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

class PressureState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.l_finger_tip = null;
      this.r_finger_tip = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('l_finger_tip')) {
        this.l_finger_tip = initObj.l_finger_tip
      }
      else {
        this.l_finger_tip = [];
      }
      if (initObj.hasOwnProperty('r_finger_tip')) {
        this.r_finger_tip = initObj.r_finger_tip
      }
      else {
        this.r_finger_tip = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PressureState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [l_finger_tip]
    bufferOffset = _arraySerializer.int16(obj.l_finger_tip, buffer, bufferOffset, null);
    // Serialize message field [r_finger_tip]
    bufferOffset = _arraySerializer.int16(obj.r_finger_tip, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PressureState
    let len;
    let data = new PressureState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [l_finger_tip]
    data.l_finger_tip = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [r_finger_tip]
    data.r_finger_tip = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 2 * object.l_finger_tip.length;
    length += 2 * object.r_finger_tip.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/PressureState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '756fb3b75fa8884524fd0789a78eb04b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #Output from finger-tip pressure sensors on PR2
    #Higher number correspond to more pressure, but there is no explicit unit and you will have to calibrate for offset
    #The numbers reported are the raw values from the I2C hardware
    
    Header header
    int16[] l_finger_tip
    int16[] r_finger_tip
    
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
    const resolved = new PressureState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.l_finger_tip !== undefined) {
      resolved.l_finger_tip = msg.l_finger_tip;
    }
    else {
      resolved.l_finger_tip = []
    }

    if (msg.r_finger_tip !== undefined) {
      resolved.r_finger_tip = msg.r_finger_tip;
    }
    else {
      resolved.r_finger_tip = []
    }

    return resolved;
    }
};

module.exports = PressureState;
