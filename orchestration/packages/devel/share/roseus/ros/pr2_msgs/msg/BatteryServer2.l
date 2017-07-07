;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::BatteryServer2)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'BatteryServer2 (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::BATTERYSERVER2")
  (make-package "PR2_MSGS::BATTERYSERVER2"))

(in-package "ROS")
;;//! \htmlinclude BatteryServer2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*MAX_BAT_COUNT*" (find-package "PR2_MSGS::BATTERYSERVER2"))
(shadow '*MAX_BAT_COUNT* (find-package "PR2_MSGS::BATTERYSERVER2"))
(defconstant pr2_msgs::BatteryServer2::*MAX_BAT_COUNT* 4)
(intern "*MAX_BAT_REG*" (find-package "PR2_MSGS::BATTERYSERVER2"))
(shadow '*MAX_BAT_REG* (find-package "PR2_MSGS::BATTERYSERVER2"))
(defconstant pr2_msgs::BatteryServer2::*MAX_BAT_REG* 48)
(defclass pr2_msgs::BatteryServer2
  :super ros::object
  :slots (_header _id _last_system_update _time_left _average_charge _message _last_controller_update _battery ))

(defmethod pr2_msgs::BatteryServer2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:last_system_update __last_system_update) (instance ros::time :init))
    ((:time_left __time_left) (instance ros::time :init))
    ((:average_charge __average_charge) 0)
    ((:message __message) "")
    ((:last_controller_update __last_controller_update) (instance ros::time :init))
    ((:battery __battery) (let (r) (dotimes (i 0) (push (instance pr2_msgs::BatteryState2 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _last_system_update __last_system_update)
   (setq _time_left __time_left)
   (setq _average_charge (round __average_charge))
   (setq _message (string __message))
   (setq _last_controller_update __last_controller_update)
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
  (:last_system_update
   (&optional __last_system_update)
   (if __last_system_update (setq _last_system_update __last_system_update)) _last_system_update)
  (:time_left
   (&optional __time_left)
   (if __time_left (setq _time_left __time_left)) _time_left)
  (:average_charge
   (&optional __average_charge)
   (if __average_charge (setq _average_charge __average_charge)) _average_charge)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:last_controller_update
   (&optional __last_controller_update)
   (if __last_controller_update (setq _last_controller_update __last_controller_update)) _last_controller_update)
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
    ;; time _last_system_update
    8
    ;; duration _time_left
    8
    ;; int32 _average_charge
    4
    ;; string _message
    4 (length _message)
    ;; time _last_controller_update
    8
    ;; pr2_msgs/BatteryState2[] _battery
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
     ;; time _last_system_update
       (write-long (send _last_system_update :sec) s) (write-long (send _last_system_update :nsec) s)
     ;; duration _time_left
       (write-long (send _time_left :sec) s) (write-long (send _time_left :nsec) s)
     ;; int32 _average_charge
       (write-long _average_charge s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; time _last_controller_update
       (write-long (send _last_controller_update :sec) s) (write-long (send _last_controller_update :nsec) s)
     ;; pr2_msgs/BatteryState2[] _battery
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
   ;; time _last_system_update
     (send _last_system_update :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_system_update :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; duration _time_left
     (send _time_left :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_left :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _average_charge
     (setq _average_charge (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; time _last_controller_update
     (send _last_controller_update :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_controller_update :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; pr2_msgs/BatteryState2[] _battery
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _battery (let (r) (dotimes (i n) (push (instance pr2_msgs::BatteryState2 :init) r)) r))
     (dolist (elem- _battery)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get pr2_msgs::BatteryServer2 :md5sum-) "5f2cec7d06c312d756189db96c1f3819")
(setf (get pr2_msgs::BatteryServer2 :datatype-) "pr2_msgs/BatteryServer2")
(setf (get pr2_msgs::BatteryServer2 :definition-)
      "# This message communicates the state of a battery server, which controls
# multiple batteries.
Header header
int32 MAX_BAT_COUNT=4
int32 MAX_BAT_REG=48
int32 id  # unique ID for each battery server
# Battery System Stats
time last_system_update  # last time the system stats where updated
duration time_left       # in seconds (hardware resolution is 1 minute)
int32 average_charge     # in percent
string message           # message from the ocean server
time last_controller_update # last time a battery status flag was updated
# for each battery
pr2_msgs/BatteryState2[] battery

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
MSG: pr2_msgs/BatteryState2
# This message communicates the state of a single battery.
# Battery Controller Flags, one per battery
bool present       # is this pack present
bool charging      # is this pack charging
bool discharging   # is this pack discharging
bool power_present # is there an input voltage
bool power_no_good # is there a fault (No Good)
bool inhibited     # is this pack disabled for some reason
# These registers are per battery
time      last_battery_update     # last time any battery update occurred
int16[48] battery_register        # value of this register in the battery
bool[48]  battery_update_flag     # Has this register ever been updated
time[48]  battery_register_update # last time this specific register was updated

")



(provide :pr2_msgs/BatteryServer2 "5f2cec7d06c312d756189db96c1f3819")


