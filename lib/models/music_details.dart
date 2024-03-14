import 'package:flutter_media_metadata/flutter_media_metadata.dart';

class MusicDetails {
  final int currentSongIndex;
  final List<Metadata> musicFilesMetaDataList;
  final bool isPlaying;
  final bool isLoading;
  final bool isVolumeChanging;

  MusicDetails(
      {required this.currentSongIndex,
      required this.musicFilesMetaDataList,
      required this.isPlaying,
      this.isLoading = true,
      required this.isVolumeChanging});

  MusicDetails copyWith({
    int? currentSongIndex,
    List<Metadata>? musicFilesMetaDataList,
    bool? isPlaying,
    bool? isLoading,
    bool? isVolumeChanging,
  }) {
    return MusicDetails(
      currentSongIndex: currentSongIndex ?? this.currentSongIndex,
      musicFilesMetaDataList:
          musicFilesMetaDataList ?? this.musicFilesMetaDataList,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      isVolumeChanging: isVolumeChanging ?? this.isVolumeChanging,
    );
  }
}
