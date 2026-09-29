import 'package:classipod/core/constants/app_palette.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

abstract final class IpodGradients {
  static const LinearGradient selection = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.selectedTileGradientColor1,
      AppPalette.selectedTileGradientMiddle,
      AppPalette.selectedTileGradientColor2,
    ],
    stops: [0, 0.4, 1],
  );

  static const LinearGradient statusBar = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.statusBarGradientColor1,
      AppPalette.statusBarGradientMiddle,
      AppPalette.statusBarGradientColor2,
    ],
    stops: [0, 0.53, 1],
  );

  static const LinearGradient progress = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.nowProgressBarGradientColor1,
      AppPalette.nowProgressBarGradientColor2,
      AppPalette.nowProgressBarGradientColor3,
      AppPalette.nowProgressBarGradientColor4,
      AppPalette.nowProgressBarGradientColor6,
      AppPalette.nowProgressBarGradientColor7,
      AppPalette.nowProgressBarGradientColor8,
    ],
    stops: [0, 0.08, 0.46, 0.54, 0.69, 0.92, 1],
  );

  static const LinearGradient sliderTrack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.inActiveSliderGradientColor1,
      AppPalette.inactiveSliderGradientMiddle,
      AppPalette.inActiveSliderGradientColor2,
    ],
    stops: [0, 0.6, 1],
  );

  static const LinearGradient battery = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.batteryBarGradientColor1,
      AppPalette.batteryBarGradientColor2,
      AppPalette.batteryBarGradientColor4,
      AppPalette.batteryBarGradientColor5,
      AppPalette.batteryBarGradientColor6,
      AppPalette.batteryBarGradientColor7,
    ],
    stops: [0, 0.22, 0.44, 0.56, 0.89, 1],
  );

  // Existing app colors; not verified against original firmware.
  static const LinearGradient lowBattery = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.lowBatteryBarGradientColor1,
      AppPalette.lowBatteryBarGradientColor2,
    ],
  );

  static const LinearGradient batteryTrack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.batteryBarBackgroundGradientColor1,
      AppPalette.batteryBarBackgroundGradientColor2,
    ],
  );

  static const LinearGradient splitPreview = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.darkScreenBackgroundGradient1,
      AppPalette.darkScreenBackgroundGradient2,
    ],
  );

  static const LinearGradient darkStatusBar = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.darkStatusBarGradientColor1,
      AppPalette.darkStatusBarGradientColor2,
    ],
  );

  static const LinearGradient darkSliderTrack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppPalette.darkSliderGradientColor1,
      AppPalette.darkSliderGradientColor2,
    ],
  );
}
