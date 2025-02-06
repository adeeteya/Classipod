import 'package:classipod/core/models/metadata.dart';
import 'package:just_audio/just_audio.dart';

enum NowPlayingType { album, playlist, songs, shuffledSongs }

class NowPlayingDetails {
  final int currentIndex;
  final bool isPlaying;
  final NowPlayingType nowPlayingType;
  final Metadata? currentMetadata;
  final List<Metadata> metadataList;
  final LoopMode loopMode;

  NowPlayingDetails({
    required this.currentIndex,
    required this.isPlaying,
    required this.nowPlayingType,
    this.currentMetadata,
    required this.metadataList,
    required this.loopMode,
  });

  NowPlayingDetails copyWith({
    int? currentIndex,
    bool? isPlaying,
    NowPlayingType? nowPlayingType,
    Metadata? currentMetadata,
    List<Metadata>? metadataList,
    LoopMode? loopMode,
  }) {
    return NowPlayingDetails(
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      nowPlayingType: nowPlayingType ?? this.nowPlayingType,
      currentMetadata: currentMetadata ?? this.currentMetadata,
      metadataList: metadataList ?? this.metadataList,
      loopMode: loopMode ?? this.loopMode,
    );
  }
}
