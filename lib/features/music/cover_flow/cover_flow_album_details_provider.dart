import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_album_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coverFlowAlbumDetailsProvider =
    Provider.autoDispose.family<List<CoverFlowAlbumDetails>, String>(
  (ref, albumName) {
    final List<CoverFlowAlbumDetails> coverFlowAlbumDetailsList = [];
    final metadataList = ref.read(audioFilesServiceProvider).requireValue;

    for (int i = 0; i < metadataList.length; i++) {
      if (metadataList[i].getAlbumName == albumName) {
        coverFlowAlbumDetailsList.add(
          CoverFlowAlbumDetails(
            songIndex: i,
            trackDuration: metadataList[i].getTrackDuration,
            songName: metadataList[i].getTrackName,
          ),
        );
      }
    }

    return coverFlowAlbumDetailsList;
  },
);
