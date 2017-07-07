// Auto-generated. Do not edit!

// (in-package pr2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PowerBoardState = require('./PowerBoardState.js');
let PowerState = require('./PowerState.js');
let AccessPoint = require('./AccessPoint.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DashboardState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motors_halted = null;
      this.motors_halted_valid = null;
      this.power_board_state = null;
      this.power_board_state_valid = null;
      this.power_state = null;
      this.power_state_valid = null;
      this.access_point = null;
      this.access_point_valid = null;
    }
    else {
      if (initObj.hasOwnProperty('motors_halted')) {
        this.motors_halted = initObj.motors_halted
      }
      else {
        this.motors_halted = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('motors_halted_valid')) {
        this.motors_halted_valid = initObj.motors_halted_valid
      }
      else {
        this.motors_halted_valid = false;
      }
      if (initObj.hasOwnProperty('power_board_state')) {
        this.power_board_state = initObj.power_board_state
      }
      else {
        this.power_board_state = new PowerBoardState();
      }
      if (initObj.hasOwnProperty('power_board_state_valid')) {
        this.power_board_state_valid = initObj.power_board_state_valid
      }
      else {
        this.power_board_state_valid = false;
      }
      if (initObj.hasOwnProperty('power_state')) {
        this.power_state = initObj.power_state
      }
      else {
        this.power_state = new PowerState();
      }
      if (initObj.hasOwnProperty('power_state_valid')) {
        this.power_state_valid = initObj.power_state_valid
      }
      else {
        this.power_state_valid = false;
      }
      if (initObj.hasOwnProperty('access_point')) {
        this.access_point = initObj.access_point
      }
      else {
        this.access_point = new AccessPoint();
      }
      if (initObj.hasOwnProperty('access_point_valid')) {
        this.access_point_valid = initObj.access_point_valid
      }
      else {
        this.access_point_valid = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DashboardState
    // Serialize message field [motors_halted]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.motors_halted, buffer, bufferOffset);
    // Serialize message field [motors_halted_valid]
    bufferOffset = _serializer.bool(obj.motors_halted_valid, buffer, bufferOffset);
    // Serialize message field [power_board_state]
    bufferOffset = PowerBoardState.serialize(obj.power_board_state, buffer, bufferOffset);
    // Serialize message field [power_board_state_valid]
    bufferOffset = _serializer.bool(obj.power_board_state_valid, buffer, bufferOffset);
    // Serialize message field [power_state]
    bufferOffset = PowerState.serialize(obj.power_state, buffer, bufferOffset);
    // Serialize message field [power_state_valid]
    bufferOffset = _serializer.bool(obj.power_state_valid, buffer, bufferOffset);
    // Serialize message field [access_point]
    bufferOffset = AccessPoint.serialize(obj.access_point, buffer, bufferOffset);
    // Serialize message field [access_point_valid]
    bufferOffset = _serializer.bool(obj.access_point_valid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DashboardState
    let len;
    let data = new DashboardState(null);
    // Deserialize message field [motors_halted]
    data.motors_halted = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [motors_halted_valid]
    data.motors_halted_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power_board_state]
    data.power_board_state = PowerBoardState.deserialize(buffer, bufferOffset);
    // Deserialize message field [power_board_state_valid]
    data.power_board_state_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power_state]
    data.power_state = PowerState.deserialize(buffer, bufferOffset);
    // Deserialize message field [power_state_valid]
    data.power_state_valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [access_point]
    data.access_point = AccessPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [access_point_valid]
    data.access_point_valid = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PowerBoardState.getMessageSize(object.power_board_state);
    length += PowerState.getMessageSize(object.power_state);
    length += AccessPoint.getMessageSize(object.access_point);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pr2_msgs/DashboardState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'db0cd0d535d75e0f6257b20c403e87f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message communicates state information that might be used by a
    # dashboard application.
    std_msgs/Bool motors_halted
    bool motors_halted_valid
    
    pr2_msgs/PowerBoardState power_board_state
    bool power_board_state_valid
    
    pr2_msgs/PowerState power_state
    bool power_state_valid
    
    pr2_msgs/AccessPoint access_point
    bool access_point_valid
    
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    ================================================================================
    MSG: pr2_msgs/PowerBoardState
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
    
    ================================================================================
    MSG: pr2_msgs/PowerState
    # This message communicates the state of the PR2's power system.
    Header header
    float64 power_consumption ## Watts
    duration time_remaining ## estimated time to empty or full
    string prediction_method ## how time_remaining is being calculated
    int8  relative_capacity ## percent of capacity
    int8  AC_present ## number of packs detecting AC power, > 0 means plugged in
    
    ================================================================================
    MSG: pr2_msgs/AccessPoint
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DashboardState(null);
    if (msg.motors_halted !== undefined) {
      resolved.motors_halted = std_msgs.msg.Bool.Resolve(msg.motors_halted)
    }
    else {
      resolved.motors_halted = new std_msgs.msg.Bool()
    }

    if (msg.motors_halted_valid !== undefined) {
      resolved.motors_halted_valid = msg.motors_halted_valid;
    }
    else {
      resolved.motors_halted_valid = false
    }

    if (msg.power_board_state !== undefined) {
      resolved.power_board_state = PowerBoardState.Resolve(msg.power_board_state)
    }
    else {
      resolved.power_board_state = new PowerBoardState()
    }

    if (msg.power_board_state_valid !== undefined) {
      resolved.power_board_state_valid = msg.power_board_state_valid;
    }
    else {
      resolved.power_board_state_valid = false
    }

    if (msg.power_state !== undefined) {
      resolved.power_state = PowerState.Resolve(msg.power_state)
    }
    else {
      resolved.power_state = new PowerState()
    }

    if (msg.power_state_valid !== undefined) {
      resolved.power_state_valid = msg.power_state_valid;
    }
    else {
      resolved.power_state_valid = false
    }

    if (msg.access_point !== undefined) {
      resolved.access_point = AccessPoint.Resolve(msg.access_point)
    }
    else {
      resolved.access_point = new AccessPoint()
    }

    if (msg.access_point_valid !== undefined) {
      resolved.access_point_valid = msg.access_point_valid;
    }
    else {
      resolved.access_point_valid = false
    }

    return resolved;
    }
};

module.exports = DashboardState;
