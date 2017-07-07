// Auto-generated. Do not edit!

// (in-package pr2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BatteryState = require('./BatteryState.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BatteryServer {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.lastTimeSystem = null;
      this.timeLeft = null;
      this.averageCharge = null;
      this.message = null;
      this.lastTimeController = null;
      this.present = null;
      this.charging = null;
      this.discharging = null;
      this.reserved = null;
      this.powerPresent = null;
      this.powerNG = null;
      this.inhibited = null;
      this.battery = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('lastTimeSystem')) {
        this.lastTimeSystem = initObj.lastTimeSystem
      }
      else {
        this.lastTimeSystem = 0;
      }
      if (initObj.hasOwnProperty('timeLeft')) {
        this.timeLeft = initObj.timeLeft
      }
      else {
        this.timeLeft = 0;
      }
      if (initObj.hasOwnProperty('averageCharge')) {
        this.averageCharge = initObj.averageCharge
      }
      else {
        this.averageCharge = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('lastTimeController')) {
        this.lastTimeController = initObj.lastTimeController
      }
      else {
        this.lastTimeController = 0;
      }
      if (initObj.hasOwnProperty('present')) {
        this.present = initObj.present
      }
      else {
        this.present = 0;
      }
      if (initObj.hasOwnProperty('charging')) {
        this.charging = initObj.charging
      }
      else {
        this.charging = 0;
      }
      if (initObj.hasOwnProperty('discharging')) {
        this.discharging = initObj.discharging
      }
      else {
        this.discharging = 0;
      }
      if (initObj.hasOwnProperty('reserved')) {
        this.reserved = initObj.reserved
      }
      else {
        this.reserved = 0;
      }
      if (initObj.hasOwnProperty('powerPresent')) {
        this.powerPresent = initObj.powerPresent
      }
      else {
        this.powerPresent = 0;
      }
      if (initObj.hasOwnProperty('powerNG')) {
        this.powerNG = initObj.powerNG
      }
      else {
        this.powerNG = 0;
      }
      if (initObj.hasOwnProperty('inhibited')) {
        this.inhibited = initObj.inhibited
      }
      else {
        this.inhibited = 0;
      }
      if (initObj.hasOwnProperty('battery')) {
        this.battery = initObj.battery
      }
      else {
        this.battery = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BatteryServer
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [lastTimeSystem]
    bufferOffset = _serializer.int32(obj.lastTimeSystem, buffer, bufferOffset);
    // Serialize message field [timeLeft]
    bufferOffset = _serializer.uint16(obj.timeLeft, buffer, bufferOffset);
    // Serialize message field [averageCharge]
    bufferOffset = _serializer.uint16(obj.averageCharge, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [lastTimeController]
    bufferOffset = _serializer.int32(obj.lastTimeController, buffer, bufferOffset);
    // Serialize message field [present]
    bufferOffset = _serializer.uint16(obj.present, buffer, bufferOffset);
    // Serialize message field [charging]
    bufferOffset = _serializer.uint16(obj.charging, buffer, bufferOffset);
    // Serialize message field [discharging]
    bufferOffset = _serializer.uint16(obj.discharging, buffer, bufferOffset);
    // Serialize message field [reserved]
    bufferOffset = _serializer.uint16(obj.reserved, buffer, bufferOffset);
    // Serialize message field [powerPresent]
    bufferOffset = _serializer.uint16(obj.powerPresent, buffer, bufferOffset);
    // Serialize message field [powerNG]
    bufferOffset = _serializer.uint16(obj.powerNG, buffer, bufferOffset);
    // Serialize message field [inhibited]
    bufferOffset = _serializer.uint16(obj.inhibited, buffer, bufferOffset);
    // Serialize message field [battery]
    // Serialize the length for message field [battery]
    bufferOffset = _serializer.uint32(obj.battery.length, buffer, bufferOffset);
    obj.battery.forEach((val) => {
      bufferOffset = BatteryState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatteryServer
    let len;
    let data = new BatteryServer(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lastTimeSystem]
    data.lastTimeSystem = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [timeLeft]
    data.timeLeft = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [averageCharge]
    data.averageCharge = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lastTimeController]
    data.lastTimeController = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [present]
    data.present = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [charging]
    data.charging = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [discharging]
    data.discharging = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [reserved]
    data.reserved = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [powerPresent]
    data.powerPresent = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [powerNG]
    data.powerNG = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [inhibited]
    data.inhibited = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [battery]
    // Deserialize array length for message field [battery]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.battery = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.battery[i] = BatteryState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.message.length;
    length += 388 * object.battery.length;
    return length + 38;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/BatteryServer';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f6d6e54c9581beb1df7ea408c0727be';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # DEPRECATED. Use pr2_msgs/BatteryServer2 instead.
    Header header
    uint32 MAX_BAT_COUNT=4
    uint32 MAX_BAT_REG=48
    int32 id  # unique ID for each battery server
    # Battery System Stats
    int32 lastTimeSystem #epoch time
    uint16 timeLeft      # in minutes
    uint16 averageCharge # in percent
    string message
    # Battery Controller Flags
    int32 lastTimeController #epoch time
    uint16 present
    uint16 charging
    uint16 discharging
    uint16 reserved
    uint16 powerPresent
    uint16 powerNG
    uint16 inhibited
    # for each battery
    pr2_msgs/BatteryState[] battery
    
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
    
    ================================================================================
    MSG: pr2_msgs/BatteryState
    # DEPRECATED.  Use pr2_msgs/BatteryState2 instead.
    # Each batteries registers
    int32 lastTimeBattery #epoch time
    uint16[48] batReg
    uint16[48] batRegFlag
    int32[48] batRegTime
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BatteryServer(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.lastTimeSystem !== undefined) {
      resolved.lastTimeSystem = msg.lastTimeSystem;
    }
    else {
      resolved.lastTimeSystem = 0
    }

    if (msg.timeLeft !== undefined) {
      resolved.timeLeft = msg.timeLeft;
    }
    else {
      resolved.timeLeft = 0
    }

    if (msg.averageCharge !== undefined) {
      resolved.averageCharge = msg.averageCharge;
    }
    else {
      resolved.averageCharge = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.lastTimeController !== undefined) {
      resolved.lastTimeController = msg.lastTimeController;
    }
    else {
      resolved.lastTimeController = 0
    }

    if (msg.present !== undefined) {
      resolved.present = msg.present;
    }
    else {
      resolved.present = 0
    }

    if (msg.charging !== undefined) {
      resolved.charging = msg.charging;
    }
    else {
      resolved.charging = 0
    }

    if (msg.discharging !== undefined) {
      resolved.discharging = msg.discharging;
    }
    else {
      resolved.discharging = 0
    }

    if (msg.reserved !== undefined) {
      resolved.reserved = msg.reserved;
    }
    else {
      resolved.reserved = 0
    }

    if (msg.powerPresent !== undefined) {
      resolved.powerPresent = msg.powerPresent;
    }
    else {
      resolved.powerPresent = 0
    }

    if (msg.powerNG !== undefined) {
      resolved.powerNG = msg.powerNG;
    }
    else {
      resolved.powerNG = 0
    }

    if (msg.inhibited !== undefined) {
      resolved.inhibited = msg.inhibited;
    }
    else {
      resolved.inhibited = 0
    }

    if (msg.battery !== undefined) {
      resolved.battery = new Array(msg.battery.length);
      for (let i = 0; i < resolved.battery.length; ++i) {
        resolved.battery[i] = BatteryState.Resolve(msg.battery[i]);
      }
    }
    else {
      resolved.battery = []
    }

    return resolved;
    }
};

// Constants for message
BatteryServer.Constants = {
  MAX_BAT_COUNT: 4,
  MAX_BAT_REG: 48,
}

module.exports = BatteryServer;
