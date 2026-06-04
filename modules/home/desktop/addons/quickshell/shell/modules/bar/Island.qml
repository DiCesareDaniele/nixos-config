import QtQuick
import Quickshell
import qs.services

Rectangle {
  width: 200
  height: 30
  radius: 15
  color: "black"

  Text {
    anchors.centerIn: parent

    text: DateTimeService.time
    color: "white"
  }
}
