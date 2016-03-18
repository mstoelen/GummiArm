#!/usr/bin/env python

from math import pi
from xml.dom.minidom import parse
import rospy

from std_msgs.msg import Float64
from msg import Diagnostics

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
        self.vGain = rospy.get_param("~" + self.name + "/gains/D")

        self.angle = JointAngle(self.nameEncoder, self.signEncoder, self.minAngle, self.maxAngle, True)
        self.ballisticModel = JointModel(self.name)
        self.actualModel = JointModel(self.name)

        if self.calibrated is 1:
            self.ballisticModel.loadCalibration()
            self.actualModel.loadCalibration()

        self.flexorAngle = JointAngle(self.nameFlexor, self.signFlexor, -1000, 1000, False)
        self.extensorAngle = JointAngle(self.nameExtensor, self.signExtensor, -1000, 1000, False)
        self.cocontractionReflex = Reflex(3.0, 0.003, 0.0)
        self.ballisticReflex = Reflex(3.0, 0.05, 0.0)

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
        self.deltaEqFeedback = 0
        self.deltaEqBallistic = 0
        self.actualEquilibrium = 0

        self.dCocontraction = 0
        self.cCocontraction = 0
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.maxCocontraction = 1.0
        self.errorLast = 0.0
        self.dEqVelCalibration = 1.0
        self.ballistic = 0

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
        self.velocity = False
        self.closedLoop = True
        self.feedForward = False
        self.dCocontraction = dCocontraction  
        self.angle.setDesired(dAngle)
        self.cocontractionReflex.clear()
        self.doUpdate()

    def goTest(self, dAngle, dStartCocontraction, now):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            if now:
                self.dCocontraction = dStartCocontraction 
                excitation = abs(self.angle.getEncoder() - dAngle)
                self.cocontractionReflex.updateExcitation(excitation)
                self.ballisticReflex.updateExcitation(excitation)
                self.feedForward = True
            self.angle.setDesired(dAngle)
            self.ballisticModel.setAngle(dAngle)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring goTo() command.")

    def goTo(self, dAngle, dStartCocontraction, now):
        if self.calibrated is 1:
            self.velocity = False
            self.closedLoop = True
            if now:
                self.dCocontraction = dStartCocontraction 
                excitation = abs(self.angle.getEncoder() - dAngle)
                self.cocontractionReflex.updateExcitation(excitation)
                self.ballisticReflex.updateExcitation(excitation)
                self.feedForward = True
            self.angle.setDesired(dAngle)
            self.ballisticModel.setAngle(dAngle)
            self.doUpdate()
        else:
            print("Warning: Joint " + self.name + " not listed as calibrated in .yaml config file. Ignoring goTo() command.")

    def moveTo(self, dEquilibrium, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = dEquilibrium
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.doUpdate()

    def moveWith(self, dEquilibriumVel, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = self.dEquilibrium + dEquilibriumVel * self.signEquilibrium * self.dEqVelCalibration;
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.angle.setDesiredToEncoder()
        self.doUpdate()

    def servoWith(self, dVelocity, dCocontraction):
        self.closedLoop = True
        self.velocity = True
        self.feedForward = False
        self.angle.setDesiredVelocity(dVelocity * self.signJoint)
        self.angle.doVelocityIncrement()
        self.dCocontraction = dCocontraction  
        self.cocontractionReflex.clear()
        self.doUpdate()

    def passiveHold(self, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.clear()
        self.doUpdate()

    def doUpdate(self):
        msgTime = self.angle.getMsgTime()
        currentTime = rospy.get_rostime()
        delay = currentTime - msgTime

        if delay.to_sec() > 0.25:
            print("Warning: Delay of message larger than 0.25 seconds for encoder " + self.nameEncoder + ", stopping.")
        else:
            if self.closedLoop:
                self.doClosedLoop()
            else:
                self.deltaEqFeedback = 0

            if self.calibrated is 1:
                self.ballisticReflex.doDiscount()
                self.cocontractionReflex.doDiscount()

                cocontReflex = self.cocontractionReflex.getContribution()
                sumCocontraction = self.dCocontraction + (1 - self.dCocontraction) * cocontReflex
                if sumCocontraction > self.maxCocontraction:
                    sumCocontraction = self.maxCocontraction

                self.ballisticModel.setCocontraction(sumCocontraction)
                self.actualModel.setCocontraction(sumCocontraction)
                self.cCocontraction = sumCocontraction

                if self.feedForward:
                    if not self.ballisticModel.generateCommand():
                        print("Warning: Outside calibration data for joint " + self.name + ", not using model-based feedforward.")
                        self.dEquilibrium = self.dEquilibrium + self.deltaEqFeedback
                    else:
                        self.actualModel.setAngle(self.getJointAngle())
                        self.actualModel.generateCommand()
                        self.actualEquilibrium = self.actualModel.getEquilibriumPoint()
                        ballisticEquilibrium = self.ballisticModel.getEquilibriumPoint()
                        self.deltaEqBallistic = ballisticEquilibrium - self.actualEquilibrium
                        self.ballistic = self.ballisticReflex.getCappedContribution()
                        #wa = self.doWeightedAverage(self.deltaEqFeedback, 1 - self.ballistic, self.deltaEqBallistic, self.ballistic)
                        wa = self.doWeightedAverage(self.deltaEqFeedback, 0.0, self.deltaEqBallistic, 1.0)
                        self.dEquilibrium =  self.actualEquilibrium + wa
                else:
                    self.dEquilibrium = self.dEquilibrium + self.deltaEqFeedback
                
            else:
                self.cCocontraction = self.dCocontraction
                self.dEquilibrium = self.dEquilibrium + self.deltaEqFeedback

            self.capEquilibrium()
            self.capCocontraction()
            self.createCommand()
            self.publishCommand()
            self.publishDiagnostics()

    def doWeightedAverage(self, value1, weight1, value2, weight2):
        return (value1*weight1 + value2*weight2)

    def createCommand(self):
        equilibrium = self.dEquilibrium
        cocontraction = self.cCocontraction

        commandFlexor = self.signFlexor*(-0.5*equilibrium*self.servoRange/2 + 0.5*cocontraction*pi)
        commandExtensor = self.signExtensor*(0.5*equilibrium*self.servoRange/2 + 0.5*cocontraction*pi)

        self.commandFlexor = commandFlexor + self.servoOffset
        self.commandExtensor = commandExtensor + self.servoOffset

    def doClosedLoop(self):
        encoderAngle = self.angle.getEncoder()
        dAngle = self.angle.getDesired()
        
        error = dAngle - encoderAngle
        errorChange = self.errorLast - error
        self.errorLast = error
        
        prop_term = error * self.pGain
        vel_term = errorChange * self.vGain

        self.deltaEqFeedback = (prop_term + vel_term)*self.signEquilibrium

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
