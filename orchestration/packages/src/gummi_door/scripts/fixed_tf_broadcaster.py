#!/usr/bin/env python

import rospy
import tf

if __name__ == '__main__':
    rospy.init_node('my_tf_broadcaster')
    br = tf.TransformBroadcaster()
    rate = rospy.Rate(10.0)
    odom_quat = tf.transformations.quaternion_from_euler(0.0, 0.39, 0.0)
    print (odom_quat)
    while not rospy.is_shutdown():
        br.sendTransform((0.0, 0.11, 0.30),
                         (odom_quat),
                         rospy.Time.now(),
                         "/kinect",
                         "/base_link")
        rate.sleep()
