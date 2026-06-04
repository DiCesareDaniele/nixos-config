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
      if (AudioService.muted) {
        return "md-volume_mute";
      }
      const audio = AudioService.percent
      if (audio >= 66) {
        return "md-volume_high";
      } else if (audio >= 33) {
        return "md-volume_medium";
      } else if (audio > 0) {
        return "md-volume_low";
      } else {
        return "md-volume_off";
      }
    }
  }
}
