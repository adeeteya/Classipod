import 'dart:async';

import 'package:classipod/core/constants.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:vibration/vibration.dart';

class DeviceControls extends ConsumerStatefulWidget {
  const DeviceControls({super.key});

  @override
  ConsumerState createState() => _DeviceControlsState();
}

class _DeviceControlsState extends ConsumerState<DeviceControls> {
  // late Timer _longPressTimer;
  Duration durationSinceLastScroll = Duration.zero;

  void buttonPressVibrate() {
    if (ref.read(settingsProvider).vibrate) {
      Vibration.vibrate(duration: 2);
    }
  }

  Future<void> clickWheelSound() async {
    if (ref.read(settingsProvider).clickWheelSound) {
      await SystemSound.play(SystemSoundType.click);
    }
  }

  void onMenuButtonPressed() {
    buttonPressVibrate();
    clickWheelSound();
    context.pop();
  }

  void onSeekBackButtonPressed() {
    buttonPressVibrate();
    clickWheelSound();
    ref
        .read(deviceButtonProvider.notifier)
        .setDeviceAction(DeviceAction.seekBackward);
  }

  void onSeekBackwardButtonLongPress() {
    buttonPressVibrate();
    clickWheelSound();
    ref
        .read(deviceButtonProvider.notifier)
        .setDeviceAction(DeviceAction.seekBackwardLongPress);
  }

  void onSeekForwardButtonPressed() {
    buttonPressVibrate();
    clickWheelSound();
    ref
        .read(deviceButtonProvider.notifier)
        .setDeviceAction(DeviceAction.seekForward);
  }

  void onSeekForwardButtonLongPress() {
    buttonPressVibrate();
    clickWheelSound();
    ref
        .read(deviceButtonProvider.notifier)
        .setDeviceAction(DeviceAction.seekForwardLongPress);
  }

  void longPressEnd(LongPressEndDetails _) {
    ref.read(deviceButtonProvider.notifier).resetDeviceAction();
  }

  void onSelectButtonPressed() {
    buttonPressVibrate();
    clickWheelSound();
    ref
        .read(deviceButtonProvider.notifier)
        .setDeviceAction(DeviceAction.select);
  }

  void onPlayPauseButtonPressed() {
    buttonPressVibrate();
    clickWheelSound();
    ref.read(musicProvider.notifier).togglePlayback();
  }

  void onClickWheelScroll(
      DragUpdateDetails dragUpdateDetails, double radius, double height) {
    /// Pan location on the wheel
    bool onTop = dragUpdateDetails.localPosition.dy <= radius;
    bool onLeftSide = dragUpdateDetails.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = dragUpdateDetails.delta.dy <= 0.0;
    bool panLeft = dragUpdateDetails.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absolute change on axis
    double yChange = dragUpdateDetails.delta.dy.abs();
    double xChange = dragUpdateDetails.delta.dx.abs();

    /// Directional change on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    double rotationalChange = (verticalRotation + horizontalRotation) *
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
        millisecondsSinceLastScroll > kMilliSecondsBeforeNextScroll) {
      buttonPressVibrate();
      clickWheelSound();
      ref
          .read(deviceButtonProvider.notifier)
          .setDeviceAction(DeviceAction.rotateForward);
      setState(() {
        durationSinceLastScroll = Duration.zero;
      });
    } else if (rotationalChange < -4 &&
        millisecondsSinceLastScroll > kMilliSecondsBeforeNextScroll) {
      buttonPressVibrate();
      clickWheelSound();
      ref
          .read(deviceButtonProvider.notifier)
          .setDeviceAction(DeviceAction.rotateBackward);
      setState(() {
        durationSinceLastScroll = Duration.zero;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AbsorbPointer(
      absorbing: ref.watch(musicProvider).isLoading,
      child: GestureDetector(
        onPanUpdate: (dragUpdateDetails) => onClickWheelScroll(
            dragUpdateDetails, (size.width * 0.61) / 2, size.height),
        child: Container(
          height: size.width * 0.61,
          width: size.width * 0.61,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? darkDeviceControlBackgroundColor
                : CupertinoColors.white,
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onMenuButtonPressed,
                  child: ColoredBox(
                    color: context.isDarkMode
                        ? darkDeviceControlBackgroundColor
                        : CupertinoColors.white,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "MENU",
                        style: TextStyle(
                          color: context.isDarkMode
                              ? CupertinoColors.white
                              : lightDeviceButtonColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Text',
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
                      onTap: onSeekBackButtonPressed,
                      onLongPress: onSeekBackwardButtonLongPress,
                      onLongPressEnd: longPressEnd,
                      child: SizedBox(
                        height: size.width * 0.2175,
                        child: ColoredBox(
                          color: context.isDarkMode
                              ? darkDeviceControlBackgroundColor
                              : CupertinoColors.white,
                          child: VectorGraphic(
                            loader: AssetBytesLoader("assets/icons/last.svg"),
                            colorFilter: context.isDarkMode
                                ? null
                                : ColorFilter.mode(
                                    lightDeviceButtonColor,
                                    BlendMode.srcIn,
                                  ),
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onSelectButtonPressed,
                    child: SizedBox(
                      height: size.width * 0.2175,
                      width: size.width * 0.2175,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.isDarkMode
                                ? CupertinoColors.black
                                : lightDeviceControlBorderColor,
                          ),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/noise.png"),
                            fit: BoxFit.cover,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: context.isDarkMode
                                ? [
                                    darkDeviceControlInnerButtonGradientColor1,
                                    darkDeviceControlInnerButtonGradientColor2
                                  ]
                                : [
                                    lightDeviceControlInnerButtonGradientColor1,
                                    lightDeviceControlInnerButtonGradientColor2
                                  ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: onSeekForwardButtonPressed,
                      onLongPress: onSeekForwardButtonLongPress,
                      onLongPressEnd: longPressEnd,
                      child: SizedBox(
                        height: size.width * 0.2175,
                        child: ColoredBox(
                          color: context.isDarkMode
                              ? darkDeviceControlBackgroundColor
                              : CupertinoColors.white,
                          child: VectorGraphic(
                            loader: AssetBytesLoader("assets/icons/next.svg"),
                            colorFilter: context.isDarkMode
                                ? null
                                : ColorFilter.mode(
                                    lightDeviceButtonColor,
                                    BlendMode.srcIn,
                                  ),
                            alignment: Alignment.centerRight,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onPlayPauseButtonPressed,
                  child: ColoredBox(
                    color: context.isDarkMode
                        ? darkDeviceControlBackgroundColor
                        : CupertinoColors.white,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: VectorGraphic(
                        loader: AssetBytesLoader("assets/icons/play.svg"),
                        colorFilter: context.isDarkMode
                            ? null
                            : ColorFilter.mode(
                                lightDeviceButtonColor,
                                BlendMode.srcIn,
                              ),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
