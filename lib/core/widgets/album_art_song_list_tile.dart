import 'package:classipod/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AlbumArtSongListTile extends StatelessWidget {
  final Uint8List? albumArt;
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  const AlbumArtSongListTile(
      {super.key,
      required this.albumArt,
      required this.songName,
      required this.trackArtistNames,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: (isSelected)
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryBlueGradientColor1,
                    primaryBlueGradientColor2
                  ],
                )
              : null,
        ),
        child: Row(
          children: [
            (albumArt != null)
                ? Image.memory(
                    albumArt!,
                    height: 50,
                    width: 50,
                  )
                : Image.asset(
                    "assets/images/default_album_cover.jpeg",
                    height: 50,
                    width: 50,
                  ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songName ?? "Unknown Song",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: (isSelected)
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    trackArtistNames ?? "Unknown Artist",
                    style: TextStyle(
                      color:
                          (isSelected) ? CupertinoColors.white : hintTextColor,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(CupertinoIcons.right_chevron,
                  color: CupertinoColors.white),
          ],
        ),
      ),
    );
  }
}
