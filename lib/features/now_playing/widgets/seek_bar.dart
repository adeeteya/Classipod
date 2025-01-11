import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/now_playing_provider.dart';
import 'package:classipod/features/now_playing/widgets/box_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeekBar extends ConsumerWidget {
  const SeekBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<Duration>(
      stream: ref.read(audioPlayerProvider).positionStream,
      builder: (context, snapshot) {
        final double totalDuration = (ref
                    .read(nowPlayingMetadataListProvider)[
                        ref.read(audioPlayerProvider).currentIndex ?? 0]
                    .trackDuration ??
                1000) /
            1000;
        double currentDuration = snapshot.data?.inSeconds.toDouble() ?? 0;
        if (currentDuration < 0) {
          currentDuration = 0;
        }

        final int elapsedTimeInMinutes = currentDuration ~/ 60;
        // ignore: unnecessary_parenthesis
        final int elapsedTimeInSeconds = (currentDuration).toInt() % 60;

        final int remainingTimeInMinutes =
            (totalDuration - currentDuration) ~/ 60;
        final int remainingTimeInSeconds =
            (totalDuration - currentDuration).toInt() % 60;

        return Row(
          children: [
            SizedBox(
              width: 35,
              child: Text(
                "$elapsedTimeInMinutes:${elapsedTimeInSeconds < 10 ? "0$elapsedTimeInSeconds" : elapsedTimeInSeconds}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BoxProgressBar(
              max: totalDuration,
              value: currentDuration,
            ),
            SizedBox(
              width: 40,
              child: Text(
                "- $remainingTimeInMinutes:${remainingTimeInSeconds < 10 ? "0$remainingTimeInSeconds" : remainingTimeInSeconds}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
