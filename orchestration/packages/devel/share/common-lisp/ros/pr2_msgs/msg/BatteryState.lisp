; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude BatteryState.msg.html

(cl:defclass <BatteryState> (roslisp-msg-protocol:ros-message)
  ((lastTimeBattery
    :reader lastTimeBattery
    :initarg :lastTimeBattery
    :type cl:integer
    :initform 0)
   (batReg
    :reader batReg
    :initarg :batReg
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 48 :element-type 'cl:fixnum :initial-element 0))
   (batRegFlag
    :reader batRegFlag
    :initarg :batRegFlag
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 48 :element-type 'cl:fixnum :initial-element 0))
   (batRegTime
    :reader batRegTime
    :initarg :batRegTime
    :type (cl:vector cl:integer)
   :initform (cl:make-array 48 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass BatteryState (<BatteryState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<BatteryState> is deprecated: use pr2_msgs-msg:BatteryState instead.")))

(cl:ensure-generic-function 'lastTimeBattery-val :lambda-list '(m))
(cl:defmethod lastTimeBattery-val ((m <BatteryState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:lastTimeBattery-val is deprecated.  Use pr2_msgs-msg:lastTimeBattery instead.")
  (lastTimeBattery m))

(cl:ensure-generic-function 'batReg-val :lambda-list '(m))
(cl:defmethod batReg-val ((m <BatteryState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:batReg-val is deprecated.  Use pr2_msgs-msg:batReg instead.")
  (batReg m))

(cl:ensure-generic-function 'batRegFlag-val :lambda-list '(m))
(cl:defmethod batRegFlag-val ((m <BatteryState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:batRegFlag-val is deprecated.  Use pr2_msgs-msg:batRegFlag instead.")
  (batRegFlag m))

(cl:ensure-generic-function 'batRegTime-val :lambda-list '(m))
(cl:defmethod batRegTime-val ((m <BatteryState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:batRegTime-val is deprecated.  Use pr2_msgs-msg:batRegTime instead.")
  (batRegTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryState>) ostream)
  "Serializes a message object of type '<BatteryState>"
  (cl:let* ((signed (cl:slot-value msg 'lastTimeBattery)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'batReg))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'batRegFlag))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'batRegTime))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryState>) istream)
  "Deserializes a message object of type '<BatteryState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lastTimeBattery) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'batReg) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'batReg)))
    (cl:dotimes (i 48)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'batRegFlag) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'batRegFlag)))
    (cl:dotimes (i 48)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'batRegTime) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'batRegTime)))
    (cl:dotimes (i 48)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryState>)))
  "Returns string type for a message object of type '<BatteryState>"
  "pr2_msgs/BatteryState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryState)))
  "Returns string type for a message object of type 'BatteryState"
  "pr2_msgs/BatteryState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryState>)))
  "Returns md5sum for a message object of type '<BatteryState>"
  "00e9f996c2fc26700fd25abcd8422db0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryState)))
  "Returns md5sum for a message object of type 'BatteryState"
  "00e9f996c2fc26700fd25abcd8422db0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryState>)))
  "Returns full string definition for message of type '<BatteryState>"
  (cl:format cl:nil "# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.~%# Each batteries registers~%int32 lastTimeBattery #epoch time~%uint16[48] batReg~%uint16[48] batRegFlag~%int32[48] batRegTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryState)))
  "Returns full string definition for message of type 'BatteryState"
  (cl:format cl:nil "# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.~%# Each batteries registers~%int32 lastTimeBattery #epoch time~%uint16[48] batReg~%uint16[48] batRegFlag~%int32[48] batRegTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryState>))
  (cl:+ 0
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'batReg) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'batRegFlag) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'batRegTime) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryState>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryState
    (cl:cons ':lastTimeBattery (lastTimeBattery msg))
    (cl:cons ':batReg (batReg msg))
    (cl:cons ':batRegFlag (batRegFlag msg))
    (cl:cons ':batRegTime (batRegTime msg))
))
