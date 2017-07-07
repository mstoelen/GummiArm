;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::AccelerometerState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'AccelerometerState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::ACCELEROMETERSTATE")
  (make-package "PR2_MSGS::ACCELEROMETERSTATE"))

(in-package "ROS")
;;//! \htmlinclude AccelerometerState.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::AccelerometerState
  :super ros::object
  :slots (_header _samples ))

(defmethod pr2_msgs::AccelerometerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:samples __samples) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Vector3 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _samples __samples)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:samples
   (&rest __samples)
   (if (keywordp (car __samples))
       (send* _samples __samples)
     (progn
       (if __samples (setq _samples (car __samples)))
       _samples)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3[] _samples
    (apply #'+ (send-all _samples :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3[] _samples
     (write-long (length _samples) s)
     (dolist (elem _samples)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3[] _samples
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _samples (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _samples)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pr2_msgs::AccelerometerState :md5sum-) "26492e97ed8c13252c4a85592d3e93fd")
(setf (get pr2_msgs::AccelerometerState :datatype-) "pr2_msgs/AccelerometerState")
(setf (get pr2_msgs::AccelerometerState :definition-)
      "#This captures acceleration measurements from the 3-dof accelerometer in the hand of the PR2
#Units are meters / second / second
#Vectors should be <X, Y, Z> in the frame of the gripper

#The communication with the accelerometer is at approximately 3khz, but there is only good timestamping every 1ms
#This means the samples should be interpreted as all having come from the 1 ms before the time in the header

Header header
geometry_msgs/Vector3[] samples

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :pr2_msgs/AccelerometerState "26492e97ed8c13252c4a85592d3e93fd")


