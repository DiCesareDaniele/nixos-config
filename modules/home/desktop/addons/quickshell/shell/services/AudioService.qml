pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  id: root

  readonly property PwNode sink: Pipewire.defaultAudioSink
  readonly property PwNode source: Pipewire.defaultAudioSource

  property real volume: sink?.audio?.volume ?? 0.0
  property int percent: Math.round(volume * 100)

  property bool muted: sink?.audio?.muted ?? false

  function setVolume(vol) {
    if (sink?.audio) {
      sink.audio.volume = Math.max(0.0, Math.min(1.0, vol))
    }
  }

  function toggleMute() {
    if (sink?.audio) {
      sink.audio.muted = !sink.audio.muted
    }
  }

  // TODO: add other methods
  
  PwObjectTracker {
    objects: [root.sink, root.source]
  }
}
