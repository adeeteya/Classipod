enum SleepTimerMode { off, fixedDuration, endOfCurrentSong }

class SleepTimerState {
  final SleepTimerMode mode;
  final Duration? duration;
  final DateTime? deadline;

  const SleepTimerState({required this.mode, this.duration, this.deadline});

  const SleepTimerState.off()
    : mode = SleepTimerMode.off,
      duration = null,
      deadline = null;

  bool get isActive => mode != SleepTimerMode.off;

  @override
  bool operator ==(Object other) {
    return other is SleepTimerState &&
        other.mode == mode &&
        other.duration == duration &&
        other.deadline == deadline;
  }

  @override
  int get hashCode => Object.hash(mode, duration, deadline);
}
