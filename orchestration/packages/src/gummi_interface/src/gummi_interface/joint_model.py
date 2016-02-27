#!/usr/bin/env python

from scipy import interpolate

class JointModel:
    def __init__(self, myName):
        self.myName = myName
        self.agonist = 0.0
        self.antagonist = 0.0
        self.loadCalibration()

    def loadCalibration(self):
        # TODO: From ROS parameters:
        alphasAgonist = [0.0, 0.25, 0.45, 0.7, 0.95, 1.4]
        alphasAntagonist = [-0.0, -0.25, -0.45, -0.7, -0.95, -1.4] 
        thetas = [0, -30, 0, -30, 0, -30]
        ccs = [0, 0, 0.5, 0.5, 0.8, 0.8]

        self.fAgonist = interpolate.interp2d(thetas, ccs, alphasAgonist)
        self.fAntagonist = interpolate.interp2d(thetas, ccs, alphasAntagonist)

    def calculateCommands(self, angle, cocontraction):
        self.agonist = self.fAgonist(angle, cocontraction)[0]
        self.antagonist = self.fAntagonist(angle, cocontraction)[0]

    def getAgonist(self):
        return self.agonist

    def getAntagonist(self):
        return self.antagonist
