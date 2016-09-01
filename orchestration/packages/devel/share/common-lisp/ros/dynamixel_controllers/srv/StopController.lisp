; Auto-generated. Do not edit!


(cl:in-package dynamixel_controllers-srv)


;//! \htmlinclude StopController-request.msg.html

(cl:defclass <StopController-request> (roslisp-msg-protocol:ros-message)
  ((controller_name
    :reader controller_name
    :initarg :controller_name
    :type cl:string
    :initform ""))
)

(cl:defclass StopController-request (<StopController-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopController-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopController-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<StopController-request> is deprecated: use dynamixel_controllers-srv:StopController-request instead.")))

(cl:ensure-generic-function 'controller_name-val :lambda-list '(m))
(cl:defmethod controller_name-val ((m <StopController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:controller_name-val is deprecated.  Use dynamixel_controllers-srv:controller_name instead.")
  (controller_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopController-request>) ostream)
  "Serializes a message object of type '<StopController-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'controller_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'controller_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopController-request>) istream)
  "Deserializes a message object of type '<StopController-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'controller_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'controller_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopController-request>)))
  "Returns string type for a service object of type '<StopController-request>"
  "dynamixel_controllers/StopControllerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopController-request)))
  "Returns string type for a service object of type 'StopController-request"
  "dynamixel_controllers/StopControllerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopController-request>)))
  "Returns md5sum for a message object of type '<StopController-request>"
  "b3f1f861a8aef49071034d2f06308f6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopController-request)))
  "Returns md5sum for a message object of type 'StopController-request"
  "b3f1f861a8aef49071034d2f06308f6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopController-request>)))
  "Returns full string definition for message of type '<StopController-request>"
  (cl:format cl:nil "string controller_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopController-request)))
  "Returns full string definition for message of type 'StopController-request"
  (cl:format cl:nil "string controller_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopController-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'controller_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopController-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopController-request
    (cl:cons ':controller_name (controller_name msg))
))
;//! \htmlinclude StopController-response.msg.html

(cl:defclass <StopController-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (reason
    :reader reason
    :initarg :reason
    :type cl:string
    :initform ""))
)

(cl:defclass StopController-response (<StopController-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopController-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopController-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<StopController-response> is deprecated: use dynamixel_controllers-srv:StopController-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StopController-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:success-val is deprecated.  Use dynamixel_controllers-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <StopController-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:reason-val is deprecated.  Use dynamixel_controllers-srv:reason instead.")
  (reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopController-response>) ostream)
  "Serializes a message object of type '<StopController-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopController-response>) istream)
  "Deserializes a message object of type '<StopController-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopController-response>)))
  "Returns string type for a service object of type '<StopController-response>"
  "dynamixel_controllers/StopControllerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopController-response)))
  "Returns string type for a service object of type 'StopController-response"
  "dynamixel_controllers/StopControllerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopController-response>)))
  "Returns md5sum for a message object of type '<StopController-response>"
  "b3f1f861a8aef49071034d2f06308f6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopController-response)))
  "Returns md5sum for a message object of type 'StopController-response"
  "b3f1f861a8aef49071034d2f06308f6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopController-response>)))
  "Returns full string definition for message of type '<StopController-response>"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopController-response)))
  "Returns full string definition for message of type 'StopController-response"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopController-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopController-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopController-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopController)))
  'StopController-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopController)))
  'StopController-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopController)))
  "Returns string type for a service object of type '<StopController>"
  "dynamixel_controllers/StopController")