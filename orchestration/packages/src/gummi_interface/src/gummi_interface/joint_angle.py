#!/usr/bin/env python

import rospy
from collections import deque
import numpy as np
import math

from dynamixel_msgs.msg import JointState

class JointAngle:
    def __init__(self, name, sign, minAngle, maxAngle, encoderFlag):
        self.name = name
        self.sign = sign
        self.minAngle = minAngle
        self.maxAngle = maxAngle
        self.encoderFlag = encoderFlag
        self.initSubscriber()
        self.initVariables()
        self.msgTime = rospy.Time.from_sec(0.0)

    def initSubscriber(self):
        rospy.Subscriber(self.name + '_controller/state', JointState, self.encoderCallback)

    def initVariables(self):
        self.encoderAngles = deque()
        self.encoderAngle = 0
        self.dAngle = 0
        self.dVelocity = 0
        self.lastAngle = 0

    def encoderCallback(self, msg):
        angle = msg.current_pos * self.sign
        self.msgTime = rospy.Time(msg.header.stamp.secs, msg.header.stamp.nsecs)
        if abs(angle) <=  math.pi * 4:
            if self.encoderFlag and msg.goal_pos == angle:
                pass
                #print("WARNING: Encoder oddity, exactly same angle " + str(angle) + " and goal " + str(msg.goal_pos)  + " for " + self.name + ", ignoring.")
            else:
                self.encoderAngles.appendleft(angle)

                if len(self.encoderAngles) > 3:
                    self.encoderAngles.pop()
                    self.encoderAngle = np.median(self.encoderAngles) 
        else:
            pass
            #print("WARNING: Recieved value of " + str(angle) + " for " + self.name  + ", ignoring.")

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

    def setDesiredVelocity(self, dVelocity):
        self.dVelocity = dVelocity

    def getMin(self):
        return self.minAngle

    def getMax(self):
        return self.maxAngle

    def getMsgTime(self):
        return self.msgTime

    def isBeyondMin(self):
        if self.encoderAngle < self.minAngle:
            return True
        return False

    def isBeyondMax(self):
        if self.encoderAngle > self.maxAngle:
            return True
        return False
