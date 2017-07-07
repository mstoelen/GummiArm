;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::LaserScannerSignal)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'LaserScannerSignal (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::LASERSCANNERSIGNAL")
  (make-package "PR2_MSGS::LASERSCANNERSIGNAL"))

(in-package "ROS")
;;//! \htmlinclude LaserScannerSignal.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::LaserScannerSignal
  :super ros::object
  :slots (_header _signal ))

(defmethod pr2_msgs::LaserScannerSignal
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:signal __signal) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _signal (round __signal))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _signal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _signal
       (write-long _signal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _signal
     (setq _signal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pr2_msgs::LaserScannerSignal :md5sum-) "78f41e618127bce049dd6104d9c31dc5")
(setf (get pr2_msgs::LaserScannerSignal :datatype-) "pr2_msgs/LaserScannerSignal")
(setf (get pr2_msgs::LaserScannerSignal :definition-)
      "# This message is emitted by the laser tilt controller when the laser hits
# one limit of its profile.
Header header

# signal == 0 => Half profile complete
# signal == 1 => Full Profile Complete
int32 signal

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

")



(provide :pr2_msgs/LaserScannerSignal "78f41e618127bce049dd6104d9c31dc5")


