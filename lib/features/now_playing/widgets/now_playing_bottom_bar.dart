import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/scrubber_bar.dart';
import 'package:classipod/features/now_playing/widgets/seek_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingBottomBar extends ConsumerWidget {
  final bool showScrubber;

  const NowPlayingBottomBar({super.key, this.showScrubber = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      child: StreamBuilder<Duration>(
        stream: ref.read(audioPlayerProvider).positionStream,
        builder: (context, snapshot) {
          final double totalDuration =
              (ref
                      .read(nowPlayingDetailsProvider)
                      .metadataList[ref
                              .read(audioPlayerProvider)
                              .currentIndex ??
                          0]
                      .trackDuration ??
                  1000) /
              1000;
          double currentDuration = snapshot.data?.inSeconds.toDouble() ?? 0;
          if (currentDuration < 0) {
            currentDuration = 0;
          }

          final int elapsedTimeInMinutes = currentDuration ~/ 60;
          final int elapsedTimeInSeconds = currentDuration.toInt() % 60;

          final int remainingTimeInMinutes =
              (totalDuration - currentDuration) ~/ 60;
          int remainingTimeInSeconds =
              (totalDuration - currentDuration).toInt() % 60;

          if ((totalDuration - currentDuration) < 0) {
            remainingTimeInSeconds = 0;
          }

          return Row(
            children: [
              SizedBox(
                width: 35,
                child: Text(
                  "$elapsedTimeInMinutes:${elapsedTimeInSeconds < 10 ? "0$elapsedTimeInSeconds" : elapsedTimeInSeconds}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (showScrubber)
                ScrubberBar(max: totalDuration, value: currentDuration),
              if (!showScrubber)
                SeekBar(max: totalDuration, value: currentDuration),
              SizedBox(
                width: 40,
                child: Text(
                  "- $remainingTimeInMinutes:${remainingTimeInSeconds < 10 ? "0$remainingTimeInSeconds" : remainingTimeInSeconds}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
