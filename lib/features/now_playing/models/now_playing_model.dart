import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:just_audio/just_audio.dart';

enum NowPlayingType { album, playlist, songs }

class NowPlayingModel {
  final int currentIndex;
  final int queuePosition;
  final bool isPlaying;
  final NowPlayingType nowPlayingType;
  final MusicMetadata? currentMetadata;
  final List<MusicMetadata> metadataList;
  final PlaybackShuffleMode shuffleMode;

  bool get isShuffleEnabled => shuffleMode != PlaybackShuffleMode.off;
  final LoopMode loopMode;

  NowPlayingModel({
    required this.currentIndex,
    int? queuePosition,
    required this.isPlaying,
    required this.nowPlayingType,
    this.currentMetadata,
    required this.metadataList,
    required this.shuffleMode,
    required this.loopMode,
  }) : queuePosition = queuePosition ?? currentIndex;

  NowPlayingModel copyWith({
    int? currentIndex,
    int? queuePosition,
    bool? isPlaying,
    NowPlayingType? nowPlayingType,
    MusicMetadata? currentMetadata,
    List<MusicMetadata>? metadataList,
    PlaybackShuffleMode? shuffleMode,
    LoopMode? loopMode,
  }) {
    return NowPlayingModel(
      currentIndex: currentIndex ?? this.currentIndex,
      queuePosition: queuePosition ?? this.queuePosition,
      isPlaying: isPlaying ?? this.isPlaying,
      nowPlayingType: nowPlayingType ?? this.nowPlayingType,
      currentMetadata: currentMetadata ?? this.currentMetadata,
      metadataList: metadataList ?? this.metadataList,
      shuffleMode: shuffleMode ?? this.shuffleMode,
      loopMode: loopMode ?? this.loopMode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowPlayingModel &&
        other.currentIndex == currentIndex &&
        other.queuePosition == queuePosition &&
        other.isPlaying == isPlaying &&
        other.nowPlayingType == nowPlayingType &&
        other.currentMetadata == currentMetadata &&
        other.metadataList == metadataList &&
        other.shuffleMode == shuffleMode &&
        other.loopMode == loopMode;
  }

  @override
  int get hashCode {
    return Object.hash(
      currentIndex,
      queuePosition,
      isPlaying,
      nowPlayingType,
      currentMetadata,
      metadataList,
      shuffleMode,
      loopMode,
    );
  }

  @override
  String toString() {
    return "NowPlayingModel(currentIndex: $currentIndex, queuePosition: $queuePosition, isPlaying: $isPlaying, nowPlayingType: $nowPlayingType, currentMetadata: $currentMetadata, metadataList: $metadataList, shuffleMode: $shuffleMode, loopMode: $loopMode)";
  }
}
