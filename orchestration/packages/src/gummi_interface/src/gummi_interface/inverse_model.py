#!/usr/bin/env python

import rospy
import numpy as np
from scipy.interpolate import griddata

class InverseModel:
    def __init__(self, name):
        self.name = name
        self.p = 0.0
        self.angle = 0.0
        self.cocontraction = 0.0

    def loadCalibration(self):
        self.equilibriums  = rospy.get_param("~" + self.name + "/calib/equilibriums")
        self.thetas = rospy.get_param("~" + self.name + "/calib/thetas")
        self.ccs = rospy.get_param("~" + self.name + "/calib/ccs")

    def setCalibration(self, thetas, ccs, equilibriums):
        self.equilibriums = equilibriums
        self.thetas = thetas
        self.ccs = ccs

    def generateOk(self):
        self.p = griddata((self.thetas, self.ccs), self.equilibriums, (self.angle, self.cocontraction))
        if np.isnan(self.p):
            return False
        else:
            return True

    def setCocontraction(self, cocontraction):
        self.cocontraction = cocontraction

    def setAngle(self, angle):
        self.angle = angle

    def getEquilibriumPoint(self):
        return self.p

    def getMap(self, gridThetas, gridCcs):
        return griddata((self.thetas, self.ccs), self.equilibriums, (gridThetas, gridCcs))
    
