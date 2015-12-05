#!/usr/bin/env python

import rospy

def radToDeg(angles):
    pi = 3.1416
    for i,a in enumerate(angles):
        a = a * 180/pi
        angles[i] = a
    return angles

def fetchParam(name, default):
    if not rospy.has_param(name):
        input("Warning: Parameter " + name + " not found, if press Enter will default to: " + str(default))
        return default
    else:
        return rospy.get_param(name)
