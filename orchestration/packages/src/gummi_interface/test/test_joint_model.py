#!/usr/bin/env python

PKG = 'gummi_interface'

import unittest
import matplotlib.pyplot as plt
from calibration_data import thetas, ccs, alphasFlexor, alphasExtensor
from gummi_interface.joint_model import JointModel

class TestJointModel(unittest.TestCase):

    def test_exact_flexor(self):
        jm = JointModel("test")
        global alphasFlexor, alphasExtensor, thetas, ccs
        jm.setCalibration(thetas, ccs, alphasFlexor, alphasExtensor)
        jm.setAngle(-0.481)
        jm.setCocontraction(0.8)
        jm.generateCommands()
        angle = jm.getFlexor()
        self.assertEqual(angle, 1.356)

    def test_exact_extensor(self):
        jm = JointModel("test")
        global alphasFlexor, alphasExtensor, thetas, ccs
        jm.setCalibration(thetas, ccs, alphasFlexor, alphasExtensor)
        jm.setAngle(-0.481)
        jm.setCocontraction(0.8)
        jm.generateCommands()
        angle = jm.getExtensor()
        self.assertEqual(angle, 1.666)

    def test_interpolation_flexor(self):
        jm = JointModel("test")
        global alphasFlexor, alphasExtensor, thetas, ccs
        jm.setCalibration(thetas, ccs, alphasFlexor, alphasExtensor)
        jm.setAngle(0.03)
        jm.setCocontraction(0.4)
        jm.generateCommands()
        angle = jm.getFlexor()
        self.assertTrue(angle > 2.870 and angle < 3.014)

    def test_interpolation_extensor(self):
        jm = JointModel("test")
        global alphasFlexor, alphasExtensor, thetas, ccs
        jm.setCalibration(thetas, ccs, alphasFlexor, alphasExtensor)
        jm.setAngle(0.03)
        jm.setCocontraction(0.4)
        jm.generateCommands()
        angle = jm.getExtensor()
        self.assertTrue(angle > 0.882 and angle < 1.032)

    def test_outside_range(self):
        jm = JointModel("test")
        global alphasFlexor, alphasExtensor, thetas, ccs
        jm.setCalibration(thetas, ccs, alphasFlexor, alphasExtensor)
        jm.setAngle(-0.9)
        jm.setCocontraction(0.4)
        result = jm.generateCommands()
        self.assertFalse(result)
        
if __name__ == '__main__':
    import rostest
    rostest.rosrun(PKG, 'test_joint_model', TestJointModel)
