#!/usr/bin/env python

import rospy

from std_msgs.msg import Float64

from joint_angle import JointAngle
from dynamixel_controllers.srv import SetTorqueLimit

class DirectDrive:
    def __init__(self, name, servoRange):
        self.name = name
        self.servoRange = servoRange
        self.initPublishers()
        self.initVariables()

        self.angle = JointAngle(name, 1, -servoRange/2, servoRange/2, False)

    def initPublishers(self):
        self.pub = rospy.Publisher(self.name + '_controller/command', Float64, queue_size=5)

    def initVariables(self):
        self.velocity = False
        self.noCommandYet = True

    def servoTo(self, dAngle):
        self.velocity = False
        self.angle.setDesired(dAngle)
        self.noCommandYet = False
        self.doUpdate()

    def servoWith(self, dVelocity):
        self.velocity = True
        self.angle.setDesiredVelocity(dVelocity)
        self.noCommandYet = False
        self.doUpdate()

    def publishCommand(self):
        dAngle = self.angle.getDesired()
        self.pub.publish(dAngle)

    def doUpdate(self):
        if self.velocity:
            self.angle.doVelocityIncrement()
            
        if self.noCommandYet:
            self.angle.setDesired(self.encoderAngle)
            
        self.publishCommand()

    def getJointAngle(self):
        return self.angle.getEncoder()

    def setTorqueLimit(self, limit):
        service_name = self.name + "_controller/set_torque_limit"
        rospy.wait_for_service(service_name)
        try:
            te = rospy.ServiceProxy(service_name, SetTorqueLimit)
            te(limit)
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e
