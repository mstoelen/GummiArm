; Auto-generated. Do not edit!


(cl:in-package pr2_msgs-msg)


;//! \htmlinclude BatteryState2.msg.html

(cl:defclass <BatteryState2> (roslisp-msg-protocol:ros-message)
  ((present
    :reader present
    :initarg :present
    :type cl:boolean
    :initform cl:nil)
   (charging
    :reader charging
    :initarg :charging
    :type cl:boolean
    :initform cl:nil)
   (discharging
    :reader discharging
    :initarg :discharging
    :type cl:boolean
    :initform cl:nil)
   (power_present
    :reader power_present
    :initarg :power_present
    :type cl:boolean
    :initform cl:nil)
   (power_no_good
    :reader power_no_good
    :initarg :power_no_good
    :type cl:boolean
    :initform cl:nil)
   (inhibited
    :reader inhibited
    :initarg :inhibited
    :type cl:boolean
    :initform cl:nil)
   (last_battery_update
    :reader last_battery_update
    :initarg :last_battery_update
    :type cl:real
    :initform 0)
   (battery_register
    :reader battery_register
    :initarg :battery_register
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 48 :element-type 'cl:fixnum :initial-element 0))
   (battery_update_flag
    :reader battery_update_flag
    :initarg :battery_update_flag
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 48 :element-type 'cl:boolean :initial-element cl:nil))
   (battery_register_update
    :reader battery_register_update
    :initarg :battery_register_update
    :type (cl:vector cl:real)
   :initform (cl:make-array 48 :element-type 'cl:real :initial-element 0)))
)

(cl:defclass BatteryState2 (<BatteryState2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatteryState2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatteryState2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_msgs-msg:<BatteryState2> is deprecated: use pr2_msgs-msg:BatteryState2 instead.")))

(cl:ensure-generic-function 'present-val :lambda-list '(m))
(cl:defmethod present-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:present-val is deprecated.  Use pr2_msgs-msg:present instead.")
  (present m))

(cl:ensure-generic-function 'charging-val :lambda-list '(m))
(cl:defmethod charging-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:charging-val is deprecated.  Use pr2_msgs-msg:charging instead.")
  (charging m))

(cl:ensure-generic-function 'discharging-val :lambda-list '(m))
(cl:defmethod discharging-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:discharging-val is deprecated.  Use pr2_msgs-msg:discharging instead.")
  (discharging m))

(cl:ensure-generic-function 'power_present-val :lambda-list '(m))
(cl:defmethod power_present-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_present-val is deprecated.  Use pr2_msgs-msg:power_present instead.")
  (power_present m))

(cl:ensure-generic-function 'power_no_good-val :lambda-list '(m))
(cl:defmethod power_no_good-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:power_no_good-val is deprecated.  Use pr2_msgs-msg:power_no_good instead.")
  (power_no_good m))

(cl:ensure-generic-function 'inhibited-val :lambda-list '(m))
(cl:defmethod inhibited-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:inhibited-val is deprecated.  Use pr2_msgs-msg:inhibited instead.")
  (inhibited m))

(cl:ensure-generic-function 'last_battery_update-val :lambda-list '(m))
(cl:defmethod last_battery_update-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:last_battery_update-val is deprecated.  Use pr2_msgs-msg:last_battery_update instead.")
  (last_battery_update m))

(cl:ensure-generic-function 'battery_register-val :lambda-list '(m))
(cl:defmethod battery_register-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:battery_register-val is deprecated.  Use pr2_msgs-msg:battery_register instead.")
  (battery_register m))

(cl:ensure-generic-function 'battery_update_flag-val :lambda-list '(m))
(cl:defmethod battery_update_flag-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:battery_update_flag-val is deprecated.  Use pr2_msgs-msg:battery_update_flag instead.")
  (battery_update_flag m))

(cl:ensure-generic-function 'battery_register_update-val :lambda-list '(m))
(cl:defmethod battery_register_update-val ((m <BatteryState2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_msgs-msg:battery_register_update-val is deprecated.  Use pr2_msgs-msg:battery_register_update instead.")
  (battery_register_update m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatteryState2>) ostream)
  "Serializes a message object of type '<BatteryState2>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'present) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'charging) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'discharging) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_present) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'power_no_good) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'inhibited) 1 0)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'last_battery_update)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'last_battery_update) (cl:floor (cl:slot-value msg 'last_battery_update)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'battery_register))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'battery_update_flag))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__sec (cl:floor ele))
        (__nsec (cl:round (cl:* 1e9 (cl:- ele (cl:floor ele))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream)))
   (cl:slot-value msg 'battery_register_update))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatteryState2>) istream)
  "Deserializes a message object of type '<BatteryState2>"
    (cl:setf (cl:slot-value msg 'present) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'charging) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'discharging) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'power_present) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'power_no_good) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'inhibited) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'last_battery_update) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (cl:setf (cl:slot-value msg 'battery_register) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'battery_register)))
    (cl:dotimes (i 48)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  (cl:setf (cl:slot-value msg 'battery_update_flag) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'battery_update_flag)))
    (cl:dotimes (i 48)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream))))))
  (cl:setf (cl:slot-value msg 'battery_register_update) (cl:make-array 48))
  (cl:let ((vals (cl:slot-value msg 'battery_register_update)))
    (cl:dotimes (i 48)
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatteryState2>)))
  "Returns string type for a message object of type '<BatteryState2>"
  "pr2_msgs/BatteryState2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatteryState2)))
  "Returns string type for a message object of type 'BatteryState2"
  "pr2_msgs/BatteryState2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatteryState2>)))
  "Returns md5sum for a message object of type '<BatteryState2>"
  "91b4acb000aa990ac3006834f9a99669")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatteryState2)))
  "Returns md5sum for a message object of type 'BatteryState2"
  "91b4acb000aa990ac3006834f9a99669")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatteryState2>)))
  "Returns full string definition for message of type '<BatteryState2>"
  (cl:format cl:nil "# This message communicates the state of a single battery.~%# Battery Controller Flags, one per battery~%bool present       # is this pack present~%bool charging      # is this pack charging~%bool discharging   # is this pack discharging~%bool power_present # is there an input voltage~%bool power_no_good # is there a fault (No Good)~%bool inhibited     # is this pack disabled for some reason~%# These registers are per battery~%time      last_battery_update     # last time any battery update occurred~%int16[48] battery_register        # value of this register in the battery~%bool[48]  battery_update_flag     # Has this register ever been updated~%time[48]  battery_register_update # last time this specific register was updated~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatteryState2)))
  "Returns full string definition for message of type 'BatteryState2"
  (cl:format cl:nil "# This message communicates the state of a single battery.~%# Battery Controller Flags, one per battery~%bool present       # is this pack present~%bool charging      # is this pack charging~%bool discharging   # is this pack discharging~%bool power_present # is there an input voltage~%bool power_no_good # is there a fault (No Good)~%bool inhibited     # is this pack disabled for some reason~%# These registers are per battery~%time      last_battery_update     # last time any battery update occurred~%int16[48] battery_register        # value of this register in the battery~%bool[48]  battery_update_flag     # Has this register ever been updated~%time[48]  battery_register_update # last time this specific register was updated~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatteryState2>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'battery_register) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'battery_update_flag) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'battery_register_update) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatteryState2>))
  "Converts a ROS message object to a list"
  (cl:list 'BatteryState2
    (cl:cons ':present (present msg))
    (cl:cons ':charging (charging msg))
    (cl:cons ':discharging (discharging msg))
    (cl:cons ':power_present (power_present msg))
    (cl:cons ':power_no_good (power_no_good msg))
    (cl:cons ':inhibited (inhibited msg))
    (cl:cons ':last_battery_update (last_battery_update msg))
    (cl:cons ':battery_register (battery_register msg))
    (cl:cons ':battery_update_flag (battery_update_flag msg))
    (cl:cons ':battery_register_update (battery_register_update msg))
))
