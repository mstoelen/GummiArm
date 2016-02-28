#!/usr/bin/env python

from math import pi
import numpy as np

class Reflex:
    def __init__(self, gain, excitationRate, inhibitionRate):
        self.gain = gain
        self.excitationRate = excitationRate
        self.inhibitionRate = inhibitionRate
        self.initVariables()

    def initVariables(self):
        self.inhibition = 0
        self.excitation = 0

    def discount(self, value, rate):
        discount = value * rate
        value = value - discount;
        if value < 0:
            value = 0
        return value

    def inhibit(self):
        self.inhibition = 1

    def getContribution(self):
        self.inhibition = self.discount(self.inhibition, self.inhibitionRate)
        self.excitation = self.discount(self.excitation, self.excitationRate)
        contribution = self.excitation * (1 - self.inhibition) * self.gain
        #print("Reflex contribution, excitation, inhibition: " + str(contribution) + ", " + str(self.excitation) + ", " + str(self.inhibition))
        return contribution

    def updateExcitation(self, newExcitation):
        if newExcitation > (self.excitation * 1.5):
            self.excitation = newExcitation
