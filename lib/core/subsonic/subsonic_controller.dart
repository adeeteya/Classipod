import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/core/subsonic/subsonic_client.dart';
import 'package:classipod/core/subsonic/subsonic_credentials.dart';
import 'package:classipod/core/subsonic/subsonic_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:just_audio/just_audio.dart';

final subsonicCredentialsProvider = Provider<SubsonicCredentialStore>(
  (_) => PlatformSubsonicCredentialStore(),
);
final subsonicClientFactoryProvider =
    Provider<SubsonicClient Function(SubsonicConfig, String)>(
      (_) => SubsonicClient.new,
    );
final subsonicRepositoryProvider = FutureProvider<SubsonicRepository>(
  (_) async => SubsonicRepository(await Hive.openBox<dynamic>('subsonic-v1')),
);

class SubsonicState {
  final SubsonicConfig? config;
  final List<MusicMetadata> songs;
  final bool signedIn;
  final bool scanning;
  final int indexedSongs;
  final String? error;
  const SubsonicState({
    this.config,
    this.songs = const [],
    this.signedIn = false,
    this.scanning = false,
    this.indexedSongs = 0,
    this.error,
  });

  bool get enabled => config?.enabled ?? false;
  bool available(MusicMetadata song) =>
      !song.isSubsonic ||
      (enabled &&
          signedIn &&
          config?.id == song.serverId &&
          songs.any((item) => item.identity == song.identity));
}

final subsonicControllerProvider =
    AsyncNotifierProvider<SubsonicController, SubsonicState>(
      SubsonicController.new,
    );

class SubsonicController extends AsyncNotifier<SubsonicState> {
  SubsonicClient? _client;
  int _generation = 0;
  static const _preferenceKey = 'subsonicConfig';

  @override
  Future<SubsonicState> build() async {
    ref.onDispose(() {
      _generation++;
      _client?.close();
    });
    final prefs = await ref.read(sharedPreferencesWithCacheProvider.future);
    final encoded = prefs.getString(_preferenceKey);
    if (encoded == null) return const SubsonicState();
    final repository = await ref.read(subsonicRepositoryProvider.future);
    final saved = jsonDecode(encoded) as Map;
    final config = SubsonicConfig(
      saved['url'] as String,
      saved['username'] as String,
      enabled: saved['enabled'] == true,
    );
    String? password;
    try {
      password = await ref.read(subsonicCredentialsProvider).read(config.id);
    } catch (_) {}
    if (config.enabled && password != null) {
      _client = ref.read(subsonicClientFactoryProvider)(config, password);
      unawaited(
        Future<void>(() async {
          if (ref.mounted) await refresh();
        }),
      );
    }
    return SubsonicState(
      config: config,
      songs: repository.cached(config.id),
      signedIn: password != null,
    );
  }

  SubsonicState get _current => state.value ?? const SubsonicState();

  Future<void> connect(
    String url,
    String username,
    String password, {
    void Function()? onConnected,
  }) async {
    final normalized = SubsonicConfig.normalizeUrl(url);
    if (username.trim().isEmpty || password.isEmpty) {
      throw const SubsonicException('credentials');
    }
    final config = SubsonicConfig(normalized, username.trim(), enabled: true);
    final repository = await ref.read(subsonicRepositoryProvider.future);
    final previous = _current.config;
    final store = ref.read(subsonicCredentialsProvider);
    final previousPassword = await store.read(config.id);
    final candidate = ref.read(subsonicClientFactoryProvider)(config, password);
    var credentialsWritten = false;
    try {
      await candidate.ping();
      await store.write(config.id, password);
      credentialsWritten = true;
      await _save(config);
    } catch (error) {
      candidate.close();
      if (credentialsWritten) {
        if (previousPassword == null) {
          await store.delete(config.id);
        } else {
          await store.write(config.id, previousPassword);
        }
      }
      if (error is SubsonicException) rethrow;
      throw const SubsonicException('storage');
    }
    _generation++;
    repository.cancel();
    _client?.close();
    _client = candidate;
    state = AsyncData(
      SubsonicState(
        config: config,
        songs: repository.cached(config.id),
        signedIn: true,
      ),
    );
    if (previous != null && previous.id != config.id) {
      try {
        await store.delete(previous.id);
        await repository.remove(previous.id);
      } catch (_) {}
    }
    onConnected?.call();
    await refresh();
  }

