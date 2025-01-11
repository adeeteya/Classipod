import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistSongsMetadataListProvider =
    Provider.autoDispose.family<List<Metadata>, String>((ref, artistName) {
  final List<Metadata> artistSongsMetadataList = [];

  ref.read(audioFilesServiceProvider).requireValue.forEach((metadata) {
    if (metadata.getMainArtistName == artistName) {
      artistSongsMetadataList.add(metadata);
    }
  });

  return artistSongsMetadataList;
});
