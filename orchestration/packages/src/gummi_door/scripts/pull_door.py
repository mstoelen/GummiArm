#!/usr/bin/env python
import rospy
import atexit
from std_msgs.msg import Bool
from gummi_interface.gummi import Gummi
from sensor_msgs.msg import JointState
from std_msgs.msg import UInt16


class Pulldoor():
    def __init__(self):

        rospy.init_node('gummi', anonymous=True)
        self.gummi = Gummi()
        self.r = rospy.Rate(60)
        print ("running")
        self.gripped = False
        self.positioned = False
        self.ready = True
        self.haveTouch = True
        self.touch_data_palm = 0
        self.start = rospy.get_time()
        self.attempts = 0
        self.success = 0
        self.fail = 0
        atexit.register(self.endlog)
        rospy.Subscriber("/gripped", Bool, self.gripCallback)
        rospy.Subscriber("/positioned", Bool, self.positionedCallback)
        rospy.Subscriber('/FSR', UInt16, self.touchCallback)
        self.pub = rospy.Publisher("/Equilibrium", JointState, queue_size=10)
        self.pub1 = rospy.Publisher("/ready", Bool, queue_size=10)
        rospy.logwarn('Moving joints sequentially to equilibrium positions.')
        self.gummi.doGradualStartup()

        rospy.logwarn('Moving to resting pose, hold arm!')
        rospy.sleep(1)

        self.rest()

        self.gummi.setCocontraction(1, 1, 1, 1, 1)

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

                self.attempts += 1

                self.ready = False
                self.pub1.publish(self.ready)

                self.turn_arm()
                rospy.sleep(2)

                print("=========== movng down ============")

                self.move_down()
                rospy.sleep(2)

                self.gummi.setCocontraction(0.5, 0.5, 0.5, 0.5, 0.5)

                #if self.haveTouch:

                print ("=========== closing hand ===========")

                self.close_hand()
                rospy.sleep(2)

                print ("=========== turning handle ===========")

                self.turn_handle()
                rospy.sleep(2)

                print ("=========== pulling door open ===========")

                self.pull_open()
                rospy.sleep(2)

                self.success += 1

                print ("=========== opening hand ===========")

                self.open_hand()
                rospy.sleep(2)

                print ("=========== moving to resting pose ===========")

                self.rest()
                self.gummi.setCocontraction(0.8, 0.8, 0.8, 0.8, 0.8)

                self.positioned = False
                self.haveTouch = False

                #else:
                    #print ("=========== no touch - trying again ===========")
                    #print ("=========== moving to resting pose ===========")
                    #self.fail += 1
                    #self.rest()
                    #self.gummi.setCocontraction(1, 1, 1, 1, 1)
                    #self.positioned = False
                    #self.ready = True
                    #self.pub1.publish(self.ready)

    def rest(self):
        self.gummi.goRestingPose(True)
        for i in range(0, 400):
            self.gummi.goRestingPose(False)
            self.r.sleep()

    def haveTouch(self):
        if self.touch_data_palm > 980:
            return True
        else:
            return False

    def move_down(self):
        for i in range(0, 150):
            self.gummi.elbow.moveWith(-0.001, 0.5)
            self.gummi.shoulderRoll.moveWith(-0.001, 0.5)
            #self.gummi.shoulderYaw.moveWith(-0.002, 0.5)
            self.r.sleep()

    def turn_handle(self):
        for i in range(0, 200):
            self.gummi.elbow.moveWith(-0.004, 0.5)
            self.gummi.shoulderYaw.moveWith(0.002, 0.5)
            self.gummi.shoulderPitch.moveWith(-0.003, 0.5)
            self.gummi.shoulderRoll.moveWith(-0.004, 0.5)
            self.gummi.forearmRoll.servoTo(-0.8)
            self.r.sleep()

    def pull_open(self):
        for i in range(0, 400):
            self.gummi.elbow.moveWith(0.002, 0.5)
            self.gummi.shoulderPitch.moveWith(0.002, 0.5)
            self.gummi.shoulderYaw.moveWith(-0.002, 0.5)
            self.gummi.shoulderRoll.moveWith(-0.002, 0.5)
            self.r.sleep()

    def close_hand(self):
        for i in range(0, 100):
            self.gummi.handDOF1.servoTo(3)
            self.r.sleep()

    def open_hand(self):
        for i in range(0, 100):
            self.gummi.handDOF1.servoTo(0.5)
            self.r.sleep()

    def touchCallback(self, msg):
        self.touch_data_palm = msg.data
        #print("touch = " + str(self.touch_data_palm))

    def gripCallback(self, msg):
        self.gripped = msg.data

    def positionedCallback(self, msg):
        self.positioned = msg.data

    def turn_arm(self):
        for i in range(0, 100):
            self.gummi.forearmRoll.servoTo(-1.6)
            self.r.sleep()

    #def publish_EquilibriumVel(self):
        #msg = JointState()
        #msg.header.stamp = rospy.Time.now()
        #msg.name = self.gummi.jointNames
        #msg.position = self.getEquilibrium()
        #msg.velocity = self.getEquilibriumVel()
        #self.pub.publish(msg)

    def endlog(self):
        self.end = rospy.get_time()
        self.elapsed = self.end - self.start
        self.stats = ("successful " + str(self.success) + " failed " +
        str(self.fail) + " elapsed " + str(self.elapsed) + " seconds")
        print ("===================================================")
        print ("door opening")
        print (self.stats)
        print ("===================================================")

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

