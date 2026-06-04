import QtQuick
import Quickshell
import qs.modules.bar.extra
import qs.utils
import qs.services

Item {
  width: Style.capsuleHeight
  height: Style.capsuleHeight

  BarPill {
    anchors.centerIn: parent
    icon: {
      const charging = BatteryService.charging;
      const fullyCharged = BatteryService.fullyCharged;
      const battery = BatteryService.percent;
      const batteryRounded = Math.round(battery / 10) * 10;
      const prefix = "md-battery" + (charging ? "_charging" : "");
      if (fullyCharged || batteryRounded === 100) {
        return prefix;
      }
      if (battery === 0) {
        return prefix + "_outline"; 
      }
      return prefix + "_" + batteryRounded;
    }
  }
}
