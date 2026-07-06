import QtQuick
import qs.utils
import qs.services

Rectangle {
  // TODO: do not hardcode this value
  implicitWidth: 250
  implicitHeight: Style.barHeight
  radius: height / 2
  color: Color.mSurface

  Text {
    anchors.centerIn: parent

    text: DateTimeService.time
    color: Color.mOnSurface
  }

  Loader {
    id: menu

    anchors.fill: parent
    sourceComponent: rect
    visible: false
  }

  MouseArea {
    anchors.fill: parent
    onClicked: menu.visible = !menu.visible
  }

  Component {
    id: rect
    Rectangle {
      width: 200
      height: 200
      color: "red"
    }
  }
}
