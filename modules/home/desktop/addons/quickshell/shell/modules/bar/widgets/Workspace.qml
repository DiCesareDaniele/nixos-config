import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.widgets
import qs.utils

Rectangle {
  height: Style.capsuleHeight
  width: child.width + 2 * Style.marginXXS
  radius: height / 2
  color: Color.mSurface

  Row {
    anchors.centerIn: parent
    id: child

    Repeater {
      model: 10

      delegate: Rectangle {
        property int ws: index + 1

        function currWorkspace() {
          var ws = Hyprland.focusedWorkspace
          return ws ? ws.id : -1
        }

        function isActive() {
          return currWorkspace() === ws
        }

        height: Style.capsuleHeight * 0.8
        width: Style.capsuleHeight * 0.8
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"

        Icon {
          anchors.centerIn: parent
          color: isActive() ? Color.mOnSurface : "gray"
          icon: isActive() ? "md-stop_circle" : "md-circle_medium"
        }

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${ws}})`)
        }
      }
    }
  }
}
