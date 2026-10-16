import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

// Distinct file paths give every fixture a distinct identity, since
// MusicMetadata.identity falls back to the file path (or originalSongIndex)
// when there is no song id, which would make two bare songs compare equal.
MusicMetadata song(String name) =>
    MusicMetadata(trackName: name, filePath: '/music/$name.mp3');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory directory;
  late Box<PlaylistModel> box;
  late ProviderContainer container;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp(
      'classipod-playlist-test',
    );
    Hive.init(directory.path);
    Hive.registerAdapters();
    box = await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
    container = ProviderContainer();
  });

  tearDown(() async {
    container.dispose();
    await Hive.close();
    Hive.resetAdapters();
    await directory.delete(recursive: true);
  });

  test('createPlaylist stores a named playlist and exposes it', () async {
    final created = await container
        .read(playlistsProvider.notifier)
        .createPlaylist(
          playlistName: 'Road Trip',
          songs: [song('A'), song('B')],
        );

    expect(created, isTrue);
    expect(
      container
          .read(playlistsProvider)
          .where((playlist) => playlist.name == 'Road Trip')
          .single
          .songs,
      hasLength(2),
    );
  });

  test('createPlaylist refuses an empty selection', () async {
    final created = await container
        .read(playlistsProvider.notifier)
        .createPlaylist(playlistName: 'Empty', songs: []);

    expect(created, isFalse);
    expect(box.isEmpty, isTrue);
  });

  test('addSongsToPlaylist appends to the target playlist only', () async {
    final notifier = container.read(playlistsProvider.notifier);
    await notifier.createPlaylist(playlistName: 'Target', songs: [song('A')]);
    final target = container
        .read(playlistsProvider)
        .firstWhere((playlist) => playlist.name == 'Target');

    final added = await notifier.addSongsToPlaylist(
      playlistKey: target.key,
      songs: [song('B'), song('C')],
    );

    expect(added, isTrue);
    final refreshed = container
        .read(playlistsProvider)
        .firstWhere((playlist) => playlist.name == 'Target');
    expect(refreshed.songs.map((metadata) => metadata.trackName), [
      'A',
      'B',
      'C',
    ]);
  });

  test('addSongsToPlaylist never duplicates an existing song', () async {
    final notifier = container.read(playlistsProvider.notifier);
    await notifier.createPlaylist(playlistName: 'Target', songs: [song('A')]);
    final target = container
        .read(playlistsProvider)
        .firstWhere((playlist) => playlist.name == 'Target');

    await notifier.addSongsToPlaylist(
      playlistKey: target.key,
      songs: [song('A')],
    );

    expect(
      container
          .read(playlistsProvider)
          .firstWhere((playlist) => playlist.name == 'Target')
          .songs,
      hasLength(1),
    );
  });

  test(
    'addSongsToPlaylist ignores the on-the-go playlist and empty input',
    () async {
      final notifier = container.read(playlistsProvider.notifier);
      await notifier.createPlaylist(playlistName: 'Target', songs: [song('A')]);

      expect(
        await notifier.addSongsToPlaylist(
          playlistKey: null,
          songs: [song('B')],
        ),
        isFalse,
      );
      expect(
        await notifier.addSongsToPlaylist(playlistKey: 99, songs: [song('B')]),
        isFalse,
      );
      expect(
        await notifier.addSongsToPlaylist(
          playlistKey: container
              .read(playlistsProvider)
              .firstWhere((playlist) => playlist.name == 'Target')
              .key,
          songs: [],
        ),
        isFalse,
      );
    },
  );

  test('the on-the-go playlist stays first and is never persisted', () async {
    final notifier = container.read(playlistsProvider.notifier);
    await notifier.createPlaylist(playlistName: 'Alpha', songs: [song('A')]);
    await notifier.createPlaylist(playlistName: 'Beta', songs: [song('B')]);

    final playlists = container.read(playlistsProvider);
    expect(playlists.first.key, isNull);
    expect(playlists.map((playlist) => playlist.name), [
      'On The Go',
      'Alpha',
      'Beta',
    ]);
    expect(box.length, 2);
  });

  test('addSongsToOnTheGoPlaylist fills the in-memory playlist', () async {
    final notifier = container.read(playlistsProvider.notifier);
    await notifier.createPlaylist(playlistName: 'Saved', songs: [song('Z')]);

    notifier.addSongsToOnTheGoPlaylist([song('A'), song('B')]);

    final playlists = container.read(playlistsProvider);
    expect(playlists.first.songs.map((metadata) => metadata.trackName), [
      'A',
      'B',
    ]);
    // The saved playlist is untouched and nothing new is persisted.
    expect(playlists[1].songs.single.trackName, 'Z');
    expect(box.length, 1);
  });

  test('addSongsToOnTheGoPlaylist ignores duplicates and empty input', () {
    final notifier = container.read(playlistsProvider.notifier);

    notifier.addSongsToOnTheGoPlaylist([]);
    expect(container.read(playlistsProvider).first.songs, isEmpty);

    notifier.addSongsToOnTheGoPlaylist([song('A'), song('A')]);
    expect(container.read(playlistsProvider).first.songs, hasLength(1));
  });
}
