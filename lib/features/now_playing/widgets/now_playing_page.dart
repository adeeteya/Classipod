import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:flutter/cupertino.dart';

class NowPlayingWidget extends StatelessWidget {
  final Metadata songMetadata;
  final int currentTrackNumber;
  final int totalTrackNumber;
  const NowPlayingWidget({
    super.key,
    required this.songMetadata,
    required this.currentTrackNumber,
    required this.totalTrackNumber,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Row(
        key: ValueKey(
          "Now Playing-${songMetadata.originalSongIndex}",
        ),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003)
                ..rotateY(-0.1),
              child: AlbumReflectiveArt(
                thumbnailPath: songMetadata.thumbnailPath,
                reflectedImageHeight: 50,
                heroTag:
                    "${songMetadata.albumName}-${songMetadata.albumArtistName}",
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                MarqueeText(
                  songMetadata.trackName ?? context.localization.unknownSong,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                const SizedBox(height: 5),
                MarqueeText(
                  songMetadata.getTrackArtistNames ??
                      context.localization.unknownArtist,
                  style: const TextStyle(
                    color: AppPalette.hintTextColor,
                    fontSize: 16,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                const SizedBox(height: 5),
                MarqueeText(
                  songMetadata.albumName ?? context.localization.unknownAlbum,
                  style: const TextStyle(
                    color: AppPalette.hintTextColor,
                    fontSize: 16,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                const Spacer(),
                Text(
                  "$currentTrackNumber ${context.localization.commonOfText} $totalTrackNumber",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
