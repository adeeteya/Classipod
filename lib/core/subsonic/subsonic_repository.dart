import 'dart:async';
import 'dart:typed_data';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/subsonic/subsonic_client.dart';
import 'package:classipod/core/utils/artist_name_utils.dart';
import 'package:hive_ce/hive.dart';

class SubsonicRepository {
  final Box<dynamic> box;
  final Map<String, Future<Uint8List>> _artwork = {};
  int _generation = 0;
  SubsonicRepository(this.box);

  void cancel() => _generation++;

  List<MusicMetadata> cached(String serverId) =>
      (box.get('catalog:$serverId') as List? ?? [])
          .cast<MusicMetadata>()
          .map(_applyOverride)
          .toList();

  MusicMetadata _applyOverride(MusicMetadata song) {
    final saved = box.get('override:${song.identity}');
    if (saved is! MusicMetadata) return song;
    return song.copyWith(
      trackName: saved.trackName,
      trackArtistNames: saved.trackArtistNames,
      albumName: saved.albumName,
      genres: saved.genres,
      lyrics: saved.lyrics,
      rating: saved.rating,
    );
  }

  Future<void> update(MusicMetadata song) =>
      box.put('override:${song.identity}', song);

  Future<void> clearArtwork(String id) async {
    await box.deleteAll(
      box.keys.where((key) => key.toString().startsWith('art:$id:')).toList(),
    );
    _artwork.clear();
  }

  Future<void> remove(String id) async {
    cancel();
    await clearArtwork(id);
    await box.delete('catalog:$id');
    await box.deleteAll(
      box.keys
          .where((key) => key.toString().startsWith('override:subsonic:$id:'))
          .toList(),
    );
  }

  Future<Uint8List> artwork(SubsonicClient client, String id) {
    final key = 'art:${client.config.id}:$id';
    final bytes = box.get(key);
    if (bytes is Uint8List) return Future.value(bytes);
    final generation = _generation;
    return _artwork.putIfAbsent(key, () async {
      try {
        final data = await client.artwork(id);
        if (generation != _generation) {
          throw const SubsonicException('cancelled');
        }
        await box.put(key, data);
        return data;
      } finally {
        unawaited(_artwork.remove(key));
      }
    });
  }

  Future<List<MusicMetadata>> scan(
    SubsonicClient client, {
    void Function(int albums, int songs)? progress,
  }) async {
    final generation = ++_generation;
    void check() {
      if (generation != _generation) {
        throw const SubsonicException('cancelled');
      }
    }

    final seenAlbums = <String>{};
    final songs = <String, MusicMetadata>{};
    var offset = 0;
    while (true) {
      check();
      final response = await client.request('getAlbumList2', {
        'type': 'alphabeticalByName',
        'size': '400',
        'offset': '$offset',
      });
      check();
      final listing = response['albumList2'];
      if (listing is! Map) throw const SubsonicException('response');
      final albums = listing['album'] ?? [];
      if (albums is! List) throw const SubsonicException('response');
      if (albums.isEmpty) break;
      final ids = <String>[];
      for (final album in albums) {
        final id = album is Map ? album['id']?.toString() : null;
        if (id == null || id.isEmpty) {
          throw const SubsonicException('response');
        }
        if (seenAlbums.add(id)) ids.add(id);
      }
      if (ids.isEmpty) throw const SubsonicException('pagination');
      for (var start = 0; start < ids.length; start += 4) {
        check();
        final batch = await Future.wait(
          ids.skip(start).take(4).map((id) async {
            final result = await client.request('getAlbum', {'id': id});
            final album = result['album'];
            if (album is! Map<String, dynamic> ||
                (album['song'] != null && album['song'] is! List)) {
              throw const SubsonicException('response');
            }
            return [
              for (final item in album['song'] as List? ?? [])
                parseSong(
                  Map<String, dynamic>.from(item as Map),
                  album,
                  client.config.id,
                ),
            ];
          }),
        );
        check();
        for (final song in batch.expand((songs) => songs)) {
          songs[song.identity] = song;
        }
        progress?.call(seenAlbums.length, songs.length);
      }
      offset += albums.length;
    }
    check();
    final result = songs.values.map(_applyOverride).toList();
    await box.put('catalog:${client.config.id}', result);
    check();
    return result;
  }

  static MusicMetadata parseSong(
    Map<String, dynamic> data,
    Map<String, dynamic> album,
    String serverId,
  ) {
    final id = data['id']?.toString();
    if (id == null || id.isEmpty) {
      throw const SubsonicException('response');
    }
    String? string(Object? value) => value?.toString();
    List<String> names(Object? multiple, Object? single) {
      if (multiple is List) {
        final values = multiple
            .map((e) => e is Map ? e['name'] : e)
            .whereType<String>()
            .where((e) => e.isNotEmpty)
            .toList();
        if (values.isNotEmpty) return values;
      }
      return splitArtistNames(string(single) ?? '');
    }

    final art = string(data['coverArt'] ?? album['coverArt']);
    final artists = names(data['artists'], data['artist'] ?? album['artist']);
    final albumArtists = names(
      data['albumArtists'] ?? album['artists'],
      data['albumArtist'] ?? album['artist'],
    );
    return MusicMetadata(
      serverId: serverId,
      remoteSongId: id,
      remoteAlbumId: string(data['albumId'] ?? album['id']),
      remoteArtworkId: art,
      songId: 'subsonic:$serverId:${Uri.encodeComponent(id)}',
      isOnDevice: false,
      trackName: string(data['title']),
      trackArtistNames: artists,
      albumName: string(data['album'] ?? album['name']),
      albumArtistName: albumArtists.join('; '),
      albumArtistNames: albumArtists,
      trackNumber: parseInteger(data['track']),
      discNumber: parseInteger(data['discNumber']),
      albumLength: parseInteger(album['songCount']),
      year: parseInteger(data['year'] ?? album['year']),
      genres: names(data['genres'], data['genre'] ?? album['genre']),
      trackDuration: ((num.tryParse('${data['duration']}') ?? 0) * 1000)
          .round(),
      bitrate: parseInteger(data['bitRate']),
      mimeType: string(data['contentType']),
      thumbnailPath: art == null
          ? null
          : Uri(
              scheme: 'subsonic',
              host: serverId,
              pathSegments: [art],
            ).toString(),
    );
  }
}
