;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::LaserTrajCmd)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'LaserTrajCmd (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::LASERTRAJCMD")
  (make-package "PR2_MSGS::LASERTRAJCMD"))

(in-package "ROS")
;;//! \htmlinclude LaserTrajCmd.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::LaserTrajCmd
  :super ros::object
  :slots (_header _profile _position _time_from_start _max_velocity _max_acceleration ))

(defmethod pr2_msgs::LaserTrajCmd
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:profile __profile) "")
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time_from_start __time_from_start) (let (r) (dotimes (i 0) (push (instance ros::time :init) r)) r))
    ((:max_velocity __max_velocity) 0.0)
    ((:max_acceleration __max_acceleration) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _profile (string __profile))
   (setq _position __position)
   (setq _time_from_start __time_from_start)
   (setq _max_velocity (float __max_velocity))
   (setq _max_acceleration (float __max_acceleration))
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
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:time_from_start
   (&optional __time_from_start)
   (if __time_from_start (setq _time_from_start __time_from_start)) _time_from_start)
  (:max_velocity
   (&optional __max_velocity)
   (if __max_velocity (setq _max_velocity __max_velocity)) _max_velocity)
  (:max_acceleration
   (&optional __max_acceleration)
   (if __max_acceleration (setq _max_acceleration __max_acceleration)) _max_acceleration)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _profile
    4 (length _profile)
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; duration[] _time_from_start
    (* 8    (length _time_from_start)) 4
    ;; float64 _max_velocity
    8
    ;; float64 _max_acceleration
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
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; duration[] _time_from_start
     (write-long (length _time_from_start) s)
     (dotimes (i (length _time_from_start))
       (write-long (send (elt _time_from_start i) :sec) s) (write-long (send (elt _time_from_start i) :nsec) s)
       )
     ;; float64 _max_velocity
       (sys::poke _max_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_acceleration
       (sys::poke _max_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _profile
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _profile (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; duration[] _time_from_start
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time_from_start (let (r) (dotimes (i n) (push (instance ros::time :init) r)) r))
     (dolist (elem- _time_from_start)
     (send elem- :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send elem- :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64 _max_velocity
     (setq _max_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_acceleration
     (setq _max_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pr2_msgs::LaserTrajCmd :md5sum-) "68a1665e9079049dce55a0384cb2e9b5")
(setf (get pr2_msgs::LaserTrajCmd :datatype-) "pr2_msgs/LaserTrajCmd")
(setf (get pr2_msgs::LaserTrajCmd :definition-)
      "# This message is used to set the profile that the tilt laser controller
# executes.
Header header
string profile              # options are currently \"linear\" or \"linear_blended\"
float64[] position          # Laser positions
duration[] time_from_start  # Times to reach laser positions in seconds
float64 max_velocity        # Set <= 0 to use default
float64 max_acceleration    # Set <= 0 to use default

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



(provide :pr2_msgs/LaserTrajCmd "68a1665e9079049dce55a0384cb2e9b5")


