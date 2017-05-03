#!/bin/bash

# You can't simply call export from a script and expect it will work
# According to the answer below:
# http://stackoverflow.com/a/16619261/7658422
# It will be necessary to call:
# eval $(rosrun gummi_moveit_config export2VM.bash)
echo "export ROS_HOSTNAME=ubuntu14VM.local"
echo "export ROS_MASTER_URI=http://gummi-Aero-14.local:11311"
