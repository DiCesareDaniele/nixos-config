pragma Singleton

import QtQuick
import Quickshell

// import Quickshell.Io

Singleton {
  property bool isDebug: false

  component General: QtObject {
    property real scaleRatio: 1.0
    property real radiusRatio: 1.0
    property real iRadiusRatio: 1.0
    property real boxRadiusRatio: 1.0
    property real screenRadiusRatio: 1.0
    property real animationSpeed: 1.0
  }

  readonly property General general: General {}
}
