import 'dart:async';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/duration_extensions.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/sleep_timer/models/sleep_timer_model.dart';
import 'package:classipod/features/sleep_timer/provider/sleep_timer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SleepTimerPreviewWidget extends ConsumerStatefulWidget {
  const SleepTimerPreviewWidget({super.key});

  @override
  ConsumerState createState() => _SleepTimerPreviewWidgetState();
}

class _SleepTimerPreviewWidgetState
    extends ConsumerState<SleepTimerPreviewWidget> {
  late final Timer _refreshTimer;

  @override
  void initState() {
    super.initState();
    _refreshTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SleepTimerState timerState = ref.watch(sleepTimerControllerProvider);
    return SizedBox(
      key: const ValueKey(SplitScreenType.sleepTimer),
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.darkScreenBackgroundGradient1,
              AppPalette.darkScreenBackgroundGradient2,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.localization.sleepTimerTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                CupertinoIcons.timer,
                size: 70,
                color: CupertinoColors.white,
              ),
              _TimerDuration(timerState: timerState),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimerDuration extends ConsumerWidget {
  final SleepTimerState timerState;

  const _TimerDuration({required this.timerState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (timerState.mode) {
      SleepTimerMode.off => _DurationText(
        value: context.localization.tileValueOff,
      ),
      SleepTimerMode.fixedDuration => _DurationText(
        value: _remainingFixedDuration(
          ref.read(sleepTimerClockProvider)(),
        ).getMinuteAndSecondString,
        label: context.localization.sleepTimerRemainingLabel,
      ),
      SleepTimerMode.endOfCurrentSong => StreamBuilder<Duration>(
        stream: ref.read(sleepTimerPlaybackProvider).positionStream,
        initialData: ref.read(sleepTimerPlaybackProvider).position,
        builder: (context, snapshot) {
          final Duration position = snapshot.data ?? Duration.zero;
          final Duration duration =
              ref.read(sleepTimerPlaybackProvider).duration ?? Duration.zero;
          final Duration remaining = duration > position
              ? duration - position
              : Duration.zero;
          return _DurationText(
            value: remaining.getMinuteAndSecondString,
            label: context.localization.sleepTimerEndOfCurrentSong,
          );
        },
      ),
    };
  }

  Duration _remainingFixedDuration(DateTime now) {
    final DateTime? deadline = timerState.deadline;
    if (deadline == null) {
      return Duration.zero;
    }
    final int remainingMilliseconds = deadline.difference(now).inMilliseconds;
    if (remainingMilliseconds <= 0) {
      return Duration.zero;
    }
    return Duration(
      seconds: (remainingMilliseconds / Duration.millisecondsPerSecond).ceil(),
    );
  }
}

class _DurationText extends StatelessWidget {
  final String value;
  final String? label;

  const _DurationText({required this.value, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: CupertinoColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(
            label!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: CupertinoColors.white),
          ),
        ],
      ],
    );
  }
}
