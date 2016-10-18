#!/usr/bin/env python

from math import pi
import rospy
import numpy as np

from std_msgs.msg import Float64
from msg import Diagnostics
from collections import deque

from helpers import fetchParam
from joint_angle import JointAngle
from inverse_model import InverseModel
from forward_model import ForwardModel
from equilibrium_model import EquilibriumModel
from reflex import Reflex
from dynamixel_controllers.srv import TorqueEnable

class Antagonist:
    def __init__(self, name):
        self.name = name

        self.calibrated = rospy.get_param("~" + self.name + "/calibrated")
        self.signEncoder = rospy.get_param("~" + self.name + "/signEncoder")
        self.signJoint = rospy.get_param("~" + self.name + "/signJoint")
        self.name = rospy.get_param("~" + self.name + "/name")
        self.nameEncoder = rospy.get_param("~" + self.name + "/nameEncoder")
        minAngle = rospy.get_param("~" + self.name + "/minAngle")
        maxAngle = rospy.get_param("~" + self.name + "/maxAngle")
        self.pGain = rospy.get_param("~" + self.name + "/gains/P")
        self.iGain = rospy.get_param("~" + self.name + "/gains/I")
        self.vGain = rospy.get_param("~" + self.name + "/gains/D")
        self.maxAbsForwardError = rospy.get_param("~" + self.name + "/maxAbsForwardError")

        self.range = maxAngle - minAngle
        self.angle = JointAngle(self.nameEncoder, self.signEncoder, minAngle, maxAngle, True)

        self.eqModel = EquilibriumModel(self.name)
        self.inverseModel = InverseModel(self.name)
        self.inverseModelCollision = InverseModel(self.name)
        self.forwardModel = ForwardModel(self.name)

        if self.calibrated is 1:
            self.inverseModel.loadCalibration()
            self.inverseModelCollision.loadCalibration()
            self.forwardModel.loadCalibration()

        self.cocontractionReflex = Reflex(2.0, 0.0045, 0.0)
        self.feedbackReflex = Reflex(1.0, 0.0075, 0.0)
        self.collisionReflex = Reflex(1.0, 0.0075, 0.0)

        self.initPublishers()
        self.initVariables()
        self.disableEncoderTorque()

        jointRange = self.angle.getMax() - self.angle.getMin()
        self.eqModel.calculateEqVelCalibration(jointRange)

    def initVariables(self):
        self.errors = deque()
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.collisionResponse = False
        self.errorLast = 0.0
        self.ballistic = 0.0
        self.deltaAngleBallistic = 0.0
        self.deltaEqFeedback = 0.0
        self.lastForwardError = 0.0
        self.forwardError = 0.0

        self.ballisticRatio = 0.85
        self.feedbackRatio = 0.5

    def disableEncoderTorque(self):
        service_name = self.nameEncoder + "_controller/torque_enable"
        rospy.wait_for_service(service_name)
        try:
            te = rospy.ServiceProxy(service_name, TorqueEnable)
            te(torque_enable = False)
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e

    def initPublishers(self):
        self.pubDiagnostics = rospy.Publisher(self.name + "/diagnostics", Diagnostics, queue_size=5)

    def servoTo(self, dAngle, dCocontraction):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            self.feedForward = False
            self.eqModel.dCocontraction = dCocontraction  
            self.angle.setDesired(dAngle)
            self.cocontractionReflex.clear()
            self.cocontractionReflex.setBaseContribution(dCocontraction)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring servoTo() command.")

    def goTo(self, dAngle, dStartCocontraction, now):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            excitation = abs(self.angle.getEncoder() - dAngle)
            if now:
                if excitation > 0.261799:
                    self.cocontractionReflex.setBaseContribution(dStartCocontraction)
                    self.cocontractionReflex.updateExcitation(excitation)
                    self.feedbackReflex.updateExcitation(1.0)
                    self.feedForward = True
                    self.deltaAngleBallistic = dAngle - self.getJointAngle()
            self.angle.setDesired(dAngle)
            aim = self.getBallisticAim(dAngle)
            self.inverseModel.setAngle(aim)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring goTest() command.")

    def moveTo(self, dEquilibrium, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.eqModel.dEquilibrium = dEquilibrium
        self.eqModel.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.doUpdate()

    def moveWith(self, dEquilibriumVel, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        if (not self.angle.isBeyondMin()) and (not self.angle.isBeyondMax()):
            self.eqModel.doEquilibriumIncrement(dEquilibriumVel)
        self.eqModel.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.angle.setDesiredToEncoder()
        self.doUpdate()

    def servoWith(self, dVelocity, dCocontraction):
        self.closedLoop = True
        self.velocity = True
        self.feedForward = False
        self.angle.setDesiredVelocity(dVelocity * self.signJoint)
        self.angle.doVelocityIncrement()
        self.eqModel.dCocontraction = dCocontraction  
        self.cocontractionReflex.clear()
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.feedbackReflex.removeExcitation()
        self.doUpdate()

    def passiveHold(self, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.doUpdate()

    def doUpdate(self):
        msgTime = self.angle.getMsgTime()
        currentTime = rospy.get_rostime()
        delay = currentTime - msgTime

        if delay.to_sec() > 0.25:
            print("Warning: Delay of message larger than 0.25 seconds for encoder " + self.nameEncoder + ", stopping.")
        else:
            if self.angle.isBeyondMin() or self.angle.isBeyondMax():
                self.collisionReflex.removeExcitation()
                self.doUpdateWhenLimit()
            else:
                if (self.calibrated is 1) and self.collisionResponse:
                    self.generateForwardError()
                    self.collisionReflex.doDiscount()

                    if self.isOverloaded():
                        self.collisionReflex.updateExcitation(1.0)
                        
                    if self.collisionReflex.getContribution() > 0.5:
                        if self.collisionReflex.getContribution() > 0.9:
                            self.inverseModelCollision.setCocontraction(self.eqModel.getCocontractionForAlphas())
                            self.inverseModelCollision.setAngle(self.getJointAngle())
                        self.doUpdateWhenCollision()
                    else:
                        self.doUpdateWhenFree()
                else:
                    self.doUpdateWhenFree()

        self.eqModel.capCocontraction()
        self.eqModel.createCommand()
        self.eqModel.publishCommand()
        self.publishDiagnostics()

    def doUpdateWhenLimit(self):
        if self.angle.isBeyondMin():
            self.eqModel.doEquilibriumIncrement(0.002)
        if self.angle.isBeyondMax():
            self.eqModel.doEquilibriumIncrement(-0.002)

    def doUpdateWhenCollision(self):
        if not self.inverseModelCollision.generateOk():
            print("Warning: Outside ballistic calibration data for joint " + self.name + ", not using model-based collision reaction.")
            self.collisionReflex.removeExcitation()
        else:
            self.feedbackReflex.removeExcitation()
            self.eqModel.dEquilibrium = self.inverseModelCollision.getEquilibriumPoint()

    def doUpdateWhenFree(self):
        if self.velocity:
            self.eqModel.cCocontraction = self.eqModel.dCocontraction
        else:
            if self.calibrated is 1:
                self.feedbackReflex.doDiscount()
                if self.isFeedbackDue():
                    self.feedbackReflex.removeExcitation()
                    
                self.cocontractionReflex.doDiscount()
                cocontReflex = self.cocontractionReflex.getContribution()
                sumCocontraction = cocontReflex
                if sumCocontraction > self.eqModel.maxCocontraction:
                    sumCocontraction = self.eqModel.maxCocontraction
                    
                self.inverseModel.setCocontraction(sumCocontraction)
                self.eqModel.cCocontraction = sumCocontraction
                
                if self.feedForward:
                    if not self.inverseModel.generateOk():
                        print("Warning: Outside ballistic calibration data for joint " + self.name + ", not using model-based feedforward.")
                    else:
                        self.eqModel.dEquilibrium = self.inverseModel.getEquilibriumPoint()
                    self.ballistic = 1
                    self.feedForward = False
                    
        self.generateError()

        if self.closedLoop:
            if self.feedbackReflex.getContribution() < 0.5:
                self.ballistic = 0
                self.doClosedLoop()      
                self.eqModel.dEquilibrium = self.eqModel.dEquilibrium + self.deltaEqFeedback

    def generateForwardError(self):
        equivalentEq = self.eqModel.getEquilibriumForAlphas()
        equivalentCc = self.eqModel.getCocontractionForAlphas()
        self.forwardModel.setEquilibrium(equivalentEq)
        self.forwardModel.setCocontraction(equivalentCc)
        if not self.forwardModel.generateOk():
            print("Warning: Outside load calibration data for joint " + self.name + ", not estimating load.")
            self.forwardError = 0.0
            self.lastForwardError = 0.0
            return False
        else:
            modelAngle = self.forwardModel.getJointAngle()
            self.lastForwardError = self.forwardError
            self.forwardError = modelAngle - self.getJointAngle()
            return True

    def isOverloaded(self):
        absolute = abs(self.forwardError)
        rate = absolute - abs(self.lastForwardError)
        if  (absolute > self.maxAbsForwardError) or (absolute > self.maxAbsForwardError/3.0 and rate > 0.15):
            print("Warning: Overloading joint " + self.name + ", absolute forward error: " + str(round(absolute,2)) + ", rate: " + str(round(rate,4)) + ".")
            return True
        else:
            return False

    def getBallisticAim(self, desired):
        delta = desired - self.getJointAngle()
        aim = self.getJointAngle() + delta * self.ballisticRatio
        return aim

    def isFeedbackDue(self):
        delta = self.angle.getDesired() - self.getJointAngle()
        if abs(delta) < (abs(self.deltaAngleBallistic) * self.feedbackRatio):
            return True
        else:
            return False

    def generateError(self):
        encoderAngle = self.angle.getEncoder()
        dAngle = self.angle.getDesired()
        
        error = dAngle - encoderAngle

        self.errors.appendleft(error)
        if len(self.errors) > 30:
            self.errors.pop()

    def doClosedLoop(self):
        error = self.errors[0]

        errorChange = self.errorLast - error
        self.errorLast = error
        
        prop_term = error * self.pGain
        vel_term = errorChange * self.vGain
        int_term = np.sum(self.errors) * self.iGain

        self.deltaEqFeedback = (prop_term  + vel_term + int_term) * self.eqModel.sign

    def publishDiagnostics(self):
        msg = Diagnostics()
        msg.equilibrium = self.eqModel.dEquilibrium
        msg.encoder = self.getJointAngle()
        msg.alpha_flexor = self.eqModel.flexor.getJointAngle()
        msg.alpha_extensor = self.eqModel.extensor.getJointAngle()
        msg.cocontraction = self.eqModel.cCocontraction
        msg.ballistic = self.ballistic
        msg.forward_error = self.forwardError
        self.pubDiagnostics.publish(msg)

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getName(self):
        return self.name

    def setCollisionResponse(self, response):
        self.collisionResponse = response
