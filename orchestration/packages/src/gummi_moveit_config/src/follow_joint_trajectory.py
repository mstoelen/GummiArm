#!/usr/bin/env python

# -*- coding: utf-8 -*-
#
# Software License Agreement (BSD License)
#
# Copyright (c) 2010-2011, Antons Rebguns.
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
#  * Neither the name of University of Arizona nor the names of its
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

from __future__ import division

# Adapted by Ricardo de Azambuja to use ActionServer (instead of
# SimpleActionServer) and also to run stand-alone, without a real hardware
# controller, if necessary.

# __author__ = "Antons Rebguns'
# __copyright__ = 'Copyright (c) 2010-2011 Antons Rebguns'
# __license__ = 'BSD'
# __maintainer__ = 'Antons Rebguns'
# __email__ = 'anton@email.arizona.edu'


from threading import Thread

import rospy
import actionlib

from std_msgs.msg import Float64

from sensor_msgs.msg import JointState  # send commands to GummiArm

from trajectory_msgs.msg import JointTrajectory
from control_msgs.msg import FollowJointTrajectoryAction  # it's passed to the action server itself at initialization.
from control_msgs.msg import FollowJointTrajectoryFeedback  # it's published without using the action server (topic /state)
from control_msgs.msg import FollowJointTrajectoryResult  # it's only passaed to the action server.
                                                          # curiously, it's always passed as an error (set_aborted method)

from control_msgs.msg import FollowJointTrajectoryActionFeedback

from actionlib_msgs.msg import GoalStatus

from std_msgs.msg import Header


class Segment():
    def __init__(self, num_joints):
        self.start_time = 0.0  # trajectory segment start time
        self.duration = 0.0  # trajectory segment duration
        self.positions = [0.0] * num_joints
        self.velocities = [0.0] * num_joints


