#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    cocont = 0.25
    desired = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

    gummi = Gummi()

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)
    
    gummi.goRestingPose(True)
    for i in range(0,400):
        gummi.goRestingPose(False)
        r.sleep()

    print("GummiArm is live!")

      
    print("Moving arm into place.")
    gummi.goTo(desired, True)
    for i in range(0,400):
        gummi.goTo(desired, False)
        r.sleep()

    print("Setting co-contraction - hold arm.")
    gummi.setCocontraction(cocont, cocont, cocont, cocont, 0.4)
    for i in range (0,200):
        gummi.servoTo(desired)
        r.sleep()

    print("Test started, cocontraction: " + str(cocont) + ".")
     
    while True:
        gummi.goTo(desired, False)
        r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
