import 'dart:io';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:flutter/cupertino.dart';

class AlbumArtSongListTile extends StatelessWidget {
  final Metadata songMetadata;
  final bool isSelected;
  final bool isCurrentlyPlaying;
  final VoidCallback onTap;
  const AlbumArtSongListTile({
    super.key,
    required this.songMetadata,
    required this.isSelected,
    required this.isCurrentlyPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
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
          child: Row(
            children: [
              Image(
                image: (songMetadata.thumbnailPath != null)
                    ? FileImage(File(songMetadata.thumbnailPath!))
                    : const AssetImage(Assets.defaultAlbumCoverImage),
                errorBuilder: (_, __, ___) => Image.asset(
                  Assets.defaultAlbumCoverImage,
                  fit: BoxFit.fitWidth,
                ),
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songMetadata.trackName ??
                          context.localization.unknownSong,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      songMetadata.getTrackArtistNames ??
                          context.localization.unknownArtist,
                      style: TextStyle(
                        color: isSelected
                            ? CupertinoColors.white
                            : AppPalette.hintTextColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  isCurrentlyPlaying
                      ? CupertinoIcons.volume_up
                      : CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
              if (!isSelected && isCurrentlyPlaying)
                const Icon(
                  CupertinoIcons.volume_up,
                  color: CupertinoColors.black,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
