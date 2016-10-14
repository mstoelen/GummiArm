#!/usr/bin/env python

##
# Massimiliano Patacchiola, Plymouth University 2016
# GummiArm kinect wrapper for Handshake demo.
#

import roslib
import rospy
import sensor_msgs.msg
import sensor_msgs
import numpy as np

def callback(data):
    pass
    rospy.loginfo("range min: %.2f; range Max: %.2f" % (data.range_min, data.range_max))
    print("Ranges size: " + str(len(data.ranges)))
    print("Ranges: " + str(data.ranges) + "\n")
    ranges_array = np.array(data.ranges)
    mean_value = np.mean(ranges_array[270:370])
    print("Mean: " + str(mean_value))

def laser_listener():
    pass
    rospy.init_node('laser_listener', anonymous=True)
    rospy.Subscriber("/kinect_scan", sensor_msgs.msg.LaserScan, callback)  #,20)
    #Keeps the node running
    rospy.spin()

if __name__ == '__main__':
    laser_listener()
