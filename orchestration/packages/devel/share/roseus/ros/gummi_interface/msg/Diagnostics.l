;; Auto-generated. Do not edit!


(when (boundp 'gummi_interface::Diagnostics)
  (if (not (find-package "GUMMI_INTERFACE"))
    (make-package "GUMMI_INTERFACE"))
  (shadow 'Diagnostics (find-package "GUMMI_INTERFACE")))
(unless (find-package "GUMMI_INTERFACE::DIAGNOSTICS")
  (make-package "GUMMI_INTERFACE::DIAGNOSTICS"))

(in-package "ROS")
;;//! \htmlinclude Diagnostics.msg.html


(defclass gummi_interface::Diagnostics
  :super ros::object
  :slots (_equilibrium _cocontraction _ballistic _encoder _alpha_flexor _alpha_extensor _forward_error ))

(defmethod gummi_interface::Diagnostics
  (:init
   (&key
    ((:equilibrium __equilibrium) 0.0)
    ((:cocontraction __cocontraction) 0.0)
    ((:ballistic __ballistic) 0.0)
    ((:encoder __encoder) 0.0)
    ((:alpha_flexor __alpha_flexor) 0.0)
    ((:alpha_extensor __alpha_extensor) 0.0)
    ((:forward_error __forward_error) 0.0)
    )
   (send-super :init)
   (setq _equilibrium (float __equilibrium))
   (setq _cocontraction (float __cocontraction))
   (setq _ballistic (float __ballistic))
   (setq _encoder (float __encoder))
   (setq _alpha_flexor (float __alpha_flexor))
   (setq _alpha_extensor (float __alpha_extensor))
   (setq _forward_error (float __forward_error))
   self)
  (:equilibrium
   (&optional __equilibrium)
   (if __equilibrium (setq _equilibrium __equilibrium)) _equilibrium)
  (:cocontraction
   (&optional __cocontraction)
   (if __cocontraction (setq _cocontraction __cocontraction)) _cocontraction)
  (:ballistic
   (&optional __ballistic)
   (if __ballistic (setq _ballistic __ballistic)) _ballistic)
  (:encoder
   (&optional __encoder)
   (if __encoder (setq _encoder __encoder)) _encoder)
  (:alpha_flexor
   (&optional __alpha_flexor)
   (if __alpha_flexor (setq _alpha_flexor __alpha_flexor)) _alpha_flexor)
  (:alpha_extensor
   (&optional __alpha_extensor)
   (if __alpha_extensor (setq _alpha_extensor __alpha_extensor)) _alpha_extensor)
  (:forward_error
   (&optional __forward_error)
   (if __forward_error (setq _forward_error __forward_error)) _forward_error)
  (:serialization-length
   ()
   (+
    ;; float64 _equilibrium
    8
    ;; float64 _cocontraction
    8
    ;; float64 _ballistic
    8
    ;; float64 _encoder
    8
    ;; float64 _alpha_flexor
    8
    ;; float64 _alpha_extensor
    8
    ;; float64 _forward_error
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _equilibrium
       (sys::poke _equilibrium (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cocontraction
       (sys::poke _cocontraction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ballistic
       (sys::poke _ballistic (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _encoder
       (sys::poke _encoder (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _alpha_flexor
       (sys::poke _alpha_flexor (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _alpha_extensor
       (sys::poke _alpha_extensor (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _forward_error
       (sys::poke _forward_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _equilibrium
     (setq _equilibrium (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cocontraction
     (setq _cocontraction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ballistic
     (setq _ballistic (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _encoder
     (setq _encoder (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _alpha_flexor
     (setq _alpha_flexor (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _alpha_extensor
     (setq _alpha_extensor (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _forward_error
     (setq _forward_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get gummi_interface::Diagnostics :md5sum-) "a0c4c6ef5a9afa1f2c1607160e439c7d")
(setf (get gummi_interface::Diagnostics :datatype-) "gummi_interface/Diagnostics")
(setf (get gummi_interface::Diagnostics :definition-)
      "float64 equilibrium
float64 cocontraction
float64 ballistic
float64 encoder
float64 alpha_flexor
float64 alpha_extensor
float64 forward_error
")



(provide :gummi_interface/Diagnostics "a0c4c6ef5a9afa1f2c1607160e439c7d")


