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

class BatteryState2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.present = null;
      this.charging = null;
      this.discharging = null;
      this.power_present = null;
      this.power_no_good = null;
      this.inhibited = null;
      this.last_battery_update = null;
      this.battery_register = null;
      this.battery_update_flag = null;
      this.battery_register_update = null;
    }
    else {
      if (initObj.hasOwnProperty('present')) {
        this.present = initObj.present
      }
      else {
        this.present = false;
      }
      if (initObj.hasOwnProperty('charging')) {
        this.charging = initObj.charging
      }
      else {
        this.charging = false;
      }
      if (initObj.hasOwnProperty('discharging')) {
        this.discharging = initObj.discharging
      }
      else {
        this.discharging = false;
      }
      if (initObj.hasOwnProperty('power_present')) {
        this.power_present = initObj.power_present
      }
      else {
        this.power_present = false;
      }
      if (initObj.hasOwnProperty('power_no_good')) {
        this.power_no_good = initObj.power_no_good
      }
      else {
        this.power_no_good = false;
      }
      if (initObj.hasOwnProperty('inhibited')) {
        this.inhibited = initObj.inhibited
      }
      else {
        this.inhibited = false;
      }
      if (initObj.hasOwnProperty('last_battery_update')) {
        this.last_battery_update = initObj.last_battery_update
      }
      else {
        this.last_battery_update = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('battery_register')) {
        this.battery_register = initObj.battery_register
      }
      else {
        this.battery_register = new Array(48).fill(0);
      }
      if (initObj.hasOwnProperty('battery_update_flag')) {
        this.battery_update_flag = initObj.battery_update_flag
      }
      else {
        this.battery_update_flag = new Array(48).fill(0);
      }
      if (initObj.hasOwnProperty('battery_register_update')) {
        this.battery_register_update = initObj.battery_register_update
      }
      else {
        this.battery_register_update = new Array(48).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BatteryState2
    // Serialize message field [present]
    bufferOffset = _serializer.bool(obj.present, buffer, bufferOffset);
    // Serialize message field [charging]
    bufferOffset = _serializer.bool(obj.charging, buffer, bufferOffset);
    // Serialize message field [discharging]
    bufferOffset = _serializer.bool(obj.discharging, buffer, bufferOffset);
    // Serialize message field [power_present]
    bufferOffset = _serializer.bool(obj.power_present, buffer, bufferOffset);
    // Serialize message field [power_no_good]
    bufferOffset = _serializer.bool(obj.power_no_good, buffer, bufferOffset);
    // Serialize message field [inhibited]
    bufferOffset = _serializer.bool(obj.inhibited, buffer, bufferOffset);
    // Serialize message field [last_battery_update]
    bufferOffset = _serializer.time(obj.last_battery_update, buffer, bufferOffset);
    // Check that the constant length array field [battery_register] has the right length
    if (obj.battery_register.length !== 48) {
      throw new Error('Unable to serialize array field battery_register - length must be 48')
    }
    // Serialize message field [battery_register]
    bufferOffset = _arraySerializer.int16(obj.battery_register, buffer, bufferOffset, 48);
    // Check that the constant length array field [battery_update_flag] has the right length
    if (obj.battery_update_flag.length !== 48) {
      throw new Error('Unable to serialize array field battery_update_flag - length must be 48')
    }
    // Serialize message field [battery_update_flag]
    bufferOffset = _arraySerializer.bool(obj.battery_update_flag, buffer, bufferOffset, 48);
    // Check that the constant length array field [battery_register_update] has the right length
    if (obj.battery_register_update.length !== 48) {
      throw new Error('Unable to serialize array field battery_register_update - length must be 48')
    }
    // Serialize message field [battery_register_update]
    bufferOffset = _arraySerializer.time(obj.battery_register_update, buffer, bufferOffset, 48);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatteryState2
    let len;
    let data = new BatteryState2(null);
    // Deserialize message field [present]
    data.present = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [charging]
    data.charging = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [discharging]
    data.discharging = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power_present]
    data.power_present = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power_no_good]
    data.power_no_good = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [inhibited]
    data.inhibited = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [last_battery_update]
    data.last_battery_update = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [battery_register]
    data.battery_register = _arrayDeserializer.int16(buffer, bufferOffset, 48)
    // Deserialize message field [battery_update_flag]
    data.battery_update_flag = _arrayDeserializer.bool(buffer, bufferOffset, 48)
    // Deserialize message field [battery_register_update]
    data.battery_register_update = _arrayDeserializer.time(buffer, bufferOffset, 48)
    return data;
  }

  static getMessageSize(object) {
    return 542;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/BatteryState2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91b4acb000aa990ac3006834f9a99669';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates the state of a single battery.
    # Battery Controller Flags, one per battery
    bool present       # is this pack present
    bool charging      # is this pack charging
    bool discharging   # is this pack discharging
    bool power_present # is there an input voltage
    bool power_no_good # is there a fault (No Good)
    bool inhibited     # is this pack disabled for some reason
    # These registers are per battery
    time      last_battery_update     # last time any battery update occurred
    int16[48] battery_register        # value of this register in the battery
    bool[48]  battery_update_flag     # Has this register ever been updated
    time[48]  battery_register_update # last time this specific register was updated
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BatteryState2(null);
    if (msg.present !== undefined) {
      resolved.present = msg.present;
    }
    else {
      resolved.present = false
    }

    if (msg.charging !== undefined) {
      resolved.charging = msg.charging;
    }
    else {
      resolved.charging = false
    }

    if (msg.discharging !== undefined) {
      resolved.discharging = msg.discharging;
    }
    else {
      resolved.discharging = false
    }

    if (msg.power_present !== undefined) {
      resolved.power_present = msg.power_present;
    }
    else {
      resolved.power_present = false
    }

    if (msg.power_no_good !== undefined) {
      resolved.power_no_good = msg.power_no_good;
    }
    else {
      resolved.power_no_good = false
    }

    if (msg.inhibited !== undefined) {
      resolved.inhibited = msg.inhibited;
    }
    else {
      resolved.inhibited = false
    }

    if (msg.last_battery_update !== undefined) {
      resolved.last_battery_update = msg.last_battery_update;
    }
    else {
      resolved.last_battery_update = {secs: 0, nsecs: 0}
    }

    if (msg.battery_register !== undefined) {
      resolved.battery_register = msg.battery_register;
    }
    else {
      resolved.battery_register = new Array(48).fill(0)
    }

    if (msg.battery_update_flag !== undefined) {
      resolved.battery_update_flag = msg.battery_update_flag;
    }
    else {
      resolved.battery_update_flag = new Array(48).fill(0)
    }

    if (msg.battery_register_update !== undefined) {
      resolved.battery_register_update = msg.battery_register_update;
    }
    else {
      resolved.battery_register_update = new Array(48).fill(0)
    }

    return resolved;
    }
};

module.exports = BatteryState2;
