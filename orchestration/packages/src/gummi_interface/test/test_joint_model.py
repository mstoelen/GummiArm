#!/usr/bin/env python

PKG = 'gummi_interface'

import unittest
import matplotlib.pyplot as plt
from calibration_data import thetas, ccs, equilibriums
from gummi_interface.joint_model import JointModel

class TestJointModel(unittest.TestCase):

    def test_exact(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(-0.481)
        jm.setCocontraction(0.8)
        jm.generateCommand()
        point = jm.getEquilibriumPoint()
        self.assertEqual(point, 1.356)

    def test_interpolation(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(0.03)
        jm.setCocontraction(0.4)
        jm.generateCommand()
        point = jm.getEquilibriumPoint()
        self.assertTrue(point > 2.870 and point < 3.014)

    def test_outside_range(self):
        jm = JointModel("test")
        global equilibriums, thetas, ccs
        jm.setCalibration(thetas, ccs, equilibriums)
        jm.setAngle(-0.9)
        jm.setCocontraction(0.4)
        result = jm.generateCommand()
        self.assertFalse(result)
        
if __name__ == '__main__':
    import rostest
    rostest.rosrun(PKG, 'test_joint_model', TestJointModel)
