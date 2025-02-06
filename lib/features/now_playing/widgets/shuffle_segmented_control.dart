import 'package:classipod/core/extensions/build_context_extensions.dart';
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
        const Icon(
          CupertinoIcons.shuffle,
          color: CupertinoColors.black,
        ),
        const SizedBox(width: 20),
        CupertinoSlidingSegmentedControl<bool>(
          groupValue: isShuffleEnabled,
          padding: EdgeInsets.zero,
          children: {
            false: Text(context.localization.tileValueOff),
            true: Text(context.localization.songsScreenTitle),
          },
          onValueChanged: onValueChanged,
        ),
      ],
    );
  }
}
