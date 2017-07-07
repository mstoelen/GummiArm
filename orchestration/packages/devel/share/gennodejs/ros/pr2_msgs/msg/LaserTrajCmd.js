// Auto-generated. Do not edit!

// (in-package pr2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LaserTrajCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.profile = null;
      this.position = null;
      this.time_from_start = null;
      this.max_velocity = null;
      this.max_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('profile')) {
        this.profile = initObj.profile
      }
      else {
        this.profile = '';
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('time_from_start')) {
        this.time_from_start = initObj.time_from_start
      }
      else {
        this.time_from_start = [];
      }
      if (initObj.hasOwnProperty('max_velocity')) {
        this.max_velocity = initObj.max_velocity
      }
      else {
        this.max_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('max_acceleration')) {
        this.max_acceleration = initObj.max_acceleration
      }
      else {
        this.max_acceleration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaserTrajCmd
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [profile]
    bufferOffset = _serializer.string(obj.profile, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [time_from_start]
    bufferOffset = _arraySerializer.duration(obj.time_from_start, buffer, bufferOffset, null);
    // Serialize message field [max_velocity]
    bufferOffset = _serializer.float64(obj.max_velocity, buffer, bufferOffset);
    // Serialize message field [max_acceleration]
    bufferOffset = _serializer.float64(obj.max_acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaserTrajCmd
    let len;
    let data = new LaserTrajCmd(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [profile]
    data.profile = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [time_from_start]
    data.time_from_start = _arrayDeserializer.duration(buffer, bufferOffset, null)
    // Deserialize message field [max_velocity]
    data.max_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_acceleration]
    data.max_acceleration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.profile.length;
    length += 8 * object.position.length;
    length += 8 * object.time_from_start.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/LaserTrajCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68a1665e9079049dce55a0384cb2e9b5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new LaserTrajCmd(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.profile !== undefined) {
      resolved.profile = msg.profile;
    }
    else {
      resolved.profile = ''
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.time_from_start !== undefined) {
      resolved.time_from_start = msg.time_from_start;
    }
    else {
      resolved.time_from_start = []
    }

    if (msg.max_velocity !== undefined) {
      resolved.max_velocity = msg.max_velocity;
    }
    else {
      resolved.max_velocity = 0.0
    }

    if (msg.max_acceleration !== undefined) {
      resolved.max_acceleration = msg.max_acceleration;
    }
    else {
      resolved.max_acceleration = 0.0
    }

    return resolved;
    }
};

module.exports = LaserTrajCmd;
