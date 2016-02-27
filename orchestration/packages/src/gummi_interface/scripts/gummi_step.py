#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    desired = 23
    rest = -37.5
    cocontractions_to_try = (0, 0.25, 0.5, 0.75, 1)

    rospy.init_node('cocontractionTest', anonymous=True)
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
            for i in range (0,100):
                gummi.setCocontraction(0.8, 0.8, 0.8, cocont, 0.8)
                gummi.servoTo([0, 0, 0, 0, rest * pi/180, 0, 0])
                r.sleep()
            print("Test started, cocontraction: " + str(cocont) + ", attempt: " + str(att) + ".")
            
            fileName = 'step_test_s_' + str(cocont) + '_a_' + str(att) + '.csv'
            with open(fileName, 'wb') as csvfile:
                writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                writer.writerow(['time','desired','angle'])
                
                time1 = rospy.Time.now()
                for i in range (0,800):

                    if i < 200:
                        command = rest
                    else:
                        if i <500:
                            command = desired
                        else:
                            command = rest

                    command_rad = command * pi/180

                    gummi.servoTo([0, 0, 0, 0, command_rad, 0, 0])

                    angles = gummi.getJointAngles()
                    angle = angles[4] * 180/pi
                    time2 = rospy.Time.now()
                    duration = time2-time1
                    delta = duration.to_sec()

                    writer.writerow([delta, command, angle])
                    r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
