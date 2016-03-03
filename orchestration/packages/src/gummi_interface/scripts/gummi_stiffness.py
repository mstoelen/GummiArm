#!/usr/bin/env python

#TODO: Fix and test this script

import rospy
import sys
import csv

from antagonist import Antagonist
from direct_drive import DirectDrive

def main(args):

    pi = 3.1416
    equilibriums = (-0.75, -0.5)
    stiffnesses = (0, 0.25, 0.5, 0.75, 1)
    distances = range(7,21,1)

    with open('results/stiffness_test.csv', 'wb') as csvfile:

        writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        writer.writerow(['attempt', 'distance', 'stiffness', 'equilibirum', 'angle'])

        rospy.init_node('stiffnessTest', anonymous=True)
        
        upperarmRoll = DirectDrive("upperarm_roll", pi)
        elbow = Antagonist(-1, 1, -1, -1, 1, "biceps", "triceps", "elbow_encoder", 0, 2*pi, -0.75, 0.85)

        
        r = rospy.Rate(60)  
        
        print("Moving arm into place.")
        for i in range (0,300):
            upperarmRoll.servoTo(0)
            elbow.moveTo(0, 0)
            r.sleep()
        print("Test starting. Add weights.")
            
        for dist in distances:
            
            try:
                input("Adjust distance to " + str(dist) + " cm, and press enter.")
            except SyntaxError:
                pass
            
            for att in range (1,4):
                for stiff in stiffnesses:
                    for eq in equilibriums:
                        for i in range (0,200):
                            upperarmRoll.servoTo(0)
                            elbow.moveTo(eq, stiff)
                            r.sleep()
                        angle = elbow.getJointAngle()
                        writer.writerow([att, dist, stiff, eq, angle])
            
if __name__ == '__main__':
    main(sys.argv)
