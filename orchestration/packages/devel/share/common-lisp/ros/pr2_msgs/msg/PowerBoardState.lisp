; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude PowerBoardState.msg.html

(cl:defclass <PowerBoardState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (serial_num
    :reader serial_num
    :initarg :serial_num
    :type cl:integer
    :initform 0)
   (input_voltage
    :reader input_voltage
    :initarg :input_voltage
    :type cl:float
    :initform 0.0)
   (master_state
    :reader master_state
    :initarg :master_state
    :type cl:fixnum
    :initform 0)
   (circuit_state
    :reader circuit_state
    :initarg :circuit_state
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 3 :element-type 'cl:fixnum :initial-element 0))
   (circuit_voltage
    :reader circuit_voltage
    :initarg :circuit_voltage
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (run_stop
    :reader run_stop
    :initarg :run_stop
    :type cl:boolean
    :initform cl:nil)
   (wireless_stop
    :reader wireless_stop
    :initarg :wireless_stop
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PowerBoardState (<PowerBoardState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PowerBoardState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PowerBoardState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<PowerBoardState> is deprecated: use pr2_msgs-msg:PowerBoardState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:name-val is deprecated.  Use pr2_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'serial_num-val :lambda-list '(m))
(cl:defmethod serial_num-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:serial_num-val is deprecated.  Use pr2_msgs-msg:serial_num instead.")
  (serial_num m))

(cl:ensure-generic-function 'input_voltage-val :lambda-list '(m))
(cl:defmethod input_voltage-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:input_voltage-val is deprecated.  Use pr2_msgs-msg:input_voltage instead.")
  (input_voltage m))

(cl:ensure-generic-function 'master_state-val :lambda-list '(m))
(cl:defmethod master_state-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:master_state-val is deprecated.  Use pr2_msgs-msg:master_state instead.")
  (master_state m))

(cl:ensure-generic-function 'circuit_state-val :lambda-list '(m))
(cl:defmethod circuit_state-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:circuit_state-val is deprecated.  Use pr2_msgs-msg:circuit_state instead.")
  (circuit_state m))

(cl:ensure-generic-function 'circuit_voltage-val :lambda-list '(m))
(cl:defmethod circuit_voltage-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:circuit_voltage-val is deprecated.  Use pr2_msgs-msg:circuit_voltage instead.")
  (circuit_voltage m))

(cl:ensure-generic-function 'run_stop-val :lambda-list '(m))
(cl:defmethod run_stop-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:run_stop-val is deprecated.  Use pr2_msgs-msg:run_stop instead.")
  (run_stop m))

(cl:ensure-generic-function 'wireless_stop-val :lambda-list '(m))
(cl:defmethod wireless_stop-val ((m <PowerBoardState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:wireless_stop-val is deprecated.  Use pr2_msgs-msg:wireless_stop instead.")
  (wireless_stop m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PowerBoardState>)))
    "Constants for message type '<PowerBoardState>"
  '((:STATE_NOPOWER . 0)
    (:STATE_STANDBY . 1)
    (:STATE_PUMPING . 2)
    (:STATE_ON . 3)
    (:STATE_ENABLED . 3)
    (:STATE_DISABLED . 4)
    (:MASTER_NOPOWER . 0)
    (:MASTER_STANDBY . 1)
    (:MASTER_ON . 2)
    (:MASTER_OFF . 3)
    (:MASTER_SHUTDOWN . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PowerBoardState)))
    "Constants for message type 'PowerBoardState"
  '((:STATE_NOPOWER . 0)
    (:STATE_STANDBY . 1)
    (:STATE_PUMPING . 2)
    (:STATE_ON . 3)
    (:STATE_ENABLED . 3)
    (:STATE_DISABLED . 4)
    (:MASTER_NOPOWER . 0)
    (:MASTER_STANDBY . 1)
    (:MASTER_ON . 2)
    (:MASTER_OFF . 3)
    (:MASTER_SHUTDOWN . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PowerBoardState>) ostream)
  "Serializes a message object of type '<PowerBoardState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serial_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'serial_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'serial_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'serial_num)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'input_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'master_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'circuit_state))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'circuit_voltage))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'run_stop) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wireless_stop) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PowerBoardState>) istream)
  "Deserializes a message object of type '<PowerBoardState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'serial_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'serial_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'serial_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'serial_num)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'input_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'master_state) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'circuit_state) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'circuit_state)))
    (cl:dotimes (i 3)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))))
  (cl:setf (cl:slot-value msg 'circuit_voltage) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'circuit_voltage)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:setf (cl:slot-value msg 'run_stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wireless_stop) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PowerBoardState>)))
  "Returns string type for a message object of type '<PowerBoardState>"
  "pr2_msgs/PowerBoardState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PowerBoardState)))
  "Returns string type for a message object of type 'PowerBoardState"
  "pr2_msgs/PowerBoardState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PowerBoardState>)))
  "Returns md5sum for a message object of type '<PowerBoardState>"
  "08899b671e6a1a449e7ce0000da8ae7b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PowerBoardState)))
  "Returns md5sum for a message object of type 'PowerBoardState"
  "08899b671e6a1a449e7ce0000da8ae7b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PowerBoardState>)))
  "Returns full string definition for message of type '<PowerBoardState>"
  (cl:format cl:nil "# This message communicates the state of the PR2's power board.~%int8 STATE_NOPOWER=0~%int8 STATE_STANDBY=1~%int8 STATE_PUMPING=2~%int8 STATE_ON=3~%int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat~%int8 STATE_DISABLED=4~%~%int8 MASTER_NOPOWER=0~%int8 MASTER_STANDBY=1~%int8 MASTER_ON=2~%int8 MASTER_OFF=3~%int8 MASTER_SHUTDOWN=4~%~%Header header~%string name # Name with serial number~%uint32 serial_num # Serial number for this board's message~%float64 input_voltage # Input voltage to power board~%~%# Master States:~%#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN ~%int8 master_state  # The master state machine's state in the powerboard~%~%# Circuit States:~%#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED~%int8[3] circuit_state # One of the above states~%float64[3] circuit_voltage  # Output voltage of each circuit~%~%# True if robot should be enabled~%bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable~%bool wireless_stop ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PowerBoardState)))
  "Returns full string definition for message of type 'PowerBoardState"
  (cl:format cl:nil "# This message communicates the state of the PR2's power board.~%int8 STATE_NOPOWER=0~%int8 STATE_STANDBY=1~%int8 STATE_PUMPING=2~%int8 STATE_ON=3~%int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat~%int8 STATE_DISABLED=4~%~%int8 MASTER_NOPOWER=0~%int8 MASTER_STANDBY=1~%int8 MASTER_ON=2~%int8 MASTER_OFF=3~%int8 MASTER_SHUTDOWN=4~%~%Header header~%string name # Name with serial number~%uint32 serial_num # Serial number for this board's message~%float64 input_voltage # Input voltage to power board~%~%# Master States:~%#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN ~%int8 master_state  # The master state machine's state in the powerboard~%~%# Circuit States:~%#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED~%int8[3] circuit_state # One of the above states~%float64[3] circuit_voltage  # Output voltage of each circuit~%~%# True if robot should be enabled~%bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable~%bool wireless_stop ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PowerBoardState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'name))
     4
     8
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'circuit_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'circuit_voltage) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PowerBoardState>))
  "Converts a ROS message object to a list"
  (cl:list 'PowerBoardState
    (cl:cons ':header (header msg))
    (cl:cons ':name (name msg))
    (cl:cons ':serial_num (serial_num msg))
    (cl:cons ':input_voltage (input_voltage msg))
    (cl:cons ':master_state (master_state msg))
    (cl:cons ':circuit_state (circuit_state msg))
    (cl:cons ':circuit_voltage (circuit_voltage msg))
    (cl:cons ':run_stop (run_stop msg))
    (cl:cons ':wireless_stop (wireless_stop msg))
))
