import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

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
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient:
                isSelected
                    ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.selectedTileGradientColor1,
                        AppPalette.selectedTileGradientColor2,
                      ],
                    )
                    : null,
            border:
                isSelected
                    ? null
                    : const Border(
                      bottom: BorderSide(
                        color: AppPalette.lightDeviceFrameGradientColor1,
                      ),
                    ),
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
                      Text(
                        songName ?? context.localization.unknownSong,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        trackArtistNames ?? context.localization.unknownArtist,
                        style: TextStyle(
                          color:
                              isSelected
                                  ? CupertinoColors.white
                                  : AppPalette.hintTextColor,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                if (isCurrentlyPlaying)
                  Icon(
                    CupertinoIcons.volume_up,
                    size: 18,
                    color:
                        isSelected
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
