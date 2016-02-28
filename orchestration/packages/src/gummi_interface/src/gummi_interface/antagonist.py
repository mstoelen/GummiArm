#!/usr/bin/env python

from math import pi
from xml.dom.minidom import parse
import rospy

from std_msgs.msg import Float64

from helpers import fetchParam
from joint_angle import JointAngle
from joint_model import JointModel
from reflex import Reflex
from dynamixel_controllers.srv import TorqueEnable, SetTorqueLimit

class Antagonist:
    def __init__(self, name):
        self.name = name

        self.signEquilibrium =  fetchParam("~" + self.name + "/signEquilibrium", 1)
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
        self.model = JointModel(self.name)
        self.flexorAngle = JointAngle(self.nameFlexor, self.signFlexor, -1000, 1000, False)
        self.extensorAngle = JointAngle(self.nameExtensor, self.signExtensor, -1000, 1000, False)
        self.cocontractionReflex = Reflex(0.1, 0.02, 0.01)
        self.compliance = Reflex(15, 0.02, 0.01)

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

        self.pGainUse = 0
        self.vGainUse = 0
        self.lGain = 0.03

        self.dCocontraction = 0
        self.cCocontraction = 0
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.maxCocontraction = 1
        self.maxLoad = 10000
        self.loadRatio = 0
        self.errorLast = 0.0
        self.dEqVelCalibration = 1.0

        self.model.generate()

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

    def servoTo(self, dAngle, dCocontraction):
        self.velocity = False
        self.closedLoop = True
        self.feedForward = True
        self.dCocontraction = dCocontraction  
        self.angle.setDesired(dAngle)
        self.cocontractionReflex.inhibit()
        self.doUpdate()

    def goTo(self, dAngle, dStartCocontraction):
        self.velocity = False
        self.closedLoop = True
        self.feedForward = False
        self.dCocontraction = dCocontraction  
        self.angle.setDesired(dAngle)
        self.model.setAngle(dAngle)

        excitation = self.angle.getEncoder() - dAngle
        self.reflex.updateExcitation(excitation)
        self.doUpdate()

    def moveTo(self, dEquilibrium, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = dEquilibrium
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.inhibit()
        self.doUpdate()

    def moveWith(self, dEquilibriumVel, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dEquilibrium = self.dEquilibrium + dEquilibriumVel * self.signEquilibrium * self.dEqVelCalibration;
        self.dCocontraction = dCocontraction
        self.angle.setDesiredToEncoder()
        self.doUpdate()

    def servoWith(self, dVelocity, dCocontraction):
        self.closedLoop = True
        self.velocity = True
        self.feedForward = False
        self.angle.setDesiredVelocity(dVelocity * self.signJoint)
        self.angle.doVelocityIncrement()
        self.dCocontraction = dCocontraction  
        self.doUpdate()

    def passiveHold(self, dCocontraction):
        self.velocity = False
        self.closedLoop = False
        self.feedForward = False
        self.dCocontraction = dCocontraction
        self.cocontractionReflex.inhibit()
        self.doUpdate()

    def setMaxLoad(self, maxLoad):
        self.maxLoad = maxLoad

    def doUpdate(self):
        msgTime = self.angle.getMsgTime()
        currentTime = rospy.get_rostime()
        delay = currentTime - msgTime

        if delay.to_sec() > 0.25:
            print("Warning: Delay of message larger than 0.25 seconds for encoder " + self.nameEncoder + ", stopping.")
        else:
            self.createLoadRatio()
            excessLoad = abs(self.loadRatio) - 1
            self.compliance.updateExcitation(excessLoad)
            compliance = self.compliance.getContribution()
            
            scale = 1
            self.cCocontraction = self.dCocontraction
            
            if compliance > 0.1:
                self.doCompliance(compliance)
                scale = 1 - (compliance * 0.5)
                self.cocontractionReflex.inhibit()
                self.model.setAngle(self.angle.getEncoder())
            
            if self.feedForward:
                reflex = self.cocontractionReflex.getContribution()
                sumCocontraction = self.dCocontraction + reflex
                self.model.setCocontraction(sumCocontraction)
                    
            self.model.generateCommands()
            self.scaleControlGain(scale)
                
            if self.closedLoop:
                self.doClosedLoop()
                
            self.capEquilibrium()
            self.defineMaxCocontraction()
            self.capCocontraction()
            self.createCommand()
            self.publishCommand()

    def createCommand(self):
        equilibrium = self.dEquilibrium
        cocontraction = self.cCocontraction

        commandFlexor = self.signFlexor*(-0.5*equilibrium*self.servoRange/2  + 0.5*cocontraction*pi)
        commandExtensor = self.signExtensor*(0.5*equilibrium*self.servoRange/2 + 0.5*cocontraction*pi)
        
        if self.feedForward:
            commandFlexor = commandFlexor + self.model.getFlexor()
            commandExtensor = commandExtensor + self.model.getExtensor()

        self.commandFlexor = commandFlexor + self.servoOffset
        self.commandExtensor = commandExtensor + self.servoOffset

    def doClosedLoop(self):
        encoderAngle = self.angle.getEncoder()
        dAngle = self.angle.getDesired()
        
        error = dAngle - encoderAngle
        errorChange = self.errorLast - error
        self.errorLast = error
        
        prop_term = error * self.pGainUse
        vel_term = errorChange * self.vGainUse
        self.dEquilibrium = self.dEquilibrium + (prop_term + vel_term)*self.signEquilibrium

    def doCompliance(self, contribution):
        if abs(self.loadRatio) > 1:
            self.closedLoop = False
            encoderAngle = self.angle.getEncoder()
            self.angle.setDesiredToEncoder()
            if self.loadRatio > 0:
                self.dEquilibrium = self.dEquilibrium - contribution * self.lGain * self.signEquilibrium
            else: 
                self.dEquilibrium = self.dEquilibrium + contribution * self.lGain * self.signEquilibrium

    def capEquilibrium(self):
        if self.dEquilibrium > 2:
                self.dEquilibrium = 2.0
        else:
            if self.dEquilibrium < -2:
                self.dEquilibrium = -2.0

    def defineMaxCocontraction(self):
        maxCocontraction = 1
        if self.dEquilibrium > 1:
            diff = self.dEquilibrium - 1
            maxCocontraction = 1 - diff
        else:
            if self.dEquilibrium < -1:
                diff = -self.dEquilibrium - 1
                maxCocontraction = 1 - diff
        self.maxCocontraction = maxCocontraction

    def capCocontraction(self):
        if self.cCocontraction > self.maxCocontraction:
            self.cCocontraction = self.maxCocontraction
        else:
            if self.cCocontraction < 0:
                self.cCocontraction = 0.0

    def publishCommand(self):
        self.pubExtensor.publish(self.commandExtensor)                
        self.pubFlexor.publish(self.commandFlexor)

    def scaleControlGain(self, scale):
        self.pGainUse = self.pGain * scale
        if self.pGainUse < 0:
            self.pGainUse = 0
        self.vGainUse = self.vGain * scale
        if self.vGainUse < 0:
            self.vGainUse = 0

    def createLoadRatio(self):
        encoderAngle = self.angle.getEncoder()
        minAngle = self.angle.getMin()
        maxAngle = self.angle.getMax()
        jointRange = maxAngle - minAngle
        estimatedAngle = (self.dEquilibrium/2)*(jointRange/2)*self.signEquilibrium + self.angleOffset
        load = estimatedAngle - encoderAngle
        adjustedLoad = load  * (1 + self.cCocontraction)
        self.loadRatio = adjustedLoad/self.maxLoad

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getFlexorAngle(self):
        return self.flexorAngle.getEncoder()

    def getExtensorAngle(self):
        return self.extensorAngle.getEncoder()

    def getLoadRatio(self):
        return self.loadRatio
