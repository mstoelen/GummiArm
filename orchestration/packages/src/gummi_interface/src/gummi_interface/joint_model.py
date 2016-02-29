#!/usr/bin/env python

import rospy
import numpy as np
from scipy.interpolate import griddata

class JointModel:
    def __init__(self, name):
        self.name = name
        self.flexor = 0.0
        self.extensor = 0.0
        self.angle = 0.0
        self.cocontraction = 0.0

    def loadCalibration(self):
        self.alphasFlexor  = rospy.get_param("~" + self.name + "/calib/alphasFlexor")
        self.alphasExtensor = rospy.get_param("~" + self.name + "/calib/alphasExtensor")
        self.thetas = rospy.get_param("~" + self.name + "/calib/thetas")
        self.ccs = rospy.get_param("~" + self.name + "/calib/ccs")

    def setCalibration(self, thetas, ccs, alphasFlexor, alphasExtensor):
        self.alphasFlexor = alphasFlexor
        self.alphasExtensor = alphasExtensor
        self.thetas = thetas
        self.ccs = ccs

    def generateCommands(self):
        self.flexor = griddata((self.thetas, self.ccs), self.alphasFlexor, (self.angle, self.cocontraction))
        self.extensor = griddata((self.thetas, self.ccs), self.alphasExtensor, (self.angle, self.cocontraction))
        if np.isnan(self.flexor) or np.isnan(self.extensor):
            return False
        else:
            return True

    def setCocontraction(self, cocontraction):
        self.cocontraction = cocontraction

    def setAngle(self, angle):
        self.angle = angle

    def getFlexor(self):
        return self.flexor

    def getExtensor(self):
        return self.extensor
