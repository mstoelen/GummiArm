// Auto-generated. Do not edit!

// (in-package pr2_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PeriodicCmd = require('../msg/PeriodicCmd.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetPeriodicCmdRequest {
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
        this.command = new PeriodicCmd();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPeriodicCmdRequest
    // Serialize message field [command]
    bufferOffset = PeriodicCmd.serialize(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPeriodicCmdRequest
    let len;
    let data = new SetPeriodicCmdRequest(null);
    // Deserialize message field [command]
    data.command = PeriodicCmd.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PeriodicCmd.getMessageSize(object.command);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_msgs/SetPeriodicCmdRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd4deedcc194c4a77110f7228904ee733';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pr2_msgs/PeriodicCmd command
    
    ================================================================================
    MSG: pr2_msgs/PeriodicCmd
    # This message is used to set the parameters of a profile executed by the
    # laser tilt controller.
    Header header
    string profile
    float64 period
    float64 amplitude
    float64 offset
    
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
    const resolved = new SetPeriodicCmdRequest(null);
    if (msg.command !== undefined) {
      resolved.command = PeriodicCmd.Resolve(msg.command)
    }
    else {
      resolved.command = new PeriodicCmd()
    }

    return resolved;
    }
};

class SetPeriodicCmdResponse {
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
    // Serializes a message object of type SetPeriodicCmdResponse
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPeriodicCmdResponse
    let len;
    let data = new SetPeriodicCmdResponse(null);
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pr2_msgs/SetPeriodicCmdResponse';
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
    const resolved = new SetPeriodicCmdResponse(null);
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
  Request: SetPeriodicCmdRequest,
  Response: SetPeriodicCmdResponse,
  md5sum() { return 'daeb6e862b732192bc82a7ea52bb7975'; },
  datatype() { return 'pr2_msgs/SetPeriodicCmd'; }
};
