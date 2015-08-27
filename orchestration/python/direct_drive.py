#!/usr/bin/env python

import rospy

from std_msgs.msg import Float64

from joint_angle import JointAngle

class DirectDrive:
    def __init__(self, name, servoRange):
        self.name = name
        self.servoRange = servoRange
        self.initPublishers()
        self.initVariables()

        self.angle = JointAngle(name, 1, -servoRange/2, servoRange/2)

    def initPublishers(self):
        self.pub = rospy.Publisher('/' + self.name + '/command', Float64, queue_size=5)

    def initVariables(self):
        self.velocity = False
        self.timeLast = rospy.Time.now()
        self.noCommandYet = True

    def servoTo(self, dAngle):
        self.velocity = False
        self.angle.setDesired(dAngle)
        self.noCommandYet = False
        self.doUpdate()

    def servoWith(self, dVelocity):
        self.velocity = True
        self.angle.setDesiredVelocity(dVelocity)
        self.timeLast = rospy.Time.now()
        self.noCommandYet = False
        self.doUpdate()

    def publishCommand(self):
        dAngle = self.angle.getDesired()
        self.pub.publish(dAngle)

    def doUpdate(self):
        duration = rospy.Time.now() - self.timeLast
        timeStep = duration.to_sec()
        self.timeLast = rospy.Time.now()
        
        if self.velocity:
            self.angle.doVelocityIncrement(timeStep)
            
        if self.noCommandYet:
            self.angle.setDesired(self.encoderAngle)
            
        self.publishCommand()

    def getJointAngle(self):
        return self.angle.getEncoder()
