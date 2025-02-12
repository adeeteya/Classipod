import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumDetailsProvider = Provider<List<AlbumModel>>((ref) {
  final List<AlbumModel> albumDetails = [];
  final metadataList = ref.read(audioFilesServiceProvider).requireValue;

  for (int i = 0; i < metadataList.length; i++) {
    final albumDetail = AlbumModel(
      albumName: metadataList[i].getAlbumName,
      albumArtPath: metadataList[i].thumbnailPath,
      albumArtistName: metadataList[i].getAlbumArtistName,
      albumSongs: [metadataList[i]],
    );

    // If album does not exist, add the album
    if (!albumDetails.contains(albumDetail)) {
      albumDetails.add(albumDetail);
    }

    // If album already exists, add the song to the album
    else {
      final int existingIdx = albumDetails.indexWhere((e) => e == albumDetail);
      if (existingIdx != -1) {
        albumDetails[existingIdx].albumSongs.add(metadataList[i]);
      }
    }
  }

  // Sort the album details by album name
  albumDetails.sort((a, b) => a.albumName.compareTo(b.albumName));

  return albumDetails;
});
