#!/usr/bin/env python

import rospy
import wx
import sys

from geometry_msgs.msg import Twist
from sensor_msgs.msg import JointState

from antagonist import Antagonist
from direct_drive import DirectDrive

class Gummi:

    def __init__(self):
        self.teleop = rospy.get_param("~teleop", 1)
        print("Expecting teleoperation ('teleop' parameter in gummi.yaml file): " + str(self.teleop) + ".")
        
        self.pi = 3.1416
        self.initVariables()
        self.initJoints()
        self.initPublishers()
        self.initSubscribers()

    def initVariables(self):
        self.jointNames = ("shoulder_yaw", "shoulder_roll", "shoulder_pitch", "upperarm_roll", "elbow", "forearm_roll", "wrist_pitch")
        self.shoulderRollVel = 0
        self.shoulderPitchVel = 0
        self.shoulderYawVel = 0
        self.upperarmRollVel = 0
        self.elbowVel = 0
        self.forearmRollVel = 0
        self.wristVel = 0
        self.shoulderRollCocont = 0
        self.shoulderPitchCocont = 0
        self.shoulderYawCocont = 0.3
        self.elbowCocont = 0
        self.wristCocont = 0

    def initJoints(self):
        self.shoulderYaw = Antagonist("shoulder_yaw")
        self.shoulderRoll = Antagonist("shoulder_roll")
        self.shoulderPitch = Antagonist("shoulder_pitch")
        self.upperarmRoll = DirectDrive("upperarm_roll", self.pi)
        self.elbow = Antagonist("elbow")
        self.forearmRoll = DirectDrive("forearm_roll", 1.75*self.pi)
        self.wrist = Antagonist("wrist")
        self.headYaw = DirectDrive("head_yaw", 1.5*self.pi)

    def initPublishers(self):
        self.jointStatePub = rospy.Publisher("gummi/joint_states", JointState,  queue_size=10) 

    def initSubscribers(self):
        rospy.Subscriber('gummi/joint_commands', JointState, self.cmdCallback)

    def cmdCallback(self, msg):
        if self.teleop == 1:
            self.setVelocity(msg.velocity) #TODO: CHECK NAMES
            self.setCocontraction(msg.effort[0], msg.effort[1], msg.effort[2], msg.effort[4], msg.effort[6])
            self.doVelocityUpdate()
        else:
            print("WARNING: Receiving desired joint velocities, but ignoring as not in teleop mode. Check gummi.yaml file.")

    def setMaxLoads(self, maxLoadShoulderYaw, maxLoadShoulderRoll, maxLoadShoulderPitch, maxLoadElbow, maxloadWrist):
        self.shoulderYaw.setMaxLoad(maxLoadShoulderYaw)
        self.shoulderRoll.setMaxLoad(maxLoadShoulderRoll)
        self.shoulderPitch.setMaxLoad(maxLoadShoulderPitch)
        self.elbow.setMaxLoad(maxLoadElbow)
        self.wrist.setMaxLoad(maxloadWrist)

    def doVelocityUpdate(self):
        if self.shoulderYawCocont < 0:
            self.shoulderYaw.moveWith(self.shoulderYawVel, abs(self.shoulderYawCocont))
        else:
            self.shoulderYaw.servoWith(self.shoulderYawVel, self.shoulderYawCocont)
        if self.shoulderRollCocont < 0:
            self.shoulderRoll.moveWith(self.shoulderRollVel, abs(self.shoulderRollCocont))
        else:
            self.shoulderRoll.servoWith(self.shoulderRollVel, self.shoulderRollCocont)
        if self.shoulderPitchCocont < 0:
            self.shoulderPitch.moveWith(self.shoulderPitchVel, abs(self.shoulderPitchCocont))
        else:
            self.shoulderPitch.servoWith(self.shoulderPitchVel, self.shoulderPitchCocont)
        self.upperarmRoll.servoWith(self.upperarmRollVel)
        if self.elbowCocont < 0:
            self.elbow.moveWith(self.elbowVel, abs(self.elbowCocont))
        else:
            self.elbow.servoWith(self.elbowVel, self.elbowCocont)
        self.forearmRoll.servoWith(self.forearmRollVel)
        if self.wristCocont == -999:
            self.wrist.passiveHold(0.0)
        else:
            if self.wristCocont < 0:
                self.wrist.moveWith(self.wristVel, abs(self.wristCocont))
            else:
                self.wrist.servoWith(self.wristVel, self.wristCocont)
        
        self.publishJointState()

    def publishJointState(self):
        msg = JointState()
        msg.header.stamp = rospy.Time.now()
        msg.name = self.jointNames
        msg.position = self.getJointAngles()
        msg.effort = self.getLoads()
        self.jointStatePub.publish(msg)

    def getJointAngles(self):
        angles = list()
        angles.append(self.shoulderYaw.getJointAngle())
        angles.append(self.shoulderRoll.getJointAngle())
        angles.append(self.shoulderPitch.getJointAngle())
        angles.append(self.upperarmRoll.getJointAngle())
        angles.append(self.elbow.getJointAngle())
        angles.append(self.forearmRoll.getJointAngle())
        angles.append(self.wrist.getJointAngle())
        return angles

    def setVelocity(self, velocities):
        self.shoulderYawVel = velocities[0]
        self.shoulderRollVel = velocities[1]
        self.shoulderPitchVel = velocities[2]
        self.upperarmRollVel = velocities[3]
        self.elbowVel = velocities[4]
        self.forearmRollVel = velocities[5]
        self.wristVel = velocities[6]

    def setCocontraction(self, shoulderYaw, shoulderRoll, shoulderPitch, elbow, wrist):
        self.shoulderYawCocont = shoulderYaw
        self.shoulderRollCocont = shoulderRoll
        self.shoulderPitchCocont = shoulderPitch
        self.elbowCocont = elbow
        self.wristCocont = wrist

    def servoTo(self, positions):
        if self.teleop == 0:
            self.shoulderYaw.servoTo(positions[0], self.shoulderYawCocont)
            self.shoulderRoll.servoTo(positions[1], self.shoulderRollCocont)
            self.shoulderPitch.servoTo(positions[2], self.shoulderPitchCocont)
            self.upperarmRoll.servoTo(positions[3])
            self.elbow.servoTo(positions[4], self.elbowCocont)
            self.forearmRoll.servoTo(positions[5])
            self.wrist.servoTo(positions[6], self.wristCocont)
            self.publishJointState()
        else:
            print("WARNING: Asked to servo to pose, but ignoring as in teleop mode. Check gummi.yaml file.")

    def getLoads(self):
        loads = list()
        loads.append(self.shoulderYaw.getLoadRatio())
        loads.append(self.shoulderRoll.getLoadRatio())
        loads.append(self.shoulderPitch.getLoadRatio())
        loads.append(1234)
        loads.append(self.elbow.getLoadRatio())
        loads.append(1234)
        loads.append(self.wrist.getLoadRatio())
        return loads

    def goRestingPose(self):
        self.shoulderYaw.servoTo(0, self.shoulderYawCocont)
        self.shoulderRoll.servoTo(0, self.shoulderRollCocont)
        self.shoulderPitch.servoTo(0, self.shoulderPitchCocont)
        self.upperarmRoll.servoTo(0)
        self.elbow.servoTo(0, self.elbowCocont)
        self.forearmRoll.servoTo(0)
        self.wrist.servoTo(0, self.wristCocont)

    def doGradualStartup(self):
        self.shoulderYaw.moveTo(-0.1, self.shoulderYawCocont)
        rospy.sleep(1)
        self.shoulderRoll.moveTo(-1.25, self.shoulderRollCocont)
        rospy.sleep(1)
        self.shoulderPitch.moveTo(0.5, self.shoulderPitchCocont)
        rospy.sleep(1)
        self.upperarmRoll.servoTo(0)
        rospy.sleep(1)
        self.elbow.moveTo(0, self.elbowCocont)
        rospy.sleep(1)
        self.forearmRoll.servoTo(0)
        rospy.sleep(1)
        self.wrist.moveTo(0, self.wristCocont)
        rospy.sleep(1)
        self.headYaw.servoTo(0)
        rospy.sleep(1)
    
        
