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

  String thumbnailPathName(String filePath) {
    final String albumArtFileName =
        filePath.replaceAll('/', '-').replaceAll(' ', '');
    return '$cacheParentDirectory/$albumArtFileName.jpg';
  }

  Future<void> cacheAlbumArt({
    required String thumbnailPath,
    required Uint8List bytes,
  }) async {
    final File albumArtFile = await File(thumbnailPath).create(recursive: true);
    albumArtFile.writeAsBytesSync(bytes);
  }

  bool isThumbnailFileExists({required String thumbnailPath}) {
    if (File(thumbnailPath).existsSync()) {
      return true;
    } else {
      return false;
    }
  }
}
