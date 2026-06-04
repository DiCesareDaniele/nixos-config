pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  property int devBrightness: 0
  property int maxBrightness: 1

  readonly property real brightness: devBrightness / maxBrightness
  readonly property int percent: Math.round(brightness * 100)

  property string backlightPath: ""

  function refresh() {
    if (backlightPath === "") {
      getBacklightPath.running = true
    }
    getBrightness.running = true
  }

  function setBrightness(percent) {
    const value = Math.max(0, Math.min(100, percent))
    setBrightness.command = [
      "brightnessctl",
      "set",
      `${Math.round(value)}%`
    ]
    setBrightness.running = true
  }

  Process {
    id: getBrightness
    command: ["brightnessctl", "-m"]

    stdout: SplitParser {
      onRead: data => {
        const parts = data.trim().split(",")
        if (parts.length >= 5) {
          devBrightness = Number(parts[2])
          maxBrightness = Number(parts[4])
        }
      }
    }
  }

  Process {
    id: setBrightness
    onExited: refresh()
  }

  Process {
    id: getBacklightPath
    command: ["sh", "-c", "ls /sys/class/backlight | head -n 1"]

    stdout: SplitParser {
      onRead: data => {
        const device = data.trim()
        backlightPath = `/sys/class/backlight/${device}/brightness`
      }
    }
  }

  readonly property FileView brightnessWatcher: FileView {
    path: backlightPath
    watchChanges: backlightPath !== ""
    onFileChanged: {
      Qt.callLater(refresh);
    }
  }

  Component.onCompleted: refresh()
}
