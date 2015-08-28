#!/usr/bin/env python

import rospy
import wx
import sys
import random
import time

from gummi import Gummi

def main(args):

    rospy.init_node('GummiInterface', anonymous=True)
    r = rospy.Rate(30)  

    gummi = Gummi()

    gummi.setMaxLoads(10, 10, 10, 10)

    print("GummiArm to resting pose!")

    for i in range(0, 100):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")

    while not rospy.is_shutdown():
        gummi.publishJointState()
        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
