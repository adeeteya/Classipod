import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreSongsMetadataListProvider = Provider.autoDispose
    .family<List<MusicMetadata>, String>((ref, genreName) {
      final List<MusicMetadata> genreSongsMetadataList = [];

      for (final metadata
          in ref.watch(filteredAudioFilesProvider).value ?? <MusicMetadata>[]) {
        if (metadata.genres.contains(genreName)) {
          genreSongsMetadataList.add(metadata);
        }
      }

      return genreSongsMetadataList;
    });
