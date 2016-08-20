#!/usr/bin/env python

import rospy
import sys
import time

from gummi_interface.antagonist import Antagonist

def main(args):
    
    rospy.init_node('TestSingleAntagonist', anonymous=True)
    r = rospy.Rate(60)  

    name = raw_input("Enter name of antagonist joint to test:  ")
    joint = Antagonist(name)

    cocont = float(raw_input("Enter co-contraction level:  "))

    minAngle = joint.angle.getMin()
    maxAngle = joint.angle.getMax()
    start = rospy.Time.now()
    while not rospy.is_shutdown():

        duration = rospy.Time.now() - start
        secondsSinceStart = duration.to_sec()
   
        if secondsSinceStart > 10:
            start = rospy.Time.now()
        else:
            if secondsSinceStart > 5:
                joint.servoTo(minAngle + 0.1,cocont)
            else:
                joint.servoTo(maxAngle - 0.1,cocont)
               
        r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
