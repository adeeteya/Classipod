import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistSongIndexesProvider =
    Provider.autoDispose.family<List<int>, String>((ref, artistName) {
  final List<int> artistSongIndexes = [];
  final metadataList = ref.read(audioFilesServiceProvider).requireValue;
  for (int i = 0; i < metadataList.length; i++) {
    if (metadataList[i].getMainArtistName == artistName) {
      artistSongIndexes.add(i);
    }
  }
  return artistSongIndexes;
});
