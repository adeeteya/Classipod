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

  // Sort the songs in each album by disc number, then track number.
  for (final album in albumDetails) {
    album.albumSongs.sort(_compareAlbumTracks);
  }

  return albumDetails;
}

int _compareAlbumTracks(MusicMetadata a, MusicMetadata b) {
  final aDiscNumber = (a.discNumber ?? 0) > 0 ? a.discNumber! : 1;
  final bDiscNumber = (b.discNumber ?? 0) > 0 ? b.discNumber! : 1;
  final discComparison = aDiscNumber.compareTo(bDiscNumber);
  if (discComparison != 0) {
    return discComparison;
  }

  final aTrackNumber = (a.trackNumber ?? 0) > 0 ? a.trackNumber : null;
  final bTrackNumber = (b.trackNumber ?? 0) > 0 ? b.trackNumber : null;
  if (aTrackNumber == null && bTrackNumber != null) {
    return 1;
  }
  if (aTrackNumber != null && bTrackNumber == null) {
    return -1;
  }
  if (aTrackNumber != null && bTrackNumber != null) {
    final trackComparison = aTrackNumber.compareTo(bTrackNumber);
    if (trackComparison != 0) {
      return trackComparison;
    }
  }

  final songNameComparison = a.getTrackName.toLowerCase().compareTo(
    b.getTrackName.toLowerCase(),
  );
  if (songNameComparison != 0) {
    return songNameComparison;
  }

  return a.originalSongIndex.compareTo(b.originalSongIndex);
}
