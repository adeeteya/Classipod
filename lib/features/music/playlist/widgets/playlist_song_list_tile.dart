import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/artwork_image.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaylistSongListTile extends ConsumerWidget {
  final MusicMetadata songMetadata;
  final bool unavailable;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const PlaylistSongListTile({
    super.key,
    required this.songMetadata,
    this.unavailable = false,
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
            gradient: isSelected ? IpodGradients.selection : null,
            border: isSelected
                ? null
                : const Border(
                    bottom: BorderSide(
                      color: AppPalette.lightDeviceFrameGradientColor1,
                    ),
                  ),
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
                    Flexible(
                      child: Text(
                        songMetadata.trackName ??
                            context.localization.unknownSong,
                        style: IpodTypography.title.copyWith(
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appPrimaryTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Flexible(
                      child: Text(
                        unavailable
                            ? context.localization.subsonicUnavailable
                            : songMetadata.getTrackArtistNames ??
                                  context.localization.unknownArtist,
                        style: IpodTypography.metadata.copyWith(
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appSecondaryTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCurrentlyPlaying)
                Icon(
                  CupertinoIcons.volume_up,
                  size: 18,
                  color: isSelected
                      ? context.appInverseTextColor
                      : context.appPrimaryTextColor,
                ),
              if (!isCurrentlyPlaying && isSelected)
                Icon(
                  CupertinoIcons.right_chevron,
                  color: context.appInverseTextColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
