import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:flutter/cupertino.dart';

class PlaylistListTile extends StatelessWidget {
  final PlaylistModel playlistModel;
  final bool isSelected;
  final VoidCallback onTap;

  const PlaylistListTile({
    super.key,
    required this.playlistModel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                        playlistModel.name,
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
                        context.localization.nSongs(playlistModel.songs.length),
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
                if (isSelected)
                  const Icon(
                    CupertinoIcons.chevron_right,
                    size: 18,
                    color: CupertinoColors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
