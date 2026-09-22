import 'package:classipod/core/utils/artist_name_utils.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artistAlbumDetailListProvider = Provider.autoDispose
    .family<List<AlbumModel>, String>((ref, artistName) {
      final List<AlbumModel> artistAlbumDetailsList = [];

      ref.read(albumDetailsProvider).forEach((albumDetail) {
        final isContributingArtist = albumDetail.albumSongs.any(
          (song) => song.trackArtistNames?.contains(artistName) ?? false,
        );
        final isListedAlbumArtist = albumDetail.albumSongs.any(
          (song) => song.songId != null
              ? song.albumArtistNames?.contains(artistName) ?? false
              : splitArtistNames(song.getAlbumArtistName).contains(artistName),
        );
        if (isListedAlbumArtist || isContributingArtist) {
          artistAlbumDetailsList.add(albumDetail);
        }
      });

      return artistAlbumDetailsList;
    });
