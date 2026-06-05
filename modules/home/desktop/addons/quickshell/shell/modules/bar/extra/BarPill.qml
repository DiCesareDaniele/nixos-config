import QtQuick
import Quickshell
import qs.widgets
import qs.utils
import qs.services

Item {
  id: root

  required property string icon

  width: Style.capsuleHeight
  height: Style.capsuleHeight

  Rectangle {
    width: root.width
    height: root.height
    radius: Style.radiusS
    color: Color.mSurface
    anchors.centerIn: parent

    Icon {
      anchors.centerIn: parent
      icon: root.icon
    }
  }
}
