#!/usr/bin/env python

import yaml
import rospy
import sys
import numpy as np
import matplotlib.pyplot as plt

from gummi_interface.joint_model import JointModel
from gummi_interface.antagonist import Antagonist
from gummi_interface.gummi import Gummi

def main(args):

    pi = 3.1416
    print("Please enter path to folder where you want calibration file saved:")
    path =  raw_input()

    rospy.init_node('gummiCalibrate', anonymous=True)
    r = rospy.Rate(60)  
    
    gummi = Gummi()
    joint = gummi.shoulderYaw
    numSteps = 7

    minAngle = joint.angle.getMin()
    maxAngle = joint.angle.getMax()
    rangeAngle = maxAngle - minAngle
    stepAngle = rangeAngle/numSteps
    print("Using min angle: " + str(minAngle) + ", max angle: " + str(maxAngle) + ", and step size: " + str(stepAngle))

    anglesToTry = [x / 100.0 for x in range(int(minAngle * 100), int(maxAngle * 100) + 1, int(stepAngle * 100))]
    cocontractionsToTry = [x / 100.0 for x in range(100, -1, -100/numSteps)] 

    gummi.setCocontraction(0.6, 0.6, 0.6, 0.6, 0.6)

    print('WARNING: Moving joints sequentially to equilibrium positions.')
    gummi.doGradualStartup()
    
    print('WARNING: Moving to resting pose, hold arm!')
    rospy.sleep(3)

    for i in range(0, 400):
        gummi.goRestingPose()
        r.sleep()

    print("GummiArm is live!")

    for i in range (0,300):
        joint.servoTo(0, 0.5)
        r.sleep()
    
    thetas = list()
    ccs = list()
    equilibriums = list()
    for cocont in cocontractionsToTry: 

        for i in range (0,300):
            joint.servoTo(0, cocont)
            r.sleep()

        for angle in anglesToTry:
            print("Moving joint to angle: " + str(angle) + " and cocontraction: " + str(cocont) + ".")
            for i in range (0,300):
                joint.servoTo(angle, cocont)
                r.sleep()

            thetas.append(round(joint.angle.getEncoder(), 3))
            ccs.append(round(cocont, 3))
            equilibriums.append(round(joint.getDesiredEquilibrium(), 3))

        for i in range (0,300):
            joint.servoTo(0, cocont)
            r.sleep()

    data = {'thetas': thetas, 'ccs': ccs, 'equilibriums': equilibriums}
    text = yaml.dump(data,
                     default_flow_style = False,
                     explicit_start = True)
    print text

    fileName = path + "/calibration_" + joint.getName() + ".yaml"
    with open(fileName, 'w') as outfile:
        outfile.write(text)
        print("Calibration data written to: " + fileName)

    jm = JointModel("test")
    jm.setCalibration(thetas, ccs, equilibriums)
    gridX, gridY = np.mgrid[minAngle:maxAngle:0.01, 0:1:0.01]
    map = jm.getMap(gridX, gridY)
    plt.imshow(map.T, extent=(minAngle, maxAngle, 0, 1))
    plt.show()

if __name__ == '__main__':
    main(sys.argv)
