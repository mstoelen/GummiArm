#!/usr/bin/env python
import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from geometry_msgs.msg import PointStamped
from gummi_interface.gummi import Gummi


def main(args):

    pi = 3.1416
    rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    mid = (0.0, 0.10737865515199489, 0.14317154020265985, -0.21475731030398976, -0.4755340442445488, -1.55, 0.0)
    desired = (0.3170226961630325, 0.5777994301035916, 0.22498384888989406, -0.2684466378799872, -0.3681553890925539, -1.25, 0.0)
    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)
    gummi = Gummi()
    gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)

    for i in range(0,400):
        gummi.goTo(rest, False)
        r.sleep()

    for i in range(0,400):
        gummi.goTo(mid, False)
        r.sleep()

    for i in range(0,400):
        gummi.goTo(desired, False)
        r.sleep()

if __name__ == '__main__':
    main(sys.argv)