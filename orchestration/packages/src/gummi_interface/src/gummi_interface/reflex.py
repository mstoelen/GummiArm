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
        self.baseContribution = 0
        self.maxContribution = 0

    def discount(self, value, rate):
        discount = value * rate
        value = value - discount;
        if value < 0:
            value = 0
        return value

    def inhibit(self):
        self.inhibition = 1

    def removeInhibition(self):
        self.inhibition = 0

    def removeExcitation(self):
        self.excitation = 0

    def isZero(self):
        if self.getContribution() < 0.001:
            return True
        else:
            return False

    def clear(self):
        self.inhibition = 0
        self.excitation = 0
        self.baseContribution = 0
        self.maxContribution = 0

    def doDiscount(self):
        self.inhibition = self.discount(self.inhibition, self.inhibitionRate)
        self.excitation = self.discount(self.excitation, self.excitationRate)

    def setBaseContribution(self, base):
        self.baseContribution = base

    def getContribution(self):
        contribution = self.baseContribution + (self.maxContribution - self.baseContribution) * self.excitation * (1 - self.inhibition) * self.gain
        #print("Reflex contribution, excitation, inhibition: " + str(contribution) + ", " + str(self.excitation) + ", " + str(self.inhibition))
        return contribution

    def getCappedContribution(self):
        contribution = self.excitation * (1 - self.inhibition) * self.gain
        if contribution > 1:
             contribution = 1
        else:
            if contribution < 0:
                contribution = 0
        return contribution

    def updateExcitation(self, newExcitation):
        if newExcitation > self.excitation * 1.2:
            self.excitation = newExcitation
            self.maxContribution = self.excitation * (1 - self.inhibition) * self.gain
            #print("New excitation: " + str(newExcitation))

