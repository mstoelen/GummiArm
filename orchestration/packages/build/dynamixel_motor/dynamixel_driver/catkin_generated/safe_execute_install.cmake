execute_process(COMMAND "/home/gummi/GummiArm/orchestration/packages/build/dynamixel_motor/dynamixel_driver/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/gummi/GummiArm/orchestration/packages/build/dynamixel_motor/dynamixel_driver/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
