pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  // --- Key Colors: These are the main accent colors that define your app's style
  property color mPrimary: defaultColors.mPrimary
  property color mOnPrimary: defaultColors.mOnPrimary
  property color mSecondary: defaultColors.mSecondary
  property color mOnSecondary: defaultColors.mOnSecondary
  property color mTertiary: defaultColors.mTertiary
  property color mOnTertiary: defaultColors.mOnTertiary

  // --- Utility Colors: These colors serve specific, universal purposes like indicating errors
  property color mError: defaultColors.mError
  property color mOnError: defaultColors.mOnError

  // --- Surface and Variant Colors: These provide additional options for surfaces and their contents, creating visual hierarchy
  property color mSurface: defaultColors.mSurface
  property color mOnSurface: defaultColors.mOnSurface

  property color mSurfaceVariant: defaultColors.mSurfaceVariant
  property color mOnSurfaceVariant: defaultColors.mOnSurfaceVariant

  property color mOutline: defaultColors.mOutline
  property color mShadow: defaultColors.mShadow

  property color mHover: defaultColors.mHover
  property color mOnHover: defaultColors.mOnHover

  // --------------------------------
  // TODO: Default colors
  QtObject {
    id: defaultColors

    readonly property color base00: "#101010"
    readonly property color base01: "#252525"
    readonly property color base02: "#464646"
    readonly property color base03: "#525252"
    readonly property color base04: "#ababab"
    readonly property color base05: "#b9b9b9"
    readonly property color base06: "#e3e3e3"
    readonly property color base07: "#f7f7f7"
    readonly property color base08: "#7c7c7c"
    readonly property color base09: "#999999"
    readonly property color base0A: "#a0a0a0"
    readonly property color base0B: "#8e8e8e"
    readonly property color base0C: "#868686"
    readonly property color base0D: "#686868"
    readonly property color base0E: "#747474"
    readonly property color base0F: "#5e5e5e"

    readonly property color mPrimary: base05
    readonly property color mOnPrimary: base00

    readonly property color mSecondary: base04
    readonly property color mOnSecondary: base00

    readonly property color mTertiary: base03
    readonly property color mOnTertiary: base07

    readonly property color mError: base08
    readonly property color mOnError: base07

    readonly property color mSurface: base00
    readonly property color mOnSurface: base06

    readonly property color mSurfaceVariant: base01
    readonly property color mOnSurfaceVariant: base04

    readonly property color mOutline: base02
    readonly property color mShadow: base00

    readonly property color mHover: base05
    readonly property color mOnHover: base00
  }
}
