;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::PowerState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'PowerState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::POWERSTATE")
  (make-package "PR2_MSGS::POWERSTATE"))

(in-package "ROS")
;;//! \htmlinclude PowerState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::PowerState
  :super ros::object
  :slots (_header _power_consumption _time_remaining _prediction_method _relative_capacity _AC_present ))

(defmethod pr2_msgs::PowerState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:power_consumption __power_consumption) 0.0)
    ((:time_remaining __time_remaining) (instance ros::time :init))
    ((:prediction_method __prediction_method) "")
    ((:relative_capacity __relative_capacity) 0)
    ((:AC_present __AC_present) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _power_consumption (float __power_consumption))
   (setq _time_remaining __time_remaining)
   (setq _prediction_method (string __prediction_method))
   (setq _relative_capacity (round __relative_capacity))
   (setq _AC_present (round __AC_present))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:power_consumption
   (&optional __power_consumption)
   (if __power_consumption (setq _power_consumption __power_consumption)) _power_consumption)
  (:time_remaining
   (&optional __time_remaining)
   (if __time_remaining (setq _time_remaining __time_remaining)) _time_remaining)
  (:prediction_method
   (&optional __prediction_method)
   (if __prediction_method (setq _prediction_method __prediction_method)) _prediction_method)
  (:relative_capacity
   (&optional __relative_capacity)
   (if __relative_capacity (setq _relative_capacity __relative_capacity)) _relative_capacity)
  (:AC_present
   (&optional __AC_present)
   (if __AC_present (setq _AC_present __AC_present)) _AC_present)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _power_consumption
    8
    ;; duration _time_remaining
    8
    ;; string _prediction_method
    4 (length _prediction_method)
    ;; int8 _relative_capacity
    1
    ;; int8 _AC_present
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _power_consumption
       (sys::poke _power_consumption (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; duration _time_remaining
       (write-long (send _time_remaining :sec) s) (write-long (send _time_remaining :nsec) s)
     ;; string _prediction_method
       (write-long (length _prediction_method) s) (princ _prediction_method s)
     ;; int8 _relative_capacity
       (write-byte _relative_capacity s)
     ;; int8 _AC_present
       (write-byte _AC_present s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _power_consumption
     (setq _power_consumption (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; duration _time_remaining
     (send _time_remaining :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_remaining :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _prediction_method
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _prediction_method (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _relative_capacity
     (setq _relative_capacity (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _relative_capacity 127) (setq _relative_capacity (- _relative_capacity 256)))
   ;; int8 _AC_present
     (setq _AC_present (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _AC_present 127) (setq _AC_present (- _AC_present 256)))
   ;;
   self)
  )

(setf (get pr2_msgs::PowerState :md5sum-) "e6fa46a387cad0b7a80959a21587a6c9")
(setf (get pr2_msgs::PowerState :datatype-) "pr2_msgs/PowerState")
(setf (get pr2_msgs::PowerState :definition-)
      "# This message communicates the state of the PR2's power system.
Header header
float64 power_consumption ## Watts
duration time_remaining ## estimated time to empty or full
string prediction_method ## how time_remaining is being calculated
int8  relative_capacity ## percent of capacity
int8  AC_present ## number of packs detecting AC power, > 0 means plugged in

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



(provide :pr2_msgs/PowerState "e6fa46a387cad0b7a80959a21587a6c9")


