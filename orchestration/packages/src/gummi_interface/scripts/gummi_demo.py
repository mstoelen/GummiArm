#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    cocontractionsToTry = (0.25, 0.25)
    jointNums = (0,1,2,4,6)

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    gummi.setCocontraction(0.8, 0.8, 0.8, 0.8, 0.8)
    
    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)
    
    gummi.goRestingPose(True)
    for i in range(0,400):
        gummi.goRestingPose(False)
        r.sleep()
        
    print("GummiArm is live!")


    for jointNum in jointNums:

        if jointNum is 0:
            joint = gummi.shoulderYaw
        else:
            if jointNum is 1:
                joint = gummi.shoulderRoll
            else:
                if jointNum is 2:
                    joint = gummi.shoulderPitch
                else:
                    if jointNum is 4:
                        joint = gummi.elbow
                    else:
                        if jointNum is 6:
                            joint = gummi.wrist
                            
        minAngle = joint.angle.getMin()*180/pi
        maxAngle = joint.angle.getMax()*180/pi
        rangeAngle = maxAngle - minAngle
        
        rest = minAngle + rangeAngle/4
        desired = maxAngle - rangeAngle/4
            
        for cocont in cocontractionsToTry: 
                
            for i in range (0,500):
                       
                if i < 200:
                    command = rest
                    joint.servoTo(command * pi/180, cocont)
                else:
                    if i < 400:
                        command = desired
                        now = False
                        if i == 200:
                            now = True
                    else:
                        command = rest
                        now = False
                        if i == 400:
                            now = True
                    joint.goTo(command * pi/180, cocont, now)
                r.sleep()

        for i in range(0,400):
            gummi.goRestingPose(False)
            r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
