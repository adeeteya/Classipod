import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/artists/artist_names_provider.dart';
import 'package:classipod/features/music/artists/artist_songs_provider.dart';
import 'package:classipod/features/music/search/search_model.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    Provider.autoDispose.family<List<SearchResultsModel>, String>(
  (ref, searchQuery) {
    if (searchQuery.isEmpty) {
      return [];
    }
    final List<SearchResultsModel> searchResults = [];

    final songsList = ref.read(songsProvider);
    for (final song in songsList) {
      if (song.getTrackName.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchResults.add(
          SearchResultsModel(
            searchResultType: SearchResultType.track,
            result: song,
          ),
        );
      }
    }

    final artistsNames = ref.read(artistNamesProvider);
    for (final artist in artistsNames) {
      if (artist.toLowerCase().contains(searchQuery.toLowerCase())) {
        final numberOfSongs =
            ref.read(artistSongsMetadataListProvider(artist)).length;
        searchResults.add(
          SearchResultsModel(
            searchResultType: SearchResultType.artist,
            result: artist,
            count: numberOfSongs,
          ),
        );
      }
    }

    final albumDetails = ref.read(albumDetailsProvider);
    for (final album in albumDetails) {
      if (album.albumName.toLowerCase().contains(searchQuery.toLowerCase())) {
        final int numberOfSongs = ref
            .read(albumDetailsProvider.notifier)
            .getAlbumMetadataList(album.albumName)
            .length;
        searchResults.add(
          SearchResultsModel(
            searchResultType: SearchResultType.album,
            result: album,
            count: numberOfSongs,
          ),
        );
      }
    }

    return searchResults;
  },
);
