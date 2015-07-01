#!/usr/bin/env python

import rospy

from sensor_msgs.msg import JointState

class JointAngle:
    def __init__(self, name, servoRange):
        self.name = name
        self.servoRange = servoRange
        self.initSubscriber()
        self.initVariables()

    def initSubscriber(self):
        rospy.Subscriber('/joint_states', JointState, self.encoderCallback)

    def initVariables(self):
        self.encoderAngle = 0
        self.dAngle = 0
        self.dVelocity = 0

    def encoderCallback(self, msg):
        if self.name in msg.name:
            index = msg.name.index(self.name)            
            self.encoderAngle = msg.position[index]
        else:
            rospy.logerr("Encoder " + self.name + " not found in joint state received!\n")
            return (0, 0., 0., 0.)

    def doVelocityIncrement(self, timeStep):
        self.dAngle = self.dAngle + self.dVelocity * timeStep
        self.capDesired()

    def setDesired(self, angle):
        self.dAngle = angle
        self.capDesired()

    def setDesiredToEncoder(self):
        self.dAngle = self.encoderAngle

    def getDesired(self):
        return self.dAngle

    def capDesired(self):
        if self.dAngle > self.servoRange/2:
            self.dAngle = self.servoRange/2
        else:
            if self.dAngle < -self.servoRange/2:
                self.dAngle = -self.servoRange/2

    def getEncoder(self):
        return self.encoderAngle

    def setDesiredVelocity(self, dVelocity):
        self.dVelocity = dVelocity
