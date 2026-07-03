import QtQuick
import Quickshell.Hyprland
import qs.widgets
import qs.utils

Rectangle {
  implicitHeight: Style.barHeight
  implicitWidth: row.width + 2 * Style.marginS
  radius: height / 2
  color: Color.mSurface

  Row {
    id: row
    anchors.centerIn: parent

    Repeater {
      model: 10

      delegate: Rectangle {
        required property int index
        property int ws: index + 1

        function currWorkspace() {
          var ws = Hyprland.focusedWorkspace;
          return ws ? ws.id : -1;
        }

        function isActive() {
          return currWorkspace() === ws;
        }

        implicitHeight: Style.barHeight - Style.marginL
        implicitWidth: Style.barHeight - Style.marginL
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"

        Icon {
          anchors.centerIn: parent
          color: Color.mOnSurface
          icon: parent.isActive() ? "md-record_circle" : "md-circle_medium"
        }

        MouseArea {
          anchors.fill: parent
          // TODO: use service instead of calling Hyprland directly
          onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${parent.ws}})`)
        }
      }
    }
  }
}
