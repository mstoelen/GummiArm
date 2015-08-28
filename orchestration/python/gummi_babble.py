#!/usr/bin/env python

import rospy
import wx
import sys
import random
import time
import pygame
from pygame.locals import *

from gummi import Gummi

def isAtJointLimit(angles, mins, maxs):
    atLimits = list()
    for an, mi, ma in zip(angles, mins, maxs):
        if an <= mi:
            atLimits.append(True)
        else:
            if an >= ma:
                atLimits.append(True)
            else:
                atLimits.append(False)
    return atLimits

def limitVelocity(v,limit):
    if v >= limit:
        return limit
    else:
        if v <= -limit:
            return -limit
    return v

def radToDeg(angles):
    pi = 3.1416
    for i,a in enumerate(angles):
        a = a * 180/pi
        angles[i] = a
    return angles

def reverseVelocities(vels):
    for i,v in enumerate(vels):
        v = -v/2
        vels[i] = v
    return vels

def main(args):

    pygame.init()
    
    disp = pygame.display.set_mode((600,600),0,32)
    disp.fill((255,255,255))
    pygame.display.update()

    rospy.init_node('GummiBabble', anonymous=True)
    r = rospy.Rate(30)  

    gummi = Gummi()

    gummi.setMaxLoads(2, 1.75, 2, 1)
    gummi.manualSetStiffness(0.4, 0.4, 0.4, 0.4)

    minLimits = [-30,-75,-30,-25,-75,-35]
    maxLimits = [65,0,30,25,75,35]

    timeReverse = rospy.Time.now()

    for i in range(0, 300):
        gummi.goRestingPose()
        r.sleep()

    velocities = [0, 0, 0, 0, 0, 0]
    while not rospy.is_shutdown():

        angles = gummi.getJointAngles()
        angles = radToDeg(angles)
        #print(angles)

        for i,v in enumerate(velocities):
            ran = random.uniform(-1000, 1000)  
            v = v + ran
            if i==2: 
                #Upper arm roll
                v = limitVelocity(v,1000)
            else:
                v = limitVelocity(v,7500)
            velocities[i] = v
        #print(velocities)

        reverse = False
        loads = gummi.getLoads()
        #print(loads)
        for i,l in enumerate(loads):
            if i is not 2:
                if i is not 4:
                    if abs(l) > 1:
                        reverse = True
        
        if not reverse:
            atLimits = list()
            atLimits = isAtJointLimit(angles, minLimits, maxLimits)
            for i,l in enumerate(atLimits):
                if l:
                    if angles[i] <= minLimits[i]:
                        corrected = 300
                    else:
                        corrected = -300
                    velocities[i] = corrected
                    print("Moving joint " + str(i+1) + " away from joint limit!")

        duration = rospy.Time.now() - timeReverse
        secondsSinceReverse = duration.to_sec()

        if secondsSinceReverse > 2.0:
            if reverse:
                velocities = reverseVelocities(velocities)
                print("Reversing all velocities!")
                timeReverse = rospy.Time.now()
            colour = (0, 255, 0)
        else:
            colour = (255, 0, 0)

        gummi.manualServoWith(velocities)

        disp.fill(colour)
        pygame.display.update()

        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
