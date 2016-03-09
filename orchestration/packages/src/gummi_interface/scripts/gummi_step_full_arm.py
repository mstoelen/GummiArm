#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  
    
    cocontractionsToTry = (1.0, 1.0, 1.0)

    #rest = (-0.13, -0.3, 0.89, -0.26, -0.05, 0.69, 0.6)
    rest = (-0.29, -0.40, 0.68, -0.14, 0.14, -1.11, -0.39)
    #desired = (0.16, 0.56, 0.35, -0.56, 0.04, 0.40, -0.26)
    desired = (0.44, 0.99, 0.06, -1.00, -0.56, 0.72, 0.43)

    gummi = Gummi()

    gummi.setCocontraction(0.4, 0.4, 0.4, 0.4, 0.4)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)

    for i in range(0, 400):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")
     
    for cocont in cocontractionsToTry: 

        gummi.setCocontraction(cocont, cocont, cocont, cocont, cocont)
      
        for att in range (1,2):

            print("Moving arm into place.")
            for i in range (0,400):
                gummi.servoTo(rest)
                r.sleep()
            print("Test started, cocontraction: " + str(cocont) + ", attempt: " + str(att) + ".")
            
            time1 = rospy.Time.now()
            now = False
            for i in range (0,1000):
                
                if i < 200:
                    command = rest
                else:
                    if i < 600:
                        command = desired
                        now = False
                        if i == 200:
                            now = True
                    else:
                        command = rest
                        now = False
                        if i == 600:
                            now = True
                            
                gummi.goTo(command, now)

                r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
