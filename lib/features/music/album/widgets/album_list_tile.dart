import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/artwork_image.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumListTile extends ConsumerWidget {
  final AlbumModel albumDetails;
  final bool isSelected;
  final bool showArtistName;
  final bool isAllSongsAlbum;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const AlbumListTile({
    super.key,
    required this.albumDetails,
    required this.isSelected,
    this.isAllSongsAlbum = false,
    this.showArtistName = true,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final borderColor = isDarkTheme
        ? AppPalette.darkListTileBorderColor
        : AppPalette.lightListTileBorderColor;
    final Border? tileBorder = isSelected
        ? null
        : Border(bottom: BorderSide(color: borderColor));

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: tileBorder,
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Row(
            children: [
              if (isAllSongsAlbum)
                const SizedBox(
                  height: 54,
                  width: 54,
                  child: ColoredBox(
                    color: CupertinoColors.black,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.music_note_2,
                        size: 40,
                        color: AppPalette.selectedTileGradientColor2,
                      ),
                    ),
                  ),
                ),
              if (!isAllSongsAlbum)
                Image(
                  image: artworkImage(ref, albumDetails.albumArtPath),
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
                    Text(
                      albumDetails.albumName,
                      style: IpodTypography.title.copyWith(
                        color: isSelected
                            ? context.appInverseTextColor
                            : context.appPrimaryTextColor,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      showArtistName
                          ? albumDetails.albumArtistName
                          : context.localization.nSongs(
                              albumDetails.albumSongs.length,
                            ),
                      style: IpodTypography.metadata.copyWith(
                        color: isSelected
                            ? context.appInverseTextColor
                            : context.appSecondaryTextColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              if (isSelected)
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
