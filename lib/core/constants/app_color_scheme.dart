import 'package:classipod/core/constants/app_palette.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class AppColorScheme {
  AppColorScheme._();

  static const CupertinoDynamicColor screenBackground =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.screenBackground,
        darkColor: AppPalette.darkScreenBackground,
      );

  static const CupertinoDynamicColor surface =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.screenBackground,
        darkColor: AppPalette.darkSurface,
      );

  static const CupertinoDynamicColor primaryText =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.primaryText,
        darkColor: AppPalette.darkPrimaryText,
      );

  static const CupertinoDynamicColor secondaryText =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.hintTextColor,
        darkColor: AppPalette.darkSecondaryText,
      );

  static const CupertinoDynamicColor inverseText =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.selectedText,
        darkColor: AppPalette.selectedText,
      );

  static const CupertinoDynamicColor ratingIcon =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.ratingIcon,
        darkColor: AppPalette.darkRatingIcon,
      );

  static const CupertinoDynamicColor outline =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.sliderBorderColor,
        darkColor: Color(0xFF2F2F33),
      );

  static const CupertinoDynamicColor deviceScreenBorder =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.deviceScreenBorderColor,
        darkColor: AppPalette.deviceScreenBorderColor,
      );

  static const CupertinoDynamicColor deviceScreenBackground =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.screenBackground,
        darkColor: AppPalette.darkScreenBackground,
      );

  static const CupertinoDynamicColor controlSurface =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.screenBackground,
        darkColor: AppPalette.darkDeviceControlBackgroundColor,
      );

  static const CupertinoDynamicColor iconEmphasis =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.primaryText,
        darkColor: AppPalette.darkPrimaryText,
      );

  static const CupertinoDynamicColor iconMuted =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.screenBackground,
        darkColor: Color(0xFF1A1C1F),
      );
}
