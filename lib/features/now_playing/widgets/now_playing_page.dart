import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:flutter/cupertino.dart';

class NowPlayingWidget extends StatelessWidget {
  final NowPlayingModel nowPlayingDetails;

  const NowPlayingWidget({super.key, required this.nowPlayingDetails});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Row(
        key: ValueKey("Now Playing-${nowPlayingDetails.currentMetadata}"),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 7,
            child: Transform(
              transform:
                  Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateY(-0.1),
              child: AlbumReflectiveArt(
                thumbnailPath: nowPlayingDetails.currentMetadata?.thumbnailPath,
                reflectedImageHeight: 50,
                isOnDevice:
                    nowPlayingDetails.currentMetadata?.isOnDevice ?? true,
                heroTag:
                    "${nowPlayingDetails.currentMetadata?.albumName}-${nowPlayingDetails.currentMetadata?.albumArtistName}",
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
                  nowPlayingDetails.currentMetadata?.trackName ??
                      context.localization.unknownSong,
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
                  nowPlayingDetails.currentMetadata?.getTrackArtistNames ??
                      context.localization.unknownArtist,
                  style: const TextStyle(
                    color: AppPalette.hintTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                const SizedBox(height: 5),
                MarqueeText(
                  nowPlayingDetails.currentMetadata?.albumName ??
                      context.localization.unknownAlbum,
                  style: const TextStyle(
                    color: AppPalette.hintTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                const Spacer(),
                Text(
                  "${nowPlayingDetails.currentIndex + 1} ${context.localization.commonOfText} ${nowPlayingDetails.metadataList.length}",
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
