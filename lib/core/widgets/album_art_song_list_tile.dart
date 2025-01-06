import 'dart:io';

import 'package:classipod/core/constants.dart';
import 'package:flutter/cupertino.dart';

class AlbumArtSongListTile extends StatelessWidget {
  final String? thumbnailPath;
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  const AlbumArtSongListTile({
    super.key,
    required this.thumbnailPath,
    required this.songName,
    required this.trackArtistNames,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(width: 0.5, color: statusBarBorderColor),
          ),
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryBlueGradientColor1,
                    primaryBlueGradientColor2,
                  ],
                )
              : null,
        ),
        child: Row(
          children: [
            Image(
              image: (thumbnailPath != null)
                  ? FileImage(File(thumbnailPath!))
                  : const AssetImage("assets/images/default_album_cover.jpeg"),
              errorBuilder: (_, __, ___) => Image.asset(
                "assets/images/default_album_cover.jpeg",
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
                    songName ?? "Unknown Song",
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
                    trackArtistNames ?? "Unknown Artist",
                    style: TextStyle(
                      color: isSelected ? CupertinoColors.white : hintTextColor,
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
    );
  }
}
