import QtQuick
import Quickshell
import Quickshell.Hyprland

Rectangle {
  radius: 14
  height: 30
  color: "transparent"

  width: child.width

  Row {
    id: child
    spacing: 6

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

        width: 28
        height: 24
        radius: 6

        color: isActive()
          ? "#3b82f6"
          : "#222222"

        border.color: isActive()
          ? "#60a5fa"
          : "transparent"

        Text {
          anchors.centerIn: parent
          text: ws 
          color: "white"
          font.bold: isActive()
        }

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${ws}})`)
        }
      }
    }
  }
}
