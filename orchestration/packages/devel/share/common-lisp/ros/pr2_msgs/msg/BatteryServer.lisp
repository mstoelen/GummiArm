; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude BatteryServer.msg.html

(cl:defclass <BatteryServer> (roslisp-msg-protocol:ros-message)
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
   (lastTimeSystem
    :reader lastTimeSystem
    :initarg :lastTimeSystem
    :type cl:integer
    :initform 0)
   (timeLeft
    :reader timeLeft
    :initarg :timeLeft
    :type cl:fixnum
    :initform 0)
   (averageCharge
    :reader averageCharge
    :initarg :averageCharge
    :type cl:fixnum
    :initform 0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (lastTimeController
    :reader lastTimeController
    :initarg :lastTimeController
    :type cl:integer
    :initform 0)
   (present
    :reader present
    :initarg :present
    :type cl:fixnum
    :initform 0)
   (charging
    :reader charging
    :initarg :charging
    :type cl:fixnum
    :initform 0)
   (discharging
    :reader discharging
    :initarg :discharging
    :type cl:fixnum
    :initform 0)
   (reserved
    :reader reserved
    :initarg :reserved
    :type cl:fixnum
    :initform 0)
   (powerPresent
    :reader powerPresent
    :initarg :powerPresent
    :type cl:fixnum
    :initform 0)
   (powerNG
    :reader powerNG
    :initarg :powerNG
    :type cl:fixnum
    :initform 0)
   (inhibited
    :reader inhibited
    :initarg :inhibited
    :type cl:fixnum
    :initform 0)
   (battery
    :reader battery
    :initarg :battery
    :type (cl:vector pr2_msgs-msg:BatteryState)
   :initform (cl:make-array 0 :element-type 'pr2_msgs-msg:BatteryState :initial-element (cl:make-instance 'pr2_msgs-msg:BatteryState))))
)

