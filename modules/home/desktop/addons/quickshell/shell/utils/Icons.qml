pragma Singleton

import QtQuick
import Quickshell
import qs.utils

Singleton {
  readonly property string fontFamily: "JetBrainsMono Nerd Font"

  readonly property string defaultIcon: IconsTable.defaultIcon
  readonly property var icons: IconsTable.icons
  readonly property var aliases: IconsTable.aliases

  function get(iconName) {
    if (aliases[iconName] !== undefined) {
      iconName = aliases[iconName];
    }

    return icons[iconName];
  }
}
