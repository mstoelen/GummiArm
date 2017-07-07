;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::PressureState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'PressureState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::PRESSURESTATE")
  (make-package "PR2_MSGS::PRESSURESTATE"))

(in-package "ROS")
;;//! \htmlinclude PressureState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::PressureState
  :super ros::object
  :slots (_header _l_finger_tip _r_finger_tip ))

(defmethod pr2_msgs::PressureState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:l_finger_tip __l_finger_tip) (make-array 0 :initial-element 0 :element-type :integer))
    ((:r_finger_tip __r_finger_tip) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _l_finger_tip __l_finger_tip)
   (setq _r_finger_tip __r_finger_tip)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:l_finger_tip
   (&optional __l_finger_tip)
   (if __l_finger_tip (setq _l_finger_tip __l_finger_tip)) _l_finger_tip)
  (:r_finger_tip
   (&optional __r_finger_tip)
   (if __r_finger_tip (setq _r_finger_tip __r_finger_tip)) _r_finger_tip)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16[] _l_finger_tip
    (* 2    (length _l_finger_tip)) 4
    ;; int16[] _r_finger_tip
    (* 2    (length _r_finger_tip)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16[] _l_finger_tip
     (write-long (length _l_finger_tip) s)
     (dotimes (i (length _l_finger_tip))
       (write-word (elt _l_finger_tip i) s)
       )
     ;; int16[] _r_finger_tip
     (write-long (length _r_finger_tip) s)
     (dotimes (i (length _r_finger_tip))
       (write-word (elt _r_finger_tip i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16[] _l_finger_tip
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _l_finger_tip (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _l_finger_tip i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _r_finger_tip
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _r_finger_tip (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _r_finger_tip i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get pr2_msgs::PressureState :md5sum-) "756fb3b75fa8884524fd0789a78eb04b")
(setf (get pr2_msgs::PressureState :datatype-) "pr2_msgs/PressureState")
(setf (get pr2_msgs::PressureState :definition-)
      "#Output from finger-tip pressure sensors on PR2
#Higher number correspond to more pressure, but there is no explicit unit and you will have to calibrate for offset
#The numbers reported are the raw values from the I2C hardware

Header header
int16[] l_finger_tip
int16[] r_finger_tip

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :pr2_msgs/PressureState "756fb3b75fa8884524fd0789a78eb04b")


