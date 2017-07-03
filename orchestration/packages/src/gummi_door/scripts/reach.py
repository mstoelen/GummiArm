#!/usr/bin/env python

import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from geometry_msgs.msg import PointStamped
from gummi_interface.gummi import Gummi



def planning(self):

    #door_planning = door_handle_planning()
    gummi = Gummi()
    gripped = False
    self.group = moveit_commander.MoveGroupCommander("right_arm")
    #rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    #ready = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    #move_down = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    # gummi.handClose.servoTo(1) # adjust this value roughtrial and error
    # will need to adjust hand open amount and orientation here before reaching
    print("running")
    #rospy.spin()
    rospy.Subscriber("/true_target", PointStamped, self.callback)
    rospy.Subscriber('~touch', UInt16, self.touchCallback)
    # will need to subscribe to /joint_positions to move the arm down to contact handle from the target position
    self.pub = rospy.Publisher("/gripped", Bool, queue_size=10)
    #print("running")
    moveit_commander.roscpp_initialize(sys.argv)
    self.x = 0
    self.y = 0
    self.z = 0
    self.touch_data_palm = 0
    self.robot = moveit_commander.RobotCommander()
    self.scene = moveit_commander.PlanningSceneInterface()
    self.group = moveit_commander.MoveGroupCommander("right_arm")
    self.display_trajectory_publisher = rospy.Publisher(
                                        '/move_group/display_planned_path',
                                        moveit_msgs.msg.DisplayTrajectory,
                                        queue_size=20)
    #print ("============ Waiting for RVIZ...")
    rospy.sleep(1)
    #print ("============ Reference frame: %s" % self.group.get_planning_frame())
    #print ("============ Reference frame: %s" % self.group.get_end_effector_link())
    #print ("============ Robot Groups:")
    print (self.robot.get_group_names())

    print ("============ Generating plan 1")
    pose_target = geometry_msgs.msg.Pose()
    pose_target.orientation.w = 1.0
    pose_target.position.x = self.x
    pose_target.position.y = -self.y
    pose_target.position.z = self.z
    self.group.set_pose_target(pose_target)

    plan1 = self.group.plan()
    #print ("============ Waiting while RVIZ displays plan1...")
    rospy.sleep(5)
    print ("============ Visualizing plan1")
    display_trajectory = moveit_msgs.msg.DisplayTrajectory()

    display_trajectory.trajectory_start = self.robot.get_current_state()
    display_trajectory.trajectory.append(plan1)
    self.display_trajectory_publisher.publish(display_trajectory)
    print ("============ Waiting while plan1 is visualized (again)...")
    rospy.sleep(1)

    self.group.go(wait=True)

    self.group.clear_pose_targets()

    #group_variable_values = group.get_current_joint_values()
    # Uncomment below line when working with a real robot
    # self.group.go(wait=True)
    rospy.spin()
    #moveit_commander.roscpp_shutdown()
    #print ("============ STOPPING")
    # need to move hand down until contact is made here (using elbow joint?)
    if self.haveTouch():
        gummi.handClose.servoTo(2) # adjust this value roughtrial and error
        gripped = True
        self.pub.publish(gripped)

    def callback(self, data):
        self.x = rospy.loginfo(data.point.x)
        self.y = rospy.loginfo(data.point.y)
        self.z = rospy.loginfo(data.point.z)
        rospy.sleep(5)
        #print("running")

    def touchCallback(self, msg):
        self.touch_data_palm = msg.data

    def haveTouch(self):
        if self.touch_data_palm > 350:
            return True
        else:
            return False