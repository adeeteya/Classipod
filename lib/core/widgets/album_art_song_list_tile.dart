import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/artwork_image.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumArtSongListTile extends ConsumerWidget {
  final MusicMetadata songMetadata;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const AlbumArtSongListTile({
    super.key,
    required this.songMetadata,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Row(
            children: [
              Image(
                image: artworkImage(ref, songMetadata.thumbnailPath),
                errorBuilder: (_, _, _) => Image.asset(
                  Assets.defaultAlbumCoverImage,
                  fit: BoxFit.fitWidth,
                ),
                height: 54,
                width: 54,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectedMarqueeText(
                      songMetadata.trackName ??
                          context.localization.unknownSong,
                      isSelected: isSelected,
                      style: IpodTypography.title.copyWith(
                        color: isSelected
                            ? context.appInverseTextColor
                            : context.appPrimaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      songMetadata.getTrackArtistNames ??
                          context.localization.unknownArtist,
                      style: IpodTypography.metadata.copyWith(
                        color: isSelected
                            ? context.appInverseTextColor
                            : context.appSecondaryTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  isCurrentlyPlaying
                      ? CupertinoIcons.volume_up
                      : CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
              if (!isSelected && isCurrentlyPlaying)
                Icon(
                  CupertinoIcons.volume_up,
                  color: context.appPrimaryTextColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
