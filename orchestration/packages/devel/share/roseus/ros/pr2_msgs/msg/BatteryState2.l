;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::BatteryState2)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'BatteryState2 (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::BATTERYSTATE2")
  (make-package "PR2_MSGS::BATTERYSTATE2"))

(in-package "ROS")
;;//! \htmlinclude BatteryState2.msg.html


(defclass pr2_msgs::BatteryState2
  :super ros::object
  :slots (_present _charging _discharging _power_present _power_no_good _inhibited _last_battery_update _battery_register _battery_update_flag _battery_register_update ))

(defmethod pr2_msgs::BatteryState2
  (:init
   (&key
    ((:present __present) nil)
    ((:charging __charging) nil)
    ((:discharging __discharging) nil)
    ((:power_present __power_present) nil)
    ((:power_no_good __power_no_good) nil)
    ((:inhibited __inhibited) nil)
    ((:last_battery_update __last_battery_update) (instance ros::time :init))
    ((:battery_register __battery_register) (make-array 48 :initial-element 0 :element-type :integer))
    ((:battery_update_flag __battery_update_flag) (let (r) (dotimes (i 48) (push nil r)) r))
    ((:battery_register_update __battery_register_update) (let (r) (dotimes (i 48) (push (instance ros::time :init) r)) r))
    )
   (send-super :init)
   (setq _present __present)
   (setq _charging __charging)
   (setq _discharging __discharging)
   (setq _power_present __power_present)
   (setq _power_no_good __power_no_good)
   (setq _inhibited __inhibited)
   (setq _last_battery_update __last_battery_update)
   (setq _battery_register __battery_register)
   (setq _battery_update_flag __battery_update_flag)
   (setq _battery_register_update __battery_register_update)
   self)
  (:present
   (&optional __present)
   (if __present (setq _present __present)) _present)
  (:charging
   (&optional __charging)
   (if __charging (setq _charging __charging)) _charging)
  (:discharging
   (&optional __discharging)
   (if __discharging (setq _discharging __discharging)) _discharging)
  (:power_present
   (&optional __power_present)
   (if __power_present (setq _power_present __power_present)) _power_present)
  (:power_no_good
   (&optional __power_no_good)
   (if __power_no_good (setq _power_no_good __power_no_good)) _power_no_good)
  (:inhibited
   (&optional __inhibited)
   (if __inhibited (setq _inhibited __inhibited)) _inhibited)
  (:last_battery_update
   (&optional __last_battery_update)
   (if __last_battery_update (setq _last_battery_update __last_battery_update)) _last_battery_update)
  (:battery_register
   (&optional __battery_register)
   (if __battery_register (setq _battery_register __battery_register)) _battery_register)
  (:battery_update_flag
   (&optional __battery_update_flag)
   (if __battery_update_flag (setq _battery_update_flag __battery_update_flag)) _battery_update_flag)
  (:battery_register_update
   (&optional __battery_register_update)
   (if __battery_register_update (setq _battery_register_update __battery_register_update)) _battery_register_update)
  (:serialization-length
   ()
   (+
    ;; bool _present
    1
    ;; bool _charging
    1
    ;; bool _discharging
    1
    ;; bool _power_present
    1
    ;; bool _power_no_good
    1
    ;; bool _inhibited
    1
    ;; time _last_battery_update
    8
    ;; int16[48] _battery_register
    (* 2    48)
    ;; bool[48] _battery_update_flag
    (* 1    48)
    ;; time[48] _battery_register_update
    (* 8    48)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _present
       (if _present (write-byte -1 s) (write-byte 0 s))
     ;; bool _charging
       (if _charging (write-byte -1 s) (write-byte 0 s))
     ;; bool _discharging
       (if _discharging (write-byte -1 s) (write-byte 0 s))
     ;; bool _power_present
       (if _power_present (write-byte -1 s) (write-byte 0 s))
     ;; bool _power_no_good
       (if _power_no_good (write-byte -1 s) (write-byte 0 s))
     ;; bool _inhibited
       (if _inhibited (write-byte -1 s) (write-byte 0 s))
     ;; time _last_battery_update
       (write-long (send _last_battery_update :sec) s) (write-long (send _last_battery_update :nsec) s)
     ;; int16[48] _battery_register
     (dotimes (i 48)
       (write-word (elt _battery_register i) s)
       )
     ;; bool[48] _battery_update_flag
     (dotimes (i 48)
       (if (elt _battery_update_flag i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; time[48] _battery_register_update
     (dotimes (i 48)
       (write-long (send (elt _battery_register_update i) :sec) s) (write-long (send (elt _battery_register_update i) :nsec) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _present
     (setq _present (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _charging
     (setq _charging (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _discharging
     (setq _discharging (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _power_present
     (setq _power_present (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _power_no_good
     (setq _power_no_good (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _inhibited
     (setq _inhibited (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; time _last_battery_update
     (send _last_battery_update :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _last_battery_update :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16[48] _battery_register
   (dotimes (i (length _battery_register))
     (setf (elt _battery_register i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; bool[48] _battery_update_flag
   (dotimes (i (length _battery_update_flag))
     (setf (elt _battery_update_flag i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     )
   ;; time[48] _battery_register_update
   (dotimes (i (length _battery_register_update))
     (send (elt _battery_register_update i) :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send (elt _battery_register_update i) :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get pr2_msgs::BatteryState2 :md5sum-) "91b4acb000aa990ac3006834f9a99669")
(setf (get pr2_msgs::BatteryState2 :datatype-) "pr2_msgs/BatteryState2")
(setf (get pr2_msgs::BatteryState2 :definition-)
      "# This message communicates the state of a single battery.
# Battery Controller Flags, one per battery
bool present       # is this pack present
bool charging      # is this pack charging
bool discharging   # is this pack discharging
bool power_present # is there an input voltage
bool power_no_good # is there a fault (No Good)
bool inhibited     # is this pack disabled for some reason
# These registers are per battery
time      last_battery_update     # last time any battery update occurred
int16[48] battery_register        # value of this register in the battery
bool[48]  battery_update_flag     # Has this register ever been updated
time[48]  battery_register_update # last time this specific register was updated

")



(provide :pr2_msgs/BatteryState2 "91b4acb000aa990ac3006834f9a99669")