(cl:defclass BatteryServer (<BatteryServer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryServer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryServer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<BatteryServer> is deprecated: use pr2_msgs-msg:BatteryServer instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:id-val is deprecated.  Use pr2_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'lastTimeSystem-val :lambda-list '(m))
(cl:defmethod lastTimeSystem-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:lastTimeSystem-val is deprecated.  Use pr2_msgs-msg:lastTimeSystem instead.")
  (lastTimeSystem m))

(cl:ensure-generic-function 'timeLeft-val :lambda-list '(m))
(cl:defmethod timeLeft-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:timeLeft-val is deprecated.  Use pr2_msgs-msg:timeLeft instead.")
  (timeLeft m))

(cl:ensure-generic-function 'averageCharge-val :lambda-list '(m))
(cl:defmethod averageCharge-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:averageCharge-val is deprecated.  Use pr2_msgs-msg:averageCharge instead.")
  (averageCharge m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:message-val is deprecated.  Use pr2_msgs-msg:message instead.")
  (message m))

(cl:ensure-generic-function 'lastTimeController-val :lambda-list '(m))
(cl:defmethod lastTimeController-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:lastTimeController-val is deprecated.  Use pr2_msgs-msg:lastTimeController instead.")
  (lastTimeController m))

(cl:ensure-generic-function 'present-val :lambda-list '(m))
(cl:defmethod present-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:present-val is deprecated.  Use pr2_msgs-msg:present instead.")
  (present m))

(cl:ensure-generic-function 'charging-val :lambda-list '(m))
(cl:defmethod charging-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:charging-val is deprecated.  Use pr2_msgs-msg:charging instead.")
  (charging m))

(cl:ensure-generic-function 'discharging-val :lambda-list '(m))
(cl:defmethod discharging-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:discharging-val is deprecated.  Use pr2_msgs-msg:discharging instead.")
  (discharging m))

(cl:ensure-generic-function 'reserved-val :lambda-list '(m))
(cl:defmethod reserved-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:reserved-val is deprecated.  Use pr2_msgs-msg:reserved instead.")
  (reserved m))

(cl:ensure-generic-function 'powerPresent-val :lambda-list '(m))
(cl:defmethod powerPresent-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:powerPresent-val is deprecated.  Use pr2_msgs-msg:powerPresent instead.")
  (powerPresent m))

(cl:ensure-generic-function 'powerNG-val :lambda-list '(m))
(cl:defmethod powerNG-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:powerNG-val is deprecated.  Use pr2_msgs-msg:powerNG instead.")
  (powerNG m))

(cl:ensure-generic-function 'inhibited-val :lambda-list '(m))
(cl:defmethod inhibited-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:inhibited-val is deprecated.  Use pr2_msgs-msg:inhibited instead.")
  (inhibited m))

(cl:ensure-generic-function 'battery-val :lambda-list '(m))
(cl:defmethod battery-val ((m <BatteryServer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:battery-val is deprecated.  Use pr2_msgs-msg:battery instead.")
  (battery m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BatteryServer>)))
    "Constants for message type '<BatteryServer>"
  '((:MAX_BAT_COUNT . 4)
    (:MAX_BAT_REG . 48))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BatteryServer)))
    "Constants for message type 'BatteryServer"
  '((:MAX_BAT_COUNT . 4)
    (:MAX_BAT_REG . 48))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryServer>) ostream)
  "Serializes a message object of type '<BatteryServer>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lastTimeSystem)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeLeft)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeLeft)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'averageCharge)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'averageCharge)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let* ((signed (cl:slot-value msg 'lastTimeController)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'present)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'present)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'charging)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'charging)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'discharging)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'discharging)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reserved)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'reserved)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powerPresent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'powerPresent)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powerNG)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'powerNG)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'inhibited)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'inhibited)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'battery))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'battery))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryServer>) istream)
  "Deserializes a message object of type '<BatteryServer>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastTimeSystem) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeLeft)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeLeft)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'averageCharge)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'averageCharge)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastTimeController) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'present)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'present)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'charging)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'charging)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'discharging)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'discharging)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reserved)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'reserved)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powerPresent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'powerPresent)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'powerNG)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'powerNG)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'inhibited)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'inhibited)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'battery) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'battery)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'pr2_msgs-msg:BatteryState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryServer>)))
  "Returns string type for a message object of type '<BatteryServer>"
  "pr2_msgs/BatteryServer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryServer)))
  "Returns string type for a message object of type 'BatteryServer"
  "pr2_msgs/BatteryServer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryServer>)))
  "Returns md5sum for a message object of type '<BatteryServer>"
  "4f6d6e54c9581beb1df7ea408c0727be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryServer)))
  "Returns md5sum for a message object of type 'BatteryServer"
  "4f6d6e54c9581beb1df7ea408c0727be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryServer>)))
  "Returns full string definition for message of type '<BatteryServer>"
  (cl:format cl:nil "# DEPRECATED. Use pr2_msgs/BatteryServer2 instead.~%Header header~%uint32 MAX_BAT_COUNT=4~%uint32 MAX_BAT_REG=48~%int32 id  # unique ID for each battery server~%# Battery System Stats~%int32 lastTimeSystem #epoch time~%uint16 timeLeft      # in minutes~%uint16 averageCharge # in percent~%string message~%# Battery Controller Flags~%int32 lastTimeController #epoch time~%uint16 present~%uint16 charging~%uint16 discharging~%uint16 reserved~%uint16 powerPresent~%uint16 powerNG~%uint16 inhibited~%# for each battery~%pr2_msgs/BatteryState[] battery~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/BatteryState~%# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.~%# Each batteries registers~%int32 lastTimeBattery #epoch time~%uint16[48] batReg~%uint16[48] batRegFlag~%int32[48] batRegTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryServer)))
  "Returns full string definition for message of type 'BatteryServer"
  (cl:format cl:nil "# DEPRECATED. Use pr2_msgs/BatteryServer2 instead.~%Header header~%uint32 MAX_BAT_COUNT=4~%uint32 MAX_BAT_REG=48~%int32 id  # unique ID for each battery server~%# Battery System Stats~%int32 lastTimeSystem #epoch time~%uint16 timeLeft      # in minutes~%uint16 averageCharge # in percent~%string message~%# Battery Controller Flags~%int32 lastTimeController #epoch time~%uint16 present~%uint16 charging~%uint16 discharging~%uint16 reserved~%uint16 powerPresent~%uint16 powerNG~%uint16 inhibited~%# for each battery~%pr2_msgs/BatteryState[] battery~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: pr2_msgs/BatteryState~%# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.~%# Each batteries registers~%int32 lastTimeBattery #epoch time~%uint16[48] batReg~%uint16[48] batRegFlag~%int32[48] batRegTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryServer>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     2
     2
     4 (cl:length (cl:slot-value msg 'message))
     4
     2
     2
     2
     2
     2
     2
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'battery) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryServer>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryServer
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':lastTimeSystem (lastTimeSystem msg))
    (cl:cons ':timeLeft (timeLeft msg))
    (cl:cons ':averageCharge (averageCharge msg))
    (cl:cons ':message (message msg))
    (cl:cons ':lastTimeController (lastTimeController msg))
    (cl:cons ':present (present msg))
    (cl:cons ':charging (charging msg))
    (cl:cons ':discharging (discharging msg))
    (cl:cons ':reserved (reserved msg))
    (cl:cons ':powerPresent (powerPresent msg))
    (cl:cons ':powerNG (powerNG msg))
    (cl:cons ':inhibited (inhibited msg))
    (cl:cons ':battery (battery msg))
))
