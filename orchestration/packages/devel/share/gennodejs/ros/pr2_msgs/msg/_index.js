
"use strict";

let GPUStatus = require('./GPUStatus.js');
let LaserTrajCmd = require('./LaserTrajCmd.js');
let AccelerometerState = require('./AccelerometerState.js');
let AccessPoint = require('./AccessPoint.js');
let BatteryServer = require('./BatteryServer.js');
let LaserScannerSignal = require('./LaserScannerSignal.js');
let BatteryState = require('./BatteryState.js');
let BatteryState2 = require('./BatteryState2.js');
let DashboardState = require('./DashboardState.js');
let BatteryServer2 = require('./BatteryServer2.js');
let PeriodicCmd = require('./PeriodicCmd.js');
let PowerState = require('./PowerState.js');
let PressureState = require('./PressureState.js');
let PowerBoardState = require('./PowerBoardState.js');

module.exports = {
  GPUStatus: GPUStatus,
  LaserTrajCmd: LaserTrajCmd,
  AccelerometerState: AccelerometerState,
  AccessPoint: AccessPoint,
  BatteryServer: BatteryServer,
  LaserScannerSignal: LaserScannerSignal,
  BatteryState: BatteryState,
  BatteryState2: BatteryState2,
  DashboardState: DashboardState,
  BatteryServer2: BatteryServer2,
  PeriodicCmd: PeriodicCmd,
  PowerState: PowerState,
  PressureState: PressureState,
  PowerBoardState: PowerBoardState,
};
