#!/usr/bin/env python

import rospy
#import sys
#import csv
#import math

from std_msgs.msg import Bool
#from std_msgs.msg import UInt16
#from sensor_msgs.msg import JointState

from gummi_interface.gummi import Gummi


class pulldoor():
    def __init__(self):
        rospy.init_node('pull', anonymous=True)
        print ("running")
        self.gripped = False
        rospy.Subscriber("/gripped", Bool, self.gripCallback)
        #rospy.Subscriber("/joint_states", JointState, self.jointsCallback)
        self.main()


    def gripCallback(self, msg):
        self.gripped = msg.data
        #print (self.gripped)

    #def jointsCallback(self, msg):
        #self.joints = msg.position
        ##print (self.joints)
        #return self.joints


    def main(self):

        #pulldoor()
        print ("running")
        pi = 3.1416
        #start = self.joints
        rest = (0.3732686584,0.7209709703,0.4448544285,0.0322135965,-0.4295146206,-1.1402590523,-0.122718463, 1.5)
        ##(0.4653075057,0.6340453923,0.5726861608,0.1135145783,-0.209644041,-1.2169580917,-0.122718463, 1)
        #handle_turned = (0.3732686584,0.7209709703,0.4448544285,0.0322135965,-0.4295146206,-1.1402590523,-0.122718463, 1.5)
        #pull_door1 = (0.1380582709,0.7976700097,0.4141748127,-0.4740000635,0,-1.135145783,-0.1380582709, 1.5)
        #pull_door2 = (-0.1380582709,0.5317800065,0.6851780853,-0.4034369472,0.3425890426,-1.1300325137,-0.1380582709, 1.5)
        #door_open = (-0.2403236568,0.3016828883,0.4039482741,-0.122718463,0.4346278899,-1.1555988602,-0.419288082, 1.5)

        r = rospy.Rate(60)
        rospy.sleep(5)


        while self.gripped is True:
            gummi = Gummi()
            gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)

            #print('WARNING: Moving joints sequentially to equilibrium positions.')
            #gummi.doGradualStartup()

            #print("GummiArm is live!")

            for i in range(0,100):
                gummi.handDOF1.servoTo(1.5)
                r.sleep()

            for i in range(0,500):
                gummi.elbow.moveWith(-0.002, 0.5)
                r.sleep()

                #for i in range(0,100):
                    #gummi.goTo(pull_door1, False)
                    #r.sleep()

                #for i in range(0,100):
                    #gummi.goTo(pull_door2, False)
                    #r.sleep()

                #for i in range(0,100):
                    #gummi.goTo(door_open, False)
                    #r.sleep()

            for i in range(0,100):
                gummi.goTo(rest, False)
                r.sleep()

        rospy.spin()
            #self.gripped = False

if __name__ == '__main__':
    pulldoor()

