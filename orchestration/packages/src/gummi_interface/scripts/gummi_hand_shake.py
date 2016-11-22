#!/usr/bin/env python

import rospy
import sys
import csv
import math

from std_msgs.msg import Bool
from std_msgs.msg import UInt16

from gummi_interface.gummi import Gummi

class HandShake:
    def __init__(self):
        self.person_in_front = False
        self.hand_shake_done = False
        self.touch_data_palm = 0
        self.person_counter = 0
        self.touch_counter = 0

        rospy.Subscriber('~person', Bool, self.personCallback)
        rospy.Subscriber('~touch', UInt16, self.touchCallback)

        self.pwm1_pub = rospy.Publisher("~pwm1", UInt16,  queue_size=10) 
        self.pwm2_pub = rospy.Publisher("~pwm2", UInt16,  queue_size=10) 

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

        if self.haveTouch():
            if self.touch_counter < 100:
                self.touch_counter = self.touch_counter + 5
        else:
            self.touch_counter = self.touch_counter - 15
        if self.touch_counter < 0:
            self.touch_counter = 0
        print "Touch counter: " + str(self.touch_counter)

    def havePersistentPerson(self):
        if self.person_counter == 100:
            return True
        else:
            return False

    def haveTouch(self):
        if self.touch_data_palm > 350:
            return True
        else:
            return False

    def havePersistentTouch(self):
        if self.touch_counter == 100:
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

    def closeHand(self):
        print "Closing hand"
        #self.closePwm1()
        #self.closePwm2()

    def closePwm1(self):
        msg = UInt16()
        msg.data = 10
        self.pwm1_pub.publish(msg)

    def closePwm2(self):
        msg = UInt16()
        msg.data = 10
        self.pwm2_pub.publish(msg)

def main(args):

    pi = 3.1416
    rest = (0.0, -0.34770231192074535, 0.03579288505066496, 0.0030679615757712823, -0.7465373167710121, -1.55, -0.0051132692929521375)
    mid = (0.0, 0.10737865515199489, 0.14317154020265985, -0.21475731030398976, -0.4755340442445488, -1.55, 0.0)
    desired = (0.3170226961630325, 0.5777994301035916, 0.22498384888989406, -0.2684466378799872, -0.3681553890925539, -1.25, 0.0)

    width = 1.2 #0.6
    frequency = 4.5

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    hand_shake = HandShake()

    gummi = Gummi()
    gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
    
    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(1)

    for i in range(0,400):
        gummi.goTo(rest, False)
        r.sleep()
        
    print("GummiArm is live!")

    do_shake_hand = False
    hand_is_closed = False
    time_counter = 1
    while True:

        hand_shake.doUpdate()

        if do_shake_hand:
            if time_counter < 60:
                print "Moving, first step"
                gummi.setCocontraction(0.6, 0.6, 0.85, 0.6, 0.2)
                gummi.goTo(mid, False)
                r.sleep()
            else:
                if time_counter < 250:
                    print "Moving, second step"
                    gummi.setCocontraction(0.5, 0.4, 0.6, 0.55, 0.2)
                    gummi.goTo(desired, False) # TODO: CALIB
                    r.sleep()
                else:
                    print "Waiting..."

                    if time_counter < 1150:
                        if not hand_is_closed:
                            if hand_shake.havePersistentTouch():
                                print "Closing hand"
                                gummi.handClose.servoTo(1.5)
                                elbow_waiting = gummi.elbow.angle.getEncoder()
                                hand_is_closed = True
                                time_counter = 750
                        else:
                            elbow = elbow_waiting + width/2 * math.sin(frequency * time_counter/60.0)
                            gummi.elbow.servoTo(elbow, 0.3)
                    else:
                        if time_counter < 1350:
                            print "Opening hand"
                            gummi.handClose.servoTo(-2.2)
                            hand_is_closed = False
                        else:
                            if time_counter < 1600:
                                print "Go to rest"
                                gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)
                                gummi.goTo(rest, False)
                            else:
                                print "Done with hand shake"
                                hand_shake.done()
                                do_shake_hand = False
                                time_counter = 0

            time_counter = time_counter + 1
                
        else:
           print "Passive hold"
           gummi.passiveHold()
            
           if hand_shake.haveNewPerson():
               if hand_shake.havePersistentPerson():
                   do_shake_hand = True
                   print "Do hand shake"

        r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
