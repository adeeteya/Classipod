import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/scrubber_bar.dart';
import 'package:classipod/features/now_playing/widgets/seek_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingBottomBar extends ConsumerWidget {
  final bool showScrubber;

  const NowPlayingBottomBar({super.key, this.showScrubber = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.watch(libraryAudioHandlerProvider);
    return RepaintBoundary(
      child: StreamBuilder<PlaybackState>(
        stream: handler.playbackState,
        initialData: handler.playbackState.value,
        builder: (context, snapshot) {
          final double totalDuration =
              (ref
                      .watch(nowPlayingDetailsProvider)
                      .currentMetadata
                      ?.trackDuration ??
                  1000) /
              1000;
          final playback = snapshot.data!;
          final buffering =
              playback.processingState == AudioProcessingState.buffering ||
              playback.processingState == AudioProcessingState.loading;
          double currentDuration = playback.updatePosition.inSeconds.toDouble();
          currentDuration = currentDuration.clamp(
            0,
            totalDuration > 0 ? totalDuration : 0,
          );
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
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$elapsedTimeInMinutes:${elapsedTimeInSeconds < 10 ? "0$elapsedTimeInSeconds" : elapsedTimeInSeconds}",
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        if (showScrubber)
                          ScrubberBar(
                            max: totalDuration,
                            value: currentDuration,
                          ),
                        if (!showScrubber)
                          SeekBar(max: totalDuration, value: currentDuration),
                      ],
                    ),
                    if (buffering) const _DelayedBufferingIndicator(),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "- $remainingTimeInMinutes:${remainingTimeInSeconds < 10 ? "0$remainingTimeInSeconds" : remainingTimeInSeconds}",
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
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

class _DelayedBufferingIndicator extends StatefulWidget {
  const _DelayedBufferingIndicator();

  @override
  State<_DelayedBufferingIndicator> createState() =>
      _DelayedBufferingIndicatorState();
}

class _DelayedBufferingIndicatorState
    extends State<_DelayedBufferingIndicator> {
  late final Timer _delay;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _delay = Timer(const Duration(seconds: 1), () {
      setState(() => _visible = true);
    });
  }

  @override
  void dispose() {
    _delay.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();
    return IgnorePointer(
      child: Semantics(
        label: context.localization.playbackBuffering,
        child: const CupertinoActivityIndicator(radius: 8),
      ),
    );
  }
}
