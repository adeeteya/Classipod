import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/duration_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:flutter/cupertino.dart';

class CoverFlowAlbumSongListTile extends StatelessWidget {
  final String songName;
  final Duration songDuration;
  final bool isSelected;
  final VoidCallback onTap;
  const CoverFlowAlbumSongListTile({
    super.key,
    required this.songName,
    required this.songDuration,
    required this.isSelected,
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
                      AppPalette.primaryBlueGradientColor1,
                      AppPalette.primaryBlueGradientColor2,
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    songDuration.getMinuteAndSecondString,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? CupertinoColors.white
                          : CupertinoColors.black,
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
