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
    rest = (-0.5,0.6632251157578453,0.5410520681182421,-0.12217304763960307,0.5585053606381855,-2.4085543677521746,-0.7330382858376184)
    mid = (0.05,1.8,0.2792526803190927,-0.17453292519943295,0.4014257279586958,-2.3736477827122884,-0.7330382858376184)
    desired = (0.1,1.8500490071139892,0.20943951023931956,-0.24434609527920614,-0.45,-2.7,-0.2617993877991494)

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    hand_shake = HandShake()

    #gummi = Gummi()
    #gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
    
    #print('WARNING: Moving joints sequentially to equilibrium positions.')
    #gummi.doGradualStartup()
   # 
   # print('WARNING: Moving to resting pose, hold arm!')
   # rospy.sleep(3)
   # 
   # gummi.goRestingPose(True)
   # for i in range(0,400):
   #     gummi.goRestingPose(False)
   #     r.sleep()
#
#    for i in range(0,100):
#        gummi.forearmRoll.servoTo(-pi/2)
#        r.sleep()
        
    print("GummiArm is live!")

    do_shake_hand = False
    while True:

        hand_shake.doUpdate()
        
        if hand_shake.haveNewPerson():
            if hand_shake.havePersistentPerson():
                do_shake_hand = True

        if do_shake_hand:
            print "Do hand shake"
            for i in range (0,500):
            #    gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
            #    gummi.goTo(rest, False)
                r.sleep()
            #    
            for i in range (0,60):
            #    gummi.setCocontraction(0.6, 0.6, 0.85, 0.6, 0.2)
            #    gummi.goTo(mid, False)
                r.sleep()
            hand_shake.done()
            do_shake_hand = False
                
        else:
           print "Do rest"
            #gummi.setCocontraction(0.8, 0.5, 1.0, 0.3, 0.2)
            #gummi.goTo(desired, True)
            
        r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
