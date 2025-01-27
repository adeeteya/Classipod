import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/custom_painter/music_note_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPreviewWidget extends ConsumerWidget {
  const SettingsPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider);

    return SizedBox(
      key: const ValueKey(SplitScreenType.settings),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.localization.appTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomPaint(
                size: const Size(65, 65),
                painter: MusicNoteCustomPainter(
                  color: CupertinoColors.white,
                ),
              ),
              Text(
                "${songs.length} ${context.localization.songsScreenTitle}",
                style: const TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
