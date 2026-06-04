import QtQuick
import Quickshell
import qs.modules.bar.extra
import qs.services

Item {
  width: 30
  height: 30

  BarPill {
    anchors.centerIn: parent
    // icon: `${BrightnessService.percent}%`
    icon: "md-brightness_7"
  }
}
