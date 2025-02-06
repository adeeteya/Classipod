import 'package:classipod/core/models/metadata.dart';
import 'package:just_audio/just_audio.dart';

enum NowPlayingType { album, playlist, songs }

class NowPlayingDetails {
  final int currentIndex;
  final bool isPlaying;
  final NowPlayingType nowPlayingType;
  final Metadata? currentMetadata;
  final List<Metadata> metadataList;
  final bool isShuffleEnabled;
  final LoopMode loopMode;

  NowPlayingDetails({
    required this.currentIndex,
    required this.isPlaying,
    required this.nowPlayingType,
    this.currentMetadata,
    required this.metadataList,
    required this.isShuffleEnabled,
    required this.loopMode,
  });

  NowPlayingDetails copyWith({
    int? currentIndex,
    bool? isPlaying,
    NowPlayingType? nowPlayingType,
    Metadata? currentMetadata,
    List<Metadata>? metadataList,
    bool? isShuffleEnabled,
    LoopMode? loopMode,
  }) {
    return NowPlayingDetails(
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      nowPlayingType: nowPlayingType ?? this.nowPlayingType,
      currentMetadata: currentMetadata ?? this.currentMetadata,
      metadataList: metadataList ?? this.metadataList,
      isShuffleEnabled: isShuffleEnabled ?? this.isShuffleEnabled,
      loopMode: loopMode ?? this.loopMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowPlayingDetails &&
        other.currentIndex == currentIndex &&
        other.isPlaying == isPlaying &&
        other.nowPlayingType == nowPlayingType &&
        other.currentMetadata == currentMetadata &&
        other.metadataList == metadataList &&
        other.isShuffleEnabled == isShuffleEnabled &&
        other.loopMode == loopMode;
  }

  @override
  int get hashCode {
    return Object.hash(
      currentIndex,
      isPlaying,
      nowPlayingType,
      currentMetadata,
      metadataList,
      isShuffleEnabled,
      loopMode,
    );
  }
}
