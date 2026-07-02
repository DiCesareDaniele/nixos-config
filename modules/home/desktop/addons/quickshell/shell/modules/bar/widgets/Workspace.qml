import QtQuick
import Quickshell
import Quickshell.Hyprland
import qs.widgets
import qs.utils

Rectangle {
  implicitHeight: Style.barHeight
  implicitWidth: child.width + 2 * Style.marginXXS
  radius: height / 2
  color: Color.mSurface

  Row {
    id: child
    anchors.centerIn: parent

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

        implicitHeight: Style.barHeight - Style.marginXXS
        implicitWidth: Style.barHeight - Style.marginXXS
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"

        Icon {
          anchors.centerIn: parent
          color: Color.mOnSurface
          icon: isActive() ? "md-record_circle" : "md-circle_medium"
        }

        MouseArea {
          anchors.fill: parent
          // TODO: use service instead of calling Hyprland directly
          onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${ws}})`)
        }
      }
    }
  }
}
