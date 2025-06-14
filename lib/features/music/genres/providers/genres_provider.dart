import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genresProvider = Provider<List<String>>((ref) {
  final genreNamesSet = <String>{};
  ref.read(filteredAudioFilesProvider).requireValue.forEach((audioFile) {
    genreNamesSet.addAll(audioFile.genres);
  });

  final genreNames = genreNamesSet.toList();
  genreNames.sort();

  return genreNames;
});
