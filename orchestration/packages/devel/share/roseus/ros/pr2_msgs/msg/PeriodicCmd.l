;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::PeriodicCmd)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'PeriodicCmd (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::PERIODICCMD")
  (make-package "PR2_MSGS::PERIODICCMD"))

(in-package "ROS")
;;//! \htmlinclude PeriodicCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::PeriodicCmd
  :super ros::object
  :slots (_header _profile _period _amplitude _offset ))

(defmethod pr2_msgs::PeriodicCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:profile __profile) "")
    ((:period __period) 0.0)
    ((:amplitude __amplitude) 0.0)
    ((:offset __offset) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _profile (string __profile))
   (setq _period (float __period))
   (setq _amplitude (float __amplitude))
   (setq _offset (float __offset))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:profile
   (&optional __profile)
   (if __profile (setq _profile __profile)) _profile)
  (:period
   (&optional __period)
   (if __period (setq _period __period)) _period)
  (:amplitude
   (&optional __amplitude)
   (if __amplitude (setq _amplitude __amplitude)) _amplitude)
  (:offset
   (&optional __offset)
   (if __offset (setq _offset __offset)) _offset)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _profile
    4 (length _profile)
    ;; float64 _period
    8
    ;; float64 _amplitude
    8
    ;; float64 _offset
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _profile
       (write-long (length _profile) s) (princ _profile s)
     ;; float64 _period
       (sys::poke _period (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _amplitude
       (sys::poke _amplitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _offset
       (sys::poke _offset (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _profile
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _profile (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _period
     (setq _period (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _amplitude
     (setq _amplitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _offset
     (setq _offset (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pr2_msgs::PeriodicCmd :md5sum-) "95ab7e548e3d4274f83393129dd96c2e")
(setf (get pr2_msgs::PeriodicCmd :datatype-) "pr2_msgs/PeriodicCmd")
(setf (get pr2_msgs::PeriodicCmd :definition-)
      "# This message is used to set the parameters of a profile executed by the
# laser tilt controller.
Header header
string profile
float64 period
float64 amplitude
float64 offset

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



(provide :pr2_msgs/PeriodicCmd "95ab7e548e3d4274f83393129dd96c2e")


