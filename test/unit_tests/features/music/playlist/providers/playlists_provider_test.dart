import 'dart:collection';
import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  late Directory directory;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('classipod-playlists-');
    Hive.init(directory.path);
    Hive.registerAdapters();
    await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
  });

  tearDown(() async {
    await Hive.close();
    await directory.delete(recursive: true);
  });

  test('Starred contains only songs with a positive rating', () async {
    final songs = [
      MusicMetadata(songId: 'unrated'),
      MusicMetadata(songId: 'starred', rating: 1),
      MusicMetadata(songId: 'five-stars', rating: 5),
    ];
    final container = ProviderContainer(
      overrides: [
        filteredAudioFilesProvider.overrideWith(
          (ref) async => UnmodifiableListView(songs),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container.read(filteredAudioFilesProvider.future);
    expect(container.read(starredPlaylistProvider), [songs[1], songs[2]]);
  });

  test(
    'Starred is listed after On The Go and before saved playlists',
    () async {
      final playlistBox = Hive.box<PlaylistModel>(Constants.playlistBoxName);
      await playlistBox.add(PlaylistModel(name: 'Saved', songs: []));
      final container = ProviderContainer(
        overrides: [
          filteredAudioFilesProvider.overrideWith(
            (ref) async => UnmodifiableListView([
              MusicMetadata(songId: 'starred', rating: 1),
            ]),
          ),
        ],
      );
      addTearDown(container.dispose);

      final playlists = container.read(playlistsProvider);

      expect(playlists.map((playlist) => playlist.name), [
        'On The Go',
        'Starred',
        'Saved',
      ]);
      expect(playlists[1].key, starredPlaylistKey);
    },
  );

  test('rating updates do not clear On The Go songs', () async {
    var songs = <MusicMetadata>[MusicMetadata(songId: 'song')];
    final container = ProviderContainer(
      overrides: [
        filteredAudioFilesProvider.overrideWith(
          (ref) async => UnmodifiableListView(songs),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(playlistsProvider.notifier);
    notifier.addSongToPlaylist(songs.single);
    songs = [songs.single.copyWith(rating: 1)];
    container.invalidate(filteredAudioFilesProvider);
    await container.read(filteredAudioFilesProvider.future);
    await pumpEventQueue();

    final playlists = container.read(playlistsProvider);
    expect(playlists.first.songs.single.identity, 'song');
    expect(playlists[1].songs.single.rating, 1);
  });
}
