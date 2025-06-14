import 'dart:async';

import 'package:classipod/core/constants/app_palette.dart';
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
      final volumeMode =
          ref.read(settingsPreferencesControllerProvider).volumeMode;
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
    return RepaintBoundary(
      child: Row(
        children: [
          const Icon(CupertinoIcons.volume_down, size: 18),
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
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppPalette.inActiveSliderGradientColor1,
                                AppPalette.inActiveSliderGradientColor2,
                              ],
                            ),
                            border: Border.all(
                              color: AppPalette.sliderBorderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      height: 20,
                      width: _volumeLevel * constraints.maxWidth,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      duration: const Duration(milliseconds: 10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
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
                            color: AppPalette.nowProgressBarShadowColor,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Icon(CupertinoIcons.volume_up, size: 18),
        ],
      ),
    );
  }
}
