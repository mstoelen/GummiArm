Gummi Trigger
--------

- Language: Python and ROS (Robot Operating System)
- Robot: [GummiArm](https://github.com/mstoelen/GummiArm)
- Contributors: Massimiliano Patacchiola


Requirements
------------

- This tutorial has been tested on ROS Indigo, using the Kinect 2.0
- Install the [freenect package](http://wiki.ros.org/freenect_launch): sudo apt-get install libfreenect-dev ros-indigo-freenect-launch
- Install [depthimage_to_laserscan](http://wiki.ros.org/depthimage_to_laserscan): sudo apt-get install ros-indigo-depthimage-to-laserscan

Installation
------------

- Run the roscore from terminal: roscore
- Run the freenect node: roslaunch freenect_launch freenect.launch
- To check the connection between nodes run: rosrun rqt_graph rqt_graph
- (optional) Visualise the pointcloud and the scan with rviz: rosrun rviz rviz
- Copy the following launch file in the depth_to_laserscan folder and call the file scan.launch: roscd depth_to_laserscan; gedit scan.launch

```xml 
<launch>
    <node pkg="nodelet" type="nodelet" name="depthimage_to_laserscan" args="load depthimage_to_laserscan/DepthImageToLaserScanNodelet camera/camera_nodelet_manager">
      <param name="scan_height" value="10"/>
      <param name="output_frame_id" value="/camera_depth_frame"/>
      <param name="range_min" value="0.50"/>
      <param name="range_max" type="double" value="5"/>
      <remap from="image" to="camera/depth/image_raw"/>
      <remap from="scan" to="/kinect_scan"/>
      <remap from="camera/image" to="camera/depth/image_raw"/>
      <remap from="camera/scan" to="/kinect_scan"/>
    </node>
 </launch>
```

- Run the launch file: roslaunch depthimage_to_laserscan scan.launch
- The scanner output is visible under the topic /kinect_scan
- Now it is possible to visualise the scan output directly in Rviz

Visulise in Rviz
----------------

- Run rviz: rosrun rviz rviz
- Add a pointcloud2 service in the display session
- Add the laser_scan service in the display session
