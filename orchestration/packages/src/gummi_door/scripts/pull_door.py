#!/usr/bin/env python

import rospy
import sys
import csv
import math

from std_msgs.msg import Bool
from std_msgs.msg import UInt16

from gummi_interface.gummi import Gummi


class PullDoor:

    def __init__(self):
        self.gripped = False

        rospy.Subscriber("/gripped", Bool, self.gripCallback)

    def gripCallback(self, msg):
        self.gripped = msg.data


def main():

    pi = 3.1416
    gummi = Gummi()
    # get some numbers for open from moveit!
    ajar = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)

    # turn handle by rotating forarm roll joint clockwise by ~45 deg
    # pull door by rotating shoulder (yaw?) and contracting angle of elbow
    # lateral joints should be low cocontraction
    if self.gripped is True:
        gummi.setCocontraction(0.6, 0.6, 0.85, 0.6, 0.2)
        # gummi.forearm_roll.servoTo(a number)
        rospy.sleep(2)
        gummi.moveTo(ajar)

    else:
        gummi.goTo(rest)




if __name__ == '__main__':
    main()