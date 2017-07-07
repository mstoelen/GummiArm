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

class GPUStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.product_name = null;
      this.pci_device_id = null;
      this.pci_location = null;
      this.display = null;
      this.driver_version = null;
      this.temperature = null;
      this.fan_speed = null;
      this.gpu_usage = null;
      this.memory_usage = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('product_name')) {
        this.product_name = initObj.product_name
      }
      else {
        this.product_name = '';
      }
      if (initObj.hasOwnProperty('pci_device_id')) {
        this.pci_device_id = initObj.pci_device_id
      }
      else {
        this.pci_device_id = '';
      }
      if (initObj.hasOwnProperty('pci_location')) {
        this.pci_location = initObj.pci_location
      }
      else {
        this.pci_location = '';
      }
      if (initObj.hasOwnProperty('display')) {
        this.display = initObj.display
      }
      else {
        this.display = '';
      }
      if (initObj.hasOwnProperty('driver_version')) {
        this.driver_version = initObj.driver_version
      }
      else {
        this.driver_version = '';
      }
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0.0;
      }
      if (initObj.hasOwnProperty('fan_speed')) {
        this.fan_speed = initObj.fan_speed
      }
      else {
        this.fan_speed = 0.0;
      }
      if (initObj.hasOwnProperty('gpu_usage')) {
        this.gpu_usage = initObj.gpu_usage
      }
      else {
        this.gpu_usage = 0.0;
      }
      if (initObj.hasOwnProperty('memory_usage')) {
        this.memory_usage = initObj.memory_usage
      }
      else {
        this.memory_usage = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPUStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [product_name]
    bufferOffset = _serializer.string(obj.product_name, buffer, bufferOffset);
    // Serialize message field [pci_device_id]
    bufferOffset = _serializer.string(obj.pci_device_id, buffer, bufferOffset);
    // Serialize message field [pci_location]
    bufferOffset = _serializer.string(obj.pci_location, buffer, bufferOffset);
    // Serialize message field [display]
    bufferOffset = _serializer.string(obj.display, buffer, bufferOffset);
    // Serialize message field [driver_version]
    bufferOffset = _serializer.string(obj.driver_version, buffer, bufferOffset);
    // Serialize message field [temperature]
    bufferOffset = _serializer.float32(obj.temperature, buffer, bufferOffset);
    // Serialize message field [fan_speed]
    bufferOffset = _serializer.float32(obj.fan_speed, buffer, bufferOffset);
    // Serialize message field [gpu_usage]
    bufferOffset = _serializer.float32(obj.gpu_usage, buffer, bufferOffset);
    // Serialize message field [memory_usage]
    bufferOffset = _serializer.float32(obj.memory_usage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPUStatus
    let len;
    let data = new GPUStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [product_name]
    data.product_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pci_device_id]
    data.pci_device_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pci_location]
    data.pci_location = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [display]
    data.display = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [driver_version]
    data.driver_version = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fan_speed]
    data.fan_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gpu_usage]
    data.gpu_usage = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [memory_usage]
    data.memory_usage = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.product_name.length;
    length += object.pci_device_id.length;
    length += object.pci_location.length;
    length += object.display.length;
    length += object.driver_version.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/GPUStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c74e5474b8aade04e56108262099c6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    string product_name
    string pci_device_id
    string pci_location
    string display
    string driver_version
    float32 temperature # Temperature in Celcius
    float32 fan_speed # Fan speed in rad/s
    float32 gpu_usage # Usage in percent
    float32 memory_usage # Usage in percent
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
    const resolved = new GPUStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.product_name !== undefined) {
      resolved.product_name = msg.product_name;
    }
    else {
      resolved.product_name = ''
    }

    if (msg.pci_device_id !== undefined) {
      resolved.pci_device_id = msg.pci_device_id;
    }
    else {
      resolved.pci_device_id = ''
    }

    if (msg.pci_location !== undefined) {
      resolved.pci_location = msg.pci_location;
    }
    else {
      resolved.pci_location = ''
    }

    if (msg.display !== undefined) {
      resolved.display = msg.display;
    }
    else {
      resolved.display = ''
    }

    if (msg.driver_version !== undefined) {
      resolved.driver_version = msg.driver_version;
    }
    else {
      resolved.driver_version = ''
    }

    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0.0
    }

    if (msg.fan_speed !== undefined) {
      resolved.fan_speed = msg.fan_speed;
    }
    else {
      resolved.fan_speed = 0.0
    }

    if (msg.gpu_usage !== undefined) {
      resolved.gpu_usage = msg.gpu_usage;
    }
    else {
      resolved.gpu_usage = 0.0
    }

    if (msg.memory_usage !== undefined) {
      resolved.memory_usage = msg.memory_usage;
    }
    else {
      resolved.memory_usage = 0.0
    }

    return resolved;
    }
};

module.exports = GPUStatus;
