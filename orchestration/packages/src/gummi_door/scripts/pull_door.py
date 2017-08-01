#!/usr/bin/env python

import rospy
from std_msgs.msg import Bool
from gummi_interface.gummi import Gummi
from sensor_msgs.msg import JointState
from std_msgs.msg import UInt16
#from antagonist import Antagonist


class Pulldoor():
    def __init__(self):

        rospy.init_node('gummi', anonymous=True)
        self.gummi = Gummi()
        self.r = rospy.Rate(60)
        print ("running")
        self.gripped = False
        self.positioned = False
        self.ready = True
        self.touch_data_palm = 0
        rospy.Subscriber("/gripped", Bool, self.gripCallback)
        rospy.Subscriber("/positioned", Bool, self.positionedCallback)
        rospy.Subscriber('/FSR', UInt16, self.touchCallback)
        self.pub = rospy.Publisher("/Equilibrium", JointState, queue_size=10)
        self.pub1 = rospy.Publisher("/ready", Bool, queue_size=10)
        rospy.logwarn('Moving joints sequentially to equilibrium positions.')
        self.gummi.doGradualStartup()

        rospy.logwarn('Moving to resting pose, hold arm!')
        rospy.sleep(1)

        self.gummi.goRestingPose(True)
        for i in range(0,400):
            self.gummi.goRestingPose(False)
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

            if self.positioned is True:

                self.ready = False
                self.pub1.publish(self.ready)

                self.turn_arm()
                rospy.sleep(5)

                print("=========== movng down ============")

                self.move_down()
                rospy.sleep(5)

                if self.haveTouch:

                    print ("=========== closing hand ===========")

                    self.close_hand()
                    rospy.sleep(5)

                    print ("=========== turning handle ===========")

                    self.turn_handle()
                    rospy.sleep(5)

                    print ("=========== pulling door open ===========")

                    self.pull_open()
                    rospy.sleep(5)

                    print ("=========== opening hand ===========")

                    self.open_hand()
                    rospy.sleep(5)

                    print ("=========== moving to resting pose ===========")

                    self.gummi.goRestingPose(True)
                    for i in range(0,400):
                        self.gummi.goRestingPose(False)
                        self.r.sleep()

                    self.positioned = False
                    self.haveTouch = False

                else:
                    print ("=========== no touch - trying again ===========")
                    print ("=========== moving to resting pose ===========")
                    self.gummi.goRestingPose(True)
                    for i in range(0,400):
                        self.gummi.goRestingPose(False)
                        self.r.sleep()
                    self.positioned = False
                    self.ready = True
                    self.pub1.publish(self.ready)

    def haveTouch(self):
        if self.touch_data_palm > 900:
            return True
        else:
            return False

    def move_down(self):
        for i in range(0,200):
            self.gummi.elbow.moveWith(-0.002, 0.5)

    def turn_handle(self):
        for i in range(0,100):
            self.gummi.elbow.moveWith(0.002, 0.5)
            self.gummi.shoulderYaw.moveWith(0.002, 0.5)
            self.gummi.forearmRoll.servoWith(0.002)
            self.gummi.shoulderRoll.moveWith(-0.002, 0.5)
            self.r.sleep()

    def pull_open(self):
        for i in range(0,200):
            self.gummi.elbow.moveWith(0.002, 0.5)
            self.gummi.shoulderPitch.moveWith(0.002, 0.5)
            self.gummi.shoulderYaw.moveWith(-0.002, 0.5)
            self.gummi.shoulderRoll.moveWith(-0.002, 0.5)

    def close_hand(self):
        for i in range(0,100):
            self.gummi.handDOF1.servoTo(2.5)
            self.r.sleep()

    def open_hand(self):
        for i in range(0,100):
            self.gummi.handDOF1.servoTo(0.5)
            self.r.sleep()

    def touchCallback(self, msg):
        self.touch_data_palm = msg.data
        #print(self.touch_data_palm)

    def gripCallback(self, msg):
        self.gripped = msg.data

    def positionedCallback(self, msg):
        self.positioned = msg.data

    def turn_arm(self):
        for i in range(0,100):
            self.gummi.forearmRoll.servoTo(-1.5)
            self.r.sleep()

    def publish_EquilibriumVel(self):
        msg = JointState()
        msg.header.stamp = rospy.Time.now()
        msg.name = self.gummi.jointNames
        msg.position = self.getEquilibrium()
        msg.velocity = self.getEquilibriumVel()
        self.pub.publish(msg)

    #def getEquilibrium(self):
        #Equilibrium = list()
        #Equilibrium.append(self.Antagonist.shoulderYaw(dEquilbriumVel))
        #Equilibrium.append(self.Antagonist.shoulderRoll(dEquilbriumVel))
        #Equilibrium.append(self.Antagonist.shoulderPitch(dEquilbriumVel))
        #Equilibrium.append(self.Antagonist.elbow(dEquilbriumVel))
        #Equilibrium.append(self.Antagonist.wrist(dEquilbriumVel))

    #def getEquilibriumVel(self):
        #EquilibriumVel = list()
        #EquilibriumVel.append(self.Antagonist.shoulderYaw(dEquilibrium))
        #EquilibriumVel.append(self.Antagonist.shoulderRoll(dEquilbriumVel))
        #EquilibriumVel.append(self.Antagonist.shoulderPitch(dEquilbriumVel))
        #EquilibriumVel.append(self.Antagonist.elbow(dEquilbriumVel))
        #EquilibriumVel.append(self.Antagonist.wrist(dEquilbriumVel))



if __name__ == '__main__':
    Pulldoor()

