#!/usr/bin/env python

import rospy
import sys
import csv

from std_msgs.msg import Bool
from std_msgs.msg import Int16

from gummi_interface.gummi import Gummi

class HandShake:
    def __init__(self):
        self.person_in_front = False
        self.hand_shake_done = False
        self.touch_data_palm = 0
        self.person_counter = 0

        rospy.Subscriber('~person', Bool, self.personCallback)
        rospy.Subscriber('~touch', Int16, self.touchCallback)

        pwm1_pub = rospy.Publisher("~pwm1", Int16,  queue_size=10) 
        pwm2_pub = rospy.Publisher("~pwm2", Int16,  queue_size=10) 

    def personCallback(self, msg):
        self.person_in_front = msg.data
        #print "Person: " + str(person_in_front)

    def touchCallback(self, msg):
        self.touch_data_palm = msg.data
        #print "Touch: " + str(touch_data_palm)

    def doUpdate(self):
        if self.person_in_front:
            if self.person_counter < 100:
                self.person_counter = self.person_counter + 1
        else:
            self.person_counter = self.person_counter - 5
        if self.person_counter < 0:
            self.hand_shake_done = False
            self.person_counter = 0
        print "Person counter: " + str(self.person_counter)

    def havePersistentPerson(self):
        if self.person_counter == 100:
            return True
        else:
            return False

    def haveNewPerson(self):
        if self.hand_shake_done:
            return False
        else:
            return True

    def done(self):
        self.hand_shake_done = True

def main(args):

    pi = 3.1416
    rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, 0.0, -0.0051132692929521375)
    mid = (0.0, 0.10737865515199489, 0.14317154020265985, -0.21475731030398976, -0.4755340442445488, 0.05113269292952138, 0.0)
    desired = (0.3170226961630325, 0.5777994301035916, 0.22498384888989406, -0.2684466378799872, -0.3681553890925539, 0.29656961899122397, 0.0)

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    hand_shake = HandShake()

    gummi = Gummi()
    gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
    
    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)
    
    gummi.goRestingPose(True)
    for i in range(0,400):
        gummi.goRestingPose(False)
        r.sleep()

    for i in range(0,100):
        gummi.forearmRoll.servoTo(-pi/2)
        r.sleep()
        
    print("GummiArm is live!")

    do_shake_hand = False
    while True:

        hand_shake.doUpdate()
        
        if hand_shake.haveNewPerson():
            if hand_shake.havePersistentPerson():
                do_shake_hand = True

        if do_shake_hand:
            print "Do hand shake"
            for i in range (0,60):
                gummi.setCocontraction(0.6, 0.6, 0.85, 0.6, 0.2)
                gummi.goTo(mid, False)
                r.sleep()
            for i in range (0,1000):
                gummi.setCocontraction(0.8, 0.5, 1.0, 0.3, 0.2)
                gummi.goTo(desired, False) # TODO
                r.sleep()
            hand_shake.done()
            do_shake_hand = False
                
        else:
           print "Do rest"
           gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
           gummi.goTo(rest, False) # TODO
            
        r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
