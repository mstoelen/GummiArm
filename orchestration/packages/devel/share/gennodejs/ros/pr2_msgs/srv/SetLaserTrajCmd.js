// Auto-generated. Do not edit!

// (in-package pr2_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LaserTrajCmd = require('../msg/LaserTrajCmd.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetLaserTrajCmdRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = new LaserTrajCmd();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLaserTrajCmdRequest
    // Serialize message field [command]
    bufferOffset = LaserTrajCmd.serialize(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLaserTrajCmdRequest
    let len;
    let data = new SetLaserTrajCmdRequest(null);
    // Deserialize message field [command]
    data.command = LaserTrajCmd.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += LaserTrajCmd.getMessageSize(object.command);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_msgs/SetLaserTrajCmdRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83f915c37d36f61442c752779261e7d4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pr2_msgs/LaserTrajCmd command
    
    ================================================================================
    MSG: pr2_msgs/LaserTrajCmd
    # This message is used to set the profile that the tilt laser controller
    # executes.
    Header header
    string profile              # options are currently "linear" or "linear_blended"
    float64[] position          # Laser positions
    duration[] time_from_start  # Times to reach laser positions in seconds
    float64 max_velocity        # Set <= 0 to use default
    float64 max_acceleration    # Set <= 0 to use default
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLaserTrajCmdRequest(null);
    if (msg.command !== undefined) {
      resolved.command = LaserTrajCmd.Resolve(msg.command)
    }
    else {
      resolved.command = new LaserTrajCmd()
    }

    return resolved;
    }
};

class SetLaserTrajCmdResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_time = null;
    }
    else {
      if (initObj.hasOwnProperty('start_time')) {
        this.start_time = initObj.start_time
      }
      else {
        this.start_time = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLaserTrajCmdResponse
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLaserTrajCmdResponse
    let len;
    let data = new SetLaserTrajCmdResponse(null);
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_msgs/SetLaserTrajCmdResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3888666920054f1ef39d2df7a5d94b02';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time start_time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLaserTrajCmdResponse(null);
    if (msg.start_time !== undefined) {
      resolved.start_time = msg.start_time;
    }
    else {
      resolved.start_time = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = {
  Request: SetLaserTrajCmdRequest,
  Response: SetLaserTrajCmdResponse,
  md5sum() { return '28fe2ce397611c999952c74a1ea882aa'; },
  datatype() { return 'pr2_msgs/SetLaserTrajCmd'; }
};
