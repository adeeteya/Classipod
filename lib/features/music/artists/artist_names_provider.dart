import 'package:classipod/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<Set<String>>((ref) {
  final artistNames = <String>{};
  ref.read(audioFilesServiceProvider).requireValue.forEach((audioFile) {
    artistNames.add(audioFile.getMainArtistName);
  });
  return artistNames;
});
