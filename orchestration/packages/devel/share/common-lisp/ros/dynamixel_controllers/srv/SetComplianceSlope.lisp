; Auto-generated. Do not edit!


(cl:in-package dynamixel_controllers-srv)


;//! \htmlinclude SetComplianceSlope-request.msg.html

(cl:defclass <SetComplianceSlope-request> (roslisp-msg-protocol:ros-message)
  ((slope
    :reader slope
    :initarg :slope
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetComplianceSlope-request (<SetComplianceSlope-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetComplianceSlope-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetComplianceSlope-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<SetComplianceSlope-request> is deprecated: use dynamixel_controllers-srv:SetComplianceSlope-request instead.")))

(cl:ensure-generic-function 'slope-val :lambda-list '(m))
(cl:defmethod slope-val ((m <SetComplianceSlope-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamixel_controllers-srv:slope-val is deprecated.  Use dynamixel_controllers-srv:slope instead.")
  (slope m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetComplianceSlope-request>) ostream)
  "Serializes a message object of type '<SetComplianceSlope-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'slope)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetComplianceSlope-request>) istream)
  "Deserializes a message object of type '<SetComplianceSlope-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'slope)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetComplianceSlope-request>)))
  "Returns string type for a service object of type '<SetComplianceSlope-request>"
  "dynamixel_controllers/SetComplianceSlopeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetComplianceSlope-request)))
  "Returns string type for a service object of type 'SetComplianceSlope-request"
  "dynamixel_controllers/SetComplianceSlopeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetComplianceSlope-request>)))
  "Returns md5sum for a message object of type '<SetComplianceSlope-request>"
  "0b655cbe1b74daf357824dcc427c1004")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetComplianceSlope-request)))
  "Returns md5sum for a message object of type 'SetComplianceSlope-request"
  "0b655cbe1b74daf357824dcc427c1004")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetComplianceSlope-request>)))
  "Returns full string definition for message of type '<SetComplianceSlope-request>"
  (cl:format cl:nil "~%~%uint8 slope~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetComplianceSlope-request)))
  "Returns full string definition for message of type 'SetComplianceSlope-request"
  (cl:format cl:nil "~%~%uint8 slope~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetComplianceSlope-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetComplianceSlope-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetComplianceSlope-request
    (cl:cons ':slope (slope msg))
))
;//! \htmlinclude SetComplianceSlope-response.msg.html

(cl:defclass <SetComplianceSlope-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetComplianceSlope-response (<SetComplianceSlope-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetComplianceSlope-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetComplianceSlope-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamixel_controllers-srv:<SetComplianceSlope-response> is deprecated: use dynamixel_controllers-srv:SetComplianceSlope-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetComplianceSlope-response>) ostream)
  "Serializes a message object of type '<SetComplianceSlope-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetComplianceSlope-response>) istream)
  "Deserializes a message object of type '<SetComplianceSlope-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetComplianceSlope-response>)))
  "Returns string type for a service object of type '<SetComplianceSlope-response>"
  "dynamixel_controllers/SetComplianceSlopeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetComplianceSlope-response)))
  "Returns string type for a service object of type 'SetComplianceSlope-response"
  "dynamixel_controllers/SetComplianceSlopeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetComplianceSlope-response>)))
  "Returns md5sum for a message object of type '<SetComplianceSlope-response>"
  "0b655cbe1b74daf357824dcc427c1004")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetComplianceSlope-response)))
  "Returns md5sum for a message object of type 'SetComplianceSlope-response"
  "0b655cbe1b74daf357824dcc427c1004")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetComplianceSlope-response>)))
  "Returns full string definition for message of type '<SetComplianceSlope-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetComplianceSlope-response)))
  "Returns full string definition for message of type 'SetComplianceSlope-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetComplianceSlope-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetComplianceSlope-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetComplianceSlope-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetComplianceSlope)))
  'SetComplianceSlope-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetComplianceSlope)))
  'SetComplianceSlope-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetComplianceSlope)))
  "Returns string type for a service object of type '<SetComplianceSlope>"
  "dynamixel_controllers/SetComplianceSlope")