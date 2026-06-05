import QtQuick
import Quickshell
import qs.utils
import qs.services

Rectangle {
  // TODO: do not hardcode this value
  width: 250
  height: Style.capsuleHeight
  radius: height / 2
  color: Color.mSurface

  Text {
    anchors.centerIn: parent

    text: DateTimeService.time
    color: Color.mOnSurface
  }
}
