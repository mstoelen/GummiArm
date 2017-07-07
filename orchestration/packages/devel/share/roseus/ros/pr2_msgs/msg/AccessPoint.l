;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::AccessPoint)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'AccessPoint (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::ACCESSPOINT")
  (make-package "PR2_MSGS::ACCESSPOINT"))

(in-package "ROS")
;;//! \htmlinclude AccessPoint.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::AccessPoint
  :super ros::object
  :slots (_header _essid _macaddr _signal _noise _snr _channel _rate _tx_power _quality ))

(defmethod pr2_msgs::AccessPoint
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:essid __essid) "")
    ((:macaddr __macaddr) "")
    ((:signal __signal) 0)
    ((:noise __noise) 0)
    ((:snr __snr) 0)
    ((:channel __channel) 0)
    ((:rate __rate) "")
    ((:tx_power __tx_power) "")
    ((:quality __quality) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _essid (string __essid))
   (setq _macaddr (string __macaddr))
   (setq _signal (round __signal))
   (setq _noise (round __noise))
   (setq _snr (round __snr))
   (setq _channel (round __channel))
   (setq _rate (string __rate))
   (setq _tx_power (string __tx_power))
   (setq _quality (round __quality))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:essid
   (&optional __essid)
   (if __essid (setq _essid __essid)) _essid)
  (:macaddr
   (&optional __macaddr)
   (if __macaddr (setq _macaddr __macaddr)) _macaddr)
  (:signal
   (&optional __signal)
   (if __signal (setq _signal __signal)) _signal)
  (:noise
   (&optional __noise)
   (if __noise (setq _noise __noise)) _noise)
  (:snr
   (&optional __snr)
   (if __snr (setq _snr __snr)) _snr)
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:rate
   (&optional __rate)
   (if __rate (setq _rate __rate)) _rate)
  (:tx_power
   (&optional __tx_power)
   (if __tx_power (setq _tx_power __tx_power)) _tx_power)
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _essid
    4 (length _essid)
    ;; string _macaddr
    4 (length _macaddr)
    ;; int32 _signal
    4
    ;; int32 _noise
    4
    ;; int32 _snr
    4
    ;; int32 _channel
    4
    ;; string _rate
    4 (length _rate)
    ;; string _tx_power
    4 (length _tx_power)
    ;; int32 _quality
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _essid
       (write-long (length _essid) s) (princ _essid s)
     ;; string _macaddr
       (write-long (length _macaddr) s) (princ _macaddr s)
     ;; int32 _signal
       (write-long _signal s)
     ;; int32 _noise
       (write-long _noise s)
     ;; int32 _snr
       (write-long _snr s)
     ;; int32 _channel
       (write-long _channel s)
     ;; string _rate
       (write-long (length _rate) s) (princ _rate s)
     ;; string _tx_power
       (write-long (length _tx_power) s) (princ _tx_power s)
     ;; int32 _quality
       (write-long _quality s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _essid
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _essid (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _macaddr
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _macaddr (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _signal
     (setq _signal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _noise
     (setq _noise (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _snr
     (setq _snr (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _channel
     (setq _channel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _rate
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rate (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _tx_power
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tx_power (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _quality
     (setq _quality (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pr2_msgs::AccessPoint :md5sum-) "810217d9e35df31ffb396ea5673d7d1b")
(setf (get pr2_msgs::AccessPoint :datatype-) "pr2_msgs/AccessPoint")
(setf (get pr2_msgs::AccessPoint :definition-)
      "# This message communicates the state of the PR2's wifi access point.
Header header
string essid
string macaddr
int32 signal
int32 noise
int32 snr
int32 channel
string rate
string tx_power
int32 quality

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



(provide :pr2_msgs/AccessPoint "810217d9e35df31ffb396ea5673d7d1b")


