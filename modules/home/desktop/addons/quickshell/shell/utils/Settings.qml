pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  property JsonObject general: JsonObject {
    property real scaleRatio: 1.0
    property real radiusRatio: 1.0
    property real iRadiusRatio: 1.0
    property real boxRadiusRatio: 1.0
    property real screenRadiusRatio: 1.0
    property real animationSpeed: 1.0
  }
}
