pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property string time: {
    Qt.formatDateTime(clock.date, "MMM d hh:mm:ss")
  }

  // TODO: add other properties

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
