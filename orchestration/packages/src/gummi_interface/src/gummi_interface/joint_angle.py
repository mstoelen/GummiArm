#!/usr/bin/env python

import rospy
from collections import deque
import numpy as np
import math

from dynamixel_msgs.msg import JointState

class JointAngle:
    def __init__(self, name, sign, minAngle, maxAngle):
        self.name = name
        self.sign = sign
        self.minAngle = minAngle
        self.maxAngle = maxAngle
        self.initSubscriber()
        self.initVariables()
        self.newState = False

    def initSubscriber(self):
        rospy.Subscriber(self.name + '_controller/state', JointState, self.encoderCallback)

    def initVariables(self):
        self.encoderAngles = deque()
        self.encoderAngle = 0
        self.dAngle = 0
        self.dVelocity = 0

    def encoderCallback(self, msg):           
        angle = msg.current_pos * self.sign
        if abs(angle) <=  math.pi:
            self.encoderAngles.appendleft(angle)
            if len(self.encoderAngles) > 5:
                self.encoderAngles.pop()
                #TODO: Median for removing spikes seen in encoders. Better solution?
                self.encoderAngle = np.median(self.encoderAngles) 
                self.newState = True
        else:
            print("WARNING: Recieved encoder value of " + str(angle) + ", ignoring.")

    def doVelocityIncrement(self):
        self.dAngle = self.dAngle + self.dVelocity
        self.capDesired()

    def setDesired(self, angle):
        self.dAngle = angle
        self.capDesired()

    def setDesiredToEncoder(self):
        self.dAngle = self.encoderAngle

    def getDesired(self):
        return self.dAngle

    def capDesired(self):
        if self.dAngle > self.maxAngle:
            self.dAngle = self.maxAngle
        else:
            if self.dAngle < self.minAngle:
                self.dAngle = self.minAngle

    def getEncoder(self):
        return self.encoderAngle
        self.newState = False

    def setDesiredVelocity(self, dVelocity):
        self.dVelocity = dVelocity

    def getMin(self):
        return self.minAngle

    def getMax(self):
        return self.maxAngle

    def haveNewState(self):
        return self.newState
