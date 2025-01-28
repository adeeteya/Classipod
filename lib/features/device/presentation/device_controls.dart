import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/custom_painter/next_button_custom_painter.dart';
import 'package:classipod/core/custom_painter/play_pause_button_custom_painter.dart';
import 'package:classipod/core/custom_painter/previous_button_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/model/device_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceControls extends ConsumerStatefulWidget {
  const DeviceControls({super.key});

  @override
  ConsumerState createState() => _DeviceControlsState();
}

class _DeviceControlsState extends ConsumerState<DeviceControls> {
  Duration durationSinceLastScroll = Duration.zero;

  Future<void> onClickWheelScroll(
    DragUpdateDetails dragUpdateDetails,
    double radius,
    double height,
  ) async {
    /// Pan location on the wheel
    final bool onTop = dragUpdateDetails.localPosition.dy <= radius;
    final bool onLeftSide = dragUpdateDetails.localPosition.dx <= radius;
    final bool onRightSide = !onLeftSide;
    final bool onBottom = !onTop;

    /// Pan movements
    final bool panUp = dragUpdateDetails.delta.dy <= 0.0;
    final bool panLeft = dragUpdateDetails.delta.dx <= 0.0;
    final bool panRight = !panLeft;
    final bool panDown = !panUp;

    /// Absolute change on axis
    final double yChange = dragUpdateDetails.delta.dy.abs();
    final double xChange = dragUpdateDetails.delta.dx.abs();

    /// Directional change on wheel
    final double verticalRotation =
        (onRightSide && panDown) || (onLeftSide && panUp)
            ? yChange
            : yChange * -1;

    final double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    final double rotationalChange = (verticalRotation + horizontalRotation) *
        (dragUpdateDetails.delta.distance * 0.8);

    int millisecondsSinceLastScroll = 0;
    if (durationSinceLastScroll.inMinutes ==
            dragUpdateDetails.sourceTimeStamp?.inMinutes &&
        durationSinceLastScroll.inSeconds ==
            dragUpdateDetails.sourceTimeStamp?.inSeconds) {
      millisecondsSinceLastScroll =
          dragUpdateDetails.sourceTimeStamp!.inMilliseconds -
              durationSinceLastScroll.inMilliseconds;
    } else {
      setState(() {
        durationSinceLastScroll =
            dragUpdateDetails.sourceTimeStamp ?? Duration.zero;
      });
    }

    if (rotationalChange > 4 &&
        millisecondsSinceLastScroll > Constants.milliSecondsBeforeNextScroll) {
      await ref
          .read(deviceButtonsServiceProvider.notifier)
          .buttonPressVibrate();
      await ref.read(deviceButtonsServiceProvider.notifier).clickWheelSound();
      await ref
          .read(deviceButtonsServiceProvider.notifier)
          .setDeviceAction(DeviceAction.rotateForward);
      setState(() {
        durationSinceLastScroll = Duration.zero;
      });
    } else if (rotationalChange < -4 &&
        millisecondsSinceLastScroll > Constants.milliSecondsBeforeNextScroll) {
      await ref
          .read(deviceButtonsServiceProvider.notifier)
          .buttonPressVibrate();
      await ref.read(deviceButtonsServiceProvider.notifier).clickWheelSound();
      await ref
          .read(deviceButtonsServiceProvider.notifier)
          .setDeviceAction(DeviceAction.rotateBackward);
      setState(() {
        durationSinceLastScroll = Duration.zero;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final deviceColor = ref
        .watch(currentSettingsPreferencesProvider.select((e) => e.deviceColor));

    return GestureDetector(
      onPanUpdate: (dragUpdateDetails) async => onClickWheelScroll(
        dragUpdateDetails,
        (size.width * Constants.deviceClickWheelRadiusRatio) / 2,
        size.height,
      ),
      child: Container(
        height: size.width * Constants.deviceClickWheelRadiusRatio,
        width: size.width * Constants.deviceClickWheelRadiusRatio,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: deviceColor == DeviceColor.black
              ? AppPalette.darkDeviceControlBackgroundColor
              : CupertinoColors.white,
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
                child: ColoredBox(
                  color: deviceColor == DeviceColor.black
                      ? AppPalette.darkDeviceControlBackgroundColor
                      : CupertinoColors.white,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      context.localization.menuButtonText,
                      style: TextStyle(
                        color: deviceColor == DeviceColor.black
                            ? CupertinoColors.white
                            : AppPalette.lightDeviceButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.sfProTextFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async => ref
                        .read(deviceButtonsServiceProvider.notifier)
                        .setDeviceAction(DeviceAction.seekBackward),
                    onLongPress: () async => ref
                        .read(deviceButtonsServiceProvider.notifier)
                        .setDeviceAction(DeviceAction.seekBackwardLongPress),
                    onLongPressEnd: (_) async => ref
                        .read(deviceButtonsServiceProvider.notifier)
                        .setDeviceAction(DeviceAction.longPressEnd),
                    child: SizedBox(
                      height: size.width * 0.2175,
                      child: ColoredBox(
                        color: deviceColor == DeviceColor.black
                            ? AppPalette.darkDeviceControlBackgroundColor
                            : CupertinoColors.white,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomPaint(
                            size: const Size(20, 10),
                            painter: PreviousButtonCustomPainter(
                              color: deviceColor == DeviceColor.black
                                  ? null
                                  : AppPalette.lightDeviceButtonColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async => ref
                      .read(deviceButtonsServiceProvider.notifier)
                      .setDeviceAction(DeviceAction.select),
                  child: SizedBox(
                    height: size.width * Constants.deviceButtonSizeRatio,
                    width: size.width * Constants.deviceButtonSizeRatio,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: deviceColor == DeviceColor.black
                              ? CupertinoColors.black
                              : AppPalette.lightDeviceControlBorderColor,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(Assets.noiseImage),
                          fit: BoxFit.cover,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: deviceColor == DeviceColor.black
                              ? [
                                  AppPalette
                                      .darkDeviceControlInnerButtonGradientColor1,
                                  AppPalette
                                      .darkDeviceControlInnerButtonGradientColor2,
                                ]
                              : [
                                  AppPalette
                                      .lightDeviceControlInnerButtonGradientColor1,
                                  AppPalette
                                      .lightDeviceControlInnerButtonGradientColor2,
                                ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                      height: size.width * Constants.deviceButtonSizeRatio,
                      child: ColoredBox(
                        color: deviceColor == DeviceColor.black
                            ? AppPalette.darkDeviceControlBackgroundColor
                            : CupertinoColors.white,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomPaint(
                            size: const Size(20, 10),
                            painter: NextButtonCustomPainter(
                              color: deviceColor == DeviceColor.black
                                  ? null
                                  : AppPalette.lightDeviceButtonColor,
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
                    .setDeviceAction(DeviceAction.playPause),
                child: ColoredBox(
                  color: deviceColor == DeviceColor.black
                      ? AppPalette.darkDeviceControlBackgroundColor
                      : CupertinoColors.white,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomPaint(
                      size: const Size(26, 12),
                      painter: PlayPauseButtonCustomPainter(
                        color: deviceColor == DeviceColor.black
                            ? null
                            : AppPalette.lightDeviceButtonColor,
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
  }
}
