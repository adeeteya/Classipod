import 'dart:typed_data';

import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/core/widgets/artwork_file_stub.dart'
    if (dart.library.io) 'package:classipod/core/widgets/artwork_file_io.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteArtworkProvider = FutureProvider.autoDispose
    .family<Uint8List, String>((ref, path) async {
      ref.watch(
        subsonicControllerProvider.select(
          (value) => (
            value.value?.enabled,
            value.value?.signedIn,
            value.value?.config?.id,
            value.value?.scanning,
          ),
        ),
      );
      return ref.read(subsonicControllerProvider.notifier).artwork(path);
    });

ImageProvider artworkImage(WidgetRef ref, String? path) {
  const fallback = AssetImage(Assets.defaultAlbumCoverImage);
  if (path == null) return fallback;
  final uri = Uri.tryParse(path);
  if (uri?.scheme == 'subsonic') {
    final bytes = ref.watch(remoteArtworkProvider(path)).value;
    return bytes == null ? fallback : MemoryImage(bytes);
  }
  if (uri?.scheme == 'http' || uri?.scheme == 'https') {
    return NetworkImage(path);
  }
  return fileArtwork(path);
}
