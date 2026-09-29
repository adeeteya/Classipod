import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingWidget extends ConsumerWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingDetails = ref.watch(nowPlayingDetailsProvider);
    final artworkPath = ref.watch(
      songAlbumArtworkProvider(nowPlayingDetails.currentMetadata),
    );
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Row(
        key: ValueKey(
          "Now Playing-${nowPlayingDetails.currentMetadata?.identity}",
        ),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 150,
            child: AlbumReflectiveArt(
              imageWidth: 200,
              tiltedImage: true,
              thumbnailPath: artworkPath,
              isOnDevice: nowPlayingDetails.currentMetadata?.isOnDevice ?? true,
              heroTag:
                  "${nowPlayingDetails.currentMetadata?.albumName}-${nowPlayingDetails.currentMetadata?.albumArtistName}",
            ),
          ),
          Expanded(
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
                  style: context.appTextStyle.copyWith(
                    color: context.appSecondaryTextColor,
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
                  style: context.appTextStyle.copyWith(
                    color: context.appSecondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  delayBefore: const Duration(seconds: 2),
                  pauseBetween: const Duration(seconds: 2),
                  pauseOnBounce: const Duration(seconds: 2),
                ),
                if ((nowPlayingDetails.currentMetadata?.rating ?? 0) != 0)
                  Row(
                    children: List.generate(
                      nowPlayingDetails.currentMetadata?.rating ?? 0,
                      (index) => const Padding(
                        padding: EdgeInsets.only(right: 2, top: 4, bottom: 4),
                        child: Icon(
                          CupertinoIcons.star_fill,
                          size: 14,
                          color: AppPalette.selectedTileGradientColor2,
                        ),
                      ),
                    ),
                  ),
                if ((nowPlayingDetails.currentMetadata?.rating ?? 0) == 0)
                  const SizedBox(height: 22),
                Text(
                  "${nowPlayingDetails.currentIndex + 1} ${context.localization.commonOfText} ${nowPlayingDetails.metadataList.length}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
