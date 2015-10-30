#!/usr/bin/env python

import rospy
import sys
import csv

from antagonist import Antagonist
from direct_drive import DirectDrive

def main(args):

    pi = 3.1416

    desired = 23 #-0.4
    rest = -37.5 #0.65
    stiffnesses = (0, 0.25, 0.5, 0.75, 1)

    rospy.init_node('stiffnessTest', anonymous=True)

    upperarmRoll = DirectDrive("upperarm_roll", pi)
    elbow = Antagonist(-1, 1, -1, -1, 1, "biceps", "triceps", "elbow_encoder", 0, 2*pi, -0.75, 0.85)
    forearmRoll = DirectDrive("forearm_roll", 1.75*pi)
    wrist = Antagonist(-1, -1, -1, -1, 1, "wrist_flexor", "wrist_extensor", "wrist_encoder", 0, 1.75*pi, -1.0, 1.0)
    
    r = rospy.Rate(60)  
     
    for stiff in stiffnesses: 
      
        for att in range (1,11):

            print("Moving arm into place.")
            for i in range (0,150):
                upperarmRoll.servoTo(0)
                forearmRoll.servoTo(0)
                wrist.servoTo(0,0)
                elbow.servoTo(rest * pi/180, stiff)
                r.sleep()
            print("Test started, stiffness: " + str(stiff) + ", attempt: " + str(att) + ".")
            
            fileName = 'results/step_test_s_' + str(stiff) + '_a_' + str(att) + '.csv'
            with open(fileName, 'wb') as csvfile:
                writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                writer.writerow(['time','desired','angle'])
                
                time1 = rospy.Time.now()
                for i in range (0,400):
                    upperarmRoll.servoTo(0)
                    forearmRoll.servoTo(0)
                    wrist.servoTo(0,0)

                    if i < 80:
                        command = rest
                    else:
                        if i <240:
                            command = desired
                        else:
                            command = rest

                    command_rad = command * pi/180

                    elbow.servoTo(command_rad, stiff)

                    angle = elbow.getJointAngle() * 180/pi
                    time2 = rospy.Time.now()
                    duration = time2-time1
                    delta = duration.to_sec()

                    writer.writerow([delta, command, angle])
                    r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
