// Auto-generated. Do not edit!

// (in-package pr2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BatteryState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lastTimeBattery = null;
      this.batReg = null;
      this.batRegFlag = null;
      this.batRegTime = null;
    }
    else {
      if (initObj.hasOwnProperty('lastTimeBattery')) {
        this.lastTimeBattery = initObj.lastTimeBattery
      }
      else {
        this.lastTimeBattery = 0;
      }
      if (initObj.hasOwnProperty('batReg')) {
        this.batReg = initObj.batReg
      }
      else {
        this.batReg = new Array(48).fill(0);
      }
      if (initObj.hasOwnProperty('batRegFlag')) {
        this.batRegFlag = initObj.batRegFlag
      }
      else {
        this.batRegFlag = new Array(48).fill(0);
      }
      if (initObj.hasOwnProperty('batRegTime')) {
        this.batRegTime = initObj.batRegTime
      }
      else {
        this.batRegTime = new Array(48).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BatteryState
    // Serialize message field [lastTimeBattery]
    bufferOffset = _serializer.int32(obj.lastTimeBattery, buffer, bufferOffset);
    // Check that the constant length array field [batReg] has the right length
    if (obj.batReg.length !== 48) {
      throw new Error('Unable to serialize array field batReg - length must be 48')
    }
    // Serialize message field [batReg]
    bufferOffset = _arraySerializer.uint16(obj.batReg, buffer, bufferOffset, 48);
    // Check that the constant length array field [batRegFlag] has the right length
    if (obj.batRegFlag.length !== 48) {
      throw new Error('Unable to serialize array field batRegFlag - length must be 48')
    }
    // Serialize message field [batRegFlag]
    bufferOffset = _arraySerializer.uint16(obj.batRegFlag, buffer, bufferOffset, 48);
    // Check that the constant length array field [batRegTime] has the right length
    if (obj.batRegTime.length !== 48) {
      throw new Error('Unable to serialize array field batRegTime - length must be 48')
    }
    // Serialize message field [batRegTime]
    bufferOffset = _arraySerializer.int32(obj.batRegTime, buffer, bufferOffset, 48);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatteryState
    let len;
    let data = new BatteryState(null);
    // Deserialize message field [lastTimeBattery]
    data.lastTimeBattery = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [batReg]
    data.batReg = _arrayDeserializer.uint16(buffer, bufferOffset, 48)
    // Deserialize message field [batRegFlag]
    data.batRegFlag = _arrayDeserializer.uint16(buffer, bufferOffset, 48)
    // Deserialize message field [batRegTime]
    data.batRegTime = _arrayDeserializer.int32(buffer, bufferOffset, 48)
    return data;
  }

  static getMessageSize(object) {
    return 388;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/BatteryState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00e9f996c2fc26700fd25abcd8422db0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new BatteryState(null);
    if (msg.lastTimeBattery !== undefined) {
      resolved.lastTimeBattery = msg.lastTimeBattery;
    }
    else {
      resolved.lastTimeBattery = 0
    }

    if (msg.batReg !== undefined) {
      resolved.batReg = msg.batReg;
    }
    else {
      resolved.batReg = new Array(48).fill(0)
    }

    if (msg.batRegFlag !== undefined) {
      resolved.batRegFlag = msg.batRegFlag;
    }
    else {
      resolved.batRegFlag = new Array(48).fill(0)
    }

    if (msg.batRegTime !== undefined) {
      resolved.batRegTime = msg.batRegTime;
    }
    else {
      resolved.batRegTime = new Array(48).fill(0)
    }

    return resolved;
    }
};

module.exports = BatteryState;
