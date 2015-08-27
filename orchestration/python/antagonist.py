#!/usr/bin/env python

from math import pi
from xml.dom.minidom import parse
import rospy

from std_msgs.msg import Float64

from joint_angle import JointAngle
from reflex import Reflex

class Antagonist:
    def __init__(self, signFlexor, signExtensor, signEncoder, signJoint, nameFlexor, nameExtensor, nameEncoder, stretchReflexGain, servoRange, minAngle, maxAngle):
        self.signFlexor = signFlexor
        self.signExtensor = signExtensor
        self.signJoint = signJoint
        self.nameFlexor = nameFlexor
        self.nameExtensor = nameExtensor
        self.nameEncoder = nameEncoder
        self.servoRange = servoRange

        self.angle = JointAngle(nameEncoder, signEncoder, minAngle, maxAngle)
        self.stretchReflex = Reflex(stretchReflexGain, 0.02, 0.01)
        self.compliance = Reflex(15, 0.02, 0.01)

        self.initPublishers()
        self.initVariables()

    def initVariables(self):
        self.commandFlexor = 0
        self.commandExtensor = 0
        self.dEquilibrium = 0
        self.dGain = 0
        self.cGain = 0
        self.dStiffness = 0
        self.cStiffness = 0
        self.velocity = False
        self.closedLoop = False
        self.maxStiffness = 1
        self.meanError = 0
        self.timeLast = rospy.Time.now()
        self.maxLoad = 10000
        self.lGain = 0.03
        self.loadRatio = 0

        self.equilibriumErrors = list()
        for i in range(0, 5):
            self.equilibriumErrors.append(0.0)

    def initPublishers(self):
        self.pubExtensor = rospy.Publisher('/' + self.nameExtensor + '/command', Float64, queue_size=5)
        self.pubFlexor = rospy.Publisher('/' + self.nameFlexor + '/command', Float64, queue_size=5)

    def servoTo(self, dAngle, dStiffness, dGain):
        self.velocity = False
        self.closedLoop = True
        self.dStiffness = dStiffness  
        self.dGain = dGain
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

    def servoWith(self, dVelocity, dStiffness, dGain):
        self.closedLoop = True
        self.velocity = True
        self.angle.setDesiredVelocity(dVelocity)
        self.dStiffness = dStiffness  
        self.dGain = dGain
        self.timeLast = rospy.Time.now()
        self.doUpdate()

    def setMaxLoad(self, maxLoad):
        self.maxLoad = maxLoad

    def doUpdate(self):
        duration = rospy.Time.now() - self.timeLast
        timeStep = duration.to_sec()
        self.timeLast = rospy.Time.now()

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
        
        if self.velocity:
            self.angle.doVelocityIncrement(timeStep)
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

        equilibriumFlexor = self.signFlexor*(-0.5*equilibrium + 0.5*stiffness)
        equilibriumExtensor = self.signExtensor*(0.5*equilibrium + 0.5*stiffness)
        
        self.commandFlexor = equilibriumFlexor*self.servoRange/2
        self.commandExtensor = equilibriumExtensor*self.servoRange/2

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
        dAngle = self.signJoint * self.angle.getDesired()
        error = dAngle - encoderAngle
        self.dEquilibrium = self.dEquilibrium + error * self.cGain

    def doCompliance(self, contribution):
        if abs(self.loadRatio) > 1:
            self.closedLoop = False
            encoderAngle = self.angle.getEncoder()
            self.angle.setDesiredToEncoder()
            if self.loadRatio > 0:
                self.dEquilibrium = self.dEquilibrium - contribution * self.lGain 
            else: 
                self.dEquilibrium = self.dEquilibrium + contribution * self.lGain 

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
        self.cGain = self.dGain * scale
        if self.cGain < 0:
            self.cGain = 0

    def createLoadRatio(self):
        encoderAngle = self.angle.getEncoder()
        load = self.dEquilibrium - encoderAngle #TODO
        adjustedLoad = load  * (1 + self.cStiffness)
        self.loadRatio = adjustedLoad/self.maxLoad
        #print("loadRatio for " + self.nameEncoder + ": " + str(self.loadRatio))

    def getJointAngle(self):
        return self.angle.getEncoder()

    def getLoadRatio(self):
        return self.loadRatio
