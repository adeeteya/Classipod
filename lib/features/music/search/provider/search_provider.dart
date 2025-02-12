import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/artists/providers/artist_albums_provider.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:classipod/features/music/search/model/search_model.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
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
            ref.read(artistAlbumDetailListProvider(artist)).length;
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
        final int numberOfSongs = album.albumSongs.length;
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
