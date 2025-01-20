import 'dart:io';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

class AlbumArtSongListTile extends StatelessWidget {
  final String? thumbnailPath;
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  final VoidCallback onTap;
  const AlbumArtSongListTile({
    super.key,
    required this.thumbnailPath,
    required this.songName,
    required this.trackArtistNames,
    required this.isSelected,
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
                      AppPalette.primaryBlueGradientColor1,
                      AppPalette.primaryBlueGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Row(
            children: [
              Image(
                image: (thumbnailPath != null)
                    ? FileImage(File(thumbnailPath!))
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
                      songName ?? context.localization.unknownSong,
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
                      trackArtistNames ?? context.localization.unknownArtist,
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
                const Icon(
                  CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
