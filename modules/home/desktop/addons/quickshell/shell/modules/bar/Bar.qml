import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.bar

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  color: "transparent"

  implicitHeight: 30

  margins {
    top: 10
    left: 10
    right: 10
  }

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

    RowLayout {
      anchors.right: parent.right

      Battery {}
      Volume {}
    }
  }
}
