#!/usr/bin/env python
import rospy
import tf
from geometry_msgs.msg import PointStamped


class transformer(object):

    def __init__(self):
        rospy.init_node('tf_kinect')
        self.listener = tf.TransformListener()
        self.pub = rospy.Publisher('/true_target', PointStamped, queue_size=1)
        rospy.Subscriber("/target", PointStamped, self.callback)
        self.rate = rospy.Rate(10.0)

    def callback(self, msg):
        self.listener.waitForTransform("/base_link", "/kinect", rospy.Time(),
rospy.Duration(4.0))
        self.true_target = self.listener.transformPoint("/base_link", msg)
        self.pub.publish(self.true_target)
        self.x = self.true_target.point.x
        self.y = self.true_target.point.y
        self.z = self.true_target.point.z


if __name__ == '__main__':
    transformer()
    rospy.spin()

