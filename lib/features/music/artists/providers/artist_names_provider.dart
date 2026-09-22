import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<List<String>>((ref) {
  final artistNamesSet = <String>{};
  ref.read(filteredAudioFilesProvider).requireValue.forEach((audioFile) {
    if (audioFile.songId != null) {
      artistNamesSet.addAll(audioFile.trackArtistNames ?? []);
      artistNamesSet.addAll(audioFile.albumArtistNames ?? []);
    } else {
      artistNamesSet.add(audioFile.getMainArtistName);
    }
  });

  final artistNames = artistNamesSet.toList();
  artistNames.sort();

  return artistNames;
});
