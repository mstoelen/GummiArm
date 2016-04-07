#!/usr/bin/env python

import rospy
import sys
import csv

from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416

    cocontractionsToTry = (0.0, 0.25, 0.5, 0.75, 1.0)

    rospy.init_node('gummi', anonymous=True)
    r = rospy.Rate(60)  

    gummi = Gummi()

    numAttempts = rospy.get_param("~numAttempts")
    path = rospy.get_param("~outputPath")
    jointNums = rospy.get_param("~jointNums")
    elbowExtended = rospy.get_param("~elbowExtended")

    for jointNum in jointNums:

        print("Output path is '" + path + "'.")
        print("Joint to test: " + str(jointNum) + ".")
        print("Elbow extended: " + str(elbowExtended) + ".")

        if jointNum is 0:
            joint = gummi.shoulderYaw
        else:
            if jointNum is 1:
                joint = gummi.shoulderRoll
            else:
                if jointNum is 2:
                    joint = gummi.shoulderPitch
                else:
                    if jointNum is 4:
                        joint = gummi.elbow
                    else:
                        if jointNum is 6:
                            joint = gummi.wrist
                            
        minAngle = joint.angle.getMin()*180/pi
        maxAngle = joint.angle.getMax()*180/pi
        rangeAngle = maxAngle - minAngle
        
        rest = minAngle + rangeAngle/4
        desired = maxAngle - rangeAngle/4
        print("Moving from rest: " + str(rest) + ", to desired: " + str(desired) + ".")
        
        gummi.setCocontraction(0.8, 0.8, 0.8, 0.8, 0.8)
        
        print('WARNING: Moving joints sequentially to equilibrium positions.')
        gummi.doGradualStartup()
        
        print('WARNING: Moving to resting pose, hold arm!')
        rospy.sleep(1)
        
        gummi.goRestingPose(True)
        for i in range(0,400):
            gummi.goRestingPose(False)
            r.sleep()
            
        print("GummiArm is live!")
        
        print("Moving arm into place.")
        joint.goTo(rest * pi/180, 0.3, True)
        for i in range (0,200):
            joint.goTo(rest * pi/180, 0.3, False)
            if elbowExtended: 
                gummi.elbow.servoTo(gummi.elbow.angle.getMin(), 0.8)
            r.sleep()
            
        for cocont in cocontractionsToTry: 
            
            for att in range (1, numAttempts + 1):
                
                print("Setting desired cocontraction.")
                for i in range (0,600):
                    joint.servoTo(rest * pi/180, cocont)
                    if elbowExtended: 
                        gummi.elbow.servoTo(gummi.elbow.angle.getMin(), 0.8)
                    r.sleep()
                    
                print("Test started, cocontraction: " + str(cocont) + ", attempt: " + str(att) + ".")
            
                fileName = path + '/step_test_' + joint.getName() + '_s_' + str(cocont) + '_a_' + str(att) + '.csv'
                with open(fileName, 'wb') as csvfile:
                    writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
                    writer.writerow(['time','desired', 'angle', 'equilibrium', 'cocontraction', 'flexor', 'extensor', 'ballistic_reflex'])
                    
                    time1 = rospy.Time.now()
                    now = False
                    for i in range (0,1400):
                        
                        if i < 200:
                            command = rest
                            joint.servoTo(command * pi/180, cocont)
                        else:
                            if i < 600:
                                command = desired
                                now = False
                                if i == 200:
                                    now = True
                            else:
                                command = rest
                                now = False
                                if i == 600:
                                    now = True
                            #joint.servoTo(command * pi/180, cocont)
                            joint.goTo(command * pi/180, cocont, now)

                        angle = joint.getJointAngle() * 180/pi
                        time2 = rospy.Time.now()
                        duration = time2-time1
                        delta = duration.to_sec()
                        equilibrium = joint.eqModel.dEquilibrium
                        cocontraction = joint.eqModel.cCocontraction
                        flexor = joint.eqModel.flexor.getJointAngle() * 180/pi
                        extensor = joint.eqModel.extensor.getJointAngle() * 180/pi
                        ballistic = joint.ballistic
                        
                        writer.writerow([delta, command, angle, equilibrium, cocontraction, flexor, extensor, ballistic])
                        r.sleep()
            
if __name__ == '__main__':
    main(sys.argv)
