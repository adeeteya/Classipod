import 'package:classipod/core/constants.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DeviceControls extends ConsumerStatefulWidget {
  const DeviceControls({super.key});

  @override
  ConsumerState createState() => _DeviceControlsState();
}

class _DeviceControlsState extends ConsumerState<DeviceControls> {
  Duration durationSinceLastScroll = Duration.zero;

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
      ref.read(deviceButtonProvider.notifier).buttonPressVibrate();
      ref.read(deviceButtonProvider.notifier).clickWheelSound();
      ref
          .read(deviceButtonProvider.notifier)
          .setDeviceAction(DeviceAction.rotateForward);
      setState(() {
        durationSinceLastScroll = Duration.zero;
      });
    } else if (rotationalChange < -4 &&
        millisecondsSinceLastScroll > kMilliSecondsBeforeNextScroll) {
      ref.read(deviceButtonProvider.notifier).buttonPressVibrate();
      ref.read(deviceButtonProvider.notifier).clickWheelSound();
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
                  onTap: () => ref
                      .read(deviceButtonProvider.notifier)
                      .setDeviceAction(DeviceAction.menu),
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
                      onTap: () => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.seekBackward),
                      onLongPress: () => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.seekBackwardLongPress),
                      onLongPressEnd: (_) => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.longPressEnd),
                      child: SizedBox(
                        height: size.width * 0.2175,
                        child: ColoredBox(
                          color: context.isDarkMode
                              ? darkDeviceControlBackgroundColor
                              : CupertinoColors.white,
                          child: VectorGraphic(
                            loader:
                                const AssetBytesLoader("assets/icons/last.svg"),
                            colorFilter: context.isDarkMode
                                ? null
                                : const ColorFilter.mode(
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
                    onTap: () => ref
                        .read(deviceButtonProvider.notifier)
                        .setDeviceAction(DeviceAction.select),
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
                      onTap: () => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.seekForward),
                      onLongPress: () => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.seekForwardLongPress),
                      onLongPressEnd: (_) => ref
                          .read(deviceButtonProvider.notifier)
                          .setDeviceAction(DeviceAction.longPressEnd),
                      child: SizedBox(
                        height: size.width * 0.2175,
                        child: ColoredBox(
                          color: context.isDarkMode
                              ? darkDeviceControlBackgroundColor
                              : CupertinoColors.white,
                          child: VectorGraphic(
                            loader:
                                const AssetBytesLoader("assets/icons/next.svg"),
                            colorFilter: context.isDarkMode
                                ? null
                                : const ColorFilter.mode(
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
                  onTap: () => ref
                      .read(deviceButtonProvider.notifier)
                      .setDeviceAction(DeviceAction.playPause),
                  child: ColoredBox(
                    color: context.isDarkMode
                        ? darkDeviceControlBackgroundColor
                        : CupertinoColors.white,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: VectorGraphic(
                        loader: const AssetBytesLoader("assets/icons/play.svg"),
                        colorFilter: context.isDarkMode
                            ? null
                            : const ColorFilter.mode(
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
