import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/utils/album_order.dart';
import 'package:classipod/core/utils/name_order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genresProvider = Provider<List<String>>((ref) {
  final genreNames = ref.watch(genreCountsProvider).keys.toList();
  genreNames.sort(compareNames);

  return genreNames;
});

final genreCountsProvider =
    Provider<Map<String, ({int artistCount, int albumCount})>>((ref) {
      final artists = <String, Set<String>>{};
      final albums = <String, Set<String>>{};
      final songs =
          ref.watch(filteredAudioFilesProvider).value ?? <MusicMetadata>[];
      for (final song in songs) {
        final songArtists = (song.trackArtistNames ?? [])
            .map((name) => name.trim().toLowerCase())
            .where((name) => name.isNotEmpty)
            .toSet();
        if (songArtists.isEmpty) songArtists.add('unknown artist');
        for (final genre in song.genres) {
          artists.putIfAbsent(genre, () => {}).addAll(songArtists);
          albums.putIfAbsent(genre, () => {}).add(albumIdentityOf(song));
        }
      }
      return {
        for (final genre in artists.keys)
          genre: (
            artistCount: artists[genre]!.length,
            albumCount: albums[genre]!.length,
          ),
      };
    });
