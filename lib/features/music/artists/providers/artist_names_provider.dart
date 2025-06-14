import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<List<String>>((ref) {
  final artistNamesSet = <String>{};
  ref.read(filteredAudioFilesProvider).requireValue.forEach((audioFile) {
    artistNamesSet.add(audioFile.getMainArtistName);
  });

  final artistNames = artistNamesSet.toList();
  artistNames.sort();

  return artistNames;
});
