#!/usr/bin/env python

import rospy

from gummi_interface.gummi import Gummi


class pulldoor():
    def __init__(self):

        rospy.init_node('gummi', anonymous=True)
        self.gummi = Gummi()
        self.r = rospy.Rate(60)
        print ("running")

        rospy.logwarn('Moving joints sequentially to equilibrium positions.')
        self.gummi.doGradualStartup()

        rospy.logwarn('Moving to resting pose, hold arm!')
        rospy.sleep(1)

        self.gummi.goRestingPose(True)
        for i in range(0,400):
            self.gummi.goRestingPose(False)
            self.r.sleep()

        for i in range(0,100):
            self.gummi.forearmRoll.servoTo(-1)
            self.r.sleep()

        self.gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)

        self.gummi.setCollisionResponses(False, False, False, False, False)
        rospy.loginfo("GummiArm is live!")

        self.main()


    def main(self):
        while not rospy.is_shutdown():
            if self.gummi.teleop == 0 and self.gummi.velocity_control == 0:
                self.gummi.doUpdate()

            self.gummi.publishJointState()
            self.r.sleep()


if __name__ == '__main__':
    pulldoor()

