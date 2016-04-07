#!/usr/bin/env python

from math import pi
import rospy
import numpy as np

from std_msgs.msg import Float64
from msg import Diagnostics
from collections import deque

from helpers import fetchParam
from joint_angle import JointAngle
from joint_model import JointModel
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
        self.minAngle = rospy.get_param("~" + self.name + "/minAngle")
        self.maxAngle = rospy.get_param("~" + self.name + "/maxAngle")
        self.angleOffset = rospy.get_param("~" + self.name + "/angleOffset")
        self.pGain = rospy.get_param("~" + self.name + "/gains/P")
        self.iGain = rospy.get_param("~" + self.name + "/gains/I")
        self.vGain = rospy.get_param("~" + self.name + "/gains/D")

        self.range = self.maxAngle - self.minAngle
        self.angle = JointAngle(self.nameEncoder, self.signEncoder, self.minAngle, self.maxAngle, True)

        self.eqModel = EquilibriumModel(self.name)
        self.inverseModel = JointModel(self.name)

        if self.calibrated is 1:
            self.inverseModel.loadCalibration()

        self.cocontractionReflex = Reflex(2.0, 0.0015, 0.0)
        self.feedbackReflex = Reflex(1.0, 0.0, 0.0)
        self.feedbackReflex.updateExcitation(1.0)

        self.initPublishers()
        self.initVariables()
        self.disableEncoderTorque()

        jointRange = self.angle.getMax() - self.angle.getMin()
        self.eqModel.calculateEqVelCalibration(jointRange)

    def initVariables(self):
        self.deltaAngleFeedback = 0

        self.errors = deque()
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.errorLast = 0.0
        self.ballistic = 0
        self.deltaAngleBallistic = 0
        self.deltaEqFeedback = 0

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
                    self.feedbackReflex.inhibit()
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
        self.feedbackReflex.removeInhibition()
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
            if self.velocity:
               self.eqModel.cCocontraction = self.eqModel.dCocontraction                
            else:
                if self.calibrated is 1:
                    if self.isFeedbackDue():
                        self.feedbackReflex.removeInhibition()

                    self.cocontractionReflex.doDiscount()
                    cocontReflex = self.cocontractionReflex.getContribution()
                    sumCocontraction = cocontReflex
                    if sumCocontraction > self.eqModel.maxCocontraction:
                        sumCocontraction = self.eqModel.maxCocontraction
                        
                    self.inverseModel.setCocontraction(sumCocontraction)
                    self.eqModel.cCocontraction = sumCocontraction
                    
                    if self.feedForward:
                        #now = rospy.get_time()
                        if not self.inverseModel.generateCommand():
                            print("Warning: Outside ballistic calibration data for joint " + self.name + ", not using model-based feedforward.")
                        else:
                            self.eqModel.dEquilibrium = self.inverseModel.getEquilibriumPoint()
                        self.ballistic = 1
                        self.feedForward = False
                        #then = rospy.get_time()
                        #duration = then - now
                        #print("Call to inverse model for joint " + self.name + " took: " + str(duration) + " seconds.")
 
            self.generateError()

            if self.closedLoop:
                if self.feedbackReflex.isZero() is False:
                    self.ballistic = 0
                    self.doClosedLoop()      
                    self.eqModel.dEquilibrium = self.eqModel.dEquilibrium + self.deltaEqFeedback

            self.eqModel.capCocontraction()
            self.eqModel.createCommand()
            self.eqModel.publishCommand()
            self.publishDiagnostics()

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

    def doWeightedAverage(self, value1, weight1, value2, weight2):
        return (value1*weight1 + value2*weight2)

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
        self.pubDiagnostics.publish(msg)

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getName(self):
        return self.name