  Future<void> _save(SubsonicConfig config) async {
    final prefs = await ref.read(sharedPreferencesWithCacheProvider.future);
    await prefs.setString(
      _preferenceKey,
      jsonEncode({
        'url': config.url,
        'username': config.username,
        'enabled': config.enabled,
      }),
    );
  }

  Future<bool> setEnabled(bool enabled) async {
    final old = _current;
    if (old.config == null) return false;
    final repository = await ref.read(subsonicRepositoryProvider.future);
    String? password;
    if (enabled) {
      password = await ref
          .read(subsonicCredentialsProvider)
          .read(old.config!.id);
      if (password == null) return false;
    }
    final config = old.config!.withEnabled(enabled);
    await _save(config);
    _generation++;
    repository.cancel();
    _client?.close();
    _client = enabled
        ? ref.read(subsonicClientFactoryProvider)(config, password!)
        : null;
    state = AsyncData(
      SubsonicState(
        config: config,
        songs: old.songs,
        signedIn: enabled && password != null,
      ),
    );
    if (enabled) unawaited(refresh());
    return true;
  }

  Future<void> remove() async {
    final config = _current.config;
    if (config == null) return;
    await setEnabled(false);
    await ref.read(subsonicCredentialsProvider).delete(config.id);
    await (await ref.read(subsonicRepositoryProvider.future)).remove(config.id);
    final prefs = await ref.read(sharedPreferencesWithCacheProvider.future);
    await prefs.remove(_preferenceKey);
    state = const AsyncData(SubsonicState());
  }

  Future<void> refresh({bool clearArtwork = false}) async {
    final old = _current;
    final client = _client;
    if (!old.enabled || client == null) return;
    final generation = ++_generation;
    final repository = await ref.read(subsonicRepositoryProvider.future);
    if (generation != _generation) return;
    state = AsyncData(
      SubsonicState(
        config: old.config,
        songs: old.songs,
        signedIn: true,
        scanning: true,
      ),
    );
    try {
      if (clearArtwork) await repository.clearArtwork(client.config.id);
      if (generation != _generation) return;
      final songs = await repository.scan(
        client,
        progress: (_, count) {
          if (generation == _generation && ref.mounted) {
            state = AsyncData(
              SubsonicState(
                config: old.config,
                songs: old.songs,
                signedIn: true,
                scanning: true,
                indexedSongs: count,
              ),
            );
          }
        },
      );
      if (generation != _generation || !ref.mounted) return;
      state = AsyncData(
        SubsonicState(config: old.config, songs: songs, signedIn: true),
      );
    } catch (error) {
      if (generation != _generation || !ref.mounted) return;
      state = AsyncData(
        SubsonicState(
          config: old.config,
          songs: old.songs,
          signedIn: true,
          error: error is SubsonicException ? error.code : 'response',
        ),
      );
    }
  }

  Future<void> updateSong(MusicMetadata song) async {
    await (await ref.read(subsonicRepositoryProvider.future)).update(song);
    final old = _current;
    state = AsyncData(
      SubsonicState(
        config: old.config,
        songs: [
          for (final item in old.songs)
            if (item.identity == song.identity) song else item,
        ],
        signedIn: old.signedIn,
        scanning: old.scanning,
        error: old.error,
      ),
    );
  }

  Future<Uint8List> artwork(String reference) async {
    final uri = Uri.parse(reference);
    final client = _client;
    if (!_current.enabled || uri.host != _current.config?.id) {
      throw const SubsonicException('unavailable');
    }
    final repository = await ref.read(subsonicRepositoryProvider.future);
    final id = uri.pathSegments.single;
    final bytes = repository.box.get('art:${uri.host}:$id');
    if (bytes is Uint8List) return bytes;
    if (client == null) throw const SubsonicException('signin');
    return repository.artwork(client, id);
  }

  Future<UriAudioSource> resolve(MusicMetadata song) async {
    if (!song.isSubsonic) return song.toAudioSource() as UriAudioSource;
    if (!_current.enabled || _current.config?.id != song.serverId) {
      throw const SubsonicException('unavailable');
    }
    final client = _client;
    if (client == null) throw const SubsonicException('signin');
    return AudioSource.uri(
      client.uri('stream', {'id': song.remoteSongId!}),
      tag: MediaItem(
        id: song.identity,
        title: song.getTrackName,
        album: song.albumName,
        artist: song.getTrackArtistNames,
        duration: Duration(milliseconds: song.getTrackDuration),
        artUri: song.remoteArtworkId == null
            ? null
            : client.uri('getCoverArt', {
                'id': song.remoteArtworkId!,
                'size': '600',
              }),
      ),
    );
  }
}
