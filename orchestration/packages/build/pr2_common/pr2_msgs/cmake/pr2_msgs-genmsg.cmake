# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pr2_msgs: 14 messages, 2 services")

set(MSG_I_FLAGS "-Ipr2_msgs:/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pr2_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" "pr2_msgs/BatteryState:std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" "pr2_msgs/LaserTrajCmd:std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" ""
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" "pr2_msgs/PeriodicCmd:std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" "std_msgs/Header:pr2_msgs/BatteryState2"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" ""
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" "pr2_msgs/AccessPoint:std_msgs/Bool:pr2_msgs/PowerBoardState:std_msgs/Header:pr2_msgs/PowerState"
)

get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_custom_target(_pr2_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_msgs" "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Bool.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)

### Generating Services
_generate_srv_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)
_generate_srv_cpp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
)

### Generating Module File
_generate_module_cpp(pr2_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pr2_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pr2_msgs_generate_messages pr2_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_cpp _pr2_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_msgs_gencpp)
add_dependencies(pr2_msgs_gencpp pr2_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Bool.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_msg_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)

### Generating Services
_generate_srv_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)
_generate_srv_eus(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
)

### Generating Module File
_generate_module_eus(pr2_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pr2_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pr2_msgs_generate_messages pr2_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_eus _pr2_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_msgs_geneus)
add_dependencies(pr2_msgs_geneus pr2_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Bool.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_msg_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)

### Generating Services
_generate_srv_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)
_generate_srv_lisp(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
)

### Generating Module File
_generate_module_lisp(pr2_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pr2_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pr2_msgs_generate_messages pr2_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_lisp _pr2_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_msgs_genlisp)
add_dependencies(pr2_msgs_genlisp pr2_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Bool.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_msg_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)

### Generating Services
_generate_srv_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)
_generate_srv_nodejs(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
)

### Generating Module File
_generate_module_nodejs(pr2_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pr2_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pr2_msgs_generate_messages pr2_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_nodejs _pr2_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_msgs_gennodejs)
add_dependencies(pr2_msgs_gennodejs pr2_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Bool.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_msg_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)

### Generating Services
_generate_srv_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)
_generate_srv_py(pr2_msgs
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv"
  "${MSG_I_FLAGS}"
  "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
)

### Generating Module File
_generate_module_py(pr2_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pr2_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pr2_msgs_generate_messages pr2_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetLaserTrajCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserScannerSignal.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PeriodicCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccelerometerState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/AccessPoint.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/srv/SetPeriodicCmd.srv" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PowerBoardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryServer2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/PressureState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/LaserTrajCmd.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/BatteryState2.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/DashboardState.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joe/repos/GummiArm/orchestration/packages/src/pr2_common/pr2_msgs/msg/GPUStatus.msg" NAME_WE)
add_dependencies(pr2_msgs_generate_messages_py _pr2_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_msgs_genpy)
add_dependencies(pr2_msgs_genpy pr2_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pr2_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pr2_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pr2_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pr2_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pr2_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pr2_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pr2_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pr2_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pr2_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pr2_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
