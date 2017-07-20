#!/usr/bin/env python

import rospy
import moveit_commander
import moveit_msgs.msg
from geometry_msgs.msg import PoseStamped
from geometry_msgs.msg import PointStamped

class objects():

    def __init__(self):
        rospy.Subscriber("/true_target", PointStamped, self.callback)

        self.main()

    def main(self):

        scene = moveit_commander.PlanningSceneInterface()

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
        handle_pose.pose.position.z = self.z - 0.1
        handle_pose.pose.orientation.w = 1.0
        scene.add_box(handle_id, handle_pose, handle_size)

        door_pose = PoseStamped()
        door_pose.header.frame_id = "/base_link"
        door_pose.pose.position.x = self.x + 0.1
        door_pose.pose.position.y = self.y - 0.3
        door_pose.pose.position.z = self.z
        door_pose.pose.orientation.w = 1.0
        scene.add_box(door_id, door_pose, door_size)


    def callback(self, data):
        self.x = data.point.x
        self.y = data.point.y
        self.z = data.point.z + 0.1
        return self.x, self.y, self.z

if __name__ == '__main__':
    rospy.init_node('object', anonymous=True)
    try:
        ob = objects()
    except rospy.ROSInterruptException:
        pass