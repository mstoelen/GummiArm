#!/usr/bin/env python

from math import pi
from xml.dom.minidom import parse
import rospy
import numpy as np

from std_msgs.msg import Float64
from msg import Diagnostics
from collections import deque


from helpers import fetchParam
from joint_angle import JointAngle
from joint_model import JointModel
from reflex import Reflex
from dynamixel_controllers.srv import TorqueEnable, SetTorqueLimit

class Antagonist:
    def __init__(self, name):
        self.name = name

        self.calibrated = rospy.get_param("~" + self.name + "/calibrated")
        self.signEquilibrium = rospy.get_param("~" + self.name + "/signEquilibrium")
        self.signFlexor = rospy.get_param("~" + self.name + "/signFlexor")
        self.signExtensor = rospy.get_param("~" + self.name + "/signExtensor")
        self.signEncoder = rospy.get_param("~" + self.name + "/signEncoder")
        self.signJoint = rospy.get_param("~" + self.name + "/signJoint")
        self.name = rospy.get_param("~" + self.name + "/name")
        self.nameFlexor = rospy.get_param("~" + self.name + "/nameFlexor")
        self.nameExtensor = rospy.get_param("~" + self.name + "/nameExtensor")
        self.nameEncoder = rospy.get_param("~" + self.name + "/nameEncoder")
        self.servoRange = rospy.get_param("~" + self.name + "/servoRange")
        self.servoOffset = rospy.get_param("~" + self.name + "/servoOffset")
        self.minAngle = rospy.get_param("~" + self.name + "/minAngle")
        self.maxAngle = rospy.get_param("~" + self.name + "/maxAngle")
        self.angleOffset = rospy.get_param("~" + self.name + "/angleOffset")
        self.pGain = rospy.get_param("~" + self.name + "/gains/P")
        self.iGain = rospy.get_param("~" + self.name + "/gains/I")
        self.vGain = rospy.get_param("~" + self.name + "/gains/D")

        self.range = self.maxAngle - self.minAngle
        self.angle = JointAngle(self.nameEncoder, self.signEncoder, self.minAngle, self.maxAngle, True)
        self.ballisticModel = JointModel(self.name)

        if self.calibrated is 1:
            self.ballisticModel.loadCalibration()

        self.flexorAngle = JointAngle(self.nameFlexor, self.signFlexor, -1000, 1000, False)
        self.extensorAngle = JointAngle(self.nameExtensor, self.signExtensor, -1000, 1000, False)
        self.cocontractionReflex = Reflex(2.0, 0.0015, 0.0)
        self.feedbackReflex = Reflex(1.0, 0.0, 0.0)
        self.feedbackReflex.updateExcitation(1.0)

        self.initPublishers()
        self.initVariables()
        self.disableEncoderTorque()
        self.setTorqueLimit(self.nameExtensor, 1)
        self.setTorqueLimit(self.nameFlexor, 1)
        self.calculateEqVelCalibration()

    def initVariables(self):
        self.commandFlexor = 0
        self.commandExtensor = 0
        self.dEquilibrium = 0
        self.deltaAngleFeedback = 0

        self.errors = deque()
        self.dCocontraction = 0
        self.cCocontraction = 0
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.maxCocontraction = 1.0
        self.errorLast = 0.0
        self.dEqVelCalibration = 1.0
        self.ballistic = 0
        self.deltaAngleBallistic = 0
        self.deltaEqFeedback = 0

        self.ballisticRatio = 0.85
        self.feedbackRatio = 0.5

    def calculateEqVelCalibration(self):
        joint_range = self.angle.getMax() - self.angle.getMin()
        eq_range = 2 * 2.0
        self.dEqVelCalibration = eq_range/joint_range;
        print("Equilibrium to joint velocity calibration: " + str(self.dEqVelCalibration) + ".")

    def setTorqueLimit(self, name, limit):
        service_name = name + "_controller/set_torque_limit"
        rospy.wait_for_service(service_name)
        try:
            te = rospy.ServiceProxy(service_name, SetTorqueLimit)
            te(limit)
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e

    def disableEncoderTorque(self):
        service_name = self.nameEncoder + "_controller/torque_enable"
        rospy.wait_for_service(service_name)
        try:
            te = rospy.ServiceProxy(service_name, TorqueEnable)
            te(torque_enable = False)
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e

    def initPublishers(self):
        self.pubExtensor = rospy.Publisher(self.nameExtensor + "_controller/command", Float64, queue_size=5)
        self.pubFlexor = rospy.Publisher(self.nameFlexor + "_controller/command", Float64, queue_size=5)
        self.pubDiagnostics = rospy.Publisher(self.name + "/diagnostics", Diagnostics, queue_size=5)

    def servoTo(self, dAngle, dCocontraction):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            self.feedForward = False
            self.dCocontraction = dCocontraction  
            self.angle.setDesired(dAngle)
            self.cocontractionReflex.clear()
            self.cocontractionReflex.setBaseContribution(dCocontraction)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring servoTo() command.")

    def goTest(self, dAngle, dStartCocontraction, now):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            excitation = abs(self.angle.getEncoder() - dAngle)
            if now:
                self.cocontractionReflex.setBaseContribution(dStartCocontraction)
                self.cocontractionReflex.updateExcitation(excitation)
                self.feedbackReflex.inhibit()
                self.feedForward = True
                self.deltaAngleBallistic = dAngle - self.getJointAngle()
            self.angle.setDesired(dAngle)
            aim = self.getBallisticAim(dAngle)
            self.ballisticModel.setAngle(aim)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring goTest() command.")

    def goTo(self, dAngle, dStartCocontraction, now):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            excitation = abs(self.angle.getEncoder() - dAngle)
            if now:
                self.cocontractionReflex.setBaseContribution(dStartCocontraction)
                self.cocontractionReflex.updateExcitation(excitation)
                self.feedbackReflex.inhibit()
                self.feedForward = True
                self.deltaAngleBallistic = dAngle - self.getJointAngle()
            self.angle.setDesired(dAngle)
            aim = self.getBallisticAim(dAngle)
            self.ballisticModel.setAngle(aim)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring goTest() command.")

    def moveTo(self, dEquilibrium, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = dEquilibrium
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.doUpdate()

    def moveWith(self, dEquilibriumVel, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = self.dEquilibrium + dEquilibriumVel * self.signEquilibrium * self.dEqVelCalibration;
        self.dCocontraction = dCocontraction
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
        self.dCocontraction = dCocontraction  
        self.cocontractionReflex.setBaseContribution(dCocontraction)
        self.cocontractionReflex.clear()
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
            if self.calibrated is 1:
                if self.isFeedbackDue():
                    self.feedbackReflex.removeInhibition()

                self.cocontractionReflex.doDiscount()
                cocontReflex = self.cocontractionReflex.getContribution()
                sumCocontraction = cocontReflex
                if sumCocontraction > self.maxCocontraction:
                    sumCocontraction = self.maxCocontraction

                self.ballisticModel.setCocontraction(sumCocontraction)
                self.cCocontraction = sumCocontraction

                if self.feedForward:
                    #now = rospy.get_time()
                    if not self.ballisticModel.generateCommand():
                        print("Warning: Outside ballistic calibration data for joint " + self.name + ", not using model-based feedforward.")
                    else:
                        self.dEquilibrium = self.ballisticModel.getEquilibriumPoint()
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
                    self.dEquilibrium = self.dEquilibrium + self.deltaEqFeedback

            self.capEquilibrium()
            self.capCocontraction()
            self.createCommand()
            self.publishCommand()
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

    def createCommand(self):
        equilibrium = self.dEquilibrium
        cocontraction = self.cCocontraction

        commandFlexor = self.signFlexor*(-0.5*equilibrium*self.servoRange/2 + 0.5*cocontraction*pi)
        commandExtensor = self.signExtensor*(0.5*equilibrium*self.servoRange/2 + 0.5*cocontraction*pi)

        self.commandFlexor = commandFlexor + self.servoOffset
        self.commandExtensor = commandExtensor + self.servoOffset

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

        self.deltaEqFeedback = (prop_term  + vel_term + int_term) * self.signEquilibrium

    def capEquilibrium(self):
        if self.dEquilibrium > 2:
                self.dEquilibrium = 2.0
        else:
            if self.dEquilibrium < -2:
                self.dEquilibrium = -2.0

    def capCocontraction(self):
        if self.cCocontraction > self.maxCocontraction:
            self.cCocontraction = self.maxCocontraction
        else:
            if self.cCocontraction < 0:
                self.cCocontraction = 0.0

    def publishCommand(self):
        self.pubExtensor.publish(self.commandExtensor)                
        self.pubFlexor.publish(self.commandFlexor)

    def publishDiagnostics(self):
        msg = Diagnostics()
        msg.equilibrium = self.dEquilibrium
        msg.encoder = self.getJointAngle()
        msg.alpha_flexor = self.getFlexorAngle()
        msg.alpha_extensor = self.getExtensorAngle()
        msg.cocontraction = self.cCocontraction
        msg.ballistic = self.ballistic
        self.pubDiagnostics.publish(msg)

    def getDesiredEquilibrium(self):
        return self.dEquilibrium

    def getCommandedCocontraction(self):
        return self.cCocontraction

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getFlexorAngle(self):
        return self.flexorAngle.getEncoder()

    def getExtensorAngle(self):
        return self.extensorAngle.getEncoder()

    def getName(self):
        return self.name
