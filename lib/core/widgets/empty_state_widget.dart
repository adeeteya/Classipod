import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

class EmptyStateWidget extends StatelessWidget {
  final String emptyDescription;
  const EmptyStateWidget({super.key, required this.emptyDescription});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.darkScreenBackgroundGradient1,
              AppPalette.darkScreenBackgroundGradient2,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.music_note_2,
              size: 65,
              color: CupertinoColors.white,
            ),
            const SizedBox(height: 20),
            Text(
              emptyDescription,
              style: const TextStyle(
                fontSize: 20,
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
