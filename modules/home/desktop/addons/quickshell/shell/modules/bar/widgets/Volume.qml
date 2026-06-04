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
      const brightness = BrightnessService.percent
      if (brightness >= 75) {
        return "md-brightness_7";
      } else if (brightness >= 50) {
        return "md-brightness_4";
      } else if (brightness >= 25) {
        return "md-brightness_6";
      } else {
        return "md-brightness_5";
      }
    }
  }
}
