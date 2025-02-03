import 'dart:io';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:flutter/cupertino.dart';

class ArtistAlbumListTile extends StatelessWidget {
  final AlbumDetail albumDetails;
  final bool isSelected;
  final VoidCallback onTap;
  const ArtistAlbumListTile({
    super.key,
    required this.albumDetails,
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
                      AppPalette.selectedTileGradientColor1,
                      AppPalette.selectedTileGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Row(
            children: [
              Image(
                image: (albumDetails.albumArtPath != null)
                    ? FileImage(File(albumDetails.albumArtPath!))
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
                      albumDetails.albumName,
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
                      context.localization
                          .nSongs(albumDetails.albumSongs.length),
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
