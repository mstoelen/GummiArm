; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude PowerState.msg.html

(cl:defclass <PowerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (power_consumption
    :reader power_consumption
    :initarg :power_consumption
    :type cl:float
    :initform 0.0)
   (time_remaining
    :reader time_remaining
    :initarg :time_remaining
    :type cl:real
    :initform 0)
   (prediction_method
    :reader prediction_method
    :initarg :prediction_method
    :type cl:string
    :initform "")
   (relative_capacity
    :reader relative_capacity
    :initarg :relative_capacity
    :type cl:fixnum
    :initform 0)
   (AC_present
    :reader AC_present
    :initarg :AC_present
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PowerState (<PowerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PowerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PowerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<PowerState> is deprecated: use pr2_msgs-msg:PowerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'power_consumption-val :lambda-list '(m))
(cl:defmethod power_consumption-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_consumption-val is deprecated.  Use pr2_msgs-msg:power_consumption instead.")
  (power_consumption m))

(cl:ensure-generic-function 'time_remaining-val :lambda-list '(m))
(cl:defmethod time_remaining-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:time_remaining-val is deprecated.  Use pr2_msgs-msg:time_remaining instead.")
  (time_remaining m))

(cl:ensure-generic-function 'prediction_method-val :lambda-list '(m))
(cl:defmethod prediction_method-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:prediction_method-val is deprecated.  Use pr2_msgs-msg:prediction_method instead.")
  (prediction_method m))

(cl:ensure-generic-function 'relative_capacity-val :lambda-list '(m))
(cl:defmethod relative_capacity-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:relative_capacity-val is deprecated.  Use pr2_msgs-msg:relative_capacity instead.")
  (relative_capacity m))

(cl:ensure-generic-function 'AC_present-val :lambda-list '(m))
(cl:defmethod AC_present-val ((m <PowerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:AC_present-val is deprecated.  Use pr2_msgs-msg:AC_present instead.")
  (AC_present m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PowerState>) ostream)
  "Serializes a message object of type '<PowerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_consumption))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_remaining)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_remaining) (cl:floor (cl:slot-value msg 'time_remaining)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'prediction_method))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'prediction_method))
  (cl:let* ((signed (cl:slot-value msg 'relative_capacity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'AC_present)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PowerState>) istream)
  "Deserializes a message object of type '<PowerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_consumption) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_remaining) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prediction_method) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'prediction_method) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'relative_capacity) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'AC_present) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PowerState>)))
  "Returns string type for a message object of type '<PowerState>"
  "pr2_msgs/PowerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PowerState)))
  "Returns string type for a message object of type 'PowerState"
  "pr2_msgs/PowerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PowerState>)))
  "Returns md5sum for a message object of type '<PowerState>"
  "e6fa46a387cad0b7a80959a21587a6c9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PowerState)))
  "Returns md5sum for a message object of type 'PowerState"
  "e6fa46a387cad0b7a80959a21587a6c9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PowerState>)))
  "Returns full string definition for message of type '<PowerState>"
  (cl:format cl:nil "# This message communicates the state of the PR2's power system.~%Header header~%float64 power_consumption ## Watts~%duration time_remaining ## estimated time to empty or full~%string prediction_method ## how time_remaining is being calculated~%int8  relative_capacity ## percent of capacity~%int8  AC_present ## number of packs detecting AC power, > 0 means plugged in~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PowerState)))
  "Returns full string definition for message of type 'PowerState"
  (cl:format cl:nil "# This message communicates the state of the PR2's power system.~%Header header~%float64 power_consumption ## Watts~%duration time_remaining ## estimated time to empty or full~%string prediction_method ## how time_remaining is being calculated~%int8  relative_capacity ## percent of capacity~%int8  AC_present ## number of packs detecting AC power, > 0 means plugged in~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PowerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     4 (cl:length (cl:slot-value msg 'prediction_method))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PowerState>))
  "Converts a ROS message object to a list"
  (cl:list 'PowerState
    (cl:cons ':header (header msg))
    (cl:cons ':power_consumption (power_consumption msg))
    (cl:cons ':time_remaining (time_remaining msg))
    (cl:cons ':prediction_method (prediction_method msg))
    (cl:cons ':relative_capacity (relative_capacity msg))
    (cl:cons ':AC_present (AC_present msg))
))
