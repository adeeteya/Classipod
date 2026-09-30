import 'dart:async';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/widgets/subtle_reflection.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/volume_mode.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
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
    final gradient = isDarkTheme
        ? IpodGradients.darkSliderTrack
        : IpodGradients.sliderTrack;
    final borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;

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
                            gradient: gradient,
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
                      child: const SubtleReflection(
                        height: 20,
                        child: SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: IpodGradients.progress,
                            ),
                          ),
                        ),
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
