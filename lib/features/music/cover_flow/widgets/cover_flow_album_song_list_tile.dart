import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/duration_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class CoverFlowAlbumSongListTile extends StatelessWidget {
  final String songName;
  final Duration songDuration;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;

  const CoverFlowAlbumSongListTile({
    super.key,
    required this.songName,
    required this.songDuration,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppPalette.selectedTileGradientColor1,
                      AppPalette.selectedTileGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: MarqueeText(
                    songName,
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appPrimaryTextColor,
                        ),
                  ),
                ),
                Flexible(
                  child: isCurrentlyPlaying
                      ? Icon(
                          CupertinoIcons.volume_up,
                          size: 16,
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appPrimaryTextColor,
                        )
                      : Text(
                          songDuration.getMinuteAndSecondString,
                          style: CupertinoTheme.of(context).textTheme.textStyle
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? context.appInverseTextColor
                                    : context.appPrimaryTextColor,
                              ),
                          maxLines: 1,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
