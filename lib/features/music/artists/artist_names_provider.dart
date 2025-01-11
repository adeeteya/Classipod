import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistNamesProvider = Provider<List<String>>((ref) {
  final artistNames = <String>{};
  ref.read(audioFilesServiceProvider).requireValue.forEach((audioFile) {
    artistNames.add(audioFile.getMainArtistName);
  });
  return artistNames.toList(growable: false);
});
