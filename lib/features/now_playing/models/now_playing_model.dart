import 'package:classipod/core/models/music_metadata.dart';
import 'package:just_audio/just_audio.dart';

enum NowPlayingType { album, playlist, songs }

class NowPlayingModel {
  final int currentIndex;
  final bool isPlaying;
  final NowPlayingType nowPlayingType;
  final MusicMetadata? currentMetadata;
  final List<MusicMetadata> metadataList;
  final bool isShuffleEnabled;
  final LoopMode loopMode;

  NowPlayingModel({
    required this.currentIndex,
    required this.isPlaying,
    required this.nowPlayingType,
    this.currentMetadata,
    required this.metadataList,
    required this.isShuffleEnabled,
    required this.loopMode,
  });

  NowPlayingModel copyWith({
    int? currentIndex,
    bool? isPlaying,
    NowPlayingType? nowPlayingType,
    MusicMetadata? currentMetadata,
    List<MusicMetadata>? metadataList,
    bool? isShuffleEnabled,
    LoopMode? loopMode,
  }) {
    return NowPlayingModel(
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

    return other is NowPlayingModel &&
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

  @override
  String toString() {
    return "NowPlayingModel(currentIndex: $currentIndex, isPlaying: $isPlaying, nowPlayingType: $nowPlayingType, currentMetadata: $currentMetadata, metadataList: $metadataList, isShuffleEnabled: $isShuffleEnabled, loopMode: $loopMode)";
  }
}
