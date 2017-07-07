; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude LaserScannerSignal.msg.html

(cl:defclass <LaserScannerSignal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (signal
    :reader signal
    :initarg :signal
    :type cl:integer
    :initform 0))
)

(cl:defclass LaserScannerSignal (<LaserScannerSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserScannerSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserScannerSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<LaserScannerSignal> is deprecated: use pr2_msgs-msg:LaserScannerSignal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LaserScannerSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'signal-val :lambda-list '(m))
(cl:defmethod signal-val ((m <LaserScannerSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:signal-val is deprecated.  Use pr2_msgs-msg:signal instead.")
  (signal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserScannerSignal>) ostream)
  "Serializes a message object of type '<LaserScannerSignal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'signal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserScannerSignal>) istream)
  "Deserializes a message object of type '<LaserScannerSignal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'signal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserScannerSignal>)))
  "Returns string type for a message object of type '<LaserScannerSignal>"
  "pr2_msgs/LaserScannerSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserScannerSignal)))
  "Returns string type for a message object of type 'LaserScannerSignal"
  "pr2_msgs/LaserScannerSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserScannerSignal>)))
  "Returns md5sum for a message object of type '<LaserScannerSignal>"
  "78f41e618127bce049dd6104d9c31dc5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserScannerSignal)))
  "Returns md5sum for a message object of type 'LaserScannerSignal"
  "78f41e618127bce049dd6104d9c31dc5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserScannerSignal>)))
  "Returns full string definition for message of type '<LaserScannerSignal>"
  (cl:format cl:nil "# This message is emitted by the laser tilt controller when the laser hits~%# one limit of its profile.~%Header header~%~%# signal == 0 => Half profile complete~%# signal == 1 => Full Profile Complete~%int32 signal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserScannerSignal)))
  "Returns full string definition for message of type 'LaserScannerSignal"
  (cl:format cl:nil "# This message is emitted by the laser tilt controller when the laser hits~%# one limit of its profile.~%Header header~%~%# signal == 0 => Half profile complete~%# signal == 1 => Full Profile Complete~%int32 signal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserScannerSignal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserScannerSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserScannerSignal
    (cl:cons ':header (header msg))
    (cl:cons ':signal (signal msg))
))
