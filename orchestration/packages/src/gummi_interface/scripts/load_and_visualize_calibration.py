#!/usr/bin/env python

import yaml
import sys
import numpy as np
import matplotlib.pyplot as plt

from gummi_interface.joint_model import JointModel

def main(args):

    pi = 3.1416

    print("Please enter path to folder where calibration file is:")
    path = raw_input()

    print("Please enter joint name:")
    joint = raw_input()

    print("Please enter min angle:")
    minAngle = float(raw_input())
    minAngle_deg = minAngle * 180/pi

    print("Please enter max angle:")
    maxAngle = float(raw_input())
    maxAngle_deg = maxAngle * 180/pi

    fileName = path + "/calibration_" + joint + ".yaml"
 
    stream = file(fileName, 'r') 
    print("Calibration data read from: " + fileName)

    data = yaml.load(stream)
    thetas = data['thetas'] 
    ccs = data['ccs']
    equilibriums = data['equilibriums']

    thetas_deg = list()
    for theta in thetas:
        theta *= 180/pi
        thetas_deg.append(round(theta,1))

    jm = JointModel("test")
    jm.setCalibration(thetas, ccs, equilibriums)
    gridX, gridY = np.mgrid[minAngle:maxAngle:0.01, 0:1:0.01]
    map = jm.getMap(gridX, gridY)
    plt.imshow(map.T, extent=(minAngle_deg, maxAngle_deg, 0, 100), aspect='auto')
    plt.xlabel('Joint angle (degrees)', fontsize=18)
    plt.ylabel('Co-contraction (%)', fontsize=18)
    plt.tick_params(axis='both', which='major', labelsize=18)
    plt.tight_layout()
    plt.show()

if __name__ == '__main__':
    main(sys.argv)
