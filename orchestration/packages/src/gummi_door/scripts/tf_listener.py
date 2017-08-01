#!/usr/bin/env python

import rospy
import tf
from geometry_msgs.msg import PointStamped

class transformer():

    def __init__(self):
        rospy.init_node('tf_kinect')
        self.listener = tf.TransformListener()
        self.pub = rospy.Publisher('/true_target', PointStamped, queue_size=1)
        rospy.Subscriber("/target", PointStamped, self.callback)
        self.rate = rospy.Rate(10.0)
        self.main()

    def main(self):
        while not rospy.is_shutdown():
            try:
                self.listener.waitForTransform("/base_link", "/kinect", rospy.Time(),
    rospy.Duration(8.0))

                #print(self.true_target)
                #self.x = self.true_target.point.x
                #self.y = self.true_target.point.y
                #self.z = self.true_target.point.z
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                continue

            self.rate.sleep()


    def callback(self, msg):
        self.true_target = self.listener.transformPoint("/base_link", msg)
        self.pub.publish(self.true_target)
        return self.true_target


if __name__ == '__main__':
    transformer()
    #rospy.spin()
