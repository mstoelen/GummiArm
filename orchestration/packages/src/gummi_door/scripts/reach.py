#!/usr/bin/env python
import sys
import rospy
import atexit
import moveit_commander
import moveit_msgs.msg
import tf
#import pickle
from std_msgs.msg import Bool
from std_msgs.msg import Float32
from geometry_msgs.msg import PointStamped
from geometry_msgs.msg import PoseStamped
#from twisted.python.logfile import DailyLogFile


class planning():

    def __init__(self):
        rospy.Subscriber("/true_target", PointStamped, self.callback)
        rospy.Subscriber("/ready", Bool, self.readyCallback)
        rospy.Subscriber("/door_angle", Float32, self.angleCallback)
        self.pub = rospy.Publisher("/gripped", Bool, queue_size=10)
        self.pub1 = rospy.Publisher("/positioned", Bool, queue_size=10)
        self.gripped = False
        self.positioned = False
        self.ready = True
        self.x_offset = -0.14
        self.y_offset = 0
        self.z_offset = 0.25
        self.angle = 1
        atexit.register(self.endlog)

    def callback(self, data):
        self.x = data.point.x
        self.y = data.point.y
        self.z = data.point.z
        return self.x, self.y, self.z

    def readyCallback(self, msg):
        self.ready = msg.data

    def angleCallback(self, msg):
        self.angle = msg.data

    def main(self):

        if self.ready:
            rospy.sleep(5)
            moveit_commander.roscpp_initialize(sys.argv)
            robot = moveit_commander.RobotCommander()
            scene = moveit_commander.PlanningSceneInterface()
            group = moveit_commander.MoveGroupCommander("right_arm")

            rospy.sleep(2)

            handle_id = "handle"
            door_id = "door"
            scene.remove_world_object(handle_id)
            scene.remove_world_object(door_id)
            rospy.sleep(1)
            handle_size = [0.05, 0.2, 0.02]
            door_size = [0.05, 1.2, 2.0]
            door_quat = tf.transformations.quaternion_from_euler(0.0, 0.0, self.angle, axes='rxyz')
            print(door_quat)
            #self.y_offset += self.angle / 5
            print("========================", self.y_offset)
            ##original_pose = PoseStamped()
            ##original_pose.header.frame_id = "/base_link"
            ##original_pose.pose.position.x = self.x - self.x_offset - 0.05
            ##original_pose.pose.position.y = self.y - self.y_offset
            ##original_pose.pose.position.z = self.z - self.z_offset
            ##handle_pose.pose.orientation.x = door_quat[0]
            ##handle_pose.pose.orientation.y = door_quat[1]
            ##handle_pose.pose.orientation.z = door_quat[2]
            ##handle_pose.pose.orientation.w = door_quat[3]
            ##scene.add_box(handle_id, handle_pose, handle_size)

            handle_pose = PoseStamped()
            handle_pose.header.frame_id = "/base_link"
            handle_pose.pose.position.x = self.x - 0.1
            handle_pose.pose.position.y = self.y
            handle_pose.pose.position.z = self.z
            handle_pose.pose.orientation.x = door_quat[0]
            handle_pose.pose.orientation.y = door_quat[1]
            handle_pose.pose.orientation.z = door_quat[2]
            handle_pose.pose.orientation.w = door_quat[3]
            scene.add_box(handle_id, handle_pose, handle_size)

            door_pose = PoseStamped()
            door_pose.header.frame_id = "/base_link"
            door_pose.pose.position.x = self.x
            door_pose.pose.position.y = self.y
            door_pose.pose.position.z = self.z
            door_pose.pose.orientation.x = door_quat[0]
            door_pose.pose.orientation.y = door_quat[1]
            door_pose.pose.orientation.z = door_quat[2]
            door_pose.pose.orientation.w = door_quat[3]
            scene.add_box(door_id, door_pose, door_size)

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

            self.start = rospy.get_time()

            self.pose_target = group.get_current_pose()
            print (self.pose_target)
            self.pose_target.pose.position.x = self.x + self.x_offset
            self.pose_target.pose.position.y = self.y + self.y_offset
            self.pose_target.pose.position.z = self.z + self.z_offset
            #pose_target.pose.orientation.x = 0.0
            #pose_target.pose.orientation.y = 0.0
            #pose_target.pose.orientation.z = 0.0
            self.pose_target.pose.orientation.w = 1.0
            print (self.pose_target)
            rospy.sleep(2)

            print ("============== moving to target position ===============")
            group.go(self.pose_target, wait=True)

            rospy.sleep(10)

            #pose_target2 = group.get_current_pose()
            ##pose_target2.pose.orientation.w = 1.0
            #pose_target2.pose.position.x += 0.1
            ##pose_target2.pose.position.y += 0.1
            ##pose_target2.pose.position.z += -0.2

            #print (pose_target)
            #rospy.sleep(2)
            #print ("============== moving forward ===============")
            #group.go(pose_target2, wait=True)

            #rospy.sleep(2)

            self.end = rospy.get_time()
            self.pose_final = group.get_current_pose()
            self.ready = False
            self.positioned = True
            self.pub1.publish(self.positioned)

            group.clear_pose_targets()

            rospy.spin()

    def endlog(self):
        self.elapsed = self.end - self.start
        self.stats = (str(self.elapsed))
        self.calcs()
        print ("===================================================")
        print ("MoveIt! planning and excecution time")
        print (self.stats)
        print ("Target pose")
        print (self.pose_target)
        print ("Final pose")
        print (self.pose_final)
        #pickle.dump(self.pose_final, open("/home/joe/repos/working/GummiArm/orchestration/packages/src/gummi_door/scripts/save.p", "wb"))
        print ("===================================================")
        repo = ["\n", str(rospy.get_time()), " ", str(self.stats), " ",
str(self.x), " ", str(self.y), " ", str(self.z), " ", str(self.error_x), " ",
str(self.error_y), " ", str(self.error_z), " ", str(self.angle)]
        report = ''.join(repo)
        print(report)
        f = open("/home/joe/repos/working/Results/Tests.txt", "a+")
        f.write(report)
        f.close()

    def calcs(self):
        self.error_x = self.pose_final.pose.position.x - self.pose_target.pose.position.x
        self.error_y = self.pose_final.pose.position.y - self.pose_target.pose.position.y
        self.error_z = self.pose_final.pose.position.z - self.pose_target.pose.position.z


if __name__ == '__main__':
    rospy.init_node('target_plan', anonymous=True)
    try:
        ne = planning()
        ne.main()
    except rospy.ROSInterruptException:
        pass

