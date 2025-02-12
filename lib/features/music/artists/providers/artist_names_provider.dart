import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<List<String>>((ref) {
  final artistNamesSet = <String>{};
  ref.read(audioFilesServiceProvider).requireValue.forEach((audioFile) {
    artistNamesSet.add(audioFile.getMainArtistName);
  });

  final artistNames = artistNamesSet.toList();
  artistNames.sort();

  return artistNames;
});
