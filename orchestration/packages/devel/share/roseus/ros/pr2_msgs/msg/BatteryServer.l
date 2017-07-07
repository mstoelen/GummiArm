;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::BatteryServer)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'BatteryServer (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::BATTERYSERVER")
  (make-package "PR2_MSGS::BATTERYSERVER"))

(in-package "ROS")
;;//! \htmlinclude BatteryServer.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*MAX_BAT_COUNT*" (find-package "PR2_MSGS::BATTERYSERVER"))
(shadow '*MAX_BAT_COUNT* (find-package "PR2_MSGS::BATTERYSERVER"))
(defconstant pr2_msgs::BatteryServer::*MAX_BAT_COUNT* 4)
(intern "*MAX_BAT_REG*" (find-package "PR2_MSGS::BATTERYSERVER"))
(shadow '*MAX_BAT_REG* (find-package "PR2_MSGS::BATTERYSERVER"))
(defconstant pr2_msgs::BatteryServer::*MAX_BAT_REG* 48)
(defclass pr2_msgs::BatteryServer
  :super ros::object
  :slots (_header _id _lastTimeSystem _timeLeft _averageCharge _message _lastTimeController _present _charging _discharging _reserved _powerPresent _powerNG _inhibited _battery ))

(defmethod pr2_msgs::BatteryServer
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:lastTimeSystem __lastTimeSystem) 0)
    ((:timeLeft __timeLeft) 0)
    ((:averageCharge __averageCharge) 0)
    ((:message __message) "")
    ((:lastTimeController __lastTimeController) 0)
    ((:present __present) 0)
    ((:charging __charging) 0)
    ((:discharging __discharging) 0)
    ((:reserved __reserved) 0)
    ((:powerPresent __powerPresent) 0)
    ((:powerNG __powerNG) 0)
    ((:inhibited __inhibited) 0)
    ((:battery __battery) (let (r) (dotimes (i 0) (push (instance pr2_msgs::BatteryState :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _lastTimeSystem (round __lastTimeSystem))
   (setq _timeLeft (round __timeLeft))
   (setq _averageCharge (round __averageCharge))
   (setq _message (string __message))
   (setq _lastTimeController (round __lastTimeController))
   (setq _present (round __present))
   (setq _charging (round __charging))
   (setq _discharging (round __discharging))
   (setq _reserved (round __reserved))
   (setq _powerPresent (round __powerPresent))
   (setq _powerNG (round __powerNG))
   (setq _inhibited (round __inhibited))
   (setq _battery __battery)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:lastTimeSystem
   (&optional __lastTimeSystem)
   (if __lastTimeSystem (setq _lastTimeSystem __lastTimeSystem)) _lastTimeSystem)
  (:timeLeft
   (&optional __timeLeft)
   (if __timeLeft (setq _timeLeft __timeLeft)) _timeLeft)
  (:averageCharge
   (&optional __averageCharge)
   (if __averageCharge (setq _averageCharge __averageCharge)) _averageCharge)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:lastTimeController
   (&optional __lastTimeController)
   (if __lastTimeController (setq _lastTimeController __lastTimeController)) _lastTimeController)
  (:present
   (&optional __present)
   (if __present (setq _present __present)) _present)
  (:charging
   (&optional __charging)
   (if __charging (setq _charging __charging)) _charging)
  (:discharging
   (&optional __discharging)
   (if __discharging (setq _discharging __discharging)) _discharging)
  (:reserved
   (&optional __reserved)
   (if __reserved (setq _reserved __reserved)) _reserved)
  (:powerPresent
   (&optional __powerPresent)
   (if __powerPresent (setq _powerPresent __powerPresent)) _powerPresent)
  (:powerNG
   (&optional __powerNG)
   (if __powerNG (setq _powerNG __powerNG)) _powerNG)
  (:inhibited
   (&optional __inhibited)
   (if __inhibited (setq _inhibited __inhibited)) _inhibited)
  (:battery
   (&rest __battery)
   (if (keywordp (car __battery))
       (send* _battery __battery)
     (progn
       (if __battery (setq _battery (car __battery)))
       _battery)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _id
    4
    ;; int32 _lastTimeSystem
    4
    ;; uint16 _timeLeft
    2
    ;; uint16 _averageCharge
    2
    ;; string _message
    4 (length _message)
    ;; int32 _lastTimeController
    4
    ;; uint16 _present
    2
    ;; uint16 _charging
    2
    ;; uint16 _discharging
    2
    ;; uint16 _reserved
    2
    ;; uint16 _powerPresent
    2
    ;; uint16 _powerNG
    2
    ;; uint16 _inhibited
    2
    ;; pr2_msgs/BatteryState[] _battery
    (apply #'+ (send-all _battery :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _id
       (write-long _id s)
     ;; int32 _lastTimeSystem
       (write-long _lastTimeSystem s)
     ;; uint16 _timeLeft
       (write-word _timeLeft s)
     ;; uint16 _averageCharge
       (write-word _averageCharge s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; int32 _lastTimeController
       (write-long _lastTimeController s)
     ;; uint16 _present
       (write-word _present s)
     ;; uint16 _charging
       (write-word _charging s)
     ;; uint16 _discharging
       (write-word _discharging s)
     ;; uint16 _reserved
       (write-word _reserved s)
     ;; uint16 _powerPresent
       (write-word _powerPresent s)
     ;; uint16 _powerNG
       (write-word _powerNG s)
     ;; uint16 _inhibited
       (write-word _inhibited s)
     ;; pr2_msgs/BatteryState[] _battery
     (write-long (length _battery) s)
     (dolist (elem _battery)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lastTimeSystem
     (setq _lastTimeSystem (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _timeLeft
     (setq _timeLeft (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _averageCharge
     (setq _averageCharge (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _lastTimeController
     (setq _lastTimeController (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _present
     (setq _present (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _charging
     (setq _charging (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _discharging
     (setq _discharging (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _reserved
     (setq _reserved (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _powerPresent
     (setq _powerPresent (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _powerNG
     (setq _powerNG (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _inhibited
     (setq _inhibited (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; pr2_msgs/BatteryState[] _battery
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _battery (let (r) (dotimes (i n) (push (instance pr2_msgs::BatteryState :init) r)) r))
     (dolist (elem- _battery)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pr2_msgs::BatteryServer :md5sum-) "4f6d6e54c9581beb1df7ea408c0727be")
(setf (get pr2_msgs::BatteryServer :datatype-) "pr2_msgs/BatteryServer")
(setf (get pr2_msgs::BatteryServer :definition-)
      "# DEPRECATED. Use pr2_msgs/BatteryServer2 instead.
Header header
uint32 MAX_BAT_COUNT=4
uint32 MAX_BAT_REG=48
int32 id  # unique ID for each battery server
# Battery System Stats
int32 lastTimeSystem #epoch time
uint16 timeLeft      # in minutes
uint16 averageCharge # in percent
string message
# Battery Controller Flags
int32 lastTimeController #epoch time
uint16 present
uint16 charging
uint16 discharging
uint16 reserved
uint16 powerPresent
uint16 powerNG
uint16 inhibited
# for each battery
pr2_msgs/BatteryState[] battery

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
MSG: pr2_msgs/BatteryState
# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.
# Each batteries registers
int32 lastTimeBattery #epoch time
uint16[48] batReg
uint16[48] batRegFlag
int32[48] batRegTime

")



(provide :pr2_msgs/BatteryServer "4f6d6e54c9581beb1df7ea408c0727be")


