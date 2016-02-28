#!/usr/bin/env python

import rospy
from scipy import interpolate

class JointModel:
    def __init__(self, name):
        self.name = name
        self.agonist = 0.0
        self.antagonist = 0.0
        self.loadCalibration()

    def loadCalibration(self):
        self.alphasAgonist  = rospy.get_param("~" + self.name + "/calib/alphasAgonist")
        self.alphasAntagonist = rospy.get_param("~" + self.name + "/calib/alphasAntagonist")
        self.thetas = rospy.get_param("~" + self.name + "/calib/thetas")
        self.ccs = rospy.get_param("~" + self.name + "/calib/ccs")

    def generate(self):
        # TODO: Check for content of arrays
        self.fAgonist = interpolate.interp2d(self.thetas, self.ccs, self.alphasAgonist)
        self.fAntagonist = interpolate.interp2d(self.thetas, self.ccs, self.alphasAntagonist)
        return True

    def calculateCommands(self, angle, cocontraction):
        self.agonist = self.fAgonist(angle, cocontraction)[0]
        self.antagonist = self.fAntagonist(angle, cocontraction)[0]

    def getAgonist(self):
        return self.agonist

    def getAntagonist(self):
        return self.antagonist
