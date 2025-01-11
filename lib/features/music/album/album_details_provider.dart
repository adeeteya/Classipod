import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/music/album/album_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumDetailsProvider =
    NotifierProvider<AlbumDetailsNotifier, List<AlbumDetails>>(
  AlbumDetailsNotifier.new,
);

class AlbumDetailsNotifier extends Notifier<List<AlbumDetails>> {
  AlbumDetailsNotifier() : super();

  @override
  List<AlbumDetails> build() {
    return getAlbumDetails();
  }

  List<AlbumDetails> getAlbumDetails() {
    final Set<String> albumNames = {};
    final Set<AlbumDetails> albumDetails = {};
    final metadataList = ref.read(audioFilesServiceProvider).requireValue;

    for (int i = 0; i < metadataList.length; i++) {
      if (!albumNames.contains(metadataList[i].getAlbumName)) {
        albumNames.add(metadataList[i].getAlbumName);
        albumDetails.add(
          AlbumDetails(
            albumName: metadataList[i].getAlbumName,
            albumArtistName: metadataList[i].getAlbumArtistName,
            thumbnailPath: metadataList[i].thumbnailPath,
          ),
        );
      }
    }

    return albumDetails.toList();
  }

  List<Metadata> getAlbumMetadataList(String albumName) {
    final List<Metadata> albumMetadataList = [];
    final metadataList = ref.read(audioFilesServiceProvider).requireValue;

    for (int i = 0; i < metadataList.length; i++) {
      if (metadataList[i].getAlbumName == albumName) {
        albumMetadataList.add(metadataList[i]);
      }
    }

    return albumMetadataList;
  }
}
