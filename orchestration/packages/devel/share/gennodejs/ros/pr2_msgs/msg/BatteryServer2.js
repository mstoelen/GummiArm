// Auto-generated. Do not edit!

// (in-package pr2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BatteryState2 = require('./BatteryState2.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BatteryServer2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.last_system_update = null;
      this.time_left = null;
      this.average_charge = null;
      this.message = null;
      this.last_controller_update = null;
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
      if (initObj.hasOwnProperty('last_system_update')) {
        this.last_system_update = initObj.last_system_update
      }
      else {
        this.last_system_update = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('time_left')) {
        this.time_left = initObj.time_left
      }
      else {
        this.time_left = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('average_charge')) {
        this.average_charge = initObj.average_charge
      }
      else {
        this.average_charge = 0;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('last_controller_update')) {
        this.last_controller_update = initObj.last_controller_update
      }
      else {
        this.last_controller_update = {secs: 0, nsecs: 0};
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
    // Serializes a message object of type BatteryServer2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [last_system_update]
    bufferOffset = _serializer.time(obj.last_system_update, buffer, bufferOffset);
    // Serialize message field [time_left]
    bufferOffset = _serializer.duration(obj.time_left, buffer, bufferOffset);
    // Serialize message field [average_charge]
    bufferOffset = _serializer.int32(obj.average_charge, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [last_controller_update]
    bufferOffset = _serializer.time(obj.last_controller_update, buffer, bufferOffset);
    // Serialize message field [battery]
    // Serialize the length for message field [battery]
    bufferOffset = _serializer.uint32(obj.battery.length, buffer, bufferOffset);
    obj.battery.forEach((val) => {
      bufferOffset = BatteryState2.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatteryServer2
    let len;
    let data = new BatteryServer2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [last_system_update]
    data.last_system_update = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [time_left]
    data.time_left = _deserializer.duration(buffer, bufferOffset);
    // Deserialize message field [average_charge]
    data.average_charge = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [last_controller_update]
    data.last_controller_update = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [battery]
    // Deserialize array length for message field [battery]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.battery = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.battery[i] = BatteryState2.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.message.length;
    length += 542 * object.battery.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/BatteryServer2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5f2cec7d06c312d756189db96c1f3819';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates the state of a battery server, which controls
    # multiple batteries.
    Header header
    int32 MAX_BAT_COUNT=4
    int32 MAX_BAT_REG=48
    int32 id  # unique ID for each battery server
    # Battery System Stats
    time last_system_update  # last time the system stats where updated
    duration time_left       # in seconds (hardware resolution is 1 minute)
    int32 average_charge     # in percent
    string message           # message from the ocean server
    time last_controller_update # last time a battery status flag was updated
    # for each battery
    pr2_msgs/BatteryState2[] battery
    
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
    MSG: pr2_msgs/BatteryState2
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
    const resolved = new BatteryServer2(null);
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

    if (msg.last_system_update !== undefined) {
      resolved.last_system_update = msg.last_system_update;
    }
    else {
      resolved.last_system_update = {secs: 0, nsecs: 0}
    }

    if (msg.time_left !== undefined) {
      resolved.time_left = msg.time_left;
    }
    else {
      resolved.time_left = {secs: 0, nsecs: 0}
    }

    if (msg.average_charge !== undefined) {
      resolved.average_charge = msg.average_charge;
    }
    else {
      resolved.average_charge = 0
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.last_controller_update !== undefined) {
      resolved.last_controller_update = msg.last_controller_update;
    }
    else {
      resolved.last_controller_update = {secs: 0, nsecs: 0}
    }

    if (msg.battery !== undefined) {
      resolved.battery = new Array(msg.battery.length);
      for (let i = 0; i < resolved.battery.length; ++i) {
        resolved.battery[i] = BatteryState2.Resolve(msg.battery[i]);
      }
    }
    else {
      resolved.battery = []
    }

    return resolved;
    }
};

// Constants for message
BatteryServer2.Constants = {
  MAX_BAT_COUNT: 4,
  MAX_BAT_REG: 48,
}

module.exports = BatteryServer2;
