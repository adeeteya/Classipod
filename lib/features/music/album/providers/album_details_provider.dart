import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/utils/artist_name_utils.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumDetailsProvider = Provider<List<AlbumModel>>((ref) {
  final metadataList = ref.read(filteredAudioFilesProvider).requireValue;
  return buildAlbumDetails(metadataList);
});

List<AlbumModel> buildAlbumDetails(Iterable<MusicMetadata> metadataList) {
  final albumsByIdentity = <String, List<MusicMetadata>>{};

  for (final metadata in metadataList) {
    final albumName = metadata.getAlbumName.trim().toLowerCase();
    final primaryArtist = metadata.getPrimaryAlbumArtistName
        .trim()
        .toLowerCase();
    final albumIdentity = '$albumName\u0000$primaryArtist';
    albumsByIdentity.putIfAbsent(albumIdentity, () => []).add(metadata);
  }

  final albumDetails = albumsByIdentity.values.map((albumSongs) {
    final albumArtists = <String>{};
    for (final song in albumSongs) {
      final artistNames =
          song.trackArtistNames ?? splitArtistNames(song.getAlbumArtistName);
      albumArtists.addAll(artistNames);
    }

    final albumArtPath = albumSongs
        .map((song) => song.thumbnailPath)
        .whereType<String>()
        .firstOrNull;

    return AlbumModel(
      albumName: albumSongs.first.getAlbumName,
      albumArtPath: albumArtPath,
      albumArtistName: albumArtists.join(', '),
      albumSongs: albumSongs,
    );
  }).toList();

  // Sort the album details by artist name, album name
  albumDetails.sort((a, b) {
    final artistCompare = a.albumArtistName.compareTo(b.albumArtistName);
    if (artistCompare != 0) return artistCompare;
    return a.albumName.compareTo(b.albumName);
  });

  // Sort the songs in each album by track number
  for (final album in albumDetails) {
    album.albumSongs.sort(
      (a, b) => a.getTrackNumber.compareTo(b.getTrackNumber),
    );
  }

  return albumDetails;
}
