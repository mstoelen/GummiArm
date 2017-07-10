#!/usr/bin/env python

import rospy
import sys
import csv
import math

from std_msgs.msg import Bool
from std_msgs.msg import UInt16

from gummi_interface.gummi import Gummi


class pulldoor:

    def __init__(self):
        self.gripped = False

        rospy.Subscriber("/gripped", Bool, self.gripCallback)
        self.main()

    def gripCallback(self, msg):
        self.gripped = msg.data


    def main(self):

        pi = 3.1416
        gummi = Gummi()
        # get some numbers for open from moveit!
        rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
        ready = (0.2094395102, 0.7679448709, 0.2967059728, 0, -0.2268928028, -1.2915436465, 0, 2.7401669256)
        turn_handle = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)

        # turn handle by rotating forarm roll joint clockwise by ~45 deg
        # pull door by rotating shoulder (yaw?) and contracting angle of elbow
        # lateral joints should be low cocontraction
        if self.gripped is True:
            gummi.setCocontraction(0.6, 0.6, 0.85, 0.6, 0.2)
            # gummi.forearm_roll.servoTo(a number) or may need to rotate from shoulder
            rospy.sleep(2)
            gummi.moveTo(turn_handle)
            # maybe something like this
            #gummi.goTo(ready)
            #rospy.sleep(2)
            #gummi.handClose.servoTo(2)
            #rospy.sleep(2)
            #gummi.goTo(turn_handle)
            #rospy.sleep(2)

        else:
            gummi.goTo(rest)

if __name__ == '__main__':
    rospy.init_node('open_door', anonymous=True)
    pulldoor()