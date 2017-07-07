;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::DashboardState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'DashboardState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::DASHBOARDSTATE")
  (make-package "PR2_MSGS::DASHBOARDSTATE"))

(in-package "ROS")
;;//! \htmlinclude DashboardState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::DashboardState
  :super ros::object
  :slots (_motors_halted _motors_halted_valid _power_board_state _power_board_state_valid _power_state _power_state_valid _access_point _access_point_valid ))

(defmethod pr2_msgs::DashboardState
  (:init
   (&key
    ((:motors_halted __motors_halted) (instance std_msgs::Bool :init))
    ((:motors_halted_valid __motors_halted_valid) nil)
    ((:power_board_state __power_board_state) (instance pr2_msgs::PowerBoardState :init))
    ((:power_board_state_valid __power_board_state_valid) nil)
    ((:power_state __power_state) (instance pr2_msgs::PowerState :init))
    ((:power_state_valid __power_state_valid) nil)
    ((:access_point __access_point) (instance pr2_msgs::AccessPoint :init))
    ((:access_point_valid __access_point_valid) nil)
    )
   (send-super :init)
   (setq _motors_halted __motors_halted)
   (setq _motors_halted_valid __motors_halted_valid)
   (setq _power_board_state __power_board_state)
   (setq _power_board_state_valid __power_board_state_valid)
   (setq _power_state __power_state)
   (setq _power_state_valid __power_state_valid)
   (setq _access_point __access_point)
   (setq _access_point_valid __access_point_valid)
   self)
  (:motors_halted
   (&rest __motors_halted)
   (if (keywordp (car __motors_halted))
       (send* _motors_halted __motors_halted)
     (progn
       (if __motors_halted (setq _motors_halted (car __motors_halted)))
       _motors_halted)))
  (:motors_halted_valid
   (&optional __motors_halted_valid)
   (if __motors_halted_valid (setq _motors_halted_valid __motors_halted_valid)) _motors_halted_valid)
  (:power_board_state
   (&rest __power_board_state)
   (if (keywordp (car __power_board_state))
       (send* _power_board_state __power_board_state)
     (progn
       (if __power_board_state (setq _power_board_state (car __power_board_state)))
       _power_board_state)))
  (:power_board_state_valid
   (&optional __power_board_state_valid)
   (if __power_board_state_valid (setq _power_board_state_valid __power_board_state_valid)) _power_board_state_valid)
  (:power_state
   (&rest __power_state)
   (if (keywordp (car __power_state))
       (send* _power_state __power_state)
     (progn
       (if __power_state (setq _power_state (car __power_state)))
       _power_state)))
  (:power_state_valid
   (&optional __power_state_valid)
   (if __power_state_valid (setq _power_state_valid __power_state_valid)) _power_state_valid)
  (:access_point
   (&rest __access_point)
   (if (keywordp (car __access_point))
       (send* _access_point __access_point)
     (progn
       (if __access_point (setq _access_point (car __access_point)))
       _access_point)))
  (:access_point_valid
   (&optional __access_point_valid)
   (if __access_point_valid (setq _access_point_valid __access_point_valid)) _access_point_valid)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Bool _motors_halted
    (send _motors_halted :serialization-length)
    ;; bool _motors_halted_valid
    1
    ;; pr2_msgs/PowerBoardState _power_board_state
    (send _power_board_state :serialization-length)
    ;; bool _power_board_state_valid
    1
    ;; pr2_msgs/PowerState _power_state
    (send _power_state :serialization-length)
    ;; bool _power_state_valid
    1
    ;; pr2_msgs/AccessPoint _access_point
    (send _access_point :serialization-length)
    ;; bool _access_point_valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Bool _motors_halted
       (send _motors_halted :serialize s)
     ;; bool _motors_halted_valid
       (if _motors_halted_valid (write-byte -1 s) (write-byte 0 s))
     ;; pr2_msgs/PowerBoardState _power_board_state
       (send _power_board_state :serialize s)
     ;; bool _power_board_state_valid
       (if _power_board_state_valid (write-byte -1 s) (write-byte 0 s))
     ;; pr2_msgs/PowerState _power_state
       (send _power_state :serialize s)
     ;; bool _power_state_valid
       (if _power_state_valid (write-byte -1 s) (write-byte 0 s))
     ;; pr2_msgs/AccessPoint _access_point
       (send _access_point :serialize s)
     ;; bool _access_point_valid
       (if _access_point_valid (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Bool _motors_halted
     (send _motors_halted :deserialize buf ptr-) (incf ptr- (send _motors_halted :serialization-length))
   ;; bool _motors_halted_valid
     (setq _motors_halted_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; pr2_msgs/PowerBoardState _power_board_state
     (send _power_board_state :deserialize buf ptr-) (incf ptr- (send _power_board_state :serialization-length))
   ;; bool _power_board_state_valid
     (setq _power_board_state_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; pr2_msgs/PowerState _power_state
     (send _power_state :deserialize buf ptr-) (incf ptr- (send _power_state :serialization-length))
   ;; bool _power_state_valid
     (setq _power_state_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; pr2_msgs/AccessPoint _access_point
     (send _access_point :deserialize buf ptr-) (incf ptr- (send _access_point :serialization-length))
   ;; bool _access_point_valid
     (setq _access_point_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get pr2_msgs::DashboardState :md5sum-) "db0cd0d535d75e0f6257b20c403e87f5")
(setf (get pr2_msgs::DashboardState :datatype-) "pr2_msgs/DashboardState")
(setf (get pr2_msgs::DashboardState :definition-)
      "# This message communicates state information that might be used by a
# dashboard application.
std_msgs/Bool motors_halted
bool motors_halted_valid

pr2_msgs/PowerBoardState power_board_state
bool power_board_state_valid

pr2_msgs/PowerState power_state
bool power_state_valid

pr2_msgs/AccessPoint access_point
bool access_point_valid

================================================================================
MSG: std_msgs/Bool
bool data
================================================================================
MSG: pr2_msgs/PowerBoardState
# This message communicates the state of the PR2's power board.
int8 STATE_NOPOWER=0
int8 STATE_STANDBY=1
int8 STATE_PUMPING=2
int8 STATE_ON=3
int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat
int8 STATE_DISABLED=4

int8 MASTER_NOPOWER=0
int8 MASTER_STANDBY=1
int8 MASTER_ON=2
int8 MASTER_OFF=3
int8 MASTER_SHUTDOWN=4

Header header
string name # Name with serial number
uint32 serial_num # Serial number for this board's message
float64 input_voltage # Input voltage to power board

# Master States:
#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN 
int8 master_state  # The master state machine's state in the powerboard

# Circuit States:
#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED
int8[3] circuit_state # One of the above states
float64[3] circuit_voltage  # Output voltage of each circuit

# True if robot should be enabled
bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable
bool wireless_stop 

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
MSG: pr2_msgs/PowerState
# This message communicates the state of the PR2's power system.
Header header
float64 power_consumption ## Watts
duration time_remaining ## estimated time to empty or full
string prediction_method ## how time_remaining is being calculated
int8  relative_capacity ## percent of capacity
int8  AC_present ## number of packs detecting AC power, > 0 means plugged in

================================================================================
MSG: pr2_msgs/AccessPoint
# This message communicates the state of the PR2's wifi access point.
Header header
string essid
string macaddr
int32 signal
int32 noise
int32 snr
int32 channel
string rate
string tx_power
int32 quality

")



(provide :pr2_msgs/DashboardState "db0cd0d535d75e0f6257b20c403e87f5")


