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

  String thumbnailPath(
      {required String? albumName,
      required String? artistName,
      required String filePath}) {
    String albumArtFileName;
    if (albumName == null || artistName == null) {
      albumArtFileName = filePath;
    } else {
      albumArtFileName = '${albumName}by$artistName';
    }
    albumArtFileName =
        albumArtFileName.replaceAll('/', '-').replaceAll(' ', '');
    return '$cacheParentDirectory/$albumArtFileName.jpg';
  }

  void cacheAlbumArt({
    required String thumbnailPath,
    required Uint8List bytes,
  }) {
    File(thumbnailPath).writeAsBytesSync(bytes);
  }

  bool isThumbnailFileExists({required String thumbnailPath}) {
    if (File(thumbnailPath).existsSync()) {
      return true;
    } else {
      return false;
    }
  }
}
