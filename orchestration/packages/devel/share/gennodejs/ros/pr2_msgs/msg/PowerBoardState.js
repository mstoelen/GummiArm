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

class PowerBoardState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.name = null;
      this.serial_num = null;
      this.input_voltage = null;
      this.master_state = null;
      this.circuit_state = null;
      this.circuit_voltage = null;
      this.run_stop = null;
      this.wireless_stop = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('serial_num')) {
        this.serial_num = initObj.serial_num
      }
      else {
        this.serial_num = 0;
      }
      if (initObj.hasOwnProperty('input_voltage')) {
        this.input_voltage = initObj.input_voltage
      }
      else {
        this.input_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('master_state')) {
        this.master_state = initObj.master_state
      }
      else {
        this.master_state = 0;
      }
      if (initObj.hasOwnProperty('circuit_state')) {
        this.circuit_state = initObj.circuit_state
      }
      else {
        this.circuit_state = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('circuit_voltage')) {
        this.circuit_voltage = initObj.circuit_voltage
      }
      else {
        this.circuit_voltage = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('run_stop')) {
        this.run_stop = initObj.run_stop
      }
      else {
        this.run_stop = false;
      }
      if (initObj.hasOwnProperty('wireless_stop')) {
        this.wireless_stop = initObj.wireless_stop
      }
      else {
        this.wireless_stop = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PowerBoardState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [serial_num]
    bufferOffset = _serializer.uint32(obj.serial_num, buffer, bufferOffset);
    // Serialize message field [input_voltage]
    bufferOffset = _serializer.float64(obj.input_voltage, buffer, bufferOffset);
    // Serialize message field [master_state]
    bufferOffset = _serializer.int8(obj.master_state, buffer, bufferOffset);
    // Check that the constant length array field [circuit_state] has the right length
    if (obj.circuit_state.length !== 3) {
      throw new Error('Unable to serialize array field circuit_state - length must be 3')
    }
    // Serialize message field [circuit_state]
    bufferOffset = _arraySerializer.int8(obj.circuit_state, buffer, bufferOffset, 3);
    // Check that the constant length array field [circuit_voltage] has the right length
    if (obj.circuit_voltage.length !== 3) {
      throw new Error('Unable to serialize array field circuit_voltage - length must be 3')
    }
    // Serialize message field [circuit_voltage]
    bufferOffset = _arraySerializer.float64(obj.circuit_voltage, buffer, bufferOffset, 3);
    // Serialize message field [run_stop]
    bufferOffset = _serializer.bool(obj.run_stop, buffer, bufferOffset);
    // Serialize message field [wireless_stop]
    bufferOffset = _serializer.bool(obj.wireless_stop, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PowerBoardState
    let len;
    let data = new PowerBoardState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [serial_num]
    data.serial_num = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [input_voltage]
    data.input_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [master_state]
    data.master_state = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [circuit_state]
    data.circuit_state = _arrayDeserializer.int8(buffer, bufferOffset, 3)
    // Deserialize message field [circuit_voltage]
    data.circuit_voltage = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [run_stop]
    data.run_stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wireless_stop]
    data.wireless_stop = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.name.length;
    return length + 46;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/PowerBoardState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08899b671e6a1a449e7ce0000da8ae7b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates the state of the PR2's power board.
    int8 STATE_NOPOWER=0
    int8 STATE_STANDBY=1
    int8 STATE_PUMPING=2
    int8 STATE_ON=3
    int8 STATE_ENABLED=3  # Preferred over STATE_ON, keeping STATE_ON for backcompat
    int8 STATE_DISABLED=4
    
    int8 MASTER_NOPOWER=0
    int8 MASTER_STANDBY=1
    int8 MASTER_ON=2
    int8 MASTER_OFF=3
    int8 MASTER_SHUTDOWN=4
    
    Header header
    string name # Name with serial number
    uint32 serial_num # Serial number for this board's message
    float64 input_voltage # Input voltage to power board
    
    # Master States:
    #  MASTER_NOPOWER, MASTER_STANDBY, MASTER_ON, MASTER_OFF, MASTER_SHUTDOWN 
    int8 master_state  # The master state machine's state in the powerboard
    
    # Circuit States:
    #  STATE_NOPOWER, STATE_STANDBY, STATE_PUMPING, STATE_ON, STATE_DISABLED
    int8[3] circuit_state # One of the above states
    float64[3] circuit_voltage  # Output voltage of each circuit
    
    # True if robot should be enabled
    bool run_stop           #Note - if the wireless run-stop is hit, this will be unobservable
    bool wireless_stop 
    
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
    const resolved = new PowerBoardState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.serial_num !== undefined) {
      resolved.serial_num = msg.serial_num;
    }
    else {
      resolved.serial_num = 0
    }

    if (msg.input_voltage !== undefined) {
      resolved.input_voltage = msg.input_voltage;
    }
    else {
      resolved.input_voltage = 0.0
    }

    if (msg.master_state !== undefined) {
      resolved.master_state = msg.master_state;
    }
    else {
      resolved.master_state = 0
    }

    if (msg.circuit_state !== undefined) {
      resolved.circuit_state = msg.circuit_state;
    }
    else {
      resolved.circuit_state = new Array(3).fill(0)
    }

    if (msg.circuit_voltage !== undefined) {
      resolved.circuit_voltage = msg.circuit_voltage;
    }
    else {
      resolved.circuit_voltage = new Array(3).fill(0)
    }

    if (msg.run_stop !== undefined) {
      resolved.run_stop = msg.run_stop;
    }
    else {
      resolved.run_stop = false
    }

    if (msg.wireless_stop !== undefined) {
      resolved.wireless_stop = msg.wireless_stop;
    }
    else {
      resolved.wireless_stop = false
    }

    return resolved;
    }
};

// Constants for message
PowerBoardState.Constants = {
  STATE_NOPOWER: 0,
  STATE_STANDBY: 1,
  STATE_PUMPING: 2,
  STATE_ON: 3,
  STATE_ENABLED: 3,
  STATE_DISABLED: 4,
  MASTER_NOPOWER: 0,
  MASTER_STANDBY: 1,
  MASTER_ON: 2,
  MASTER_OFF: 3,
  MASTER_SHUTDOWN: 4,
}

module.exports = PowerBoardState;
