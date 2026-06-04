pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
  readonly property var battery: UPower.displayDevice
  readonly property bool available: battery && battery.isLaptopBattery

  readonly property int percent: available ? Math.round(battery.percentage * 100) : 0

  readonly property bool charging: available && battery.state === UPowerDeviceState.Charging
  readonly property bool fullyCharged: available && battery.state === UPowerDeviceState.FullyCharged

  readonly property real timeToEmpty: available ? battery.timeToEmpty : 0
  readonly property real timeToFull: available ? battery.timeToFull : 0
}
