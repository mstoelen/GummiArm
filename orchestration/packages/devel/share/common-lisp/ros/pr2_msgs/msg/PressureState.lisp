; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude PressureState.msg.html

(cl:defclass <PressureState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (l_finger_tip
    :reader l_finger_tip
    :initarg :l_finger_tip
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (r_finger_tip
    :reader r_finger_tip
    :initarg :r_finger_tip
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass PressureState (<PressureState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PressureState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PressureState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<PressureState> is deprecated: use pr2_msgs-msg:PressureState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PressureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'l_finger_tip-val :lambda-list '(m))
(cl:defmethod l_finger_tip-val ((m <PressureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:l_finger_tip-val is deprecated.  Use pr2_msgs-msg:l_finger_tip instead.")
  (l_finger_tip m))

(cl:ensure-generic-function 'r_finger_tip-val :lambda-list '(m))
(cl:defmethod r_finger_tip-val ((m <PressureState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:r_finger_tip-val is deprecated.  Use pr2_msgs-msg:r_finger_tip instead.")
  (r_finger_tip m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PressureState>) ostream)
  "Serializes a message object of type '<PressureState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'l_finger_tip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'l_finger_tip))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'r_finger_tip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'r_finger_tip))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PressureState>) istream)
  "Deserializes a message object of type '<PressureState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'l_finger_tip) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'l_finger_tip)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'r_finger_tip) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'r_finger_tip)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PressureState>)))
  "Returns string type for a message object of type '<PressureState>"
  "pr2_msgs/PressureState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PressureState)))
  "Returns string type for a message object of type 'PressureState"
  "pr2_msgs/PressureState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PressureState>)))
  "Returns md5sum for a message object of type '<PressureState>"
  "756fb3b75fa8884524fd0789a78eb04b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PressureState)))
  "Returns md5sum for a message object of type 'PressureState"
  "756fb3b75fa8884524fd0789a78eb04b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PressureState>)))
  "Returns full string definition for message of type '<PressureState>"
  (cl:format cl:nil "#Output from finger-tip pressure sensors on PR2~%#Higher number correspond to more pressure, but there is no explicit unit and you will have to calibrate for offset~%#The numbers reported are the raw values from the I2C hardware~%~%Header header~%int16[] l_finger_tip~%int16[] r_finger_tip~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PressureState)))
  "Returns full string definition for message of type 'PressureState"
  (cl:format cl:nil "#Output from finger-tip pressure sensors on PR2~%#Higher number correspond to more pressure, but there is no explicit unit and you will have to calibrate for offset~%#The numbers reported are the raw values from the I2C hardware~%~%Header header~%int16[] l_finger_tip~%int16[] r_finger_tip~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PressureState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'l_finger_tip) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'r_finger_tip) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PressureState>))
  "Converts a ROS message object to a list"
  (cl:list 'PressureState
    (cl:cons ':header (header msg))
    (cl:cons ':l_finger_tip (l_finger_tip msg))
    (cl:cons ':r_finger_tip (r_finger_tip msg))
))
