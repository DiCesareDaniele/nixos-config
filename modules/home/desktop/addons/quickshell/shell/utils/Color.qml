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

    readonly property color mPrimary: "#fff59b"
    readonly property color mOnPrimary: "#0e0e43"

    readonly property color mSecondary: "#a9aefe"
    readonly property color mOnSecondary: "#0e0e43"

    readonly property color mTertiary: "#9BFECE"
    readonly property color mOnTertiary: "#0e0e43"

    readonly property color mError: "#FD4663"
    readonly property color mOnError: "#0e0e43"

    readonly property color mSurface: "#070722"
    readonly property color mOnSurface: "#f3edf7"

    readonly property color mSurfaceVariant: "#11112d"
    readonly property color mOnSurfaceVariant: "#7c80b4"

    readonly property color mOutline: "#21215F"
    readonly property color mShadow: "#070722"

    readonly property color mHover: "#9BFECE"
    readonly property color mOnHover: "#0e0e43"
  }
}
