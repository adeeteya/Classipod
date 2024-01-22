import 'package:flutter_media_metadata/flutter_media_metadata.dart';

class MusicDetails {
  final int currentSongIndex;
  final List<Metadata> musicFilesMetaDataList;
  final bool isPlaying;
  final bool isLoading;

  MusicDetails(
      {required this.currentSongIndex,
      required this.musicFilesMetaDataList,
      required this.isPlaying,
      this.isLoading = true});

  MusicDetails copyWith({
    int? currentSongIndex,
    List<Metadata>? musicFilesMetaDataList,
    bool? isPlaying,
    bool? isLoading,
  }) {
    return MusicDetails(
      currentSongIndex: currentSongIndex ?? this.currentSongIndex,
      musicFilesMetaDataList:
          musicFilesMetaDataList ?? this.musicFilesMetaDataList,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
