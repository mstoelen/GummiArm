#!/usr/bin/env python

import rospy
import numpy as np
from scipy.interpolate import griddata

class ForwardModel:
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
        self.angle = griddata((self.equilibriums, self.ccs), self.thetas, (self.p, self.cocontraction))
        if np.isnan(self.angle):
            return False
        else:
            return True

    def setCocontraction(self, cocontraction):
        self.cocontraction = cocontraction

    def setEquilibrium(self, p):
        self.p = p

    def getJointAngle(self):
        return self.angle

    def getMap(self, gridEqs, gridCcs):
        return griddata((self.equilibriums, self.ccs), self.thetas, (gridEqs, gridCcs))
    
