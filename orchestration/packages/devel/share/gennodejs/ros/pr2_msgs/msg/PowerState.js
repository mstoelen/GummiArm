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

class PowerState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.power_consumption = null;
      this.time_remaining = null;
      this.prediction_method = null;
      this.relative_capacity = null;
      this.AC_present = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('power_consumption')) {
        this.power_consumption = initObj.power_consumption
      }
      else {
        this.power_consumption = 0.0;
      }
      if (initObj.hasOwnProperty('time_remaining')) {
        this.time_remaining = initObj.time_remaining
      }
      else {
        this.time_remaining = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('prediction_method')) {
        this.prediction_method = initObj.prediction_method
      }
      else {
        this.prediction_method = '';
      }
      if (initObj.hasOwnProperty('relative_capacity')) {
        this.relative_capacity = initObj.relative_capacity
      }
      else {
        this.relative_capacity = 0;
      }
      if (initObj.hasOwnProperty('AC_present')) {
        this.AC_present = initObj.AC_present
      }
      else {
        this.AC_present = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PowerState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [power_consumption]
    bufferOffset = _serializer.float64(obj.power_consumption, buffer, bufferOffset);
    // Serialize message field [time_remaining]
    bufferOffset = _serializer.duration(obj.time_remaining, buffer, bufferOffset);
    // Serialize message field [prediction_method]
    bufferOffset = _serializer.string(obj.prediction_method, buffer, bufferOffset);
    // Serialize message field [relative_capacity]
    bufferOffset = _serializer.int8(obj.relative_capacity, buffer, bufferOffset);
    // Serialize message field [AC_present]
    bufferOffset = _serializer.int8(obj.AC_present, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PowerState
    let len;
    let data = new PowerState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [power_consumption]
    data.power_consumption = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [time_remaining]
    data.time_remaining = _deserializer.duration(buffer, bufferOffset);
    // Deserialize message field [prediction_method]
    data.prediction_method = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [relative_capacity]
    data.relative_capacity = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [AC_present]
    data.AC_present = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.prediction_method.length;
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/PowerState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e6fa46a387cad0b7a80959a21587a6c9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates the state of the PR2's power system.
    Header header
    float64 power_consumption ## Watts
    duration time_remaining ## estimated time to empty or full
    string prediction_method ## how time_remaining is being calculated
    int8  relative_capacity ## percent of capacity
    int8  AC_present ## number of packs detecting AC power, > 0 means plugged in
    
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
    const resolved = new PowerState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.power_consumption !== undefined) {
      resolved.power_consumption = msg.power_consumption;
    }
    else {
      resolved.power_consumption = 0.0
    }

    if (msg.time_remaining !== undefined) {
      resolved.time_remaining = msg.time_remaining;
    }
    else {
      resolved.time_remaining = {secs: 0, nsecs: 0}
    }

    if (msg.prediction_method !== undefined) {
      resolved.prediction_method = msg.prediction_method;
    }
    else {
      resolved.prediction_method = ''
    }

    if (msg.relative_capacity !== undefined) {
      resolved.relative_capacity = msg.relative_capacity;
    }
    else {
      resolved.relative_capacity = 0
    }

    if (msg.AC_present !== undefined) {
      resolved.AC_present = msg.AC_present;
    }
    else {
      resolved.AC_present = 0
    }

    return resolved;
    }
};

module.exports = PowerState;
