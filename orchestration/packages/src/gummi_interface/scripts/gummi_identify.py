#!/usr/bin/env python

import rospy
import wx
import sys
import random
import time
import pygame
from pygame.locals import *

from gummi_interface.gummi import Gummi
from gummi_interface.helpers import radToDeg

def main(args):

    pygame.init()
    
    rospy.init_node('GummiIdentify', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    gummi.setMaxLoads(100, 100, 100, 100, 100)
    gummi.setStiffness(0.5, 0.5, 0.5, 0.5, 0.5)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)

    for i in range(0, 400):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")

    velocities = [0, 0, 0, 0, 0, 0, 0]
    start = rospy.Time.now()
    ask = True
    while not rospy.is_shutdown():

        if ask:
            indexes = [int(x) for x in raw_input("Enter index of joint to identify (1-7):  ").split()]
            velocities = [0, 0, 0, 0, 0, 0, 0]
            index = indexes[0] - 1
            start = rospy.Time.now()
            ask = False

        angles = gummi.getJointAngles()
        angles = radToDeg(angles)

        duration = rospy.Time.now() - start
        secondsSinceStart = duration.to_sec()
            
        if secondsSinceStart > 20:
            ask = True
        else:
            if secondsSinceStart > 15:
                print("Done, moving to resting pose.")
                gummi.goRestingPose()
            else:
                vel = 0.0
                if secondsSinceStart > 5:
                    vel = -0.01
                else:
                    vel = 0.01

                print('At angle: ' + str(angles[index]) + ' degrees, sending velocity: ' + str(vel) + '.')
                velocities[index] = vel
                gummi.setVelocity(velocities)
                gummi.doUpdate()

        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
