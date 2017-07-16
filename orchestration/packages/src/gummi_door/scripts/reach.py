#!/usr/bin/env python

import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from geometry_msgs.msg import PointStamped


class planning():

    def __init__(self):
        rospy.Subscriber("/true_target", PointStamped, self.callback)
        self.pub = rospy.Publisher("/gripped", Bool, queue_size=10)
        self.gripped = False

        self.main()


    def callback(self, data):
        self.x = data.point.x
        self.y = data.point.y
        self.z = data.point.z
        return self.x, self.y, self.z

    def main(self):

        moveit_commander.roscpp_initialize(sys.argv)
        robot = moveit_commander.RobotCommander()
        scene = moveit_commander.PlanningSceneInterface()
        group = moveit_commander.MoveGroupCommander("right_arm")

        #x = 0.5
        #y = 0.1
        #z = 0.1


        display_trajectory_publisher = rospy.Publisher(
                                            '/move_group/display_planned_path',
                                            moveit_msgs.msg.DisplayTrajectory,
                                            queue_size=20)
        print ("============ Waiting for RVIZ...")
        rospy.sleep(2)
        print ("============ Reference frame: %s" % group.get_planning_frame())
        print ("============ Reference frame: %s" % group.get_end_effector_link())
        print ("============ Robot Groups:")
        print (robot.get_group_names())
        print "============ Printing robot state"
        print robot.get_current_state()
        print ("============ Generating plan 1")
        print "Pose=>",group.get_current_pose().pose
        pose_target = geometry_msgs.msg.Pose()
        pose_target.orientation.w = 1.0
        pose_target.position.x = self.x
        pose_target.position.y = -self.y
        pose_target.position.z = self.z
        group.set_pose_target(pose_target)

        plan1 = group.plan()
        print ("============ Waiting while RVIZ displays plan1...")
        rospy.sleep(1)
        print ("============ Visualizing plan1")
        display_trajectory = moveit_msgs.msg.DisplayTrajectory()

        display_trajectory.trajectory_start = robot.get_current_state()
        display_trajectory.trajectory.append(plan1)
        display_trajectory_publisher.publish(display_trajectory)
        print ("============ Waiting while plan1 is visualized (again)...")
        rospy.sleep(1)

        group.go(wait=True)

        group.clear_pose_targets()

        group_variable_values = group.get_current_joint_values()
        print "============ Joint values: ", group_variable_values
        # Uncomment below line when working with a real robot
        # self.group.go(wait=True)
        #rospy.spin()
        #moveit_commander.roscpp_shutdown()
        #print ("============ STOPPING")
        self.gripped = True
        while not rospy.is_shutdown():
            self.pub.publish(self.gripped)

        rospy.spin()


if __name__ == '__main__':
    rospy.init_node('target_plan', anonymous=True)
    try:
        ne = planning()
    except rospy.ROSInterruptException:
        pass

