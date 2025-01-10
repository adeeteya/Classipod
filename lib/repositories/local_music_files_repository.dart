import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/helper_functions.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/repositories/local_album_art_cache_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final localMusicFileRepositoryProvider =
    Provider.autoDispose<LocalMusicFilesRepository>((ref) {
  return LocalMusicFilesRepository(
    ref.read(localAlbumArtCacheRepositoryProvider),
  );
});

class LocalMusicFilesRepository {
  final LocalAlbumArtCacheRepository _localAlbumArtCacheRepository;

  LocalMusicFilesRepository(this._localAlbumArtCacheRepository);

  Future<Map<Permission, PermissionStatus>> requestStoragePermissions() async {
    try {
      return await [Permission.storage, Permission.audio].request();
    } catch (e) {
      throw Exception('Permission request failed');
    }
  }

  Future<List<Metadata>> getMusicFilesMetadata({
    required String musicFolderPath,
    required String cacheParentDirectory,
  }) async {
    final Directory storageDir = Directory(musicFolderPath);
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

    return metadataList;
  }
}
