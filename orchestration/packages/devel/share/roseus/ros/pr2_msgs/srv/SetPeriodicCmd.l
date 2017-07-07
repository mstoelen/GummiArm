;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::SetPeriodicCmd)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'SetPeriodicCmd (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::SETPERIODICCMD")
  (make-package "PR2_MSGS::SETPERIODICCMD"))
(unless (find-package "PR2_MSGS::SETPERIODICCMDREQUEST")
  (make-package "PR2_MSGS::SETPERIODICCMDREQUEST"))
(unless (find-package "PR2_MSGS::SETPERIODICCMDRESPONSE")
  (make-package "PR2_MSGS::SETPERIODICCMDRESPONSE"))

(in-package "ROS")





(defclass pr2_msgs::SetPeriodicCmdRequest
  :super ros::object
  :slots (_command ))

(defmethod pr2_msgs::SetPeriodicCmdRequest
  (:init
   (&key
    ((:command __command) (instance pr2_msgs::PeriodicCmd :init))
    )
   (send-super :init)
   (setq _command __command)
   self)
  (:command
   (&rest __command)
   (if (keywordp (car __command))
       (send* _command __command)
     (progn
       (if __command (setq _command (car __command)))
       _command)))
  (:serialization-length
   ()
   (+
    ;; pr2_msgs/PeriodicCmd _command
    (send _command :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pr2_msgs/PeriodicCmd _command
       (send _command :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pr2_msgs/PeriodicCmd _command
     (send _command :deserialize buf ptr-) (incf ptr- (send _command :serialization-length))
   ;;
   self)
  )

(defclass pr2_msgs::SetPeriodicCmdResponse
  :super ros::object
  :slots (_start_time ))

(defmethod pr2_msgs::SetPeriodicCmdResponse
  (:init
   (&key
    ((:start_time __start_time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _start_time __start_time)
   self)
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:serialization-length
   ()
   (+
    ;; time _start_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass pr2_msgs::SetPeriodicCmd
  :super ros::object
  :slots ())

(setf (get pr2_msgs::SetPeriodicCmd :md5sum-) "daeb6e862b732192bc82a7ea52bb7975")
(setf (get pr2_msgs::SetPeriodicCmd :datatype-) "pr2_msgs/SetPeriodicCmd")
(setf (get pr2_msgs::SetPeriodicCmd :request) pr2_msgs::SetPeriodicCmdRequest)
(setf (get pr2_msgs::SetPeriodicCmd :response) pr2_msgs::SetPeriodicCmdResponse)

(defmethod pr2_msgs::SetPeriodicCmdRequest
  (:response () (instance pr2_msgs::SetPeriodicCmdResponse :init)))

(setf (get pr2_msgs::SetPeriodicCmdRequest :md5sum-) "daeb6e862b732192bc82a7ea52bb7975")
(setf (get pr2_msgs::SetPeriodicCmdRequest :datatype-) "pr2_msgs/SetPeriodicCmdRequest")
(setf (get pr2_msgs::SetPeriodicCmdRequest :definition-)
      "pr2_msgs/PeriodicCmd command

================================================================================
MSG: pr2_msgs/PeriodicCmd
# This message is used to set the parameters of a profile executed by the
# laser tilt controller.
Header header
string profile
float64 period
float64 amplitude
float64 offset

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
---
time start_time
")

(setf (get pr2_msgs::SetPeriodicCmdResponse :md5sum-) "daeb6e862b732192bc82a7ea52bb7975")
(setf (get pr2_msgs::SetPeriodicCmdResponse :datatype-) "pr2_msgs/SetPeriodicCmdResponse")
(setf (get pr2_msgs::SetPeriodicCmdResponse :definition-)
      "pr2_msgs/PeriodicCmd command

================================================================================
MSG: pr2_msgs/PeriodicCmd
# This message is used to set the parameters of a profile executed by the
# laser tilt controller.
Header header
string profile
float64 period
float64 amplitude
float64 offset

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
---
time start_time
")



(provide :pr2_msgs/SetPeriodicCmd "daeb6e862b732192bc82a7ea52bb7975")


