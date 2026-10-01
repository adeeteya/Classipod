import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class GenreListTile extends StatelessWidget {
  final String genreName;
  final int artistCount;
  final int albumCount;
  final bool isSelected;
  final VoidCallback? onTap;

  const GenreListTile({
    super.key,
    required this.genreName,
    required this.artistCount,
    required this.albumCount,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = IpodTypography.title.copyWith(
      color: isSelected
          ? context.appInverseTextColor
          : context.appPrimaryTextColor,
    );
    final artists = context.localization.nArtists(artistCount);
    final albums = context.localization.nAlbums(albumCount);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: isSelected
                ? const Border(
                    top: BorderSide(
                      color: AppPalette.selectedTileTopBorderColor,
                    ),
                    bottom: BorderSide(
                      color: AppPalette.selectedTileBottomBorderColor,
                    ),
                  )
                : null,
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectedMarqueeText(
                        genreName,
                        isSelected: isSelected,
                        style: textStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$artists, $albums',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: IpodTypography.description.copyWith(
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appSecondaryTextColor,
                        ),
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
      ),
    );
  }
}
