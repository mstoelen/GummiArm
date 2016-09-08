#!/usr/bin/env python

import rospy
import sys
import random
import time
from math import pi

from gummi_interface.gummi import Gummi

def main(args):

    rospy.init_node('GummiArm', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(1)

    gummi.goRestingPose(True)
    for i in range(0,400):
        gummi.goRestingPose(False)
        r.sleep()

    #for i in range(0,100):
    #    gummi.forearmRoll.servoTo(pi/2)
    #    r.sleep()

    gummi.setCollisionResponses(False, False, False, False, False)
    print("GummiArm is live!")

    while not rospy.is_shutdown():
        if gummi.teleop == 0:
            gummi.doUpdate()

        gummi.publishJointState()
        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
