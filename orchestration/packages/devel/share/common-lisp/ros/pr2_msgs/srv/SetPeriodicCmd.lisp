; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-srv)


;//! \htmlinclude SetPeriodicCmd-request.msg.html

(cl:defclass <SetPeriodicCmd-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type pr2_msgs-msg:PeriodicCmd
    :initform (cl:make-instance 'pr2_msgs-msg:PeriodicCmd)))
)

(cl:defclass SetPeriodicCmd-request (<SetPeriodicCmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPeriodicCmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPeriodicCmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-srv:<SetPeriodicCmd-request> is deprecated: use pr2_msgs-srv:SetPeriodicCmd-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SetPeriodicCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-srv:command-val is deprecated.  Use pr2_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPeriodicCmd-request>) ostream)
  "Serializes a message object of type '<SetPeriodicCmd-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'command) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPeriodicCmd-request>) istream)
  "Deserializes a message object of type '<SetPeriodicCmd-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'command) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPeriodicCmd-request>)))
  "Returns string type for a service object of type '<SetPeriodicCmd-request>"
  "pr2_msgs/SetPeriodicCmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPeriodicCmd-request)))
  "Returns string type for a service object of type 'SetPeriodicCmd-request"
  "pr2_msgs/SetPeriodicCmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPeriodicCmd-request>)))
  "Returns md5sum for a message object of type '<SetPeriodicCmd-request>"
  "daeb6e862b732192bc82a7ea52bb7975")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPeriodicCmd-request)))
  "Returns md5sum for a message object of type 'SetPeriodicCmd-request"
  "daeb6e862b732192bc82a7ea52bb7975")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPeriodicCmd-request>)))
  "Returns full string definition for message of type '<SetPeriodicCmd-request>"
  (cl:format cl:nil "pr2_msgs/PeriodicCmd command~%~%================================================================================~%MSG: pr2_msgs/PeriodicCmd~%# This message is used to set the parameters of a profile executed by the~%# laser tilt controller.~%Header header~%string profile~%float64 period~%float64 amplitude~%float64 offset~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPeriodicCmd-request)))
  "Returns full string definition for message of type 'SetPeriodicCmd-request"
  (cl:format cl:nil "pr2_msgs/PeriodicCmd command~%~%================================================================================~%MSG: pr2_msgs/PeriodicCmd~%# This message is used to set the parameters of a profile executed by the~%# laser tilt controller.~%Header header~%string profile~%float64 period~%float64 amplitude~%float64 offset~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPeriodicCmd-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPeriodicCmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPeriodicCmd-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude SetPeriodicCmd-response.msg.html

(cl:defclass <SetPeriodicCmd-response> (roslisp-msg-protocol:ros-message)
  ((start_time
    :reader start_time
    :initarg :start_time
    :type cl:real
    :initform 0))
)

(cl:defclass SetPeriodicCmd-response (<SetPeriodicCmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPeriodicCmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPeriodicCmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-srv:<SetPeriodicCmd-response> is deprecated: use pr2_msgs-srv:SetPeriodicCmd-response instead.")))

(cl:ensure-generic-function 'start_time-val :lambda-list '(m))
(cl:defmethod start_time-val ((m <SetPeriodicCmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-srv:start_time-val is deprecated.  Use pr2_msgs-srv:start_time instead.")
  (start_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPeriodicCmd-response>) ostream)
  "Serializes a message object of type '<SetPeriodicCmd-response>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'start_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'start_time) (cl:floor (cl:slot-value msg 'start_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPeriodicCmd-response>) istream)
  "Deserializes a message object of type '<SetPeriodicCmd-response>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPeriodicCmd-response>)))
  "Returns string type for a service object of type '<SetPeriodicCmd-response>"
  "pr2_msgs/SetPeriodicCmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPeriodicCmd-response)))
  "Returns string type for a service object of type 'SetPeriodicCmd-response"
  "pr2_msgs/SetPeriodicCmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPeriodicCmd-response>)))
  "Returns md5sum for a message object of type '<SetPeriodicCmd-response>"
  "daeb6e862b732192bc82a7ea52bb7975")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPeriodicCmd-response)))
  "Returns md5sum for a message object of type 'SetPeriodicCmd-response"
  "daeb6e862b732192bc82a7ea52bb7975")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPeriodicCmd-response>)))
  "Returns full string definition for message of type '<SetPeriodicCmd-response>"
  (cl:format cl:nil "time start_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPeriodicCmd-response)))
  "Returns full string definition for message of type 'SetPeriodicCmd-response"
  (cl:format cl:nil "time start_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPeriodicCmd-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPeriodicCmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPeriodicCmd-response
    (cl:cons ':start_time (start_time msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPeriodicCmd)))
  'SetPeriodicCmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPeriodicCmd)))
  'SetPeriodicCmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPeriodicCmd)))
  "Returns string type for a service object of type '<SetPeriodicCmd>"
  "pr2_msgs/SetPeriodicCmd")