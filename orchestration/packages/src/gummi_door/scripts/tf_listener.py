#!/usr/bin/env python
import roslib
#roslib.load_manifest('learning_tf')
import rospy
import math
import tf
from std_msgs.msg import Header
from geometry_msgs.msg import PointStamped
import turtlesim.srv


class transformer():

    def __init__(self):
        rospy.init_node('tf_kinect')
        #print("running")
        self.listener = tf.TransformListener()
        self.pub = rospy.Publisher('true_target', PointStamped, queue_size=1)
        rospy.Subscriber("/target", PointStamped, self.callback)
        rate = rospy.Rate(10.0)
        while not rospy.is_shutdown():
            try:
                (trans,rot) = self.listener.lookupTransform('/base_link', '/kinect', rospy.Time(0))
                #print(trans, rot)
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                continue
            rate.sleep()

    def callback(self, msg):
        #print("running")
        self.listener.waitForTransform("/base_link", "/kinect", rospy.Time(), rospy.Duration(4.0))
        self.true_target = self.listener.transformPoint("/base_link", msg)
        #print(self.true_target)
        self.x = self.true_target.point.x
        self.y = self.true_target.point.y
        self.z = self.true_target.point.z
        print ((self.x, self.y, self.z))
        self.pub.publish(self.true_target)

if __name__ == '__main__':
    transformer()

