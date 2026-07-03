import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.bar.widgets
import qs.utils

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      implicitHeight: Style.barHeight

      anchors {
        top: true
        left: true
        right: true
      }

      margins {
        top: Style.marginM
        left: Style.marginM
        right: Style.marginM
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

          Island {}
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
  }
}
