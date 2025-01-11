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
    final Set<String> albumNamesSet = {};
    final Set<AlbumDetails> albumDetailsSet = {};
    final metadataList = ref.read(audioFilesServiceProvider).requireValue;

    for (int i = 0; i < metadataList.length; i++) {
      if (!albumNamesSet.contains(metadataList[i].getAlbumName)) {
        albumNamesSet.add(metadataList[i].getAlbumName);
        albumDetailsSet.add(
          AlbumDetails(
            albumName: metadataList[i].getAlbumName,
            albumArtistName: metadataList[i].getAlbumArtistName,
            thumbnailPath: metadataList[i].thumbnailPath,
          ),
        );
      }
    }

    final List<AlbumDetails> albumDetails = albumDetailsSet.toList();
    albumDetails.sort((a, b) => a.albumName.compareTo(b.albumName));

    return albumDetails;
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
