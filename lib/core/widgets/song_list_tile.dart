import 'package:flutter/cupertino.dart';
import 'package:retropod/core/constants.dart';

class SongListTile extends StatelessWidget {
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  const SongListTile(
      {super.key,
      required this.songName,
      required this.trackArtistNames,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: (isSelected)
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryBlueGradientColor1, primaryBlueGradientColor2],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songName ?? "Unknown Song",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:
                  (isSelected) ? CupertinoColors.white : CupertinoColors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            trackArtistNames ?? "Unknown Artist",
            style: TextStyle(
              color: (isSelected) ? CupertinoColors.white : hintTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Optimize the use of containers throughout the app.
