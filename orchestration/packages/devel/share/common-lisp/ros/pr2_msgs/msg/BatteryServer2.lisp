; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude BatteryServer2.msg.html

(cl:defclass <BatteryServer2> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (last_system_update
    :reader last_system_update
    :initarg :last_system_update
    :type cl:real
    :initform 0)
   (time_left
    :reader time_left
    :initarg :time_left
    :type cl:real
    :initform 0)
   (average_charge
    :reader average_charge
    :initarg :average_charge
    :type cl:integer
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (last_controller_update
    :reader last_controller_update
    :initarg :last_controller_update
    :type cl:real
    :initform 0)
   (battery
    :reader battery
    :initarg :battery
    :type (cl:vector pr2_msgs-msg:BatteryState2)
   :initform (cl:make-array 0 :element-type 'pr2_msgs-msg:BatteryState2 :initial-element (cl:make-instance 'pr2_msgs-msg:BatteryState2))))
)

(cl:defclass BatteryServer2 (<BatteryServer2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryServer2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryServer2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<BatteryServer2> is deprecated: use pr2_msgs-msg:BatteryServer2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:id-val is deprecated.  Use pr2_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'last_system_update-val :lambda-list '(m))
(cl:defmethod last_system_update-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:last_system_update-val is deprecated.  Use pr2_msgs-msg:last_system_update instead.")
  (last_system_update m))

(cl:ensure-generic-function 'time_left-val :lambda-list '(m))
(cl:defmethod time_left-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:time_left-val is deprecated.  Use pr2_msgs-msg:time_left instead.")
  (time_left m))

(cl:ensure-generic-function 'average_charge-val :lambda-list '(m))
(cl:defmethod average_charge-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:average_charge-val is deprecated.  Use pr2_msgs-msg:average_charge instead.")
  (average_charge m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:message-val is deprecated.  Use pr2_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'last_controller_update-val :lambda-list '(m))
(cl:defmethod last_controller_update-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:last_controller_update-val is deprecated.  Use pr2_msgs-msg:last_controller_update instead.")
  (last_controller_update m))

(cl:ensure-generic-function 'battery-val :lambda-list '(m))
(cl:defmethod battery-val ((m <BatteryServer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:battery-val is deprecated.  Use pr2_msgs-msg:battery instead.")
  (battery m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BatteryServer2>)))
    "Constants for message type '<BatteryServer2>"
  '((:MAX_BAT_COUNT . 4)
    (:MAX_BAT_REG . 48))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BatteryServer2)))
    "Constants for message type 'BatteryServer2"
  '((:MAX_BAT_COUNT . 4)
    (:MAX_BAT_REG . 48))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryServer2>) ostream)
  "Serializes a message object of type '<BatteryServer2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_system_update)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_system_update) (cl:floor (cl:slot-value msg 'last_system_update)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_left)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_left) (cl:floor (cl:slot-value msg 'time_left)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'average_charge)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_controller_update)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_controller_update) (cl:floor (cl:slot-value msg 'last_controller_update)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'battery))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryServer2>) istream)
  "Deserializes a message object of type '<BatteryServer2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_system_update) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_left) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'average_charge) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_controller_update) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'battery) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'battery)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'pr2_msgs-msg:BatteryState2))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryServer2>)))
  "Returns string type for a message object of type '<BatteryServer2>"
  "pr2_msgs/BatteryServer2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryServer2)))
  "Returns string type for a message object of type 'BatteryServer2"
  "pr2_msgs/BatteryServer2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryServer2>)))
  "Returns md5sum for a message object of type '<BatteryServer2>"
  "5f2cec7d06c312d756189db96c1f3819")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryServer2)))
  "Returns md5sum for a message object of type 'BatteryServer2"
  "5f2cec7d06c312d756189db96c1f3819")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryServer2>)))
  "Returns full string definition for message of type '<BatteryServer2>"
  (cl:format cl:nil "# This message communicates the state of a battery server, which controls~%# multiple batteries.~%Header header~%int32 MAX_BAT_COUNT=4~%int32 MAX_BAT_REG=48~%int32 id  # unique ID for each battery server~%# Battery System Stats~%time last_system_update  # last time the system stats where updated~%duration time_left       # in seconds (hardware resolution is 1 minute)~%int32 average_charge     # in percent~%string message           # message from the ocean server~%time last_controller_update # last time a battery status flag was updated~%# for each battery~%pr2_msgs/BatteryState2[] battery~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/BatteryState2~%# This message communicates the state of a single battery.~%# Battery Controller Flags, one per battery~%bool present       # is this pack present~%bool charging      # is this pack charging~%bool discharging   # is this pack discharging~%bool power_present # is there an input voltage~%bool power_no_good # is there a fault (No Good)~%bool inhibited     # is this pack disabled for some reason~%# These registers are per battery~%time      last_battery_update     # last time any battery update occurred~%int16[48] battery_register        # value of this register in the battery~%bool[48]  battery_update_flag     # Has this register ever been updated~%time[48]  battery_register_update # last time this specific register was updated~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryServer2)))
  "Returns full string definition for message of type 'BatteryServer2"
  (cl:format cl:nil "# This message communicates the state of a battery server, which controls~%# multiple batteries.~%Header header~%int32 MAX_BAT_COUNT=4~%int32 MAX_BAT_REG=48~%int32 id  # unique ID for each battery server~%# Battery System Stats~%time last_system_update  # last time the system stats where updated~%duration time_left       # in seconds (hardware resolution is 1 minute)~%int32 average_charge     # in percent~%string message           # message from the ocean server~%time last_controller_update # last time a battery status flag was updated~%# for each battery~%pr2_msgs/BatteryState2[] battery~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/BatteryState2~%# This message communicates the state of a single battery.~%# Battery Controller Flags, one per battery~%bool present       # is this pack present~%bool charging      # is this pack charging~%bool discharging   # is this pack discharging~%bool power_present # is there an input voltage~%bool power_no_good # is there a fault (No Good)~%bool inhibited     # is this pack disabled for some reason~%# These registers are per battery~%time      last_battery_update     # last time any battery update occurred~%int16[48] battery_register        # value of this register in the battery~%bool[48]  battery_update_flag     # Has this register ever been updated~%time[48]  battery_register_update # last time this specific register was updated~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryServer2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     8
     8
     4
     4 (cl:length (cl:slot-value msg 'message))
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'battery) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryServer2>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryServer2
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':last_system_update (last_system_update msg))
    (cl:cons ':time_left (time_left msg))
    (cl:cons ':average_charge (average_charge msg))
    (cl:cons ':message (message msg))
    (cl:cons ':last_controller_update (last_controller_update msg))
    (cl:cons ':battery (battery msg))
))
