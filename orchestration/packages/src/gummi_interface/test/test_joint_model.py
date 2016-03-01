#!/usr/bin/env python

PKG = 'gummi_interface'

import unittest
import numpy as np
import matplotlib.pyplot as plt
from calibration_data import thetas, ccs, equilibriums
from gummi_interface.joint_model import JointModel

class TestJointModel(unittest.TestCase):

    def test_exact(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(-0.476)
        jm.setCocontraction(0.8)
        jm.generateCommand()
        point = jm.getEquilibriumPoint()
        self.assertEqual(point, -0.031)

    def test_interpolation(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(0.21)
        jm.setCocontraction(0.0)
        jm.generateCommand()
        point = jm.getEquilibriumPoint()
        self.assertTrue(point > -1.73 and point < -1.526)

    def test_outside_range(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(-0.9)
        jm.setCocontraction(0.4)
        result = jm.generateCommand()
        self.assertFalse(result)

    def test_plot_calibration(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        gridX, gridY = np.mgrid[-0.5:0.5:0.01, -0.1:0.9:0.01]
        map = jm.getMap(gridX, gridY)
        plt.imshow(map.T, extent=(-0.5, 0.5, -0.1, 0.9))
        plt.show()
        self.assertTrue(True)
        
if __name__ == '__main__':
    import rostest
    rostest.rosrun(PKG, 'test_joint_model', TestJointModel)
