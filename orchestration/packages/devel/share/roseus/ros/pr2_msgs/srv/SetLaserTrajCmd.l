;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::SetLaserTrajCmd)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'SetLaserTrajCmd (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::SETLASERTRAJCMD")
  (make-package "PR2_MSGS::SETLASERTRAJCMD"))
(unless (find-package "PR2_MSGS::SETLASERTRAJCMDREQUEST")
  (make-package "PR2_MSGS::SETLASERTRAJCMDREQUEST"))
(unless (find-package "PR2_MSGS::SETLASERTRAJCMDRESPONSE")
  (make-package "PR2_MSGS::SETLASERTRAJCMDRESPONSE"))

(in-package "ROS")





(defclass pr2_msgs::SetLaserTrajCmdRequest
  :super ros::object
  :slots (_command ))

(defmethod pr2_msgs::SetLaserTrajCmdRequest
  (:init
   (&key
    ((:command __command) (instance pr2_msgs::LaserTrajCmd :init))
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
    ;; pr2_msgs/LaserTrajCmd _command
    (send _command :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; pr2_msgs/LaserTrajCmd _command
       (send _command :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; pr2_msgs/LaserTrajCmd _command
     (send _command :deserialize buf ptr-) (incf ptr- (send _command :serialization-length))
   ;;
   self)
  )

(defclass pr2_msgs::SetLaserTrajCmdResponse
  :super ros::object
  :slots (_start_time ))

(defmethod pr2_msgs::SetLaserTrajCmdResponse
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

(defclass pr2_msgs::SetLaserTrajCmd
  :super ros::object
  :slots ())

(setf (get pr2_msgs::SetLaserTrajCmd :md5sum-) "28fe2ce397611c999952c74a1ea882aa")
(setf (get pr2_msgs::SetLaserTrajCmd :datatype-) "pr2_msgs/SetLaserTrajCmd")
(setf (get pr2_msgs::SetLaserTrajCmd :request) pr2_msgs::SetLaserTrajCmdRequest)
(setf (get pr2_msgs::SetLaserTrajCmd :response) pr2_msgs::SetLaserTrajCmdResponse)

(defmethod pr2_msgs::SetLaserTrajCmdRequest
  (:response () (instance pr2_msgs::SetLaserTrajCmdResponse :init)))

(setf (get pr2_msgs::SetLaserTrajCmdRequest :md5sum-) "28fe2ce397611c999952c74a1ea882aa")
(setf (get pr2_msgs::SetLaserTrajCmdRequest :datatype-) "pr2_msgs/SetLaserTrajCmdRequest")
(setf (get pr2_msgs::SetLaserTrajCmdRequest :definition-)
      "pr2_msgs/LaserTrajCmd command

================================================================================
MSG: pr2_msgs/LaserTrajCmd
# This message is used to set the profile that the tilt laser controller
# executes.
Header header
string profile              # options are currently \"linear\" or \"linear_blended\"
float64[] position          # Laser positions
duration[] time_from_start  # Times to reach laser positions in seconds
float64 max_velocity        # Set <= 0 to use default
float64 max_acceleration    # Set <= 0 to use default

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

(setf (get pr2_msgs::SetLaserTrajCmdResponse :md5sum-) "28fe2ce397611c999952c74a1ea882aa")
(setf (get pr2_msgs::SetLaserTrajCmdResponse :datatype-) "pr2_msgs/SetLaserTrajCmdResponse")
(setf (get pr2_msgs::SetLaserTrajCmdResponse :definition-)
      "pr2_msgs/LaserTrajCmd command

================================================================================
MSG: pr2_msgs/LaserTrajCmd
# This message is used to set the profile that the tilt laser controller
# executes.
Header header
string profile              # options are currently \"linear\" or \"linear_blended\"
float64[] position          # Laser positions
duration[] time_from_start  # Times to reach laser positions in seconds
float64 max_velocity        # Set <= 0 to use default
float64 max_acceleration    # Set <= 0 to use default

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



(provide :pr2_msgs/SetLaserTrajCmd "28fe2ce397611c999952c74a1ea882aa")


