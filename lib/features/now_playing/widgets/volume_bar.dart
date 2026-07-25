import 'dart:async';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/volume_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volume_controller/volume_controller.dart';

class VolumeBar extends ConsumerStatefulWidget {
  const VolumeBar({super.key});

  @override
  ConsumerState createState() => _VolumeBarState();
}

class _VolumeBarState extends ConsumerState<VolumeBar> {
  late final StreamSubscription<double> _volumeSubscription;
  double _volumeLevel = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final volumeMode = ref
          .read(settingsPreferencesControllerProvider)
          .volumeMode;
      if (volumeMode == VolumeMode.app) {
        _volumeSubscription = ref
            .read(audioPlayerProvider)
            .volumeStream
            .listen(_updateVolume);
      } else {
        _volumeSubscription = VolumeController.instance.addListener(
          _updateVolume,
        );
      }
    });
  }

  void _updateVolume(double volume) {
    setState(() {
      _volumeLevel = volume;
    });
  }

  @override
  void dispose() {
    unawaited(_volumeSubscription.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final inactiveGradientColors = isDarkTheme
        ? const [
            AppPalette.darkSliderGradientColor1,
            AppPalette.darkSliderGradientColor2,
          ]
        : const [
            AppPalette.inActiveSliderGradientColor1,
            AppPalette.inActiveSliderGradientColor2,
          ];
    final borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;
    final progressShadowColor = isDarkTheme
        ? AppPalette.darkNowProgressBarShadowColor
        : AppPalette.nowProgressBarShadowColor;

    return RepaintBoundary(
      child: Row(
        children: [
          Icon(
            CupertinoIcons.volume_down,
            size: 18,
            color: context.appIconEmphasisColor,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        height: 20,
                        width: constraints.maxWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: inactiveGradientColors,
                            ),
                            border: Border.all(color: borderColor),
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      height: 20,
                      width: _volumeLevel * constraints.maxWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      duration: const Duration(milliseconds: 10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppPalette.nowProgressBarGradientColor1,
                            AppPalette.nowProgressBarGradientColor2,
                            AppPalette.nowProgressBarGradientColor1,
                            AppPalette.nowProgressBarGradientColor3,
                            AppPalette.nowProgressBarGradientColor4,
                            AppPalette.nowProgressBarGradientColor5,
                            AppPalette.nowProgressBarGradientColor6,
                            AppPalette.nowProgressBarGradientColor7,
                            AppPalette.nowProgressBarGradientColor8,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: progressShadowColor,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Icon(
            CupertinoIcons.volume_up,
            size: 18,
            color: context.appIconEmphasisColor,
          ),
        ],
      ),
    );
  }
}
