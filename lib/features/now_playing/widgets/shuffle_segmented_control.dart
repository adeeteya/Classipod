import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';

class ShuffleSegmentedControl extends StatelessWidget {
  final bool isShuffleEnabled;
  final ValueChanged<bool?> onValueChanged;

  const ShuffleSegmentedControl({
    super.key,
    required this.isShuffleEnabled,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(CupertinoIcons.shuffle, color: CupertinoColors.black),
        const SizedBox(width: 20),
        CustomSlidingSegmentedControl<bool>(
          groupValue: isShuffleEnabled,
          padding: EdgeInsets.zero,
          children: {
            false: Text(
              context.localization.tileValueOff,
              style: TextStyle(
                color:
                    !isShuffleEnabled
                        ? AppPalette.selectedTileGradientColor2
                        : null,
              ),
            ),
            true: Text(
              context.localization.songsScreenTitle,
              style: TextStyle(
                color:
                    isShuffleEnabled
                        ? AppPalette.selectedTileGradientColor2
                        : null,
              ),
            ),
          },
          onValueChanged: onValueChanged,
        ),
      ],
    );
  }
}
