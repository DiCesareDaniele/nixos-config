import QtQuick
import Quickshell
import qs.widgets
import qs.utils
import qs.services

Item {
  id: root

  required property string icon

  implicitWidth: Style.barHeight
  implicitHeight: Style.barHeight

  Rectangle {
    implicitWidth: root.width
    implicitHeight: root.height
    radius: Style.radiusS
    color: Color.mSurface
    anchors.centerIn: parent

    Icon {
      anchors.centerIn: parent
      icon: root.icon
    }
  }
}
