#!/usr/bin/env python

import rospy
import wx
import sys
import random
import time

from gummi import Gummi

def main(args):

    record = False
    if len(args) > 1:
        record = True
        fileNameBase = args[1]
        print("WARNING: Will record first 20 seconds in files with base " + fileNameBase + ".")

    rospy.init_node('GummiInterface', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    gummi.setMaxLoads(10, 10, 10, 0.6)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)

    for i in range(0, 400):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")

    if record:
        print("Recording!")
        gummi.prepareRecording(fileNameBase)
        gummi.startRecording()

    while not rospy.is_shutdown():
        gummi.publishJointState()
        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
