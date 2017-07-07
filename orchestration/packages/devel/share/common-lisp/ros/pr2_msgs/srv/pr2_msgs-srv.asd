
(cl:in-package :asdf)

(defsystem "pr2_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :pr2_msgs-msg
)
  :components ((:file "_package")
    (:file "SetLaserTrajCmd" :depends-on ("_package_SetLaserTrajCmd"))
    (:file "_package_SetLaserTrajCmd" :depends-on ("_package"))
    (:file "SetPeriodicCmd" :depends-on ("_package_SetPeriodicCmd"))
    (:file "_package_SetPeriodicCmd" :depends-on ("_package"))
  ))