class JointTrajectoryActionController():
    def __init__(self, controller_namespace, joint_names):
        '''

        '''

        self.update_rate = 1000  # loop to wait until it's time to start the trajectory
        self.update_feedback_rate = 100  # frequency FollowJointTrajectoryFeedback is published

        self.trajectory = []

        self.controller_namespace = controller_namespace

        self.joint_names = joint_names

        self.joint_states_rdy = False  # Indicates it is not ready for reading
                                       # i.e., the current joint_state was not received yet.
                                       # This could be implemented by initializing self.joint_states_rdy
                                       # with None or False, but it would not be as easy to read as using
                                       # this extra variable.

        self.num_joints = len(self.joint_names)

        # Sends commands to GummiArm
        self.jointStatePub = rospy.Publisher("/gummi/joint_commands", JointState,  queue_size=10)

        # Reads GummiArm's current joint_states
        self.subscribe = rospy.Subscriber('joint_states', JointState, self.read_joint_states)


    def read_joint_states(self, msg):
        self.joint_states_rdy = True

        # Not sure if Gummi is publishing the same joints as joint names...
        self.joint_positions = dict(zip(msg.name, msg.position))
        self.joint_velocities = dict(zip(msg.name, msg.velocity))
        self.joint_cocontractions = dict(zip(msg.name, msg.effort))


    def sendCommand2Gummi(self, positions, velocities):
        '''
        gummi_interface/gummi.py will read and execute the commands sent from here
        '''

        msg = JointState()
        msg.header.stamp = rospy.Time.now()

        msg.name = self.joint_names  # received during instantiation
        msg.position = [positions[name] for name in msg.name]
        msg.velocity = [velocities[name] for name in msg.name]

        # cocontraction
        msg.effort = [self.joint_cocontractions[name] for name in msg.name]

        self.jointStatePub.publish(msg)

        rospy.sleep(0.05)

        return 0


    def initialize(self):
        ns = self.controller_namespace + '/joint_trajectory_action_node/constraints'

        # rospy.get_param will try to fetch the information from the parameter server,
        # but if the parameter is not available, it will use the default value.

        # let motors roll for specified amount of time
        self.goal_time_constraint = rospy.get_param(ns + '/goal_time', 0.0)

        self.goal_constraints = []
        self.trajectory_constraints = []

        for joint in self.joint_names:
            self.goal_constraints.append(rospy.get_param(ns + '/' + joint + '/goal', -1.0))
            self.trajectory_constraints.append(rospy.get_param(ns + '/' + joint + '/trajectory', -1.0))

        rospy.loginfo("Goal constrains: " + ",".join([ji+"="+str(ci) for ji,ci in zip(self.joint_names,self.goal_constraints)]))
        rospy.loginfo("Trajectory constrains: " + ",".join([ji+"="+str(ci) for ji,ci in zip(self.joint_names,self.trajectory_constraints)]))

        # Message containing current state for all controlled joints
        # control_msgs/FollowJointTrajectoryFeedback
        self.feedback = FollowJointTrajectoryFeedback()
        self.feedback.joint_names = self.joint_names
        self.feedback.desired.positions = [0.0] * self.num_joints
        self.feedback.desired.velocities = [0.0] * self.num_joints
        self.feedback.desired.accelerations = [0.0] * self.num_joints
        self.feedback.actual.positions = [0.0] * self.num_joints
        self.feedback.actual.velocities = [0.0] * self.num_joints
        self.feedback.error.positions = [0.0] * self.num_joints
        self.feedback.error.velocities = [0.0] * self.num_joints

        self.running = dict()

        return 0


    def start(self):
        '''

        '''

        # http://wiki.ros.org/actionlib/DetailedDescription
        self.action_server = actionlib.ActionServer(self.controller_namespace + '/follow_joint_trajectory',
                                                    FollowJointTrajectoryAction,
                                                    self.process_follow_trajectory,
                                                    cancel_cb=self.cancel, auto_start=False)

        self.action_server.start()

        # This thread is responsible for publishing the FollowJointTrajectoryFeedback
        Thread(target=self.update_feedback).start()


    def update_feedback(self):
        rate = rospy.Rate(self.update_feedback_rate)

        while not rospy.is_shutdown():
            if any(self.running.values()):
                self.feedback.header.stamp = rospy.Time.now()

                # Publish current joint state
                if self.joint_states_rdy:
                    for i, joint in enumerate(self.joint_names):
                        self.feedback.actual.positions[i] = self.joint_positions[joint]
                        self.feedback.actual.velocities[i] = abs(self.joint_velocities[joint])
                        self.feedback.error.positions[i] = self.feedback.actual.positions[i] - self.feedback.desired.positions[i]
                        self.feedback.error.velocities[i] = self.feedback.actual.velocities[i] - self.feedback.desired.velocities[i]

                    self.action_server.publish_feedback(self.current_goal.get_goal_status(),self.feedback)
            # if not self.running, the while loop, and therefore the thread, will be kept alive but under control.
            rate.sleep()

    def cancel(self, goal):
        cancellingID = goal.get_goal_id().id

        self.running.pop(cancellingID)

        rospy.loginfo('Cancelling goalID:{0}'.format(cancellingID))

        goal.set_cancel_requested()


    def process_follow_trajectory(self, goal):
        '''

        '''

        goal_id = goal.get_goal_id().id

        rospy.loginfo('Processing goalID: {0}'.format(goal_id))

        # Using this thread I'm able to react and cancel a trajectory before it is completed.
        goal.set_accepted()  # maybe this signal should be positioned just before
                             # the place where the trajectory is actually sent to the
                             # controller.

        self.running[goal_id] = True

        Thread(target=self.process_trajectory, args=(goal,goal_id)).start()


    def process_trajectory(self, goal, goal_id):

        while not self.joint_states_rdy and not rospy.is_shutdown():
            rospy.logwarn("Waiting for joint_states...")
            if not self.running[goal_id]:
                return  # it was cancelled...
            rospy.sleep(0.1)

        traj = goal.get_goal().trajectory

        self.current_goal = goal

        num_points = len(traj.points)

        # Make sure the joints in the goal (trajectory_msgs/JointTrajectory) match
        # the joints of the controller
        if set(self.joint_names) != set(traj.joint_names):
        # A Python set is always created only with unique items, therefore a set
        # eliminates duplicates, but it also sort them.
            res = FollowJointTrajectoryResult()
            res.error_code=FollowJointTrajectoryResult.INVALID_JOINTS
            msg = 'Incoming trajectory joints do not match the joints of the controller'
            rospy.logerr(msg)
            rospy.logerr(' self.joint_names={%s}' % (set(self.joint_names)))
            rospy.logerr(' traj.joint_names={%s}' % (set(traj.joint_names)))
            goal.set_aborted(result=res, text=msg)
            self.running[goal_id] = False
            return

        # make sure trajectory is not empty
        if num_points == 0:
            msg = 'Incoming trajectory is empty'
            rospy.logerr(msg)
            goal.set_aborted(text=msg)
            self.running[goal_id] = False
            return

        rospy.loginfo('Number of points:{0}'.format(num_points))


        # correlate the joints we're commanding to the joints in the message
        # map from an index of joint in the controller to an index in the trajectory
        lookup = [traj.joint_names.index(joint) for joint in self.joint_names]
        durations = [0.0] * num_points

        # find out the duration of each segment in the trajectory
        durations[0] = traj.points[0].time_from_start.to_sec()

        for i in range(1, num_points):
            durations[i] = (traj.points[i].time_from_start - traj.points[i - 1].time_from_start).to_sec()
            # Here the durations are calculated in relation to the previous point.
            # Nevertheless, the index 0 will have the trajectory's starting time.

        if not traj.points[0].positions:
            res = FollowJointTrajectoryResult()
            res.error_code = FollowJointTrajectoryResult.INVALID_GOAL
            msg = 'First point of trajectory has no positions'
            rospy.logerr(msg)
            goal.set_aborted(result=res, text=msg)
            self.running[goal_id] = False
            return

        trajectory = []
        time = rospy.Time.now() + rospy.Duration(0.01) # Why 0.01???

        for i in range(num_points): # Processing all the JointTrajectoryPoints
            seg = Segment(self.num_joints)
            # self.start_time = 0.0  # trajectory segment start time
            # self.duration = 0.0  # trajectory segment duration
            # self.positions = [0.0] * num_joints
            # self.velocities = [0.0] * num_joints


            if traj.header.stamp == rospy.Time(0.0):
                seg.start_time = (time + traj.points[i].time_from_start).to_sec() - durations[i]
            else:
                seg.start_time = (traj.header.stamp + traj.points[i].time_from_start).to_sec() - durations[i]

            seg.duration = durations[i]

            # Checks that the incoming segment has the right number of elements.
            if traj.points[i].velocities and len(traj.points[i].velocities) != self.num_joints:
                res = FollowJointTrajectoryResult()
                res.error_code=FollowJointTrajectoryResult.INVALID_GOAL
                msg = 'Command point %d has %d elements for the velocities' % (i, len(traj.points[i].velocities))
                rospy.logerr(msg)
                goal.set_aborted(result=res, text=msg)
                self.running[goal_id] = False
                return

            if len(traj.points[i].positions) != self.num_joints:
                res = FollowJointTrajectoryResult()
                res.error_code=FollowJointTrajectoryResult.INVALID_GOAL
                msg = 'Command point %d has %d elements for the positions' % (i, len(traj.points[i].positions))
                rospy.logerr(msg)
                goal.set_aborted(result=res, text=msg)
                self.running[goal_id] = False
                return

            for j in range(self.num_joints):
                if traj.points[i].velocities:
                    seg.velocities[j] = traj.points[i].velocities[lookup[j]]
                if traj.points[i].positions:
                    seg.positions[j] = traj.points[i].positions[lookup[j]]

            trajectory.append(seg)

        # Clearly, according to the lines below, future goals can be received and they will
        # wait here until it's their time to start (according to self.update_rate).
        rospy.loginfo('Trajectory start requested at %.3lf, waiting...', traj.header.stamp.to_sec())
        rate = rospy.Rate(self.update_rate)
        while traj.header.stamp > time:
            time = rospy.Time.now()
            rate.sleep()

        end_time = traj.header.stamp + rospy.Duration(sum(durations))
        seg_end_times = [rospy.Time.from_sec(trajectory[seg].start_time + durations[seg]) for seg in range(len(trajectory))]

        rospy.loginfo('Trajectory start time is %.3lf, end time is %.3lf, total duration is %.3lf', time.to_sec(), end_time.to_sec(), sum(durations))

        self.trajectory = trajectory
        traj_start_time = rospy.Time.now()  # According to this, the trajectory will start being executed here!

        # And the trajectory execution is sliced by segments.
        for seg in range(len(trajectory)):
            if not self.running[goal_id]:
                # stop the trajectory execution
                break
            rospy.loginfo('Current segment is %d time left %f cur time %f' % (seg, durations[seg] - (time.to_sec() - trajectory[seg].start_time), time.to_sec()))
            rospy.loginfo('Goal positions are: %s' % str(trajectory[seg].positions))

            # first point in trajectories calculated by OMPL is current position with duration of 0 seconds, skip it
            if durations[seg] == 0:
                rospy.loginfo('Skipping segment %d with duration of 0 seconds' % seg)
                continue

            joint_positions = {}
            joint_velocities = {}

            for j,joint in enumerate(self.joint_names):

                start_position = self.joint_positions[joint]
                if seg != 0:
                    start_position = trajectory[seg - 1].positions[j]

                desired_position = trajectory[seg].positions[j]
                joint_positions[joint]=desired_position

                desired_velocities = trajectory[seg].velocities[j]
                joint_velocities[joint]=desired_velocities

            #
            # The commands sent to the robot using sendCommand2Gummi
            # will always obey the joint name order.
            self.sendCommand2Gummi(joint_positions, joint_velocities)
            #
            #


            # Verifies trajectory constraints
            for j, joint in enumerate(self.joint_names):
                if self.trajectory_constraints[j] > 0 and self.feedback.error.positions[j] > self.trajectory_constraints[j]:
                    res = FollowJointTrajectoryResult()
                    res.error_code=FollowJointTrajectoryResult.PATH_TOLERANCE_VIOLATED
                    msg = 'Unsatisfied position constraint for %s, trajectory point %d, %f is larger than %f' % \
                           (joint, seg, self.feedback.error.positions[j], self.trajectory_constraints[j])
                    rospy.logwarn(msg)
                    goal.set_aborted(result=res, text=msg)
                    self.running[goal_id] = False
                    return

        # let motors roll for specified amount of time
        rospy.sleep(self.goal_time_constraint)

        for i, joint in enumerate(self.joint_names):
            rospy.logdebug('Desired pos was %f, actual pos is %f, error is %f' % (trajectory[-1].positions[i], self.joint_positions[joint], self.joint_positions[joint] - trajectory[-1].positions[i]))

        # Checks that we have ended inside the goal constraints
        for (joint, pos_error, pos_constraint) in zip(self.joint_names, self.feedback.error.positions, self.goal_constraints):
            if pos_constraint > 0 and abs(pos_error) > pos_constraint:
                res = FollowJointTrajectoryResult()
                res.error_code=FollowJointTrajectoryResult.GOAL_TOLERANCE_VIOLATED
                msg = 'Aborting because %s joint wound up outside the goal constraints, %f is larger than %f' % \
                      (joint, pos_error, pos_constraint)
                rospy.logwarn(msg)
                goal.set_aborted(result=res, text=msg)
                self.running[goal_id] = False
                return

        if self.running[goal_id]:
            _ = self.running.pop(goal_id)
            msg = 'Trajectory execution successfully completed (goalID:{0})!'.format(goal_id)
            rospy.loginfo(msg)
            res = FollowJointTrajectoryResult()
            res.error_code=FollowJointTrajectoryResult.SUCCESSFUL
            goal.set_succeeded(result=res, text=msg) # this must be called only once.
        else:
            msg = 'Trajectory execution cancelled/aborted... (goalID:{0})!'.format(goal.get_goal_id().id)
            rospy.logwarn(msg)
            goal.set_canceled(text=msg)


if __name__ == '__main__':
    '''Usually, this kind of controller is started by controller_manager/spawner.
    This should be done using ros_control, but dynamixel_motor package has its
    own controller_manager/spawner.

    Consequently, I'm modifying this file to be launched as an individual node
    without the use of a controller_manager/spawner.
    '''

    # The controllers below must match the ones from Moveit!
    controllers = ['shoulder_yaw','shoulder_roll','shoulder_pitch','upperarm_roll','elbow','forearm_roll','wrist_pitch']
    controller_namespace = 'gummi_right_arm_controller'

    rospy.init_node('joint_trajectory_action_node', anonymous=False)
    # 'anonymous=False' because if there's another node like this running, something
    # is wrong and it will generate problems...

    joint_trajectory_action_controller = JointTrajectoryActionController(controller_namespace, controllers)

    if not joint_trajectory_action_controller.initialize():
        joint_trajectory_action_controller.start()

    rospy.spin()
