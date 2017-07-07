; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude AccelerometerState.msg.html

(cl:defclass <AccelerometerState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (samples
    :reader samples
    :initarg :samples
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3))))
)

(cl:defclass AccelerometerState (<AccelerometerState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AccelerometerState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AccelerometerState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<AccelerometerState> is deprecated: use pr2_msgs-msg:AccelerometerState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AccelerometerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:header-val is deprecated.  Use pr2_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'samples-val :lambda-list '(m))
(cl:defmethod samples-val ((m <AccelerometerState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:samples-val is deprecated.  Use pr2_msgs-msg:samples instead.")
  (samples m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AccelerometerState>) ostream)
  "Serializes a message object of type '<AccelerometerState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'samples))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'samples))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AccelerometerState>) istream)
  "Deserializes a message object of type '<AccelerometerState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'samples) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'samples)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AccelerometerState>)))
  "Returns string type for a message object of type '<AccelerometerState>"
  "pr2_msgs/AccelerometerState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AccelerometerState)))
  "Returns string type for a message object of type 'AccelerometerState"
  "pr2_msgs/AccelerometerState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AccelerometerState>)))
  "Returns md5sum for a message object of type '<AccelerometerState>"
  "26492e97ed8c13252c4a85592d3e93fd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AccelerometerState)))
  "Returns md5sum for a message object of type 'AccelerometerState"
  "26492e97ed8c13252c4a85592d3e93fd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AccelerometerState>)))
  "Returns full string definition for message of type '<AccelerometerState>"
  (cl:format cl:nil "#This captures acceleration measurements from the 3-dof accelerometer in the hand of the PR2~%#Units are meters / second / second~%#Vectors should be <X, Y, Z> in the frame of the gripper~%~%#The communication with the accelerometer is at approximately 3khz, but there is only good timestamping every 1ms~%#This means the samples should be interpreted as all having come from the 1 ms before the time in the header~%~%Header header~%geometry_msgs/Vector3[] samples~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AccelerometerState)))
  "Returns full string definition for message of type 'AccelerometerState"
  (cl:format cl:nil "#This captures acceleration measurements from the 3-dof accelerometer in the hand of the PR2~%#Units are meters / second / second~%#Vectors should be <X, Y, Z> in the frame of the gripper~%~%#The communication with the accelerometer is at approximately 3khz, but there is only good timestamping every 1ms~%#This means the samples should be interpreted as all having come from the 1 ms before the time in the header~%~%Header header~%geometry_msgs/Vector3[] samples~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AccelerometerState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'samples) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AccelerometerState>))
  "Converts a ROS message object to a list"
  (cl:list 'AccelerometerState
    (cl:cons ':header (header msg))
    (cl:cons ':samples (samples msg))
))
