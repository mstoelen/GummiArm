#!/usr/bin/env python

import rospy
import sys
import random
import time

from gummi_interface.gummi import Gummi

def main(args):
    
    rospy.init_node('GummiConfigure', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    rospy.logwarn('WARNING: Moving joints sequentially to zero equilibrium and zero co-contraction for antagonist joints, zero joint angle for direct drive joints.')

    rospy.sleep(2)
    
    gummi.doZeroEquilibriumPose()

    rospy.sleep(2)
    
    rospy.logwarn('Done.')

    r.sleep()
  
if __name__ == '__main__':
    main(sys.argv)
