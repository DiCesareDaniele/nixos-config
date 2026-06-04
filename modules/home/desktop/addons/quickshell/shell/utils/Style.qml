pragma Singleton

import QtQuick
import Quickshell

Singleton {
  // Font size
  readonly property real fontSizeXXS: 8
  readonly property real fontSizeXS: 9
  readonly property real fontSizeS: 10
  readonly property real fontSizeM: 11
  readonly property real fontSizeL: 13
  readonly property real fontSizeXL: 16
  readonly property real fontSizeXXL: 18
  readonly property real fontSizeXXXL: 24

  // Font weight
  readonly property int fontWeightRegular: 400
  readonly property int fontWeightMedium: 500
  readonly property int fontWeightSemiBold: 600
  readonly property int fontWeightBold: 700

  // Container Radii: major layout sections (sidebars, cards, content panels)
  readonly property int radiusXXXS: Math.round(3 * Settings.general.radiusRatio)
  readonly property int radiusXXS: Math.round(4 * Settings.general.radiusRatio)
  readonly property int radiusXS: Math.round(8 * Settings.general.radiusRatio)
  readonly property int radiusS: Math.round(12 * Settings.general.radiusRatio)
  readonly property int radiusM: Math.round(16 * Settings.general.radiusRatio)
  readonly property int radiusL: Math.round(20 * Settings.general.radiusRatio)

  // Input radii: interactive elements (buttons, toggles, text fields)
  readonly property int iRadiusXXXS: Math.round(3 * Settings.general.iRadiusRatio)
  readonly property int iRadiusXXS: Math.round(4 * Settings.general.iRadiusRatio)
  readonly property int iRadiusXS: Math.round(8 * Settings.general.iRadiusRatio)
  readonly property int iRadiusS: Math.round(12 * Settings.general.iRadiusRatio)
  readonly property int iRadiusM: Math.round(16 * Settings.general.iRadiusRatio)
  readonly property int iRadiusL: Math.round(20 * Settings.general.iRadiusRatio)

  readonly property int screenRadius: Math.round(20 * Settings.general.screenRadiusRatio)

  // Border
  readonly property int borderS: Math.max(1, Math.round(1 * uiScaleRatio))
  readonly property int borderM: Math.max(1, Math.round(2 * uiScaleRatio))
  readonly property int borderL: Math.max(1, Math.round(3 * uiScaleRatio))

  // Margins (for margins and spacing)
  readonly property int marginXXXS: Math.round(1 * uiScaleRatio)
  readonly property int marginXXS: Math.round(2 * uiScaleRatio)
  readonly property int marginXS: Math.round(4 * uiScaleRatio)
  readonly property int marginS: Math.round(6 * uiScaleRatio)
  readonly property int marginM: Math.round(9 * uiScaleRatio)
  readonly property int marginL: Math.round(13 * uiScaleRatio)
  readonly property int marginXL: Math.round(18 * uiScaleRatio)

  // Double margins, for proper container sizing only (e.g. height: id.implicitHeight + Style.margin2M)
  readonly property int margin2XXXS: marginXXXS * 2
  readonly property int margin2XXS: marginXXS * 2
  readonly property int margin2XS: marginXS * 2
  readonly property int margin2S: marginS * 2
  readonly property int margin2M: marginM * 2
  readonly property int margin2L: marginL * 2
  readonly property int margin2XL: marginXL * 2

  // Opacity
  readonly property real opacityNone: 0.0
  readonly property real opacityLight: 0.25
  readonly property real opacityMedium: 0.5
  readonly property real opacityHeavy: 0.75
  readonly property real opacityAlmost: 0.95
  readonly property real opacityFull: 1.0

  // Widgets base size
  readonly property real baseWidgetSize: 33
  readonly property real sliderWidth: 200

  readonly property real uiScaleRatio: Settings.general.scaleRatio

  // Bar Height
  readonly property real barHeight: 33

  // Capsule Height
  // Note: capsule must always be smaller than barHeight to account for border rendering
  // Qt Quick Rectangle borders are drawn centered on edges (half inside, half outside)
  readonly property real capsuleHeight: barHeight * 0.82

  // The base/default font size for all texts in the bar
  readonly property real _barBaseFontSize: Math.max(1, (Style.barHeight / Style.capsuleHeight) * Style.fontSizeXXS)
  readonly property real barFontSize: _barBaseFontSize

  readonly property color capsuleColor: Color.mSurfaceVariant

  readonly property color capsuleBorderColor: Color.mPrimary
  readonly property int capsuleBorderWidth: Style.borderS

  readonly property color boxBorderColor: Color.mOutline
}
