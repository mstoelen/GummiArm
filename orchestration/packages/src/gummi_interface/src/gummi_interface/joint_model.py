#!/usr/bin/env python

import rospy
import numpy as np
from scipy import interpolate

class JointModel:
    def __init__(self, name):
        self.name = name
        self.flexor = 0.0
        self.extensor = 0.0
        self.angle = 0.0
        self.cocontraction = 0.0
        #self.xMesh, self.yMesh = np.meshgrid(np.linspace(-2*pi, 2*pi, 360), np.linspace(0, 1, 100))

    def loadCalibration(self):
        self.alphasFlexor  = rospy.get_param("~" + self.name + "/calib/alphasFlexor")
        self.alphasExtensor = rospy.get_param("~" + self.name + "/calib/alphasExtensor")
        self.thetas = rospy.get_param("~" + self.name + "/calib/thetas")
        self.ccs = rospy.get_param("~" + self.name + "/calib/ccs")

    def setCalibration(self, alphasFlexor, alphasExtensor, thetas, ccs):
        self.alphasFlexor = alphasFlexor
        self.alphasExtensor = alphasExtensor
        self.thetas = thetas
        self.ccs = ccs

    def generate(self):
        # TODO: Check for content of arrays
        #self.fFlexor = interpolate.interp2d(self.thetas, self.ccs, self.alphasFlexor)
        #self.fExtensor = interpolate.interp2d(self.thetas, self.ccs, self.alphasExtensor)
        return True

    def generateCommands(self):
        #self.flexor = self.fFlexor(self.angle, self.cocontraction)[0]
        #self.extensor = self.fExtensor(self.angle, self.cocontraction)[0]
        self.flexor = griddata(self.thetas, self.ccs, self.alphasFlexor, self.angle, self.cocontraction)
        self.extensor = griddata(self.thetas, self.ccs, self.alphasExtensor, self.angle, self.cocontraction)

    def setCocontraction(self, cocontraction):
        self.cocontraction = cocontraction

    def setAngle(self, angle):
        self.angle = angle

    def getFlexor(self):
        return self.flexor

    def getExtensor(self):
        return self.extensor
