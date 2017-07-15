; Auto-generated. Do not edit!


(cl:in-package gummi_interface-msg)


;//! \htmlinclude Diagnostics.msg.html

(cl:defclass <Diagnostics> (roslisp-msg-protocol:ros-message)
  ((equilibrium
    :reader equilibrium
    :initarg :equilibrium
    :type cl:float
    :initform 0.0)
   (cocontraction
    :reader cocontraction
    :initarg :cocontraction
    :type cl:float
    :initform 0.0)
   (ballistic
    :reader ballistic
    :initarg :ballistic
    :type cl:float
    :initform 0.0)
   (encoder
    :reader encoder
    :initarg :encoder
    :type cl:float
    :initform 0.0)
   (alpha_flexor
    :reader alpha_flexor
    :initarg :alpha_flexor
    :type cl:float
    :initform 0.0)
   (alpha_extensor
    :reader alpha_extensor
    :initarg :alpha_extensor
    :type cl:float
    :initform 0.0)
   (forward_error
    :reader forward_error
    :initarg :forward_error
    :type cl:float
    :initform 0.0))
)

(cl:defclass Diagnostics (<Diagnostics>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Diagnostics>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Diagnostics)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gummi_interface-msg:<Diagnostics> is deprecated: use gummi_interface-msg:Diagnostics instead.")))

(cl:ensure-generic-function 'equilibrium-val :lambda-list '(m))
(cl:defmethod equilibrium-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:equilibrium-val is deprecated.  Use gummi_interface-msg:equilibrium instead.")
  (equilibrium m))

(cl:ensure-generic-function 'cocontraction-val :lambda-list '(m))
(cl:defmethod cocontraction-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:cocontraction-val is deprecated.  Use gummi_interface-msg:cocontraction instead.")
  (cocontraction m))

(cl:ensure-generic-function 'ballistic-val :lambda-list '(m))
(cl:defmethod ballistic-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:ballistic-val is deprecated.  Use gummi_interface-msg:ballistic instead.")
  (ballistic m))

(cl:ensure-generic-function 'encoder-val :lambda-list '(m))
(cl:defmethod encoder-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:encoder-val is deprecated.  Use gummi_interface-msg:encoder instead.")
  (encoder m))

(cl:ensure-generic-function 'alpha_flexor-val :lambda-list '(m))
(cl:defmethod alpha_flexor-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:alpha_flexor-val is deprecated.  Use gummi_interface-msg:alpha_flexor instead.")
  (alpha_flexor m))

(cl:ensure-generic-function 'alpha_extensor-val :lambda-list '(m))
(cl:defmethod alpha_extensor-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:alpha_extensor-val is deprecated.  Use gummi_interface-msg:alpha_extensor instead.")
  (alpha_extensor m))

(cl:ensure-generic-function 'forward_error-val :lambda-list '(m))
(cl:defmethod forward_error-val ((m <Diagnostics>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gummi_interface-msg:forward_error-val is deprecated.  Use gummi_interface-msg:forward_error instead.")
  (forward_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Diagnostics>) ostream)
  "Serializes a message object of type '<Diagnostics>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'equilibrium))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cocontraction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ballistic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'encoder))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'alpha_flexor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'alpha_extensor))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'forward_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Diagnostics>) istream)
  "Deserializes a message object of type '<Diagnostics>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'equilibrium) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cocontraction) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ballistic) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'encoder) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha_flexor) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha_extensor) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'forward_error) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Diagnostics>)))
  "Returns string type for a message object of type '<Diagnostics>"
  "gummi_interface/Diagnostics")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Diagnostics)))
  "Returns string type for a message object of type 'Diagnostics"
  "gummi_interface/Diagnostics")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Diagnostics>)))
  "Returns md5sum for a message object of type '<Diagnostics>"
  "a0c4c6ef5a9afa1f2c1607160e439c7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Diagnostics)))
  "Returns md5sum for a message object of type 'Diagnostics"
  "a0c4c6ef5a9afa1f2c1607160e439c7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Diagnostics>)))
  "Returns full string definition for message of type '<Diagnostics>"
  (cl:format cl:nil "float64 equilibrium~%float64 cocontraction~%float64 ballistic~%float64 encoder~%float64 alpha_flexor~%float64 alpha_extensor~%float64 forward_error~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Diagnostics)))
  "Returns full string definition for message of type 'Diagnostics"
  (cl:format cl:nil "float64 equilibrium~%float64 cocontraction~%float64 ballistic~%float64 encoder~%float64 alpha_flexor~%float64 alpha_extensor~%float64 forward_error~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Diagnostics>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Diagnostics>))
  "Converts a ROS message object to a list"
  (cl:list 'Diagnostics
    (cl:cons ':equilibrium (equilibrium msg))
    (cl:cons ':cocontraction (cocontraction msg))
    (cl:cons ':ballistic (ballistic msg))
    (cl:cons ':encoder (encoder msg))
    (cl:cons ':alpha_flexor (alpha_flexor msg))
    (cl:cons ':alpha_extensor (alpha_extensor msg))
    (cl:cons ':forward_error (forward_error msg))
))
