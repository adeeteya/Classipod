import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LibraryPhase { discovering, metadata, artwork, saving, complete }

class LibraryProgress {
  final LibraryPhase phase;
  final int songsTotal;
  final int songsLoaded;
  final int songsCached;
  final int? artworkTotal;
  final int artworkCached;
  final int failures;

  const LibraryProgress({
    this.phase = LibraryPhase.discovering,
    this.songsTotal = 0,
    this.songsLoaded = 0,
    this.songsCached = 0,
    this.artworkTotal,
    this.artworkCached = 0,
    this.failures = 0,
  });
}

final libraryProgressProvider =
    NotifierProvider<LibraryProgressNotifier, LibraryProgress>(
      LibraryProgressNotifier.new,
    );

class LibraryProgressNotifier extends Notifier<LibraryProgress> {
  DateTime _lastUpdate = DateTime(1970);

  @override
  LibraryProgress build() => const LibraryProgress();

  void report(LibraryProgress progress) {
    final now = DateTime.now();
    if (progress.phase != state.phase ||
        progress.phase == LibraryPhase.discovering ||
        now.difference(_lastUpdate).inMilliseconds >= 80 ||
        progress.phase == LibraryPhase.complete) {
      state = progress;
      _lastUpdate = now;
    }
  }
}
