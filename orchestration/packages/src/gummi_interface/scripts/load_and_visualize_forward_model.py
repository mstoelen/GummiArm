#!/usr/bin/env python

import yaml
import sys
import numpy as np
import matplotlib.pyplot as plt

from gummi_interface.forward_model import ForwardModel

def main(args):

    pi = 3.1416

    print("Please enter path to folder where calibration file is:")
    path = raw_input()

    print("Please enter joint name:")
    joint = raw_input()

    print("Please enter min eqilibrium:")
    minEq = float(raw_input())

    print("Please enter max equilibrium:")
    maxEq = float(raw_input())

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

    jm = ForwardModel("test")
    jm.setCalibration(thetas_deg, ccs, equilibriums)
    gridX, gridY = np.mgrid[minEq:maxEq:0.01, 0:1:0.01]
    map = jm.getMap(gridX, gridY)

    ax = plt.imshow(map.T, extent=(minEq, maxEq, 0, 100), aspect='auto')
    plt.xlabel('Equilibrium point', fontsize=18)
    plt.ylabel('Co-contraction (%)', fontsize=18)
    plt.tick_params(axis='both', which='major', labelsize=18)
    cbar = plt.colorbar(ax)
    cbar.set_label('Joint angle (degrees)', size=18)
    cbar.ax.tick_params(labelsize=18) 
    plt.tight_layout()
    plt.show()

if __name__ == '__main__':
    main(sys.argv)
