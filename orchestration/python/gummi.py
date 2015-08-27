#!/usr/bin/env python

import rospy
import wx
import sys

from geometry_msgs.msg import Twist
from sensor_msgs.msg import JointState

from antagonist import Antagonist
from direct_drive import DirectDrive

class Teleop:

    def __init__(self):
        pi = 3.1416
        self.elbow = Antagonist(1, -1, 1, 1, "biceps", "triceps", "elbow_encoder", 0, 2*pi, -0.75, 0.85)
        self.wrist = Antagonist(-1, -1, 1, 1, "wrist_flexor", "wrist_extensor", "wrist_encoder", 0, 1.75*pi, -1.0, 1.0)
        self.shoulderPitch = Antagonist(-1, -1, 1, 1, "shoulder_abductor", "shoulder_adductor", "shoulder_pitch_encoder", 0, 2*pi, -1.0, 1.0)
        self.upperarmRoll = DirectDrive("upperarm_roll", 1.75*pi)
        self.forearmRoll = DirectDrive("forearm_roll", 1.75*pi)        

        self.initVariables()
        self.initSubscribers()

    def initVariables(self):
        self.stiffness = 0
        self.elbowVel = 0
        self.wristVel = 0
        self.forearmRollVel = 0
        self.upperarmRollVel = 0

    def initSubscribers(self):
        rospy.Subscriber('/gummi/cmd_vel', Twist, self.cmdCallback)

    def cmdCallback(self, msg):
        velGain = 3
        self.elbowVel = msg.linear.x * velGain
        self.wristVel = msg.angular.y * velGain
        self.forearmRollVel = msg.angular.x * velGain
        self.upperarmRollVel = - msg.angular.z * velGain
        
        self.stiffness = self.stiffness + msg.linear.z*0.025 
        if self.stiffness > 1:
            self.stiffness = 1
        else:
            if self.stiffness < 0:
                self.stiffness = 0

    def setMaxLoads(self, maxLoadShoulderPitch, maxLoadElbow, maxloadWrist):
        self.shoulderPitch.setMaxLoad(maxLoadShoulderPitch)
        self.elbow.setMaxLoad(maxLoadElbow)
        self.wrist.setMaxLoad(maxloadWrist)

    def doUpdate(self):
        gain = 0.15
        self.shoulderPitch.doUpdate()
        self.elbow.servoWith(self.elbowVel, self.stiffness, gain)
        self.wrist.servoWith(self.wristVel, self.stiffness, gain)
        self.upperarmRoll.servoWith(self.upperarmRollVel)
        self.forearmRoll.servoWith(self.forearmRollVel)

    def getJointAngles(self):
        angles = list()
        angles.append(self.shoulderPitch.getJointAngle())
        angles.append(self.upperarmRoll.getJointAngle())
        angles.append(self.elbow.getJointAngle())
        angles.append(self.forearmRoll.getJointAngle())
        angles.append(self.wrist.getJointAngle())
        return angles

    def manualServoWith(self, velocities):
        self.upperarmRollVel = velocities[0]
        self.elbowVel = velocities[1]
        self.forearmRollVel = velocities[2]
        self.wristVel = velocities[3]
        self.doUpdate()

    def getLoads(self):
        loads = list()
        loads.append(self.shoulderPitch.getLoadRatio())
        loads.append(self.elbow.getLoadRatio())
        loads.append(self.wrist.getLoadRatio())
        return loads

    def goRestingPose(self):
        self.elbow.servoTo(0, 0.4, 0.1)
        self.wrist.servoTo(0, 0.4, 0.1)
        self.upperarmRoll.servoTo(0)
        self.forearmRoll.servoTo(0)
