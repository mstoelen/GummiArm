#!/usr/bin/env python

from math import pi
from xml.dom.minidom import parse
import rospy

from std_msgs.msg import Float64

from helpers import fetchParam
from joint_angle import JointAngle
from reflex import Reflex
from recording import Recording
from dynamixel_controllers.srv import TorqueEnable, SetTorqueLimit

class Antagonist:
    def __init__(self, name):
        self.name = name

        self.signEquilibrium =  fetchParam("~" + self.name + "/signEquilibrium", 1)
        self.signFlexor = rospy.get_param("~" + self.name + "/signFlexor")
        self.signExtensor = rospy.get_param("~" + self.name + "/signExtensor")
        self.signEncoder = rospy.get_param("~" + self.name + "/signEncoder")
        self.signJoint = rospy.get_param("~" + self.name + "/signJoint")
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
        self.flexorAngle = JointAngle(self.nameFlexor, self.signFlexor, -1000, 1000, False)
        self.extensorAngle = JointAngle(self.nameExtensor, self.signExtensor, -1000, 1000, False)
        self.stretchReflex = Reflex(0, 0.02, 0.01)
        self.compliance = Reflex(15, 0.02, 0.01)
        self.recording = Recording()

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

        self.dStiffness = 0
        self.cStiffness = 0
        self.velocity = False
        self.closedLoop = False
        self.maxStiffness = 1
        self.meanError = 0
        self.maxLoad = 10000
        self.loadRatio = 0
        self.errorLast = 0.0
        self.dEqVelCalibration = 1.0

        self.equilibriumErrors = list()
        for i in range(0, 5):
            self.equilibriumErrors.append(0.0)

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

    def servoTo(self, dAngle, dStiffness):
        self.velocity = False
        self.closedLoop = True
        self.dStiffness = dStiffness  
        self.angle.setDesired(dAngle)
        self.resetEquilibriumErrors()
        self.stretchReflex.inhibit()
        self.doUpdate()

    def moveTo(self, dEquilibrium, dStiffness):
        self.velocity = False
        self.closedLoop = False
        self.dEquilibrium = dEquilibrium
        self.dStiffness = dStiffness
        self.resetEquilibriumErrors()
        self.stretchReflex.inhibit()
        self.doUpdate()

    def moveWith(self, dEquilibriumVel, dStiffness):
        self.velocity = False
        self.closedLoop = False
        self.dEquilibrium = self.dEquilibrium + dEquilibriumVel * self.signEquilibrium * self.dEqVelCalibration;
        self.dStiffness = dStiffness
        self.angle.setDesiredToEncoder()
        self.doUpdate()

    def servoWith(self, dVelocity, dStiffness):
        self.closedLoop = True
        self.velocity = True
        self.angle.setDesiredVelocity(dVelocity * self.signJoint)
        self.angle.doVelocityIncrement()
        self.dStiffness = dStiffness  
        self.doUpdate()

    def passiveHold(self, dStiffness):
        self.velocity = False
        self.closedLoop = False
        self.dStiffness = dStiffness
        self.resetEquilibriumErrors()
        self.stretchReflex.inhibit()
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
            self.createEquilibriumError()            
            self.createMeanError()
            reflex = self.stretchReflex.getContribution(self.meanError)
            
            self.createLoadRatio()
            excessLoad = abs(self.loadRatio) - 1
            compliance = self.compliance.getContribution(excessLoad)
            
            scale = 1
            self.cStiffness = self.dStiffness
            
            if compliance > 0.1:
                self.doCompliance(compliance)
                scale = 1 - (compliance * 0.5)
                self.stretchReflex.inhibit()
            else:
                scale = 1 - (reflex * 0.5)
                self.cStiffness = self.dStiffness + reflex
                
            self.scaleControlGain(scale)
                
            if self.closedLoop:
                self.doClosedLoop()
                
            self.capEquilibrium()
            self.defineMaxStiffness()
            self.capStiffness()
            self.createCommand()
            self.publishCommand()

    def createCommand(self):
        equilibrium = self.dEquilibrium
        stiffness = self.cStiffness

        scaledStiffness = stiffness # TODO
        #if abs(equilibrium) <= 1:
        #    scaledStiffness = stiffness
        #else:
        #    scaledStiffness = stiffness*(2-abs(equilibrium))

        equilibriumFlexor = self.signFlexor*(-0.5*equilibrium*self.servoRange/2  + 0.5*scaledStiffness*pi)
        equilibriumExtensor = self.signExtensor*(0.5*equilibrium*self.servoRange/2 + 0.5*scaledStiffness*pi)
        
        self.commandFlexor = equilibriumFlexor + self.servoOffset
        self.commandExtensor = equilibriumExtensor + self.servoOffset

    def resetEquilibriumErrors(self):
        for error in self.equilibriumErrors:
            self.equilibriumErrors.pop(0)
            self.equilibriumErrors.append(0.0)

    def createEquilibriumError(self):
        encoderAngle = self.angle.getEncoder()
        error = self.dEquilibrium - encoderAngle
        self.equilibriumErrors.append(error)
        self.equilibriumErrors.pop(0)

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

    def defineMaxStiffness(self):
        maxStiffness = 1
        if self.dEquilibrium > 1:
            diff = self.dEquilibrium - 1
            maxStiffness = 1 - diff
        else:
            if self.dEquilibrium < -1:
                diff = -self.dEquilibrium - 1
                maxStiffness = 1 - diff
        self.maxStiffness = maxStiffness

    def capStiffness(self):
        if self.cStiffness > self.maxStiffness:
            self.cStiffness = self.maxStiffness
        else:
            if self.cStiffness < 0:
                self.cStiffness = 0.0

    def publishCommand(self):
        self.pubExtensor.publish(self.commandExtensor)                
        self.pubFlexor.publish(self.commandFlexor)

    def createMeanError(self):
        sum = 0
        index = 0
        for error in self.equilibriumErrors:
            error = abs(error)
            if index > 0:
                changeInError = error - previousError
                sum = sum + changeInError
            previousError = error
            index = index + 1
        self.meanError = sum/(index - 1)

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
        adjustedLoad = load  * (1 + self.cStiffness)
        self.loadRatio = adjustedLoad/self.maxLoad

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getFlexorAngle(self):
        return self.flexorAngle.getEncoder()

    def getExtensorAngle(self):
        return self.extensorAngle.getEncoder()

    def getLoadRatio(self):
        return self.loadRatio

    def prepareRecording(self, fileNameBase):
        fileName = fileNameBase + "_" + self.nameEncoder + ".csv"
        self.recording.prepare(fileName, ["time","equilibrium","stiffness","angle","flexor-angle","extensor-angle", "load-ratio"])

    def recordLine(self, delta):
        encoderAngle = self.getJointAngle()
        flexorAngle = self.getFlexorAngle()
        extensorAngle = self.getExtensorAngle()
        loadRatio = self.getLoadRatio()
        self.recording.add([delta, self.dEquilibrium, self.cStiffness, encoderAngle, flexorAngle, extensorAngle, loadRatio])
