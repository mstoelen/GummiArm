;; Auto-generated. Do not edit!


(when (boundp 'pr2_msgs::BatteryState)
  (if (not (find-package "PR2_MSGS"))
    (make-package "PR2_MSGS"))
  (shadow 'BatteryState (find-package "PR2_MSGS")))
(unless (find-package "PR2_MSGS::BATTERYSTATE")
  (make-package "PR2_MSGS::BATTERYSTATE"))

(in-package "ROS")
;;//! \htmlinclude BatteryState.msg.html


(defclass pr2_msgs::BatteryState
  :super ros::object
  :slots (_lastTimeBattery _batReg _batRegFlag _batRegTime ))

(defmethod pr2_msgs::BatteryState
  (:init
   (&key
    ((:lastTimeBattery __lastTimeBattery) 0)
    ((:batReg __batReg) (make-array 48 :initial-element 0 :element-type :integer))
    ((:batRegFlag __batRegFlag) (make-array 48 :initial-element 0 :element-type :integer))
    ((:batRegTime __batRegTime) (make-array 48 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _lastTimeBattery (round __lastTimeBattery))
   (setq _batReg __batReg)
   (setq _batRegFlag __batRegFlag)
   (setq _batRegTime __batRegTime)
   self)
  (:lastTimeBattery
   (&optional __lastTimeBattery)
   (if __lastTimeBattery (setq _lastTimeBattery __lastTimeBattery)) _lastTimeBattery)
  (:batReg
   (&optional __batReg)
   (if __batReg (setq _batReg __batReg)) _batReg)
  (:batRegFlag
   (&optional __batRegFlag)
   (if __batRegFlag (setq _batRegFlag __batRegFlag)) _batRegFlag)
  (:batRegTime
   (&optional __batRegTime)
   (if __batRegTime (setq _batRegTime __batRegTime)) _batRegTime)
  (:serialization-length
   ()
   (+
    ;; int32 _lastTimeBattery
    4
    ;; uint16[48] _batReg
    (* 2    48)
    ;; uint16[48] _batRegFlag
    (* 2    48)
    ;; int32[48] _batRegTime
    (* 4    48)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _lastTimeBattery
       (write-long _lastTimeBattery s)
     ;; uint16[48] _batReg
     (dotimes (i 48)
       (write-word (elt _batReg i) s)
       )
     ;; uint16[48] _batRegFlag
     (dotimes (i 48)
       (write-word (elt _batRegFlag i) s)
       )
     ;; int32[48] _batRegTime
     (dotimes (i 48)
       (write-long (elt _batRegTime i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _lastTimeBattery
     (setq _lastTimeBattery (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16[48] _batReg
   (dotimes (i (length _batReg))
     (setf (elt _batReg i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[48] _batRegFlag
   (dotimes (i (length _batRegFlag))
     (setf (elt _batRegFlag i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; int32[48] _batRegTime
   (dotimes (i (length _batRegTime))
     (setf (elt _batRegTime i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get pr2_msgs::BatteryState :md5sum-) "00e9f996c2fc26700fd25abcd8422db0")
(setf (get pr2_msgs::BatteryState :datatype-) "pr2_msgs/BatteryState")
(setf (get pr2_msgs::BatteryState :definition-)
      "# DEPRECATED.  Use pr2_msgs/BatteryState2 instead.
# Each batteries registers
int32 lastTimeBattery #epoch time
uint16[48] batReg
uint16[48] batRegFlag
int32[48] batRegTime

")



(provide :pr2_msgs/BatteryState "00e9f996c2fc26700fd25abcd8422db0")


