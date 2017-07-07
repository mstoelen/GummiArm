#!/usr/bin/env python

import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

print "============ Starting tutorial setup"
moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_group_python_interface_tutorial',
                anonymous=True)

robot = moveit_commander.RobotCommander()

scene = moveit_commander.PlanningSceneInterface()

group = moveit_commander.MoveGroupCommander("right_arm")

display_trajectory_publisher = rospy.Publisher(
                                    '/moveit/move_group/display_planned_path',
                                    moveit_msgs.msg.DisplayTrajectory,
                                    queue_size=20)

print "============ Waiting for RVIZ..."
rospy.sleep(2)
print "============ Starting tutorial "


print "============ Reference frame: %s" % group.get_planning_frame()

print "============ Reference frame: %s" % group.get_end_effector_link()

print "============ Robot Groups:"
print robot.get_group_names()

print "============ Printing robot state"
print robot.get_current_state()
print "============"

print "============ Generating plan 1"
print "Pose=>",group.get_current_pose().pose
pose_target = geometry_msgs.msg.Pose()
pose_target.orientation.w = 0.0
#pose_target.position.x = 0.48
#pose_target.position.y = 0.0
#pose_target.position.z = -0.23
pose_target.position.x = 0.20
pose_target.position.y = -0.10
pose_target.position.z = -0.20

group.set_pose_target(pose_target)

plan1 = group.plan()

print "============ Waiting while RVIZ displays plan1..."
rospy.sleep(1)

print "============ Visualizing plan1"
display_trajectory = moveit_msgs.msg.DisplayTrajectory()

display_trajectory.trajectory_start = robot.get_current_state()
display_trajectory.trajectory.append(plan1)
display_trajectory_publisher.publish(display_trajectory);

print "============ Waiting while plan1 is visualized (again)..."
rospy.sleep(1)

group.go(wait=True)

group.clear_pose_targets()

group_variable_values = group.get_current_joint_values()
print "============ Joint values: ", group_variable_values


# group.get_active_joints()
# Lists the joint names.

# group.get_current_pose()
# Gives the current pose.

# ['shoulder_yaw', 'shoulder_roll', 'shoulder_pitch', 'upperarm_roll', 'elbow', 'forearm_roll', 'wrist_pitch', 'gripper']
# [-0.025226037690079302, 0.3769213245135568, 0.4897020802744555, 0.1243771113491562, 0.18574430427282076, -0.4894410390524079, -0.5991564303230394, 0.0]
