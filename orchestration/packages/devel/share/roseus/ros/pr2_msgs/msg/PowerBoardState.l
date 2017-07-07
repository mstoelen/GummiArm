;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::PowerBoardState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'PowerBoardState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::POWERBOARDSTATE")
  (make-package "PR2_MSGS::POWERBOARDSTATE"))

(in-package "ROS")
;;//! \htmlinclude PowerBoardState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*STATE_NOPOWER*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_NOPOWER* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_NOPOWER* 0)
(intern "*STATE_STANDBY*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_STANDBY* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_STANDBY* 1)
(intern "*STATE_PUMPING*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_PUMPING* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_PUMPING* 2)
(intern "*STATE_ON*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_ON* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_ON* 3)
(intern "*STATE_ENABLED*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_ENABLED* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_ENABLED* 3)
(intern "*STATE_DISABLED*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*STATE_DISABLED* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*STATE_DISABLED* 4)
(intern "*MASTER_NOPOWER*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*MASTER_NOPOWER* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*MASTER_NOPOWER* 0)
(intern "*MASTER_STANDBY*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*MASTER_STANDBY* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*MASTER_STANDBY* 1)
(intern "*MASTER_ON*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*MASTER_ON* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*MASTER_ON* 2)
(intern "*MASTER_OFF*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*MASTER_OFF* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*MASTER_OFF* 3)
(intern "*MASTER_SHUTDOWN*" (find-package "PR2_MSGS::POWERBOARDSTATE"))
(shadow '*MASTER_SHUTDOWN* (find-package "PR2_MSGS::POWERBOARDSTATE"))
(defconstant pr2_msgs::PowerBoardState::*MASTER_SHUTDOWN* 4)
(defclass pr2_msgs::PowerBoardState
  :super ros::object
  :slots (_header _name _serial_num _input_voltage _master_state _circuit_state _circuit_voltage _run_stop _wireless_stop ))

(defmethod pr2_msgs::PowerBoardState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:serial_num __serial_num) 0)
    ((:input_voltage __input_voltage) 0.0)
    ((:master_state __master_state) 0)
    ((:circuit_state __circuit_state) (make-array 3 :initial-element 0 :element-type :integer))
    ((:circuit_voltage __circuit_voltage) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:run_stop __run_stop) nil)
    ((:wireless_stop __wireless_stop) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _serial_num (round __serial_num))
   (setq _input_voltage (float __input_voltage))
   (setq _master_state (round __master_state))
   (setq _circuit_state __circuit_state)
   (setq _circuit_voltage __circuit_voltage)
   (setq _run_stop __run_stop)
   (setq _wireless_stop __wireless_stop)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serial_num
   (&optional __serial_num)
   (if __serial_num (setq _serial_num __serial_num)) _serial_num)
  (:input_voltage
   (&optional __input_voltage)
   (if __input_voltage (setq _input_voltage __input_voltage)) _input_voltage)
  (:master_state
   (&optional __master_state)
   (if __master_state (setq _master_state __master_state)) _master_state)
  (:circuit_state
   (&optional __circuit_state)
   (if __circuit_state (setq _circuit_state __circuit_state)) _circuit_state)
  (:circuit_voltage
   (&optional __circuit_voltage)
   (if __circuit_voltage (setq _circuit_voltage __circuit_voltage)) _circuit_voltage)
  (:run_stop
   (&optional __run_stop)
   (if __run_stop (setq _run_stop __run_stop)) _run_stop)
  (:wireless_stop
   (&optional __wireless_stop)
   (if __wireless_stop (setq _wireless_stop __wireless_stop)) _wireless_stop)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; uint32 _serial_num
    4
    ;; float64 _input_voltage
    8
    ;; int8 _master_state
    1
    ;; int8[3] _circuit_state
    (* 1    3)
    ;; float64[3] _circuit_voltage
    (* 8    3)
    ;; bool _run_stop
    1
    ;; bool _wireless_stop
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint32 _serial_num
       (write-long _serial_num s)
     ;; float64 _input_voltage
       (sys::poke _input_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _master_state
       (write-byte _master_state s)
     ;; int8[3] _circuit_state
     (dotimes (i 3)
       (write-byte (elt _circuit_state i) s)
       )
     ;; float64[3] _circuit_voltage
     (dotimes (i 3)
       (sys::poke (elt _circuit_voltage i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _run_stop
       (if _run_stop (write-byte -1 s) (write-byte 0 s))
     ;; bool _wireless_stop
       (if _wireless_stop (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _serial_num
     (setq _serial_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _input_voltage
     (setq _input_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _master_state
     (setq _master_state (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _master_state 127) (setq _master_state (- _master_state 256)))
   ;; int8[3] _circuit_state
   (dotimes (i (length _circuit_state))
     (setf (elt _circuit_state i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _circuit_state i) 127) (setf (elt _circuit_state i) (- (elt _circuit_state i) 256)))
     )
   ;; float64[3] _circuit_voltage
   (dotimes (i (length _circuit_voltage))
     (setf (elt _circuit_voltage i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; bool _run_stop
     (setq _run_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _wireless_stop
     (setq _wireless_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get pr2_msgs::PowerBoardState :md5sum-) "08899b671e6a1a449e7ce0000da8ae7b")
(setf (get pr2_msgs::PowerBoardState :datatype-) "pr2_msgs/PowerBoardState")
(setf (get pr2_msgs::PowerBoardState :definition-)
      "# This message communicates the state of the PR2's power board.
int8 STATE_NOPOWER=0
int8 STATE_STANDBY=1
int8 STATE_PUMPING=2
int8 STATE_ON=3
int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat
int8 STATE_DISABLED=4

int8 MASTER_NOPOWER=0
int8 MASTER_STANDBY=1
int8 MASTER_ON=2
int8 MASTER_OFF=3
int8 MASTER_SHUTDOWN=4

Header header
string name # Name with serial number
uint32 serial_num # Serial number for this board's message
float64 input_voltage # Input voltage to power board

# Master States:
#  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN 
int8 master_state  # The master state machine's state in the powerboard

# Circuit States:
#  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED
int8[3] circuit_state # One of the above states
float64[3] circuit_voltage  # Output voltage of each circuit

# True if robot should be enabled
bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable
bool wireless_stop 

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



(provide :pr2_msgs/PowerBoardState "08899b671e6a1a449e7ce0000da8ae7b")


