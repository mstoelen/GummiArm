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

class AccessPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.essid = null;
      this.macaddr = null;
      this.signal = null;
      this.noise = null;
      this.snr = null;
      this.channel = null;
      this.rate = null;
      this.tx_power = null;
      this.quality = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('essid')) {
        this.essid = initObj.essid
      }
      else {
        this.essid = '';
      }
      if (initObj.hasOwnProperty('macaddr')) {
        this.macaddr = initObj.macaddr
      }
      else {
        this.macaddr = '';
      }
      if (initObj.hasOwnProperty('signal')) {
        this.signal = initObj.signal
      }
      else {
        this.signal = 0;
      }
      if (initObj.hasOwnProperty('noise')) {
        this.noise = initObj.noise
      }
      else {
        this.noise = 0;
      }
      if (initObj.hasOwnProperty('snr')) {
        this.snr = initObj.snr
      }
      else {
        this.snr = 0;
      }
      if (initObj.hasOwnProperty('channel')) {
        this.channel = initObj.channel
      }
      else {
        this.channel = 0;
      }
      if (initObj.hasOwnProperty('rate')) {
        this.rate = initObj.rate
      }
      else {
        this.rate = '';
      }
      if (initObj.hasOwnProperty('tx_power')) {
        this.tx_power = initObj.tx_power
      }
      else {
        this.tx_power = '';
      }
      if (initObj.hasOwnProperty('quality')) {
        this.quality = initObj.quality
      }
      else {
        this.quality = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AccessPoint
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [essid]
    bufferOffset = _serializer.string(obj.essid, buffer, bufferOffset);
    // Serialize message field [macaddr]
    bufferOffset = _serializer.string(obj.macaddr, buffer, bufferOffset);
    // Serialize message field [signal]
    bufferOffset = _serializer.int32(obj.signal, buffer, bufferOffset);
    // Serialize message field [noise]
    bufferOffset = _serializer.int32(obj.noise, buffer, bufferOffset);
    // Serialize message field [snr]
    bufferOffset = _serializer.int32(obj.snr, buffer, bufferOffset);
    // Serialize message field [channel]
    bufferOffset = _serializer.int32(obj.channel, buffer, bufferOffset);
    // Serialize message field [rate]
    bufferOffset = _serializer.string(obj.rate, buffer, bufferOffset);
    // Serialize message field [tx_power]
    bufferOffset = _serializer.string(obj.tx_power, buffer, bufferOffset);
    // Serialize message field [quality]
    bufferOffset = _serializer.int32(obj.quality, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AccessPoint
    let len;
    let data = new AccessPoint(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [essid]
    data.essid = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [macaddr]
    data.macaddr = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [signal]
    data.signal = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [noise]
    data.noise = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [snr]
    data.snr = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [channel]
    data.channel = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rate]
    data.rate = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [tx_power]
    data.tx_power = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [quality]
    data.quality = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.essid.length;
    length += object.macaddr.length;
    length += object.rate.length;
    length += object.tx_power.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/AccessPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '810217d9e35df31ffb396ea5673d7d1b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates the state of the PR2's wifi access point.
    Header header
    string essid
    string macaddr
    int32 signal
    int32 noise
    int32 snr
    int32 channel
    string rate
    string tx_power
    int32 quality
    
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
    const resolved = new AccessPoint(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.essid !== undefined) {
      resolved.essid = msg.essid;
    }
    else {
      resolved.essid = ''
    }

    if (msg.macaddr !== undefined) {
      resolved.macaddr = msg.macaddr;
    }
    else {
      resolved.macaddr = ''
    }

    if (msg.signal !== undefined) {
      resolved.signal = msg.signal;
    }
    else {
      resolved.signal = 0
    }

    if (msg.noise !== undefined) {
      resolved.noise = msg.noise;
    }
    else {
      resolved.noise = 0
    }

    if (msg.snr !== undefined) {
      resolved.snr = msg.snr;
    }
    else {
      resolved.snr = 0
    }

    if (msg.channel !== undefined) {
      resolved.channel = msg.channel;
    }
    else {
      resolved.channel = 0
    }

    if (msg.rate !== undefined) {
      resolved.rate = msg.rate;
    }
    else {
      resolved.rate = ''
    }

    if (msg.tx_power !== undefined) {
      resolved.tx_power = msg.tx_power;
    }
    else {
      resolved.tx_power = ''
    }

    if (msg.quality !== undefined) {
      resolved.quality = msg.quality;
    }
    else {
      resolved.quality = 0
    }

    return resolved;
    }
};

module.exports = AccessPoint;
