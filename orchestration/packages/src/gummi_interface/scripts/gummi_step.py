#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416
    print("Please enter path to folder where you want data file saved:")
    path =  raw_input()

    desired = 20
    rest = -23
    cocontractions_to_try = (0.0, 0.25, 0.5) #(0, 0.25, 0.5, 0.75, 1)

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    gummi.setMaxLoads(100, 100, 100, 100, 100)
    gummi.setCocontraction(0.8, 0.8, 0.8, 0.0, 0.8)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)

    for i in range(0, 400):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")
     
    for cocont in cocontractions_to_try: 
      
        for att in range (1,2):

            print("Moving arm into place.")
            for i in range (0,400):
                gummi.elbow.servoTo(rest * pi/180, cocont)
                r.sleep()
            print("Test started, cocontraction: " + str(cocont) + ", attempt: " + str(att) + ".")
            
            fileName = path + '/step_test_s_' + str(cocont) + '_a_' + str(att) + '.csv'
            with open(fileName, 'wb') as csvfile:
                writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                writer.writerow(['time','desired','angle'])
                
                time1 = rospy.Time.now()
                now = False
                for i in range (0,800):

                    if i < 200:
                        command = rest
                    else:
                        if i < 500:
                            command = desired
                            now = False
                            if i == 200:
                                now = True
                        else:
                            command = rest
                            now = False
                            if i == 500:
                                now = True

                    #gummi.elbow.servoTo(command * pi/180, cocont)
                    gummi.elbow.goTo(command * pi/180, cocont, now)

                    angles = gummi.getJointAngles()
                    angle = angles[4] * 180/pi
                    time2 = rospy.Time.now()
                    duration = time2-time1
                    delta = duration.to_sec()

                    writer.writerow([delta, command, angle])
                    r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
