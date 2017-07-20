#!/usr/bin/env python

import sys
import rospy
import copy
import numpy as np
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PoseStamped
#from gummi_interface.gummi import Gummi



class planning():

    def __init__(self):
        rospy.Subscriber("/true_target", PointStamped, self.callback)
        rospy.Subscriber("/ready", Bool, self.readyCallback)
        #self.gummi = Gummi()
        self.pub = rospy.Publisher("/gripped", Bool, queue_size=10)
        self.gripped = False

        self.main()


    def callback(self, data):
        #target = [data.point.x, data.point.y, data.point.z]
        #if np.logical_not(np.isnan(target[0])):
            #self.x = target[2]
            #self.y = target[1]
            #self.z = target[0] + 0.1
        self.x = data.point.x
        self.y = data.point.y
        self.z = data.point.z
        #if np.logical_not(np.isnan(self.x)) and np.logical_not(np.isnan(self.y)) and np.logical_not(np.isnan(self.z)):
        return self.x, self.y, self.z
        print (self.y)
        #else:
            #print ("fucking nan")

    def readyCallback(self, msg):
        self.ready = msg.data

    def main(self):
        #while self.ready is True:
        #self.gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
        rospy.sleep(5)
        moveit_commander.roscpp_initialize(sys.argv)
        robot = moveit_commander.RobotCommander()
        scene = moveit_commander.PlanningSceneInterface()
        group = moveit_commander.MoveGroupCommander("right_arm")

        #self.x = 0.5
        #self.y = 0.1
        #self.z = 0.1
        rospy.sleep(2)

        handle_id = "handle"
        door_id = "door"
        scene.remove_world_object(handle_id)
        scene.remove_world_object(door_id)
        rospy.sleep(1)
        handle_size = [0.05, 0.2, 0.02]
        door_size = [0.05, 0.8, 2.0]

        handle_pose = PoseStamped()
        handle_pose.header.frame_id = "/base_link"
        handle_pose.pose.position.x = self.x - 0.02
        handle_pose.pose.position.y = self.y
        handle_pose.pose.position.z = self.z
        handle_pose.pose.orientation.w = 1.0
        scene.add_box(handle_id, handle_pose, handle_size)

        door_pose = PoseStamped()
        door_pose.header.frame_id = "/base_link"
        door_pose.pose.position.x = self.x + 0.1
        door_pose.pose.position.y = self.y - 0.3
        door_pose.pose.position.z = self.z
        door_pose.pose.orientation.w = 1.0
        scene.add_box(door_id, door_pose, door_size)

        #self.setColor(handle_id, 0.8, 0, 0, 1.0)
        #self.sendColors()

        #collision_object = moveit_msgs.msg.CollisionObject()
        #collision_object.header.frame_id = "/base_link"


        #p = PoseStamped()
        #p.header.frame_id = robot.get_planning_frame()
        #p.pose.position.x = 0.
        #p.pose.position.y = 0.
        #p.pose.position.z = 0.
        #scene.add_box("table", p, (0.5, 1.5, 0.6))

        #group.setPlanningTime(10)
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
        #waypoints = []

        ## start with the current pose
        #waypoints.append(group.get_current_pose().pose)

        ## first orient gripper and move forward (+x)
        #wpose = geometry_msgs.msg.Pose()
        #wpose.orientation.w = -0.5
        #wpose.position.x = self.x
        #wpose.position.y = self.y
        #wpose.position.z = self.z
        #waypoints.append(copy.deepcopy(wpose))
        #rospy.sleep(1)
        ## second move down
        #wpose.position.z -= 0.10
        #waypoints.append(copy.deepcopy(wpose))
        #rospy.sleep(1)

        ## third move to the side
        ##wpose.position.y += 0.05
        ##waypoints.append(copy.deepcopy(wpose))

        #(plan3, fraction) = group.compute_cartesian_path(
                                     #waypoints,   # waypoints to follow
                                     #0.01,        # eef_step
                                     #0.0)         # jump_threshold

        #print "============ Waiting while RVIZ displays plan3..."
        #rospy.sleep(5)

        #group.go(wpose, wait=True)

        #pose_target0 = group.get_current_pose()
        #print (pose_target0)
        ##pose_target = geometry_msgs.msg.Pose()


        #pose_target0.pose.position.x = 0.3
        #pose_target0.pose.position.y = -0.4
        #pose_target0.pose.position.z = 0.0
        #pose_target0.pose.orientation.x = 0.0
        #pose_target0.pose.orientation.y = 0.0
        #pose_target0.pose.orientation.z = 0.0
        #pose_target0.pose.orientation.w = 1.0
        ##pose_target0.pose.orientation.x = 0.973741798137
        ##pose_target0.pose.orientation.y = -0.0905325275454
        ##pose_target0.pose.orientation.z = 0.185394157184
        ##pose_target0.pose.orientation.w = 0.0962277428784
        #print (pose_target0)


        #group.go(pose_target0, wait=True)

        pose_target = group.get_current_pose()
        print (pose_target)
        #pose_target.pose.position.x += 0.2
        #pose_target.pose.position.y += -0.1
        #pose_target.pose.position.z += 0.0
        #pose_target = geometry_msgs.msg.Pose()
        #pose_target.pose.orientation.w = 0.0270944592499
        #pose_target.pose.orientation.x = 0.0
        #pose_target.pose.orientation.y = 0.0
        #pose_target.pose.orientation.z = 0.0
        #pose_target.pose.orientation.w = 1.0
        pose_target.pose.position.x = self.x - 0.05
        pose_target.pose.position.y = -self.y
        pose_target.pose.position.z = self.z + 0.1
        #self.x = pose_target.pose.position.x + 0.1
        #pose_target = [self.x, self.y, self.z]
        #group.set_position_target(pose_target)
        print (self.y)
        print (pose_target)
        rospy.sleep(2)
            #x: -0.98588467338
    #y: 0.0414697750102
    #z: 0.0550324007106
    #w: 0.152588018623
        #group.set_pose_target(pose_target)

        #plan3 = group.plan()
        #print ("============ Waiting while RVIZ displays plan1...")
        #rospy.sleep(1)
        #print ("============ Visualizing plan3")
        #display_trajectory = moveit_msgs.msg.DisplayTrajectory()

        #display_trajectory.trajectory_start = robot.get_current_state()
        #display_trajectory.trajectory.append(plan3)
        #display_trajectory_publisher.publish(display_trajectory)
        #print ("============ Waiting while plan1 is visualized (again)...")
        #rospy.sleep(1)

        group.go(pose_target, wait=True)

        rospy.sleep(5)

        pose_target2 = group.get_current_pose()
        #pose_target = geometry_msgs.msg.Pose()
        #pose_target2.pose.orientation.w = 1.0
        #pose_target2.pose.position.x += 0.2
        #pose_target2.pose.position.y += 0.1
        pose_target2.pose.position.z += -0.1
        print (pose_target2)

        group.go(pose_target2, wait=True)

        rospy.sleep(5)

        self.gripped = True
        while not rospy.is_shutdown():
            self.pub.publish(self.gripped)

        #pose_target3 = group.get_current_pose()
        ##pose_target = geometry_msgs.msg.Pose()
        ##pose_target3.pose.orientation.w = 1.0
        #pose_target3.pose.position.x = 0.341542142664
        #pose_target3.pose.position.y = -0.4
        #pose_target3.pose.position.z = 0.0
        #print (pose_target3)

        #group.go(pose_target3, wait=True)

        group.clear_pose_targets()

        group_variable_values = group.get_current_joint_values()
        print "============ Joint values: ", group_variable_values
        # Uncomment below line when working with a real robot
        # self.group.go(wait=True)
        #rospy.spin()
        #moveit_commander.roscpp_shutdown()
        #print ("============ STOPPING")
        #self.gripped = True
        #while not rospy.is_shutdown():
            #self.pub.publish(self.gripped)

        rospy.spin()


if __name__ == '__main__':
    rospy.init_node('target_plan', anonymous=True)
    try:
        ne = planning()
    except rospy.ROSInterruptException:
        pass

