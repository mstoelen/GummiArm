;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::GPUStatus)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'GPUStatus (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::GPUSTATUS")
  (make-package "PR2_MSGS::GPUSTATUS"))

(in-package "ROS")
;;//! \htmlinclude GPUStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass pr2_msgs::GPUStatus
  :super ros::object
  :slots (_header _product_name _pci_device_id _pci_location _display _driver_version _temperature _fan_speed _gpu_usage _memory_usage ))

(defmethod pr2_msgs::GPUStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:product_name __product_name) "")
    ((:pci_device_id __pci_device_id) "")
    ((:pci_location __pci_location) "")
    ((:display __display) "")
    ((:driver_version __driver_version) "")
    ((:temperature __temperature) 0.0)
    ((:fan_speed __fan_speed) 0.0)
    ((:gpu_usage __gpu_usage) 0.0)
    ((:memory_usage __memory_usage) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _product_name (string __product_name))
   (setq _pci_device_id (string __pci_device_id))
   (setq _pci_location (string __pci_location))
   (setq _display (string __display))
   (setq _driver_version (string __driver_version))
   (setq _temperature (float __temperature))
   (setq _fan_speed (float __fan_speed))
   (setq _gpu_usage (float __gpu_usage))
   (setq _memory_usage (float __memory_usage))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:product_name
   (&optional __product_name)
   (if __product_name (setq _product_name __product_name)) _product_name)
  (:pci_device_id
   (&optional __pci_device_id)
   (if __pci_device_id (setq _pci_device_id __pci_device_id)) _pci_device_id)
  (:pci_location
   (&optional __pci_location)
   (if __pci_location (setq _pci_location __pci_location)) _pci_location)
  (:display
   (&optional __display)
   (if __display (setq _display __display)) _display)
  (:driver_version
   (&optional __driver_version)
   (if __driver_version (setq _driver_version __driver_version)) _driver_version)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:fan_speed
   (&optional __fan_speed)
   (if __fan_speed (setq _fan_speed __fan_speed)) _fan_speed)
  (:gpu_usage
   (&optional __gpu_usage)
   (if __gpu_usage (setq _gpu_usage __gpu_usage)) _gpu_usage)
  (:memory_usage
   (&optional __memory_usage)
   (if __memory_usage (setq _memory_usage __memory_usage)) _memory_usage)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _product_name
    4 (length _product_name)
    ;; string _pci_device_id
    4 (length _pci_device_id)
    ;; string _pci_location
    4 (length _pci_location)
    ;; string _display
    4 (length _display)
    ;; string _driver_version
    4 (length _driver_version)
    ;; float32 _temperature
    4
    ;; float32 _fan_speed
    4
    ;; float32 _gpu_usage
    4
    ;; float32 _memory_usage
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _product_name
       (write-long (length _product_name) s) (princ _product_name s)
     ;; string _pci_device_id
       (write-long (length _pci_device_id) s) (princ _pci_device_id s)
     ;; string _pci_location
       (write-long (length _pci_location) s) (princ _pci_location s)
     ;; string _display
       (write-long (length _display) s) (princ _display s)
     ;; string _driver_version
       (write-long (length _driver_version) s) (princ _driver_version s)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fan_speed
       (sys::poke _fan_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gpu_usage
       (sys::poke _gpu_usage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _memory_usage
       (sys::poke _memory_usage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _product_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _product_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _pci_device_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pci_device_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _pci_location
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pci_location (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _display
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _display (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _driver_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _driver_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fan_speed
     (setq _fan_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gpu_usage
     (setq _gpu_usage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _memory_usage
     (setq _memory_usage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pr2_msgs::GPUStatus :md5sum-) "4c74e5474b8aade04e56108262099c6e")
(setf (get pr2_msgs::GPUStatus :datatype-) "pr2_msgs/GPUStatus")
(setf (get pr2_msgs::GPUStatus :definition-)
      "Header header
string product_name
string pci_device_id
string pci_location
string display
string driver_version
float32 temperature # Temperature in Celcius
float32 fan_speed # Fan speed in rad/s
float32 gpu_usage # Usage in percent
float32 memory_usage # Usage in percent
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



(provide :pr2_msgs/GPUStatus "4c74e5474b8aade04e56108262099c6e")


