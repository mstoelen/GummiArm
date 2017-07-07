; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-srv)


;//! \htmlinclude SetLaserTrajCmd-request.msg.html

(cl:defclass <SetLaserTrajCmd-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type pr2_msgs-msg:LaserTrajCmd
    :initform (cl:make-instance 'pr2_msgs-msg:LaserTrajCmd)))
)

(cl:defclass SetLaserTrajCmd-request (<SetLaserTrajCmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLaserTrajCmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLaserTrajCmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-srv:<SetLaserTrajCmd-request> is deprecated: use pr2_msgs-srv:SetLaserTrajCmd-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SetLaserTrajCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-srv:command-val is deprecated.  Use pr2_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLaserTrajCmd-request>) ostream)
  "Serializes a message object of type '<SetLaserTrajCmd-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'command) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLaserTrajCmd-request>) istream)
  "Deserializes a message object of type '<SetLaserTrajCmd-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'command) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLaserTrajCmd-request>)))
  "Returns string type for a service object of type '<SetLaserTrajCmd-request>"
  "pr2_msgs/SetLaserTrajCmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLaserTrajCmd-request)))
  "Returns string type for a service object of type 'SetLaserTrajCmd-request"
  "pr2_msgs/SetLaserTrajCmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLaserTrajCmd-request>)))
  "Returns md5sum for a message object of type '<SetLaserTrajCmd-request>"
  "28fe2ce397611c999952c74a1ea882aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLaserTrajCmd-request)))
  "Returns md5sum for a message object of type 'SetLaserTrajCmd-request"
  "28fe2ce397611c999952c74a1ea882aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLaserTrajCmd-request>)))
  "Returns full string definition for message of type '<SetLaserTrajCmd-request>"
  (cl:format cl:nil "pr2_msgs/LaserTrajCmd command~%~%================================================================================~%MSG: pr2_msgs/LaserTrajCmd~%# This message is used to set the profile that the tilt laser controller~%# executes.~%Header header~%string profile              # options are currently \"linear\" or \"linear_blended\"~%float64[] position          # Laser positions~%duration[] time_from_start  # Times to reach laser positions in seconds~%float64 max_velocity        # Set <= 0 to use default~%float64 max_acceleration    # Set <= 0 to use default~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLaserTrajCmd-request)))
  "Returns full string definition for message of type 'SetLaserTrajCmd-request"
  (cl:format cl:nil "pr2_msgs/LaserTrajCmd command~%~%================================================================================~%MSG: pr2_msgs/LaserTrajCmd~%# This message is used to set the profile that the tilt laser controller~%# executes.~%Header header~%string profile              # options are currently \"linear\" or \"linear_blended\"~%float64[] position          # Laser positions~%duration[] time_from_start  # Times to reach laser positions in seconds~%float64 max_velocity        # Set <= 0 to use default~%float64 max_acceleration    # Set <= 0 to use default~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLaserTrajCmd-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLaserTrajCmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLaserTrajCmd-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude SetLaserTrajCmd-response.msg.html

(cl:defclass <SetLaserTrajCmd-response> (roslisp-msg-protocol:ros-message)
  ((start_time
    :reader start_time
    :initarg :start_time
    :type cl:real
    :initform 0))
)

(cl:defclass SetLaserTrajCmd-response (<SetLaserTrajCmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLaserTrajCmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLaserTrajCmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-srv:<SetLaserTrajCmd-response> is deprecated: use pr2_msgs-srv:SetLaserTrajCmd-response instead.")))

(cl:ensure-generic-function 'start_time-val :lambda-list '(m))
(cl:defmethod start_time-val ((m <SetLaserTrajCmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-srv:start_time-val is deprecated.  Use pr2_msgs-srv:start_time instead.")
  (start_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLaserTrajCmd-response>) ostream)
  "Serializes a message object of type '<SetLaserTrajCmd-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLaserTrajCmd-response>) istream)
  "Deserializes a message object of type '<SetLaserTrajCmd-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLaserTrajCmd-response>)))
  "Returns string type for a service object of type '<SetLaserTrajCmd-response>"
  "pr2_msgs/SetLaserTrajCmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLaserTrajCmd-response)))
  "Returns string type for a service object of type 'SetLaserTrajCmd-response"
  "pr2_msgs/SetLaserTrajCmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLaserTrajCmd-response>)))
  "Returns md5sum for a message object of type '<SetLaserTrajCmd-response>"
  "28fe2ce397611c999952c74a1ea882aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLaserTrajCmd-response)))
  "Returns md5sum for a message object of type 'SetLaserTrajCmd-response"
  "28fe2ce397611c999952c74a1ea882aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLaserTrajCmd-response>)))
  "Returns full string definition for message of type '<SetLaserTrajCmd-response>"
  (cl:format cl:nil "time start_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLaserTrajCmd-response)))
  "Returns full string definition for message of type 'SetLaserTrajCmd-response"
  (cl:format cl:nil "time start_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLaserTrajCmd-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLaserTrajCmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLaserTrajCmd-response
    (cl:cons ':start_time (start_time msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLaserTrajCmd)))
  'SetLaserTrajCmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLaserTrajCmd)))
  'SetLaserTrajCmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLaserTrajCmd)))
  "Returns string type for a service object of type '<SetLaserTrajCmd>"
  "pr2_msgs/SetLaserTrajCmd")