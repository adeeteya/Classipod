import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genreSongsMetadataListProvider = Provider.autoDispose
    .family<List<MusicMetadata>, String>((ref, genreName) {
      final List<MusicMetadata> genreSongsMetadataList = [];

      ref.read(audioFilesServiceProvider).requireValue.forEach((metadata) {
        if (metadata.genres.contains(genreName)) {
          genreSongsMetadataList.add(metadata);
        }
      });

      return genreSongsMetadataList;
    });
