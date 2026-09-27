import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genresProvider = Provider<List<String>>((ref) {
  final genreNamesSet = <String>{};
  for (final audioFile in ref.watch(filteredAudioFilesProvider).value ?? []) {
    genreNamesSet.addAll(audioFile.genres);
  }

  final genreNames = genreNamesSet.toList();
  genreNames.sort();

  return genreNames;
});
