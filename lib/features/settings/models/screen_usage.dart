import 'dart:math' as math;

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:flutter/cupertino.dart';

/// Percentage of the vertical screen space the device is allowed to occupy.
///
/// The remaining space is left at the top of the screen and painted solid
/// black, which keeps the whole device within reach on tall phones.
abstract final class ScreenUsage {
  static const int fullUsagePercentage = 100;
  static const int lowestUsagePercentage = 40;
  static const int stepPercentage = 5;

  /// Layout constants mirroring the ones the device frame lays out with.
  static const double _maxDeviceWidth = 450;
  static const double _horizontalFramePadding = 40;
  static const double _topFramePadding = 30;
  static const double _bottomFramePadding = 20;
  static const double _deviceScreenBorder = 10;

  /// Selectable percentages, from the largest to the smallest.
  static final List<int> allOptions = List<int>.unmodifiable(
    List<int>.generate(
      ((fullUsagePercentage - lowestUsagePercentage) ~/ stepPercentage) + 1,
      (index) => fullUsagePercentage - (index * stepPercentage),
    ),
  );

  /// Smallest percentage that still leaves room for the device screen and the
  /// whole click wheel. Shrinking any further would push the controls out of
  /// the frame, so the click wheel size caps how far the device can scale
  /// down.
  static int minimumUsagePercentage(
    BuildContext context,
    ClickWheelSize clickWheelSize,
  ) {
    // Read the real view instead of the ambient MediaQuery, which is
    // overridden both by this feature and by the device screen itself.
    final MediaQueryData viewMediaQuery = MediaQueryData.fromView(
      View.of(context),
    );
    final Size screenSize = viewMediaQuery.size;
    if (screenSize.height <= 0) {
      return fullUsagePercentage;
    }

    final double deviceWidth = math.min(
      _maxDeviceWidth,
      screenSize.width - _horizontalFramePadding,
    );
    final double clickWheelDiameter =
        (deviceWidth + _horizontalFramePadding) * clickWheelSize.radiusRatio;
    final double requiredHeight =
        _topFramePadding +
        Constants.screenHeight +
        _deviceScreenBorder +
        clickWheelDiameter +
        math.max(_bottomFramePadding, viewMediaQuery.padding.bottom);

    final double requiredPercentage =
        (requiredHeight / screenSize.height) * fullUsagePercentage;
    final int steppedPercentage =
        (requiredPercentage / stepPercentage).ceil() * stepPercentage;

    return steppedPercentage.clamp(lowestUsagePercentage, fullUsagePercentage);
  }

  /// The percentages that can be selected with the current click wheel size.
  static List<int> optionsFor(
    BuildContext context,
    ClickWheelSize clickWheelSize,
  ) {
    final int minimum = minimumUsagePercentage(context, clickWheelSize);
    return allOptions.where((option) => option >= minimum).toList();
  }

  /// Clamps [percentage] to the closest valid option.
  static int sanitize(int percentage) {
    final int rounded = (percentage / stepPercentage).round() * stepPercentage;
    return rounded.clamp(lowestUsagePercentage, fullUsagePercentage);
  }

  static String title(int percentage) => "$percentage%";
}
