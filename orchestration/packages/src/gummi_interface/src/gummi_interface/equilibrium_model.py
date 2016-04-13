#!/usr/bin/env python

from math import pi
import rospy
import numpy as np

from direct_drive import DirectDrive
from helpers import fetchParam

class EquilibriumModel:
    def __init__(self, name):
        self.name = name

        self.sign = rospy.get_param("~" + self.name + "/equilibrium/sign")
        self.signFlexor = rospy.get_param("~" + self.name + "/equilibrium/signFlexor")
        self.signExtensor = rospy.get_param("~" + self.name + "/equilibrium/signExtensor")
        self.nameFlexor = rospy.get_param("~" + self.name + "/equilibrium/nameFlexor")
        self.nameExtensor = rospy.get_param("~" + self.name + "/equilibrium/nameExtensor")
        self.servoRange = rospy.get_param("~" + self.name + "/equilibrium/servoRange")
        self.servoOffset = rospy.get_param("~" + self.name + "/equilibrium/servoOffset")

        self.flexor = DirectDrive(self.nameFlexor, 1000)
        self.extensor = DirectDrive(self.nameExtensor, 1000)

        self.initVariables()
        self.flexor.setTorqueLimit(1)
        self.extensor.setTorqueLimit(1)

    def initVariables(self):
        self.commandFlexor = 0
        self.commandExtensor = 0
        self.dEquilibrium = 0
   
        self.dCocontraction = 0
        self.cCocontraction = 0
 
        self.maxCocontraction = 1.0
        self.dEqVelCalibration = 1.0

    def getEquilibriumForAlphas(self):
        return (self.extensor.getJointAngle()*self.signExtensor - self.flexor.getJointAngle()*self.signFlexor)*2/self.servoRange

    def getCocontractionForAlphas(self):
        return (self.extensor.getJointAngle()*self.signExtensor + self.flexor.getJointAngle()*self.signFlexor)/pi
        
    def createCommand(self):
        equilibrium = self.dEquilibrium
        cocontraction = self.cCocontraction

        commandFlexor = self.signFlexor*(-equilibrium*self.servoRange/4.0 + cocontraction*pi/2.0)
        commandExtensor = self.signExtensor*(equilibrium*self.servoRange/4.0 + cocontraction*pi/2.0)

        self.commandFlexor = commandFlexor + self.servoOffset
        self.commandExtensor = commandExtensor + self.servoOffset

    def capCocontraction(self):
        if self.cCocontraction > self.maxCocontraction:
            self.cCocontraction = self.maxCocontraction
        else:
            if self.cCocontraction < 0:
                self.cCocontraction = 0.0

    def publishCommand(self):
        self.flexor.servoTo(self.commandFlexor)
        self.extensor.servoTo(self.commandExtensor)

    def doEquilibriumIncrement(self, vel):
        self.dEquilibrium = self.dEquilibrium + vel * self.sign * self.dEqVelCalibration;

    def calculateEqVelCalibration(self, jointRange):
        eqRange = 2 * 2.0
        self.dEqVelCalibration = eqRange/jointRange;
        print("Equilibrium to joint velocity calibration: " + str(self.dEqVelCalibration) + ".")

    def getDesiredEquilibrium(self):
        return self.dEquilibrium

    def getCommandedCocontraction(self):
        return self.cCocontraction
        


