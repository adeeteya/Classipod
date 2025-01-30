import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/now_playing/provider/now_playing_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingPreviewWidget extends ConsumerWidget {
  const NowPlayingPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(audioPlayerProvider).currentIndex;
    final nowPlayingListMetadata = ref.watch(nowPlayingMetadataListProvider);
    final Metadata? currentMetadata = nowPlayingListMetadata.isEmpty
        ? null
        : nowPlayingListMetadata[currentIndex ?? 0];
    return SizedBox(
      key: const ValueKey(SplitScreenType.nowPlaying),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(flex: (currentMetadata != null) ? 2 : 1),
              const Icon(
                CupertinoIcons.music_note_2,
                size: 65,
                color: CupertinoColors.white,
              ),
              const Spacer(),
              if (currentMetadata != null) ...[
                Text(
                  currentMetadata.getTrackName,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  currentMetadata.getTrackArtistNames,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  currentMetadata.getAlbumName,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
