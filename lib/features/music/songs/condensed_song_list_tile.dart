import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

class CondensedSongListTile extends StatelessWidget {
  final String songName;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback? onTap;
  const CondensedSongListTile({
    super.key,
    required this.songName,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    this.onTap,
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
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    songName,
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
                if (isSelected && !isCurrentlyPlaying)
                  const Icon(
                    CupertinoIcons.right_chevron,
                    color: CupertinoColors.white,
                  ),
                if (isCurrentlyPlaying)
                  Icon(
                    CupertinoIcons.volume_up,
                    color: isSelected
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
