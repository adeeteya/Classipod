import 'dart:async';

import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/custom_painter/next_button_custom_painter.dart';
import 'package:classipod/core/custom_painter/play_pause_button_custom_painter.dart';
import 'package:classipod/core/custom_painter/previous_button_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/device/models/click_wheel_rotation_tracker.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/click_wheel_sensitivity.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeviceControls extends ConsumerStatefulWidget {
  const DeviceControls({super.key});

  @override
  ConsumerState createState() => _DeviceControlsState();
}

class _DeviceControlsState extends ConsumerState<DeviceControls> {
  final GlobalKey _wheelBoxKey = GlobalKey();
  ClickWheelRotationTracker? _rotationTracker;

  void onWheelPointerDown(
    PointerDownEvent event, {
    required double innerDeadzoneRadius,
    required double thresholdDegrees,
  }) {
    ref.read(clickWheelGestureProvider.notifier).active = true;
    if (_rotationTracker != null) {
      return;
    }
    final RenderObject? renderObject = _wheelBoxKey.currentContext
        ?.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return;
    }
    final ClickWheelRotationTracker tracker = ClickWheelRotationTracker(
      thresholdDegrees: thresholdDegrees,
      minVelocityDegreesPerSecond:
          Constants.clickWheelAccelerationMinVelocityDegreesPerSecond,
      maxVelocityDegreesPerSecond:
          Constants.clickWheelMaxAngularVelocityDegreesPerSecond,
      accelerationFactor: Constants.clickWheelAccelerationFactor,
      maxStepsPerEvent: Constants.clickWheelMaxStepsPerPointerEvent,
    );
    tracker.begin(
      pointerId: event.pointer,
      // The click wheel circle is centered inside its box.
      wheelCenter: renderObject.size.center(Offset.zero),
      innerDeadzoneRadius: innerDeadzoneRadius,
    );
    _rotationTracker = tracker;
  }

  Future<void> onWheelPointerMove(PointerMoveEvent event) async {
    final ClickWheelRotationTracker? tracker = _rotationTracker;
    if (tracker == null || tracker.activePointerId != event.pointer) {
      return;
    }
    ref.read(splitScreenControllerProvider.notifier).onClickWheelScroll();
    final int steps = tracker.update(
      pointerId: event.pointer,
      localPosition: event.localPosition,
      timeStamp: event.timeStamp,
    );
    if (steps == 0) {
      return;
    }
    final DeviceAction deviceAction = steps.isNegative
        ? DeviceAction.rotateBackward
        : DeviceAction.rotateForward;
    for (int i = 0; i < steps.abs(); i++) {
      await ref
          .read(deviceButtonsServiceProvider.notifier)
          .setDeviceAction(deviceAction);
    }
  }

  void onWheelPointerEnd(PointerEvent event) {
    if (_rotationTracker?.activePointerId != event.pointer) {
      return;
    }
    _rotationTracker?.end(pointerId: event.pointer);
    _rotationTracker = null;
    ref.read(clickWheelGestureProvider.notifier).active = false;
  }

  @override
  Widget build(BuildContext context) {
    final DeviceColor deviceColor = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.deviceColor,
      ),
    );
    final deviceColorStyle = deviceColor.style;
    final clickWheelSize = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.clickWheelSize,
      ),
    );
    final clickWheelSensitivity = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.clickWheelSensitivity,
      ),
    );
    final clickWheelStep = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.clickWheelStep,
      ),
    );
    late final double clickWheelRadiusRatio;
    late final double selectButtonRadiusRatio;
    switch (clickWheelSize) {
      case ClickWheelSize.small:
        clickWheelRadiusRatio = Constants.deviceClickWheelSmallRadiusRatio;
        selectButtonRadiusRatio = Constants.deviceSelectButtonSmallRadiusRatio;
        break;
      case ClickWheelSize.medium:
        clickWheelRadiusRatio = Constants.deviceClickWheelMediumRadiusRatio;
        selectButtonRadiusRatio = Constants.deviceSelectButtonMediumRadiusRatio;
        break;
      case ClickWheelSize.large:
        clickWheelRadiusRatio = Constants.deviceClickWheelLargeRadiusRatio;
        selectButtonRadiusRatio = Constants.deviceSelectButtonLargeRadiusRatio;
        break;
    }

    late final double baseThresholdDegrees;
    switch (clickWheelSensitivity) {
      case ClickWheelSensitivity.veryLow:
        baseThresholdDegrees = Constants.clickWheelVeryLowSensitivityThreshold;
        break;
      case ClickWheelSensitivity.low:
        baseThresholdDegrees = Constants.clickWheelLowSensitivityThreshold;
        break;
      case ClickWheelSensitivity.medium:
        baseThresholdDegrees = Constants.clickWheelMediumSensitivityThreshold;
        break;
      case ClickWheelSensitivity.mediumHigh:
        baseThresholdDegrees =
            Constants.clickWheelMediumHighSensitivityThreshold;
        break;
      case ClickWheelSensitivity.high:
        baseThresholdDegrees = Constants.clickWheelHighSensitivityThreshold;
        break;
    }
    final double thresholdDegrees =
        baseThresholdDegrees / clickWheelStep.multiplier;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth + 40;
        final double wheelSize = screenWidth * clickWheelRadiusRatio;
        final double innerDeadzoneRadius =
            screenWidth * selectButtonRadiusRatio / 2;

        return Listener(
          key: _wheelBoxKey,
          onPointerDown: (event) => onWheelPointerDown(
            event,
            innerDeadzoneRadius: innerDeadzoneRadius,
            thresholdDegrees: thresholdDegrees,
          ),
          onPointerMove: onWheelPointerMove,
          onPointerUp: onWheelPointerEnd,
          onPointerCancel: onWheelPointerEnd,
          child: Container(
            height: wheelSize,
            width: wheelSize,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: deviceColorStyle.controlBackgroundColor,
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async => ref
                        .read(deviceButtonsServiceProvider.notifier)
                        .setDeviceAction(DeviceAction.menu),
                    onLongPress: () async {
                      await Future.wait([
                        ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .buttonPressVibrate(),
                        ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .clickWheelSound(),
                      ]);
                      if (context.mounted) {
                        context.goNamed(Routes.menu.name);
                        if (!ref
                            .read(splitScreenViewControllerProvider)
                            .isScreenVisible) {
                          unawaited(
                            ref
                                .read(splitScreenViewControllerProvider)
                                .openSplitView(),
                          );
                        }
                      }
                    },
                    child: ColoredBox(
                      color: deviceColorStyle.controlBackgroundColor,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          context.localization.menuButtonText,
                          key: menuButtonGlobalKey,
                          style: TextStyle(
                            color: deviceColorStyle.buttonAccentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      key: previousButtonGlobalKey,
                      child: GestureDetector(
                        onTap: () async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(DeviceAction.seekBackward),
                        onLongPress: () async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(
                              DeviceAction.seekBackwardLongPress,
                            ),
                        onLongPressEnd: (_) async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(DeviceAction.longPressEnd),
                        child: SizedBox(
                          height: screenWidth * 0.2175,
                          child: ColoredBox(
                            color: deviceColorStyle.controlBackgroundColor,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomPaint(
                                size: const Size(20, 10),
                                painter: PreviousButtonCustomPainter(
                                  color: deviceColorStyle.buttonIconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      key: centerButtonGlobalKey,
                      onTap: () async => ref
                          .read(deviceButtonsServiceProvider.notifier)
                          .setDeviceAction(DeviceAction.select),
                      onLongPress: () async => ref
                          .read(deviceButtonsServiceProvider.notifier)
                          .setDeviceAction(DeviceAction.selectLongPress),
                      onLongPressEnd: (_) async => ref
                          .read(deviceButtonsServiceProvider.notifier)
                          .setDeviceAction(DeviceAction.longPressEnd),
                      child: SizedBox(
                        height: screenWidth * selectButtonRadiusRatio,
                        width: screenWidth * selectButtonRadiusRatio,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: deviceColorStyle.controlBorderColor,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(Assets.noiseImage),
                              fit: BoxFit.cover,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors:
                                  deviceColorStyle.innerButtonGradientColors,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      key: nextButtonGlobalKey,
                      child: GestureDetector(
                        onTap: () async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(DeviceAction.seekForward),
                        onLongPress: () async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(DeviceAction.seekForwardLongPress),
                        onLongPressEnd: (_) async => ref
                            .read(deviceButtonsServiceProvider.notifier)
                            .setDeviceAction(DeviceAction.longPressEnd),
                        child: SizedBox(
                          height: screenWidth * selectButtonRadiusRatio,
                          child: ColoredBox(
                            color: deviceColorStyle.controlBackgroundColor,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomPaint(
                                size: const Size(20, 10),
                                painter: NextButtonCustomPainter(
                                  color: deviceColorStyle.buttonIconColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async => ref
                        .read(deviceButtonsServiceProvider.notifier)
                        .playPauseButtonClick(),
                    child: ColoredBox(
                      color: deviceColorStyle.controlBackgroundColor,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomPaint(
                          key: playPauseButtonGlobalKey,
                          size: const Size(26, 12),
                          painter: PlayPauseButtonCustomPainter(
                            color: deviceColorStyle.buttonIconColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
