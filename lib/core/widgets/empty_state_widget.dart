import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/custom_painter/music_note_custom_painter.dart';
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
              AppPalette.emptyScreenGradient1,
              AppPalette.emptyScreenGradient2,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(125, 125),
              painter: MusicNoteCustomPainter(
                color: CupertinoColors.white,
              ),
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
