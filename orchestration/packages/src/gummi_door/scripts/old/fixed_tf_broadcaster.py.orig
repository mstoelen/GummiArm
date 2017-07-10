#!/usr/bin/env python
<<<<<<< HEAD
=======
import roslib
#roslib.load_manifest('learning_tf')

>>>>>>> 22d720dd8eeb38a1c91a615621f1b924b9509575
import rospy
import tf

if __name__ == '__main__':
    rospy.init_node('my_tf_broadcaster')
    br = tf.TransformBroadcaster()
    rate = rospy.Rate(10.0)
    odom_quat = tf.transformations.quaternion_from_euler(0.0, 0.38, 0.0)
    print (odom_quat)
    while not rospy.is_shutdown():
        br.sendTransform((0.11, 0.0, 0.39),
                         (odom_quat),
                         rospy.Time.now(),
                         "/kinect",
                         "/base_link")
<<<<<<< HEAD
=======
        #print("running")
>>>>>>> 22d720dd8eeb38a1c91a615621f1b924b9509575
        rate.sleep()
