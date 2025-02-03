import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistAlbumDetailListProvider =
    Provider.autoDispose.family<List<AlbumDetail>, String>((ref, artistName) {
  final List<AlbumDetail> artistAlbumDetailsList = [];

  ref.read(albumDetailsProvider).forEach((albumDetail) {
    if (albumDetail.albumArtistName == artistName) {
      artistAlbumDetailsList.add(albumDetail);
    }
  });

  return artistAlbumDetailsList;
});
