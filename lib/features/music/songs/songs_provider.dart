import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final songsProvider = Provider<List<Metadata>>((ref) {
  final metadataList =
      ref.read(audioFilesServiceProvider).requireValue.toList();
  metadataList.sort((a, b) => a.getTrackName.compareTo(b.getTrackName));
  return metadataList;
});
