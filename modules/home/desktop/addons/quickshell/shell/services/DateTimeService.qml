pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property string time: {
    Qt.formatDateTime(clock.date, "hh:mm");
  }

  // TODO: add other properties

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
