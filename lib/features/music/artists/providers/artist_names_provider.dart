import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/utils/name_order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<List<String>>((ref) {
  final artistNamesSet = <String>{};
  for (final audioFile in ref.watch(filteredAudioFilesProvider).value ?? []) {
    if (audioFile.songId != null) {
      artistNamesSet.addAll(audioFile.trackArtistNames ?? []);
      artistNamesSet.addAll(audioFile.albumArtistNames ?? []);
    } else {
      artistNamesSet.add(audioFile.getMainArtistName);
    }
  }

  final artistNames = artistNamesSet.toList();
  artistNames.sort(compareNames);

  return artistNames;
});
