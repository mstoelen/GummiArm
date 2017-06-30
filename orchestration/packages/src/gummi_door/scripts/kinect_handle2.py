#!/usr/bin/env python
from __future__ import print_function
import sys
import rospy
import cv2
import numpy as np
import math
from sensor_msgs.msg import CameraInfo
from geometry_msgs.msg import PointStamped
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

class image_converter:
    def __init__(self):
        # initialises the node, publisher, subscribers and variables
        self.pub = rospy.Publisher("target", PointStamped, queue_size=1000)
        rospy.init_node('target', anonymous=True)
        self.bridge = CvBridge()
        self.Image_sub = rospy.Subscriber("/camera/rgb/image_color", Image, self.callback)
        self.Image_sub2 = rospy.Subscriber("/camera/depth/image_rect", Image, self.depth)
        self.cam_info = rospy.Subscriber("/camera/depth/camera_info", CameraInfo, self.fromCameraInfo)
        self.targety = 1
        self.targetx = 1
        self.z = 1
        self.P = 1

    def callback(self, data):
        # gets image from /image_color topic, calls contour to get x, y
        # and the processed cv_image with a rectangle, shows the
        # cv_image with the live x, y and z values displayed on screen
        # and publishes x, y and z on the /target topic
        self.cv_image = self.bridge.imgmsg_to_cv2(data, 'mono8')
        self.x, self.y, self.z, self.cv_image = self.contour(self.cv_image)
        font = cv2.FONT_HERSHEY_SIMPLEX
        self.str_x = str(self.z)
        self.str_y = str(self.x*-1)
        self.str_z = str(self.y)
        position = "x:{0} y:{1} z:{2}".format(self.str_x, self.str_y, self.str_z)
        cv2.putText(self.cv_image, position, (10,450), font, 0.5,(255,255,255),1) #cv2.LINE_AA
        cv2.imshow('Image', self.cv_image)
        self.target = PointStamped()
        #self.target.header.stamp.secs = rospy.Time()
        self.target.header.frame_id = "kinect"
        self.target.point.x = self.x
        self.target.point.y = self.y
        self.target.point.z = self.z
        self.pub.publish(self.target)
        cv2.waitKey(100)

    def contour(self, cv_image):
        # blurs image to remove noise, thresholds image, shows the
        # threshold image, finds contours, selects the correct contour
        # for the door handle before drawing a rectangle around it and
        # returning the x and y position of the centre top of the
        # rectangle. Then uses projectPixelTo3dRay to get camera space
        # position of the handle referenced to the middle of the image
        img = cv_image
        img = cv2.GaussianBlur(img,(5,5),0)
        thresh = cv2.adaptiveThreshold(img, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 9, 7)
        cv2.imshow('thresh', thresh)
        contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        #contours = contours[0]
        for cnt in contours:
            if len(cnt) > 10:	
                x, y, w, h = cv2.boundingRect(cnt)
                if (w < 250) and (h < 100) and (w > 40) and (h > 3) and (y > 200) and (y < 350) and (x > 150) and (x < 300):
                    good = cnt
        x, y, w, h = cv2.boundingRect(good)
        cv2.rectangle(cv_image, (x, y), (x + w, y + h), (0, 125, 8), 2)
        self.targetx = (x + (w / 2))
        self.targety = y
        self.x, self.y = self.projectPixelTo3dRay(self.targety, self.targetx)
        print (self.x, self.y, self.z)
        return self.x, self.y, self.z, self.cv_image


    def depth(self, data):
        # returns distance from sensor to target pixel from the depth
        # image
        #for i in range(1):
            depth_image = self.bridge.imgmsg_to_cv2(data, 'passthrough')
            np.clip(depth_image, 0, 2, depth_image)
            self.z = depth_image[self.targety][self.targetx]
            #if self.z < 1:
            return self.z

    def fromCameraInfo(self, data):
        # returns matrix P from camera_info topic containing focal
        # length and centre of image
        self.P = data.P

    def projectPixelTo3dRay(self, targety, targetx):
        # returns x and y in camera space calculated from x and y in
        # pixels, centre of image (cx, cy) and focal length (fx, fy)
        self.x = (self.targetx - self.cx()) / self.fx()
        self.y = (self.targety - self.cy()) / self.fy()
        return (self.x, self.y)

    def cx(self):
        # returns centre of image in x
        return self.P[2]

    def cy(self):
        # returns centre of image in y
        return self.P[6]

    def fx(self):
        # returns focal length in x
        return self.P[0]

    def fy(self):
        # returns focal length in y
        return self.P[5]


def main(args):
    image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)


