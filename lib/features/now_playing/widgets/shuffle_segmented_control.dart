import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/widgets/custom_sliding_segmented_control.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class ShuffleSegmentedControl extends StatelessWidget {
  final PlaybackShuffleMode shuffleMode;
  final ValueChanged<PlaybackShuffleMode?> onValueChanged;

  const ShuffleSegmentedControl({
    super.key,
    required this.shuffleMode,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.shuffle, color: context.appPrimaryTextColor),
        const SizedBox(width: 20),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CustomSlidingSegmentedControl<PlaybackShuffleMode>(
              groupValue: shuffleMode,
              padding: EdgeInsets.zero,
              children: {
                for (final mode in PlaybackShuffleMode.values)
                  mode: Text(
                    mode.title(context),
                    style: TextStyle(
                      color: shuffleMode == mode
                          ? AppPalette.selectedTileGradientColor2
                          : context.appPrimaryTextColor,
                    ),
                  ),
              },
              onValueChanged: onValueChanged,
            ),
          ),
        ),
      ],
    );
  }
}
