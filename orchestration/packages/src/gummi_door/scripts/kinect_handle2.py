#!/usr/bin/env python
from __future__ import print_function
import atexit
import sys
import rospy
import cv2
import numpy as np
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
        self.handle_cascade = cv2.CascadeClassifier('/home/joe/repos/working/GummiArm/orchestration/packages/src/gummi_door/scripts/cascade.xml')
        self.Image_sub = rospy.Subscriber("/camera/rgb/image_color", Image, self.callback)
        self.Image_sub2 = rospy.Subscriber("/camera/depth/image_rect", Image, self.depth)
        self.cam_info = rospy.Subscriber("/camera/depth/camera_info", CameraInfo, self.fromCameraInfo)
        self.targety = 1
        self.targetx = 1
        self.x = 1
        self.y = 1
        self.w = 1
        self.pos_cnt = 0
        self.neg_cnt = 0
        self.start = rospy.get_time()

        #self.z = 1
        self.P = [1, 1, 1, 1]
        atexit.register(self.endlog)

    def callback(self, data):
        # gets image from /image_color topic, calls contour to get x, y
        # and the processed cv_image with a rectangle, shows the
        # cv_image with the live x, y and z values displayed on screen
        # and publishes x, y and z on the /target topic
        self.cv_image = self.bridge.imgmsg_to_cv2(data, 'mono8')
        self.x3d, self.y3d, self.z, self.cv_image = self.contour(self.cv_image)
        font = cv2.FONT_HERSHEY_SIMPLEX
        self.str_x = str(self.z)
        self.str_y = str(self.x3d * -1)
        self.str_z = str(-self.y3d)
        position = "x:{0} y:{1} z:{2}".format(self.str_x, self.str_y, self.str_z)
        cv2.putText(self.cv_image, position, (10,450), font, 0.5,(255,255,255),1) #cv2.LINE_AA
        cv2.imshow('Image', self.cv_image)
        self.target = PointStamped()
        #self.target.header.stamp.secs = rospy.Time()
        self.target.header.frame_id = "/kinect"
        if np.logical_not(np.isnan(self.z)):
            self.target.point.x = self.z
        if np.logical_not(np.isnan(self.x3d)):
            self.target.point.y = self.x3d
        if np.logical_not(np.isnan(self.y3d)):
            self.target.point.z = -self.y3d
        if self.target.point.x != 0:
            self.pub.publish(self.target)
        #print (self.target)
        cv2.waitKey(100)

    def contour(self, cv_image):
        # blurs image to remove noise, thresholds image, shows the
        # threshold image, finds contours, selects the correct contour
        # for the door handle before drawing a rectangle around it and
        # returning the x and y position of the centre top of the
        # rectangle. Then uses projectPixelTo3dRay to get camera space
        # position of the handle referenced to the middle of the image
        img = cv_image
        #self.handle = self.handle_cascade.detectMultiScale(img, 40, 200)
        #for (x,y,w,h) in self.handle:
            ##if (y > 200) and (y < 350) and (x > 150) and (x < 300):
            #cv2.rectangle(img,(x,y),(x+w,y+h),(255,255,0),2)
            #self.x = x
            #self.y = y
            #self.w = w
            #else:
                #self.x = 1
                #self.y = 1
                #self.w = 1


            #roi_img = img[y:y+h, x:x+w]
            #roi_color = img[y:y+h, x:x+w]
        #cv2.imshow('img',img)
        #img = cv_image
        img = cv2.GaussianBlur(img,(5,5),0)
        thresh = cv2.adaptiveThreshold(img, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 9, 7)
        cv2.imshow('thresh', thresh)
        image, contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        #contours = contours[0]
        check = 0
        for cnt in contours:
            if len(cnt) > 10:
                x, y, w, h = cv2.boundingRect(cnt)
                if (w < 250) and (h < 100) and (w > 60) and (h > 3) and (y > 200) and (y < 350) and (x > 150) and (x < 300):
                    good = cnt
                    #print (good)
                    check = 1
                    self.pos_cnt += 1
                    print ("pos_cnt =", self.pos_cnt)
        if check == 0:
            self.neg_cnt += 1
            print ("neg_cnt =", self.neg_cnt)
            return 0, 0, 0, self.cv_image
        x, y, w, h = cv2.boundingRect(good)
        #print (x, y, w, h)
        cv2.rectangle(cv_image, (x, y), (x + w, y + h), (0, 125, 8), 2)
        self.targetx = (x + (w / 2))
        self.targety = y
        #print (self.targetx, self.targety)
        self.x3d, self.y3d = self.projectPixelTo3dRay(self.targety, self.targetx)
        #print (self.x, self.y, self.z)
        return self.x3d, self.y3d, self.z, self.cv_image

    def depth(self, data):
        # returns distance from sensor to target pixel from the depth
        # image
        #for i in range(1):
        #if self.targetx is int:
        depth_image = self.bridge.imgmsg_to_cv2(data, 'passthrough')
        np.clip(depth_image, 0, 2, depth_image)
        self.z = depth_image[self.targety + 10][self.targetx]
        #print(self.z)
        #if self.z < 1:
        return self.z

    def fromCameraInfo(self, data):
        # returns matrix P from camera_info topic containing focal
        # length and centre of image
        self.P = data.P

    def projectPixelTo3dRay(self, targety, targetx):
        # returns x and y in camera space calculated from x and y in
        # pixels, centre of image (cx, cy) and focal length (fx, fy)
        self.x3d = (self.targetx - self.cx()) / self.fx()
        self.y3d = (self.targety - self.cy()) / self.fy()
        return (self.x3d, self.y3d)

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

    def endlog(self):
        self.end = rospy.get_time()
        self.elapsed = self.end - self.start
        self.stats = ("pos_cnt = " + str(self.pos_cnt) + " neg_cnt = " +
        str(self.neg_cnt) + " elapsed " + str(self.elapsed) + " seconds")
        print ("===================================================")
        print ("door handle identification")
        print (self.stats)
        print ("===================================================")


def main(args):
    image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)


