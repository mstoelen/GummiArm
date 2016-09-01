; Auto-generated. Do not edit!


(cl:in-package dynamixel_controllers-srv)


;//! \htmlinclude SetCompliancePunch-request.msg.html

(cl:defclass <SetCompliancePunch-request> (roslisp-msg-protocol:ros-message)
  ((punch
    :reader punch
    :initarg :punch
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetCompliancePunch-request (<SetCompliancePunch-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCompliancePunch-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCompliancePunch-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<SetCompliancePunch-request> is deprecated: use dynamixel_controllers-srv:SetCompliancePunch-request instead.")))

(cl:ensure-generic-function 'punch-val :lambda-list '(m))
(cl:defmethod punch-val ((m <SetCompliancePunch-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:punch-val is deprecated.  Use dynamixel_controllers-srv:punch instead.")
  (punch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCompliancePunch-request>) ostream)
  "Serializes a message object of type '<SetCompliancePunch-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'punch)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCompliancePunch-request>) istream)
  "Deserializes a message object of type '<SetCompliancePunch-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'punch)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCompliancePunch-request>)))
  "Returns string type for a service object of type '<SetCompliancePunch-request>"
  "dynamixel_controllers/SetCompliancePunchRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCompliancePunch-request)))
  "Returns string type for a service object of type 'SetCompliancePunch-request"
  "dynamixel_controllers/SetCompliancePunchRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCompliancePunch-request>)))
  "Returns md5sum for a message object of type '<SetCompliancePunch-request>"
  "6f1db06d3f143058321215213d1c3bef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCompliancePunch-request)))
  "Returns md5sum for a message object of type 'SetCompliancePunch-request"
  "6f1db06d3f143058321215213d1c3bef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCompliancePunch-request>)))
  "Returns full string definition for message of type '<SetCompliancePunch-request>"
  (cl:format cl:nil "~%~%uint8 punch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCompliancePunch-request)))
  "Returns full string definition for message of type 'SetCompliancePunch-request"
  (cl:format cl:nil "~%~%uint8 punch~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCompliancePunch-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCompliancePunch-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCompliancePunch-request
    (cl:cons ':punch (punch msg))
))
;//! \htmlinclude SetCompliancePunch-response.msg.html

(cl:defclass <SetCompliancePunch-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetCompliancePunch-response (<SetCompliancePunch-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCompliancePunch-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCompliancePunch-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<SetCompliancePunch-response> is deprecated: use dynamixel_controllers-srv:SetCompliancePunch-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCompliancePunch-response>) ostream)
  "Serializes a message object of type '<SetCompliancePunch-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCompliancePunch-response>) istream)
  "Deserializes a message object of type '<SetCompliancePunch-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCompliancePunch-response>)))
  "Returns string type for a service object of type '<SetCompliancePunch-response>"
  "dynamixel_controllers/SetCompliancePunchResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCompliancePunch-response)))
  "Returns string type for a service object of type 'SetCompliancePunch-response"
  "dynamixel_controllers/SetCompliancePunchResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCompliancePunch-response>)))
  "Returns md5sum for a message object of type '<SetCompliancePunch-response>"
  "6f1db06d3f143058321215213d1c3bef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCompliancePunch-response)))
  "Returns md5sum for a message object of type 'SetCompliancePunch-response"
  "6f1db06d3f143058321215213d1c3bef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCompliancePunch-response>)))
  "Returns full string definition for message of type '<SetCompliancePunch-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCompliancePunch-response)))
  "Returns full string definition for message of type 'SetCompliancePunch-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCompliancePunch-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCompliancePunch-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCompliancePunch-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetCompliancePunch)))
  'SetCompliancePunch-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetCompliancePunch)))
  'SetCompliancePunch-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCompliancePunch)))
  "Returns string type for a service object of type '<SetCompliancePunch>"
  "dynamixel_controllers/SetCompliancePunch")