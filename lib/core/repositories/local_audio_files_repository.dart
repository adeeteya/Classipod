import 'dart:collection';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
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

  bool isSupportedAudioFormat(String path) {
    if (path.endsWith('.mp3') ||
        path.endsWith('.ogg') ||
        path.endsWith('.wav') ||
        path.endsWith('.flac') ||
        path.endsWith('.m4a') ||
        path.endsWith('.aac')) {
      return true;
    } else {
      return false;
    }
  }

  UnmodifiableListView<Metadata> getAudioFilesMetadata(
    String audioFileFolderPath,
  ) {
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

        final String thumbnailPath =
            _localAlbumArtCacheRepository.thumbnailPathName(path);

        //Cache album art if it doesn't exist
        if (!_localAlbumArtCacheRepository.isThumbnailFileExists(
          thumbnailPath: thumbnailPath,
        )) {
          audioMetadata = readMetadata(File(path), getImage: true);
          if (audioMetadata.pictures.isNotEmpty) {
            _localAlbumArtCacheRepository.cacheAlbumArt(
              thumbnailPath: thumbnailPath,
              bytes: audioMetadata.pictures[0].bytes,
            );
          }
        }

        //No need to fetch album art as it already exists
        else {
          audioMetadata = readMetadata(File(path));
        }

        metadataList.add(
          Metadata.fromAudioMetadata(
            audioMetadata,
            thumbnailPath,
            metadataList.length,
          ),
        );
      }
    }

    return UnmodifiableListView(metadataList);
  }
}
