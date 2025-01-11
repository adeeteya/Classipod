import 'dart:collection';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/helper_functions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/repositories/local_album_art_cache_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localAudioFileRepositoryProvider =
    Provider.autoDispose<LocalAudioFilesRepository>((ref) {
  return LocalAudioFilesRepository(
    ref.read(localAlbumArtCacheRepositoryProvider),
  );
});

class LocalAudioFilesRepository {
  final LocalAlbumArtCacheRepository _localAlbumArtCacheRepository;

  LocalAudioFilesRepository(this._localAlbumArtCacheRepository);

  Future<UnmodifiableListView<Metadata>> getAudioFilesMetadata({
    required String audioFileFolderPath,
    required String cacheParentDirectory,
  }) async {
    final Directory storageDir = Directory(audioFileFolderPath);
    final List<FileSystemEntity> files = storageDir.listSync(
      recursive: true,
      followLinks: false,
    );
    final List<String> filePaths = files.map((e) => e.path).toList();

    final List<Metadata> metadataList = [];

    for (final String path in filePaths) {
      if (isSupportedAudioFormat(path)) {
        late final AudioMetadata audioMetadata;

        String? thumbnailFilePath =
            _localAlbumArtCacheRepository.getCachedAlbumArtPath(filePath: path);

        //Cache album art if it doesn't exist
        if (thumbnailFilePath == null) {
          audioMetadata = await readMetadata(File(path), getImage: true);
          if (audioMetadata.pictures.isNotEmpty) {
            thumbnailFilePath =
                await _localAlbumArtCacheRepository.cacheAlbumArt(
              filePath: path,
              bytes: audioMetadata.pictures[0].bytes,
            );
          }
        }

        //No need to fetch album art as it already exists
        else {
          audioMetadata = await readMetadata(File(path));
        }

        metadataList.add(
          Metadata.fromAudioMetadata(
            audioMetadata,
            thumbnailFilePath,
          ),
        );
      }
    }

    return UnmodifiableListView(metadataList);
  }
}
