import 'package:classipod/core/models/music_metadata.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<String> conservativeNames(Iterable<String> values) => values
    .expand((value) => value.split(';'))
    .map((value) => (normalizeMetadataString(value) ?? value).trim())
    .where((value) => value.isNotEmpty && value != '<unknown>')
    .toSet()
    .toList();

MusicMetadata androidMetadata(
  AndroidAudioRecord song,
  Map<String, dynamic> tags, {
  required int index,
  MusicMetadata? previous,
}) {
  final properties = Map<String, dynamic>.from(
    tags['properties'] as Map? ?? {},
  );
  List<String> values(String key) =>
      List<String>.from(properties[key] as List? ?? []);
  String? text(String key, [String? fallback]) {
    final candidates = [
      ...values(key),
      if (song.metadata[fallback] != null) song.metadata[fallback].toString(),
    ];
    for (final candidate in candidates) {
      final value = normalizeMetadataString(candidate)?.trim();
      if (value != null && value.isNotEmpty && value != '<unknown>') {
        return value;
      }
    }
    return null;
  }

  int? number(String key) => parseInteger(text(key));
  List<String> names(String key, String fallback, List<String> defaults) {
    final tagged = conservativeNames(values(key));
    if (tagged.isNotEmpty) return tagged;
    final media = conservativeNames([
      song.metadata[fallback]?.toString() ?? '',
    ]);
    return media.isNotEmpty ? media : defaults;
  }

  final artists = names('ARTIST', 'artist', ['Unknown Artist']);
  final albumArtists = names('ALBUMARTIST', 'album_artist', artists);
  final track = (song.metadata['track'] as num?)?.toInt();
  final duration = (tags['duration'] as int?) ?? 0;
  return MusicMetadata(
    songId: previous?.songId ?? song.uri,
    sourceVolume: song.volume,
    contentUri: song.uri,
    trackName:
        text('TITLE', 'title') ??
        song.metadata['_display_name']?.toString() ??
        'Unknown Song',
    trackArtistNames: artists.isEmpty ? ['Unknown Artist'] : artists,
    albumName: text('ALBUM', 'album') ?? 'Unknown Album',
    albumArtistNames: albumArtists,
    albumArtistName: albumArtists.join('; '),
    trackNumber: number('TRACKNUMBER') ?? (track == null ? null : track % 1000),
    discNumber:
        number('DISCNUMBER') ??
        (track != null && track >= 1000 ? track ~/ 1000 : null),
    albumLength:
        number('TRACKTOTAL') ??
        number('TOTALTRACKS') ??
        parseInteger(text('TRACKNUMBER')?.split('/').elementAtOrNull(1)),
    year:
        parseInteger(text('DATE')?.split('-').first) ??
        number('YEAR') ??
        (song.metadata['year'] as num?)?.toInt(),
    genres: conservativeNames(
      values('GENRE').isNotEmpty
          ? values('GENRE')
          : [text('GENRE', 'genre') ?? ''],
    ),
    lyrics: text('LYRICS') ?? text('UNSYNCEDLYRICS'),
    mimeType: song.metadata['mime_type'] as String?,
    trackDuration: duration > 0
        ? duration
        : (song.metadata['duration'] as num?)?.toInt(),
    bitrate: tags['bitrate'] as int?,
    filePath: song.path ?? song.uri,
    originalSongIndex: index,
    rating: previous?.rating ?? 0,
  );
}
