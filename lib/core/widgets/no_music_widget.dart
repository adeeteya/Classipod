import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/custom_painter/music_note_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';

class NoMusicWidget extends StatelessWidget {
  final String title;
  const NoMusicWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: title),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: const Size(125, 125),
                  painter: MusicNoteCustomPainter(
                    color: AppPalette.lightDeviceFrameGradientColor2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  context.localization.noMusicFilesFound,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppPalette.lightDeviceFrameGradientColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
