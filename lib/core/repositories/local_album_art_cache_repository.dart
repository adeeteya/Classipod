import 'dart:io';
import 'dart:typed_data';

import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localAlbumArtCacheRepositoryProvider =
    Provider.autoDispose<LocalAlbumArtCacheRepository>((ref) {
  return LocalAlbumArtCacheRepository(
    ref.read(tempDirectoryProvider).requireValue.path,
  );
});

class LocalAlbumArtCacheRepository {
  final String cacheParentDirectory;

  LocalAlbumArtCacheRepository(this.cacheParentDirectory);

  Future<String> cacheAlbumArt({
    required String filePath,
    required Uint8List bytes,
  }) async {
    final String albumArtFileName =
        filePath.replaceAll('/', '-').replaceAll(' ', '');
    final String albumArtFilePath =
        '$cacheParentDirectory/$albumArtFileName.jpg';

    final File albumArtFile =
        await File(albumArtFilePath).create(recursive: true);
    albumArtFile.writeAsBytesSync(bytes);

    return albumArtFilePath;
  }

  String? getCachedAlbumArtPath({required String filePath}) {
    final String albumArtFileName =
        filePath.replaceAll('/', '-').replaceAll(' ', '');
    final String albumArtFilePath =
        '$cacheParentDirectory/$albumArtFileName.jpg';

    if (File(albumArtFilePath).existsSync()) {
      return albumArtFilePath;
    } else {
      return null;
    }
  }
}
