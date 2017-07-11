execute_process(COMMAND "/home/joe/repos/working/GummiArm/orchestration/packages/build/gummi_interface/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/joe/repos/working/GummiArm/orchestration/packages/build/gummi_interface/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
