import 'dart:typed_data';
import 'package:classipod/core/constants.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:flutter/cupertino.dart';

class NowPlayingPage extends StatelessWidget {
  final Uint8List? albumArt;
  final String? trackName;
  final String? artistNames;
  final String? albumName;
  final int currentTrackNumber;
  final int totalTrackNumber;
  const NowPlayingPage(
      {super.key,
      this.albumArt,
      required this.trackName,
      this.artistNames,
      this.albumName,
      required this.currentTrackNumber,
      required this.totalTrackNumber});

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
            child: (albumArt != null)
                ? Column(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.memory(
                            albumArt!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Transform.flip(
                              flipY: true,
                              filterQuality: FilterQuality.low,
                              child: Image.memory(
                                albumArt!,
                                height: 50,
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: const Border(
                                  left: BorderSide(
                                    color: CupertinoColors.white,
                                    width: 0,
                                  ),
                                  right: BorderSide(
                                    color: CupertinoColors.white,
                                    width: 0,
                                  ),
                                  bottom: BorderSide(
                                    color: CupertinoColors.white,
                                    width: 0,
                                    strokeAlign: -1,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    CupertinoColors.white.withOpacity(0.4),
                                    CupertinoColors.white.withOpacity(1),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Image.asset("assets/images/default_album_cover.jpeg"),
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
