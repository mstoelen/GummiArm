#!/usr/bin/env python

##
# Massimiliano Patacchiola, Plymouth University 2016
# GummiArm kinect wrapper for Handshake demo.
#
# It read the information from the kinect and turn
# it in laserscan data. This data are then used to
# identity the presence of a person in front of the arm.
# When a person is find a trigger is pulled and the value
# is published in another topic.
#
import roslib
import rospy
import sensor_msgs.msg
from std_msgs.msg import Bool
import sensor_msgs
import numpy as np

#Global variable (don't change this value)
TRIGGER = False 

#Global variable for distance and time
#Set this variable to change the time/distance 
#necessary to take up an down the trigger
#The MIN and MAX distance values define the range
#where the presence of the person is detected.
DISTANCE_MIN = 0.7 #in meters
DISTANCE_MAX = 1.0 #in meters
#The COLUMNS value is used to do an average of
#the values around the centre of the laser array
#The array contains 640 values, the centre (320)
#is used as reference point for finding the person
#if COLUMNS=30 then we check for a person in the range
# 320-30/320+30 the COLUMNS value must not be less than 320
COLUMNS = 30
#Change the time if you need more cycle to
#pull the trigger, also the rate can be changed
#if necessary. The trigger is activated when the
#internal counter>=TIME*RATE
TIME = 1.0 #in seconds
RATE = 10 #in Hz
#Enable the debug only if necessary
DEBUG = False #set to True for an heavy print

##
# This function is called when data from the 
# /kinet_scan topic receive some data
def callback(data):
    pass
    if(DEBUG == True): rospy.loginfo("range min: %.2f; range Max: %.2f" % (data.range_min, data.range_max))
    if(DEBUG == True): print("Ranges size: " + str(len(data.ranges)))
    if(DEBUG == True): print("Ranges: " + str(data.ranges) + "\n")
    ranges_array = np.array(data.ranges)
    ranges_array = np.nan_to_num(ranges_array) #change nan to zero
    mean_value = np.mean(ranges_array[320-COLUMNS:320+COLUMNS]) #320 is the centre 640 is the size
    if(DEBUG == True): print("Mean: " + str(mean_value))
    if(mean_value >= DISTANCE_MIN and mean_value <= DISTANCE_MAX):
        TRIGGER = True
        rospy.loginfo("Person detected at %.2f meters " % (mean_value))
    else:
        TRIGGER = False

##
# Listening to the kinect_scan topic
#
def laser_listener():
    pass
    rospy.init_node('laser_listener', anonymous=True)
    rospy.Subscriber("/kinect_scan", sensor_msgs.msg.LaserScan, callback)  #,20)    
    rospy.spin() #Keeps the node running

#Main function
if __name__ == '__main__':
    rospy.init_node('gummi_trigger', anonymous=True)
    rospy.loginfo("Init the listener for the '/kinect_scan' topic") 
    sub = rospy.Subscriber("/kinect_scan", sensor_msgs.msg.LaserScan, callback)  #,20)
    rospy.loginfo("Init the publisher '/trigger_status'")
    pub = rospy.Publisher('/trigger_status', Bool, queue_size=10)
    ros_rate = rospy.Rate(RATE)
    rospy.loginfo("Init the gummi_trigger node at %.2f Hz"  % (RATE))
    counter = 0
    while not rospy.is_shutdown():
            #If the TRIGGER is ON it augment the counter
            if(TRIGGER == True): counter = counter + 1

            #Check the value of the counter
            if(counter >= RATE*TIME):
                pub.publish(True)
                if(DEBUG == True): rospy.loginfo("Trigger True")
                counter = 0
            else:
                pub.publish(False)
                if(DEBUG == True): rospy.loginfo("Trigger False")

            #pub.publish(hello_str)
            ros_rate.sleep()
