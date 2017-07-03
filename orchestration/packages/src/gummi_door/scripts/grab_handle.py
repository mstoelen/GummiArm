#!/usr/bin/env python

# Software License Agreement (BSD License)
#
# Copyright (c) 2013, SRI International
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of SRI International nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Author: Acorn Pooley
#
# Adapted by Jonathan Walker to grasp as well as reach a door handle

import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from std_msgs.msg import UInt16
from std_msgs.msg import Bool
from geometry_msgs.msg import PointStamped
from gummi_interface.gummi import Gummi


class door_handle_planning(object):

    def __init__(self):
        rospy.Subscriber("/true_target", PointStamped, self.callback)
        rospy.Subscriber('~touch', UInt16, self.touchCallback)
        # will need to subscribe to /joint_positions to move the arm down to contact handle from the target position
        self.pub = rospy.Publisher("/gripped", Bool, queue_size=10)
        #print("running")
        moveit_commander.roscpp_initialize(sys.argv)
        self.gummi = Gummi()
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
        #print (self.robot.get_group_names())
        #print ("============ Printing robot state")
        #print ((self.robot.get_current_state()))
        #print ("============")
        #self.planning()

    def callback(self, data):
        x = rospy.loginfo(data.point.x)
        y = rospy.loginfo(data.point.y)
        z = rospy.loginfo(data.point.z)
        rospy.sleep(5)
        #print("running")

    def touchCallback(self, msg):
        self.touch_data_palm = msg.data

    def haveTouch(self):
        if self.touch_data_palm > 350:
            return True
        else:
            return False

def planning(door_handle_planning):

    door_planning = door_handle_planning()

    gripped = False
    #rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    #ready = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    #move_down = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    # gummi.handClose.servoTo(1) # adjust this value roughtrial and error
    # will need to adjust hand open amount and orientation here before reaching
    x, y, z = door_handle_planning.callback
    #rospy.spin()
    #self.callback(self.data)
    print ("============ Generating plan 1")
    pose_target = geometry_msgs.msg.Pose()
    pose_target.orientation.w = 1.0
    pose_target.position.x = x
    pose_target.position.y = -y
    pose_target.position.z = z
    door_handle_planning.group.set_pose_target(pose_target)
    print("running")
    plan1 = door_handle_planning.group.plan()
    #print ("============ Waiting while RVIZ displays plan1...")
    rospy.sleep(5)
    print ("============ Visualizing plan1")
    display_trajectory = moveit_msgs.msg.DisplayTrajectory()

    display_trajectory.trajectory_start = door_handle_planning.robot.get_current_state()
    display_trajectory.trajectory.append(plan1)
    door_handle_planning.display_trajectory_publisher.publish(display_trajectory);
    print ("============ Waiting while plan1 is visualized (again)...")
    rospy.sleep(1)

    door_handle_planning.group.go(wait=True)

    door_handle_planning.group.clear_pose_targets()

    door_handle_planning.group_variable_values = door_handle_planning.group.get_current_joint_values()
    # Uncomment below line when working with a real robot
    # self.group.go(wait=True)
    rospy.spin()
    #moveit_commander.roscpp_shutdown()
    #print ("============ STOPPING")
    # need to move hand down until contact is made here (using elbow joint?)
    if door_planning.haveTouch():
        door_handle_planning.gummi.handClose.servoTo(2) # adjust this value roughtrial and error
        gripped = True
        door_handle_planning.pub.publish(gripped)


if __name__ == '__main__':
    while not rospy.is_shutdown():
        try:
            rospy.init_node('target_plan', anonymous=True)
            #print("running")
            planning(door_handle_planning)

        except rospy.ROSInterruptException:
            pass
        moveit_commander.os._exit(0)