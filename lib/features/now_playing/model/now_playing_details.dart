import 'package:classipod/core/models/metadata.dart';

enum NowPlayingType { album, playlist, songs, shuffledSongs }

class NowPlayingDetails {
  final int currentIndex;
  final bool isPlaying;
  final NowPlayingType nowPlayingType;
  final Metadata? currentMetadata;
  final List<Metadata> metadataList;

  NowPlayingDetails({
    required this.currentIndex,
    required this.isPlaying,
    required this.nowPlayingType,
    this.currentMetadata,
    required this.metadataList,
  });

  NowPlayingDetails copyWith({
    int? currentIndex,
    bool? isPlaying,
    NowPlayingType? nowPlayingType,
    Metadata? currentMetadata,
    List<Metadata>? metadataList,
  }) {
    return NowPlayingDetails(
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      nowPlayingType: nowPlayingType ?? this.nowPlayingType,
      currentMetadata: currentMetadata ?? this.currentMetadata,
      metadataList: metadataList ?? this.metadataList,
    );
  }
}

//TODO: Current Volume Stream, Current Duration Stream
