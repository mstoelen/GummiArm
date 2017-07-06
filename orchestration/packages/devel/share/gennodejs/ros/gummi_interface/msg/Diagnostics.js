// Auto-generated. Do not edit!

// (in-package gummi_interface.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Diagnostics {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.equilibrium = null;
      this.cocontraction = null;
      this.ballistic = null;
      this.encoder = null;
      this.alpha_flexor = null;
      this.alpha_extensor = null;
      this.forward_error = null;
    }
    else {
      if (initObj.hasOwnProperty('equilibrium')) {
        this.equilibrium = initObj.equilibrium
      }
      else {
        this.equilibrium = 0.0;
      }
      if (initObj.hasOwnProperty('cocontraction')) {
        this.cocontraction = initObj.cocontraction
      }
      else {
        this.cocontraction = 0.0;
      }
      if (initObj.hasOwnProperty('ballistic')) {
        this.ballistic = initObj.ballistic
      }
      else {
        this.ballistic = 0.0;
      }
      if (initObj.hasOwnProperty('encoder')) {
        this.encoder = initObj.encoder
      }
      else {
        this.encoder = 0.0;
      }
      if (initObj.hasOwnProperty('alpha_flexor')) {
        this.alpha_flexor = initObj.alpha_flexor
      }
      else {
        this.alpha_flexor = 0.0;
      }
      if (initObj.hasOwnProperty('alpha_extensor')) {
        this.alpha_extensor = initObj.alpha_extensor
      }
      else {
        this.alpha_extensor = 0.0;
      }
      if (initObj.hasOwnProperty('forward_error')) {
        this.forward_error = initObj.forward_error
      }
      else {
        this.forward_error = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Diagnostics
    // Serialize message field [equilibrium]
    bufferOffset = _serializer.float64(obj.equilibrium, buffer, bufferOffset);
    // Serialize message field [cocontraction]
    bufferOffset = _serializer.float64(obj.cocontraction, buffer, bufferOffset);
    // Serialize message field [ballistic]
    bufferOffset = _serializer.float64(obj.ballistic, buffer, bufferOffset);
    // Serialize message field [encoder]
    bufferOffset = _serializer.float64(obj.encoder, buffer, bufferOffset);
    // Serialize message field [alpha_flexor]
    bufferOffset = _serializer.float64(obj.alpha_flexor, buffer, bufferOffset);
    // Serialize message field [alpha_extensor]
    bufferOffset = _serializer.float64(obj.alpha_extensor, buffer, bufferOffset);
    // Serialize message field [forward_error]
    bufferOffset = _serializer.float64(obj.forward_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Diagnostics
    let len;
    let data = new Diagnostics(null);
    // Deserialize message field [equilibrium]
    data.equilibrium = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cocontraction]
    data.cocontraction = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ballistic]
    data.ballistic = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [encoder]
    data.encoder = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [alpha_flexor]
    data.alpha_flexor = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [alpha_extensor]
    data.alpha_extensor = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [forward_error]
    data.forward_error = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gummi_interface/Diagnostics';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0c4c6ef5a9afa1f2c1607160e439c7d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 equilibrium
    float64 cocontraction
    float64 ballistic
    float64 encoder
    float64 alpha_flexor
    float64 alpha_extensor
    float64 forward_error
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Diagnostics(null);
    if (msg.equilibrium !== undefined) {
      resolved.equilibrium = msg.equilibrium;
    }
    else {
      resolved.equilibrium = 0.0
    }

    if (msg.cocontraction !== undefined) {
      resolved.cocontraction = msg.cocontraction;
    }
    else {
      resolved.cocontraction = 0.0
    }

    if (msg.ballistic !== undefined) {
      resolved.ballistic = msg.ballistic;
    }
    else {
      resolved.ballistic = 0.0
    }

    if (msg.encoder !== undefined) {
      resolved.encoder = msg.encoder;
    }
    else {
      resolved.encoder = 0.0
    }

    if (msg.alpha_flexor !== undefined) {
      resolved.alpha_flexor = msg.alpha_flexor;
    }
    else {
      resolved.alpha_flexor = 0.0
    }

    if (msg.alpha_extensor !== undefined) {
      resolved.alpha_extensor = msg.alpha_extensor;
    }
    else {
      resolved.alpha_extensor = 0.0
    }

    if (msg.forward_error !== undefined) {
      resolved.forward_error = msg.forward_error;
    }
    else {
      resolved.forward_error = 0.0
    }

    return resolved;
    }
};

module.exports = Diagnostics;
