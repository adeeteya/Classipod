import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/duration_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class CoverFlowAlbumSongListTile extends StatelessWidget {
  final String songName;
  final Duration songDuration;
  final int rating;
  final bool showRating;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;

  const CoverFlowAlbumSongListTile({
    super.key,
    required this.songName,
    required this.songDuration,
    required this.rating,
    required this.showRating,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(
      '[Classipod][cover-flow-rating] song=$songName '
      'showRating=$showRating rating=$rating',
    );
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SelectedMarqueeText(
                    songName,
                    isSelected: isSelected,
                    style: IpodTypography.menu.copyWith(
                      color: isSelected
                          ? context.appInverseTextColor
                          : context.appPrimaryTextColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showRating && rating > 0)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < rating
                                ? CupertinoIcons.star_fill
                                : CupertinoIcons.star,
                            size: 12,
                            color: isSelected
                                ? context.appInverseTextColor
                                : context.appRatingIconColor,
                          ),
                        ),
                      ),
                    if (showRating) const SizedBox(width: 8),
                    isCurrentlyPlaying
                        ? Icon(
                            CupertinoIcons.volume_up,
                            size: 16,
                            color: isSelected
                                ? context.appInverseTextColor
                                : context.appPrimaryTextColor,
                          )
                        : Text(
                            songDuration.getMinuteAndSecondString,
                            style: IpodTypography.menu.copyWith(
                              color: isSelected
                                  ? context.appInverseTextColor
                                  : context.appPrimaryTextColor,
                            ),
                            maxLines: 1,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
