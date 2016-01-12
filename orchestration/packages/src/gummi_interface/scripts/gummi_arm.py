#!/usr/bin/env python

import rospy
import wx
import sys
import random
import time

from gummi_interface.gummi import Gummi

def main(args):

    record = False
    if rospy.get_param("gummi/recording") == 1:
        record = True
        fileNameBase = rospy.get_param("gummi/name_base_recording")
        print("WARNING: Will record in files with base: " + fileNameBase + ".")

    rospy.init_node('GummiArm', anonymous=True)
    r = rospy.Rate(100)  

    gummi = Gummi()

    gummi.setMaxLoads(10, 10, 10, 10, 10)

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
