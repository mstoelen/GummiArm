; Auto-generated. Do not edit!


(cl:in-package dynamixel_controllers-srv)


;//! \htmlinclude StartController-request.msg.html

(cl:defclass <StartController-request> (roslisp-msg-protocol:ros-message)
  ((port_name
    :reader port_name
    :initarg :port_name
    :type cl:string
    :initform "")
   (package_path
    :reader package_path
    :initarg :package_path
    :type cl:string
    :initform "")
   (module_name
    :reader module_name
    :initarg :module_name
    :type cl:string
    :initform "")
   (class_name
    :reader class_name
    :initarg :class_name
    :type cl:string
    :initform "")
   (controller_name
    :reader controller_name
    :initarg :controller_name
    :type cl:string
    :initform "")
   (dependencies
    :reader dependencies
    :initarg :dependencies
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass StartController-request (<StartController-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartController-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartController-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<StartController-request> is deprecated: use dynamixel_controllers-srv:StartController-request instead.")))

(cl:ensure-generic-function 'port_name-val :lambda-list '(m))
(cl:defmethod port_name-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:port_name-val is deprecated.  Use dynamixel_controllers-srv:port_name instead.")
  (port_name m))

(cl:ensure-generic-function 'package_path-val :lambda-list '(m))
(cl:defmethod package_path-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:package_path-val is deprecated.  Use dynamixel_controllers-srv:package_path instead.")
  (package_path m))

(cl:ensure-generic-function 'module_name-val :lambda-list '(m))
(cl:defmethod module_name-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:module_name-val is deprecated.  Use dynamixel_controllers-srv:module_name instead.")
  (module_name m))

(cl:ensure-generic-function 'class_name-val :lambda-list '(m))
(cl:defmethod class_name-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:class_name-val is deprecated.  Use dynamixel_controllers-srv:class_name instead.")
  (class_name m))

(cl:ensure-generic-function 'controller_name-val :lambda-list '(m))
(cl:defmethod controller_name-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:controller_name-val is deprecated.  Use dynamixel_controllers-srv:controller_name instead.")
  (controller_name m))

(cl:ensure-generic-function 'dependencies-val :lambda-list '(m))
(cl:defmethod dependencies-val ((m <StartController-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:dependencies-val is deprecated.  Use dynamixel_controllers-srv:dependencies instead.")
  (dependencies m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartController-request>) ostream)
  "Serializes a message object of type '<StartController-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'port_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'port_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'package_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'package_path))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'module_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'module_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'class_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'class_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'controller_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'controller_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dependencies))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'dependencies))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartController-request>) istream)
  "Deserializes a message object of type '<StartController-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'port_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'port_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'package_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'package_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'module_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'module_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'class_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'class_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'controller_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'controller_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dependencies) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dependencies)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartController-request>)))
  "Returns string type for a service object of type '<StartController-request>"
  "dynamixel_controllers/StartControllerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartController-request)))
  "Returns string type for a service object of type 'StartController-request"
  "dynamixel_controllers/StartControllerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartController-request>)))
  "Returns md5sum for a message object of type '<StartController-request>"
  "94c76c2df56346fcaa2611bdac54f434")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartController-request)))
  "Returns md5sum for a message object of type 'StartController-request"
  "94c76c2df56346fcaa2611bdac54f434")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartController-request>)))
  "Returns full string definition for message of type '<StartController-request>"
  (cl:format cl:nil "string port_name~%string package_path~%string module_name~%string class_name~%string controller_name~%string[] dependencies~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartController-request)))
  "Returns full string definition for message of type 'StartController-request"
  (cl:format cl:nil "string port_name~%string package_path~%string module_name~%string class_name~%string controller_name~%string[] dependencies~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartController-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'port_name))
     4 (cl:length (cl:slot-value msg 'package_path))
     4 (cl:length (cl:slot-value msg 'module_name))
     4 (cl:length (cl:slot-value msg 'class_name))
     4 (cl:length (cl:slot-value msg 'controller_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dependencies) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartController-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StartController-request
    (cl:cons ':port_name (port_name msg))
    (cl:cons ':package_path (package_path msg))
    (cl:cons ':module_name (module_name msg))
    (cl:cons ':class_name (class_name msg))
    (cl:cons ':controller_name (controller_name msg))
    (cl:cons ':dependencies (dependencies msg))
))
;//! \htmlinclude StartController-response.msg.html

(cl:defclass <StartController-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass StartController-response (<StartController-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartController-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartController-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<StartController-response> is deprecated: use dynamixel_controllers-srv:StartController-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StartController-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:success-val is deprecated.  Use dynamixel_controllers-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <StartController-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:reason-val is deprecated.  Use dynamixel_controllers-srv:reason instead.")
  (reason m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartController-response>) ostream)
  "Serializes a message object of type '<StartController-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartController-response>) istream)
  "Deserializes a message object of type '<StartController-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartController-response>)))
  "Returns string type for a service object of type '<StartController-response>"
  "dynamixel_controllers/StartControllerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartController-response)))
  "Returns string type for a service object of type 'StartController-response"
  "dynamixel_controllers/StartControllerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartController-response>)))
  "Returns md5sum for a message object of type '<StartController-response>"
  "94c76c2df56346fcaa2611bdac54f434")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartController-response)))
  "Returns md5sum for a message object of type 'StartController-response"
  "94c76c2df56346fcaa2611bdac54f434")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartController-response>)))
  "Returns full string definition for message of type '<StartController-response>"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartController-response)))
  "Returns full string definition for message of type 'StartController-response"
  (cl:format cl:nil "bool success~%string reason~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartController-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartController-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StartController-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StartController)))
  'StartController-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StartController)))
  'StartController-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartController)))
  "Returns string type for a service object of type '<StartController>"
  "dynamixel_controllers/StartController")