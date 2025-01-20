import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genresProvider = Provider<List<String>>((ref) {
  final genreNamesSet = <String>{};
  ref.read(audioFilesServiceProvider).requireValue.forEach((audioFile) {
    genreNamesSet.add(audioFile.getMainGenre);
  });

  final genreNames = genreNamesSet.toList();
  genreNames.sort();

  return genreNames;
});
