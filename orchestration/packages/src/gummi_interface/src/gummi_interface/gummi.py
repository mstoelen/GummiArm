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
        self.pi = 3.1416
        self.initVariables()
        self.initJoints()
        self.initPublishers()
        self.initSubscribers()

    def initVariables(self):
        self.jointNames = ("shoulder_roll", "shoulder_pitch", "upperarm_roll", "elbow", "forearm_roll", "wrist")
        self.shoulderRollVel = 0
        self.shoulderPitchVel = 0
        self.upperarmRollVel = 0
        self.elbowVel = 0
        self.forearmRollVel = 0
        self.wristVel = 0
        self.shoulderRollStiff = 0
        self.shoulderPitchStiff = 0
        self.elbowStiff = 0
        self.wristStiff = 0
        self.recordData = False

    def initJoints(self):
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
        self.setVelocity(msg.velocity)
        self.setStiffness(msg.effort[0], msg.effort[1], msg.effort[3], msg.effort[5])
        self.doUpdate()

    def setMaxLoads(self, maxLoadShoulderRoll, maxLoadShoulderPitch, maxLoadElbow, maxloadWrist):
        self.shoulderRoll.setMaxLoad(maxLoadShoulderRoll)
        self.shoulderPitch.setMaxLoad(maxLoadShoulderPitch)
        self.elbow.setMaxLoad(maxLoadElbow)
        self.wrist.setMaxLoad(maxloadWrist)

    def doUpdate(self):
        if self.shoulderRollStiff < 0:
            self.shoulderRoll.moveWith(self.shoulderRollVel, abs(self.shoulderRollStiff))
        else:
            self.shoulderRoll.servoWith(self.shoulderRollVel, self.shoulderRollStiff)
        if self.shoulderPitchStiff < 0:
            self.shoulderPitch.moveWith(self.shoulderPitchVel, abs(self.shoulderPitchStiff))
        else:
            self.shoulderPitch.servoWith(self.shoulderPitchVel, self.shoulderPitchStiff)
        self.upperarmRoll.servoWith(self.upperarmRollVel)
        if self.elbowStiff < 0:
            self.elbow.moveWith(self.elbowVel, abs(self.elbowStiff))
        else:
            self.elbow.servoWith(self.elbowVel, self.elbowStiff)
        self.forearmRoll.servoWith(self.forearmRollVel)
        if self.wristStiff == -999:
            self.wrist.passiveHold(0.0)
        else:
            if self.wristStiff < 0:
                self.wrist.moveWith(self.wristVel, abs(self.wristStiff))
            else:
                self.wrist.servoWith(self.wristVel, self.wristStiff)
        
        self.publishJointState()

        if self.recordData:
            self.addLineRecording()

    def publishJointState(self):
        msg = JointState()
        msg.header.stamp = rospy.Time.now()
        msg.name = self.jointNames
        msg.position = self.getJointAngles()
        msg.effort = self.getLoads()
        self.jointStatePub.publish(msg)

    def getJointAngles(self):
        angles = list()
        angles.append(self.shoulderRoll.getJointAngle())
        angles.append(self.shoulderPitch.getJointAngle())
        angles.append(self.upperarmRoll.getJointAngle())
        angles.append(self.elbow.getJointAngle())
        angles.append(self.forearmRoll.getJointAngle())
        angles.append(self.wrist.getJointAngle())
        return angles

    def setVelocity(self, velocities):
        self.shoulderRollVel = velocities[0]
        self.shoulderPitchVel = velocities[1]
        self.upperarmRollVel = velocities[2]
        self.elbowVel = velocities[3]
        self.forearmRollVel = velocities[4]
        self.wristVel = velocities[5]

    def setStiffness(self, shoulderRoll, shoulderPitch, elbow, wrist):
        self.shoulderRollStiff = shoulderRoll
        self.shoulderPitchStiff = shoulderPitch
        self.elbowStiff = elbow
        self.wristStiff = wrist

    def getLoads(self):
        loads = list()
        loads.append(self.shoulderRoll.getLoadRatio())
        loads.append(self.shoulderPitch.getLoadRatio())
        loads.append(1234)
        loads.append(self.elbow.getLoadRatio())
        loads.append(1234)
        loads.append(self.wrist.getLoadRatio())
        return loads

    def goRestingPose(self):
        self.shoulderRoll.servoTo(0, self.shoulderRollStiff)
        self.shoulderPitch.servoTo(0, self.shoulderPitchStiff)
        self.upperarmRoll.servoTo(0)
        self.elbow.servoTo(0, self.elbowStiff)
        self.forearmRoll.servoTo(0)
        self.wrist.servoTo(0, self.wristStiff)

    def doGradualStartup(self):
        self.shoulderRoll.moveTo(-1.25, self.shoulderRollStiff)
        rospy.sleep(1)
        self.shoulderPitch.moveTo(0.5, self.shoulderPitchStiff)
        rospy.sleep(1)
        self.upperarmRoll.servoTo(0)
        rospy.sleep(1)
        self.elbow.moveTo(0, self.elbowStiff)
        rospy.sleep(1)
        self.forearmRoll.servoTo(0)
        rospy.sleep(1)
        self.wrist.moveTo(0, self.wristStiff)
        rospy.sleep(1)
        self.headYaw.servoTo(0)
        rospy.sleep(1)

    def prepareRecording(self, fileNameBase):
        self.shoulderRoll.prepareRecording(fileNameBase)
        self.shoulderPitch.prepareRecording(fileNameBase)
        self.upperarmRoll.prepareRecording(fileNameBase)
        self.elbow.prepareRecording(fileNameBase)
        self.forearmRoll.prepareRecording(fileNameBase)
        self.wrist.prepareRecording(fileNameBase)
        
    def startRecording(self):
        self.timeStartRecording = rospy.Time.now()
        self.recordData = True

    def stopRecording(self):
        self.recordData = False

    def addLineRecording(self):        
        timeNow = rospy.Time.now()
        duration = timeNow - self.timeStartRecording
        delta = duration.to_sec()
        self.shoulderRoll.recordLine(delta)
        self.shoulderPitch.recordLine(delta)
        self.upperarmRoll.recordLine(delta)
        self.elbow.recordLine(delta)
        self.forearmRoll.recordLine(delta)
        self.wrist.recordLine(delta)
    
        
