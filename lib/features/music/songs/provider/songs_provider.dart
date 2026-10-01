import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/utils/name_order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsProvider = Provider<List<MusicMetadata>>((ref) {
  final metadataList =
      (ref.watch(filteredAudioFilesProvider).value ?? <MusicMetadata>[])
          .toList();
  metadataList.sort((a, b) {
    final titleComparison = compareNames(a.getTrackName, b.getTrackName);
    if (titleComparison != 0) return titleComparison;

    return a.originalSongIndex.compareTo(b.originalSongIndex);
  });
  return metadataList;
});
