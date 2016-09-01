
(cl:in-package :asdf)

(defsystem "gummi_interface-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Diagnostics" :depends-on ("_package_Diagnostics"))
    (:file "_package_Diagnostics" :depends-on ("_package"))
  ))