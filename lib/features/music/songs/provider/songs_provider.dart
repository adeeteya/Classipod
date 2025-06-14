import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsProvider = Provider<List<MusicMetadata>>((ref) {
  final metadataList =
      ref.read(filteredAudioFilesProvider).requireValue.toList();
  metadataList.sort((a, b) => a.getTrackName.compareTo(b.getTrackName));
  return metadataList;
});
