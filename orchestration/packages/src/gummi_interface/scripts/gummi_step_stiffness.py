#!/usr/bin/env python

#TODO: Fix and test this script

import rospy
import sys
import csv

from antagonist import Antagonist
from direct_drive import DirectDrive

def main(args):

    pi = 3.1416

    rospy.init_node('stiffnessTest', anonymous=True)
        
    upperarmRoll = DirectDrive("upperarm_roll", pi)
    elbow = Antagonist(-1, 1, -1, -1, 1, "biceps", "triceps", "elbow_encoder", 0, 2*pi, -0.75, 0.85)
    forearmRoll = DirectDrive("forearm_roll", 1.75*pi)
    wrist = Antagonist(-1, -1, -1, -1, 1, "wrist_flexor", "wrist_extensor", "wrist_encoder", 0, 1.75*pi, -1.0, 1.0)
    
    r = rospy.Rate(60)  
      
    for att in range (1,11):

        print("Moving arm into place.")
        for i in range (0,150):
            upperarmRoll.servoTo(0)
            forearmRoll.servoTo(0)
            wrist.servoTo(0,0)
            elbow.moveTo(0,0)
            r.sleep()
        print("Test started, attempt: " + str(att) + ".")
            
        fileName = 'results/step_test_stiffness_a_' + str(att) + '.csv'
        with open(fileName, 'wb') as csvfile:
            writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
            writer.writerow(['time','stiffness','angle','flexor-angle','extensor-angle'])
                
            time1 = rospy.Time.now()
            for i in range (0,400):
                upperarmRoll.servoTo(0)
                forearmRoll.servoTo(0)
                wrist.servoTo(0,0)
                
                if i < 80:
                    stiff = 0.0
                else:
                    if i <240:
                        stiff = 1.0
                    else:
                        stiff = 0.0
                
                elbow.moveTo(0, stiff)
                
                angle = elbow.getJointAngle() * 180/pi
                flexor = joint.eqModel.flexor.getJointAngle() * 180/pi
                extensor = joint.eqModel.extensor.getJointAngle() * 180/pi
                time2 = rospy.Time.now()
                duration = time2-time1
                delta = duration.to_sec()
                
                writer.writerow([delta, stiff, angle, flexorAngle, extensorAngle])
                r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
