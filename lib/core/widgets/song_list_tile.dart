import 'package:classipod/core/constants.dart';
import 'package:flutter/cupertino.dart';

class SongListTile extends StatelessWidget {
  final String? songName;
  final String? trackArtistNames;
  final bool isSelected;
  const SongListTile({
    super.key,
    required this.songName,
    required this.trackArtistNames,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      ),
    );
  }
}
