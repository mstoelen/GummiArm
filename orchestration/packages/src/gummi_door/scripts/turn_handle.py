#!/usr/bin/env python
import sys
import rospy
from gummi_interface.gummi import Gummi


rospy.init_node('turn_handle', anonymous=True)

# left handed door handle
rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
ready = (0.2094395102, 0.7679448709, 0.2967059728, 0, -0.2268928028, -1.2915436465, 0, 2.7401669256)
turn_handle = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)

gummi = Gummi()

gummi.goTo(ready)
rospy.sleep(2)
gummi.handClose.servoTo(2)
rospy.sleep(2)
gummi.goTo(turn_handle)
rospy.sleep(2)