; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude DashboardState.msg.html

(cl:defclass <DashboardState> (roslisp-msg-protocol:ros-message)
  ((motors_halted
    :reader motors_halted
    :initarg :motors_halted
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool))
   (motors_halted_valid
    :reader motors_halted_valid
    :initarg :motors_halted_valid
    :type cl:boolean
    :initform cl:nil)
   (power_board_state
    :reader power_board_state
    :initarg :power_board_state
    :type pr2_msgs-msg:PowerBoardState
    :initform (cl:make-instance 'pr2_msgs-msg:PowerBoardState))
   (power_board_state_valid
    :reader power_board_state_valid
    :initarg :power_board_state_valid
    :type cl:boolean
    :initform cl:nil)
   (power_state
    :reader power_state
    :initarg :power_state
    :type pr2_msgs-msg:PowerState
    :initform (cl:make-instance 'pr2_msgs-msg:PowerState))
   (power_state_valid
    :reader power_state_valid
    :initarg :power_state_valid
    :type cl:boolean
    :initform cl:nil)
   (access_point
    :reader access_point
    :initarg :access_point
    :type pr2_msgs-msg:AccessPoint
    :initform (cl:make-instance 'pr2_msgs-msg:AccessPoint))
   (access_point_valid
    :reader access_point_valid
    :initarg :access_point_valid
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DashboardState (<DashboardState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DashboardState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DashboardState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<DashboardState> is deprecated: use pr2_msgs-msg:DashboardState instead.")))

(cl:ensure-generic-function 'motors_halted-val :lambda-list '(m))
(cl:defmethod motors_halted-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:motors_halted-val is deprecated.  Use pr2_msgs-msg:motors_halted instead.")
  (motors_halted m))

(cl:ensure-generic-function 'motors_halted_valid-val :lambda-list '(m))
(cl:defmethod motors_halted_valid-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:motors_halted_valid-val is deprecated.  Use pr2_msgs-msg:motors_halted_valid instead.")
  (motors_halted_valid m))

(cl:ensure-generic-function 'power_board_state-val :lambda-list '(m))
(cl:defmethod power_board_state-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_board_state-val is deprecated.  Use pr2_msgs-msg:power_board_state instead.")
  (power_board_state m))

(cl:ensure-generic-function 'power_board_state_valid-val :lambda-list '(m))
(cl:defmethod power_board_state_valid-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_board_state_valid-val is deprecated.  Use pr2_msgs-msg:power_board_state_valid instead.")
  (power_board_state_valid m))

(cl:ensure-generic-function 'power_state-val :lambda-list '(m))
(cl:defmethod power_state-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_state-val is deprecated.  Use pr2_msgs-msg:power_state instead.")
  (power_state m))

(cl:ensure-generic-function 'power_state_valid-val :lambda-list '(m))
(cl:defmethod power_state_valid-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_state_valid-val is deprecated.  Use pr2_msgs-msg:power_state_valid instead.")
  (power_state_valid m))

(cl:ensure-generic-function 'access_point-val :lambda-list '(m))
(cl:defmethod access_point-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:access_point-val is deprecated.  Use pr2_msgs-msg:access_point instead.")
  (access_point m))

(cl:ensure-generic-function 'access_point_valid-val :lambda-list '(m))
(cl:defmethod access_point_valid-val ((m <DashboardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:access_point_valid-val is deprecated.  Use pr2_msgs-msg:access_point_valid instead.")
  (access_point_valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DashboardState>) ostream)
  "Serializes a message object of type '<DashboardState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motors_halted) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'motors_halted_valid) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'power_board_state) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_board_state_valid) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'power_state) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_state_valid) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'access_point) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'access_point_valid) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DashboardState>) istream)
  "Deserializes a message object of type '<DashboardState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motors_halted) istream)
    (cl:setf (cl:slot-value msg 'motors_halted_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'power_board_state) istream)
    (cl:setf (cl:slot-value msg 'power_board_state_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'power_state) istream)
    (cl:setf (cl:slot-value msg 'power_state_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'access_point) istream)
    (cl:setf (cl:slot-value msg 'access_point_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DashboardState>)))
  "Returns string type for a message object of type '<DashboardState>"
  "pr2_msgs/DashboardState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DashboardState)))
  "Returns string type for a message object of type 'DashboardState"
  "pr2_msgs/DashboardState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DashboardState>)))
  "Returns md5sum for a message object of type '<DashboardState>"
  "db0cd0d535d75e0f6257b20c403e87f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DashboardState)))
  "Returns md5sum for a message object of type 'DashboardState"
  "db0cd0d535d75e0f6257b20c403e87f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DashboardState>)))
  "Returns full string definition for message of type '<DashboardState>"
  (cl:format cl:nil "# This message communicates state information that might be used by a~%# dashboard application.~%std_msgs/Bool motors_halted~%bool motors_halted_valid~%~%pr2_msgs/PowerBoardState power_board_state~%bool power_board_state_valid~%~%pr2_msgs/PowerState power_state~%bool power_state_valid~%~%pr2_msgs/AccessPoint access_point~%bool access_point_valid~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: pr2_msgs/PowerBoardState~%# This message communicates the state of the PR2's power board.~%int8 STATE_NOPOWER=0~%int8 STATE_STANDBY=1~%int8 STATE_PUMPING=2~%int8 STATE_ON=3~%int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat~%int8 STATE_DISABLED=4~%~%int8 MASTER_NOPOWER=0~%int8 MASTER_STANDBY=1~%int8 MASTER_ON=2~%int8 MASTER_OFF=3~%int8 MASTER_SHUTDOWN=4~%~%Header header~%string name # Name with serial number~%uint32 serial_num # Serial number for this board's message~%float64 input_voltage # Input voltage to power board~%~%# Master States:~%#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN ~%int8 master_state  # The master state machine's state in the powerboard~%~%# Circuit States:~%#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED~%int8[3] circuit_state # One of the above states~%float64[3] circuit_voltage  # Output voltage of each circuit~%~%# True if robot should be enabled~%bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable~%bool wireless_stop ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/PowerState~%# This message communicates the state of the PR2's power system.~%Header header~%float64 power_consumption ## Watts~%duration time_remaining ## estimated time to empty or full~%string prediction_method ## how time_remaining is being calculated~%int8  relative_capacity ## percent of capacity~%int8  AC_present ## number of packs detecting AC power, > 0 means plugged in~%~%================================================================================~%MSG: pr2_msgs/AccessPoint~%# This message communicates the state of the PR2's wifi access point.~%Header header~%string essid~%string macaddr~%int32 signal~%int32 noise~%int32 snr~%int32 channel~%string rate~%string tx_power~%int32 quality~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DashboardState)))
  "Returns full string definition for message of type 'DashboardState"
  (cl:format cl:nil "# This message communicates state information that might be used by a~%# dashboard application.~%std_msgs/Bool motors_halted~%bool motors_halted_valid~%~%pr2_msgs/PowerBoardState power_board_state~%bool power_board_state_valid~%~%pr2_msgs/PowerState power_state~%bool power_state_valid~%~%pr2_msgs/AccessPoint access_point~%bool access_point_valid~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: pr2_msgs/PowerBoardState~%# This message communicates the state of the PR2's power board.~%int8 STATE_NOPOWER=0~%int8 STATE_STANDBY=1~%int8 STATE_PUMPING=2~%int8 STATE_ON=3~%int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat~%int8 STATE_DISABLED=4~%~%int8 MASTER_NOPOWER=0~%int8 MASTER_STANDBY=1~%int8 MASTER_ON=2~%int8 MASTER_OFF=3~%int8 MASTER_SHUTDOWN=4~%~%Header header~%string name # Name with serial number~%uint32 serial_num # Serial number for this board's message~%float64 input_voltage # Input voltage to power board~%~%# Master States:~%#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN ~%int8 master_state  # The master state machine's state in the powerboard~%~%# Circuit States:~%#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED~%int8[3] circuit_state # One of the above states~%float64[3] circuit_voltage  # Output voltage of each circuit~%~%# True if robot should be enabled~%bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable~%bool wireless_stop ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/PowerState~%# This message communicates the state of the PR2's power system.~%Header header~%float64 power_consumption ## Watts~%duration time_remaining ## estimated time to empty or full~%string prediction_method ## how time_remaining is being calculated~%int8  relative_capacity ## percent of capacity~%int8  AC_present ## number of packs detecting AC power, > 0 means plugged in~%~%================================================================================~%MSG: pr2_msgs/AccessPoint~%# This message communicates the state of the PR2's wifi access point.~%Header header~%string essid~%string macaddr~%int32 signal~%int32 noise~%int32 snr~%int32 channel~%string rate~%string tx_power~%int32 quality~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DashboardState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motors_halted))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'power_board_state))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'power_state))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'access_point))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DashboardState>))
  "Converts a ROS message object to a list"
  (cl:list 'DashboardState
    (cl:cons ':motors_halted (motors_halted msg))
    (cl:cons ':motors_halted_valid (motors_halted_valid msg))
    (cl:cons ':power_board_state (power_board_state msg))
    (cl:cons ':power_board_state_valid (power_board_state_valid msg))
    (cl:cons ':power_state (power_state msg))
    (cl:cons ':power_state_valid (power_state_valid msg))
    (cl:cons ':access_point (access_point msg))
    (cl:cons ':access_point_valid (access_point_valid msg))
))
