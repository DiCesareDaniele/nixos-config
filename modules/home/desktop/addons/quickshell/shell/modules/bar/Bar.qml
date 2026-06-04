import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.bar.widgets
import qs.utils

PanelWindow {

  readonly property real barHeight: Style.barHeight
  readonly property real barMargin: Style.marginM

  implicitHeight: barHeight

  anchors {
    top: true
    left: true
    right: true
  }

  margins {
    top: barMargin
    left: barMargin
    right: barMargin
    bottom: 0
  }

  color: "transparent"

  Item {
    anchors.fill: parent

    // Left Section
    RowLayout {
      anchors.left: parent.left

      Workspace {}
    }

    // Center Section
    RowLayout {
      anchors.horizontalCenter: parent.horizontalCenter

      Island{}
    }

    // Right Section
    RowLayout {
      anchors.right: parent.right

      Volume {}
      Brightness {}
      Battery {}
    }
  }
}
