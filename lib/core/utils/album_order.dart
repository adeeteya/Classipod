import 'package:classipod/core/models/music_metadata.dart';

String albumIdentityOf(MusicMetadata metadata) {
  final albumName = metadata.getAlbumName.trim().toLowerCase();
  final primaryArtist = metadata.songId == null
      ? metadata.getPrimaryAlbumArtistName.trim().toLowerCase()
      : (metadata.albumArtistNames ?? metadata.trackArtistNames ?? [])
            .map((name) => name.trim().toLowerCase())
            .join('\u0001');
  return metadata.isSubsonic
      ? '${metadata.serverId}:${metadata.remoteAlbumId ?? albumName}'
      : '$albumName\u0000$primaryArtist';
}

int compareAlbumTracks(MusicMetadata a, MusicMetadata b) {
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
