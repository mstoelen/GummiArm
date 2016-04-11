#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  
    
    cocontractionsToTry = (0.5, 1.0)

    #rest = (-0.13, -0.3, 0.89, -0.26, -0.05, 0.69, 0.6)
    #rest = (-0.29, -0.40, 0.68, -0.14, 0.14, -1.11, -0.39)
    rest = (-0.4264776001796058, -0.3632267925204951, 0.43952896154233645, -0.3519524936392377, 0.09959590942766063, -1.38566001295885, 0.1)
    #desired = (0.16, 0.56, 0.35, -0.56, 0.04, 0.40, -0.26)
    #desired = (0.44, 0.99, 0.06, -1.00, -0.56, 0.72, 0.43)
    #desired = (0.7998190768714568, 1.0201045071709505, 0.7797487277750484, -1.0531038996116087, -0.5453775677762133, 1.1723876722423197, 0.05333409312205947)
    desired = (0.8883467495266145, 1.3092029355656658, 0.24612332745751858, -1.4054250963362158, -0.6597164515897976, -0.2171647670527418, -0.08828321162619326)

    gummi = Gummi()

    gummi.setCocontraction(0.4, 0.4, 0.4, 0.4, 0.4)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(1)
    
    gummi.goRestingPose(True)
    for i in range(0,400):
        gummi.goRestingPose(False)
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
            for i in range (0,1200):
                
                if i < 200:
                    command = rest
                else:
                    if i < 800:
                        command = desired
                        now = False
                        if i == 600:
                            print("GET READY!")
                        if i == 200:
                            now = True
                    else:
                        command = rest
                        now = False
                        if i == 800:
                            now = True
                            
                gummi.goTo(command, now)
                #gummi.servoTo(command)

                r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
