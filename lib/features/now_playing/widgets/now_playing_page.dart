import 'package:classipod/core/constants.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:flutter/cupertino.dart';

class NowPlayingPage extends StatelessWidget {
  final String? thumbnailPath;
  final String? trackName;
  final String? artistNames;
  final String? albumName;
  final int currentTrackNumber;
  final int totalTrackNumber;
  const NowPlayingPage({
    super.key,
    this.thumbnailPath,
    required this.trackName,
    this.artistNames,
    this.albumName,
    required this.currentTrackNumber,
    required this.totalTrackNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 7,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateY(-0.1),
            child: AlbumReflectiveArt(thumbnailPath: thumbnailPath),
          ),
        ),
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              MarqueeText(
                trackName ?? "Unknown Track",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                delayBefore: const Duration(seconds: 2),
                pauseBetween: const Duration(seconds: 2),
                pauseOnBounce: const Duration(seconds: 2),
              ),
              const SizedBox(height: 5),
              MarqueeText(
                artistNames ?? "Unknown Artist",
                style: const TextStyle(
                  color: hintTextColor,
                  fontSize: 16,
                ),
                delayBefore: const Duration(seconds: 2),
                pauseBetween: const Duration(seconds: 2),
                pauseOnBounce: const Duration(seconds: 2),
              ),
              const SizedBox(height: 5),
              MarqueeText(
                albumName ?? "Unknown Album",
                style: const TextStyle(
                  color: hintTextColor,
                  fontSize: 16,
                ),
                delayBefore: const Duration(seconds: 2),
                pauseBetween: const Duration(seconds: 2),
                pauseOnBounce: const Duration(seconds: 2),
              ),
              const Spacer(),
              Text(
                "$currentTrackNumber of $totalTrackNumber",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ],
    );
  }
}
