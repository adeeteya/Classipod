import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SongListTile extends StatelessWidget {
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const SongListTile({
    super.key,
    required this.songName,
    required this.trackArtistNames,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
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
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
            border: tileBorder,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectedMarqueeText(
                        songName ?? context.localization.unknownSong,
                        isSelected: isSelected,
                        style: IpodTypography.title.copyWith(
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appPrimaryTextColor,
                        ),
                      ),
                      Text(
                        trackArtistNames ?? context.localization.unknownArtist,
                        style: IpodTypography.description.copyWith(
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
                if (isCurrentlyPlaying)
                  Icon(
                    CupertinoIcons.volume_up,
                    size: 18,
                    color: isSelected
                        ? context.appInverseTextColor
                        : context.appPrimaryTextColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
