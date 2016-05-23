#!/usr/bin/env python

import rospy
import sys
import random
import time

from gummi_interface.gummi import Gummi
from gummi_interface.helpers import radToDeg

def main(args):
    
    rospy.init_node('GummiIdentify', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    gummi.setCocontraction(0.75, 0.75, 0.75, 0.95, 0.8)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(1)

    gummi.goRestingPose(True)
    for i in range(0, 400):
        gummi.goRestingPose(False)
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
                gummi.goRestingPose(False)
            else:
                vel = 0.0
                if secondsSinceStart > 5:
                    vel = -0.01
                else:
                    vel = 0.01

                print('At angle: ' + str(angles[index]) + ' degrees, sending velocity: ' + str(vel) + '.')
                velocities[index] = vel
                gummi.setVelocity(velocities)
                gummi.doVelocityUpdate()

        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
