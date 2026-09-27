import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/widgets/subsonic_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = Provider<AudioPlayer>((_) {
  return AudioPlayer();
});

final libraryAudioHandlerProvider = Provider<LibraryAudioHandler>((ref) {
  final handler = LibraryAudioHandler(
    ref.read(audioPlayerProvider),
    resolveSource: (song) async {
      if (!song.isSubsonic) return song.toAudioSource() as UriAudioSource;
      final remote = ref.read(subsonicControllerProvider).value;
      final context = rootNavigatorKey.currentContext;
      if (remote?.enabled == true &&
          remote?.signedIn != true &&
          context != null) {
        await showSubsonicDialog(context);
      }
      return ref.read(subsonicControllerProvider.notifier).resolve(song);
    },
  );
  ref.listen(
    subsonicControllerProvider.select(
      (value) => (value.value?.enabled, value.value?.config?.id),
    ),
    (_, _) => _reconcileLibrary(ref, handler),
  );
  ref.onDispose(() => unawaited(handler.dispose()));
  return handler;
});

void _reconcileLibrary(Ref ref, LibraryAudioHandler handler) {
  final now = ref.read(nowPlayingDetailsProvider);
  if (now.metadataList.isEmpty) return;
  final remote = ref.read(subsonicControllerProvider).value;
  final library = ref.read(filteredAudioFilesProvider).value;
  final songs = now.nowPlayingType == NowPlayingType.songs && library != null
      ? library.toList()
      : now.metadataList;
  final retained = songs
      .where(
        (song) =>
            !song.isSubsonic ||
            (remote?.enabled == true && remote?.config?.id == song.serverId),
      )
      .toList();
  if (listEquals(now.metadataList, retained)) return;
  ref.read(nowPlayingDetailsProvider.notifier).reconcileMetadata(retained);
  unawaited(handler.reconcileSongs(retained));
}

final audioPlayerServiceProvider =
    AsyncNotifierProvider<AudioPlayerServiceNotifier, void>(
      AudioPlayerServiceNotifier.new,
    );

class AudioPlayerServiceNotifier extends AsyncNotifier<void> {
  AudioPlayerServiceNotifier() : super();

  @override
  Future<void> build() async {
    ref.listen(filteredAudioFilesProvider, (previous, next) {
      if (next.hasValue && previous?.value != next.value) {
        _reconcileLibrary(ref, ref.read(libraryAudioHandlerProvider));
      }
    });
  }

  Future<void> play() async {
    state = await AsyncValue.guard(_play);
  }

  Future<void> _play() async {
    final handler = ref.read(libraryAudioHandlerProvider);
    if (ref.read(audioPlayerProvider).playing &&
        handler.playbackState.value.errorCode == null &&
        !handler.recovering) {
      return;
    }

    await handler.play();
  }

  Future<void> pause() async {
    await ref.read(libraryAudioHandlerProvider).pause();
  }

  Future<void> stop() async {
    await ref.read(libraryAudioHandlerProvider).stop();
  }

  Future<void> toggleShuffleMode() async {
    await setShuffleMode(!ref.read(nowPlayingDetailsProvider).isShuffleEnabled);
  }

  Future<void> setShuffleMode(bool enabled) async {
    state = await AsyncValue.guard(() async {
      await ref
          .read(libraryAudioHandlerProvider)
          .setShuffleMode(
            enabled
                ? AudioServiceShuffleMode.all
                : AudioServiceShuffleMode.none,
          );
    });
  }

  Future<void> shuffleAllSongs() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
              NowPlayingType.songs ||
          ref.read(nowPlayingDetailsProvider).metadataList.isEmpty) {
        await setAudioSource(
          musicMetadataList: ref.read(filteredAudioFilesProvider).requireValue,
        );
      }

      await setShuffleMode(true);
      await nextSong();
      Future.delayed(const Duration(milliseconds: 100), play);

      await ref
          .read(settingsPreferencesControllerProvider.notifier)
          .setInitialRepeatMode();
    });
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(libraryAudioHandlerProvider).setRepeatMode(
        switch (loopMode) {
          LoopMode.off => AudioServiceRepeatMode.none,
          LoopMode.one => AudioServiceRepeatMode.one,
          LoopMode.all => AudioServiceRepeatMode.all,
        },
      );
    });
  }

  Future<void> setAudioSource({
    NowPlayingType nowPlayingType = NowPlayingType.songs,
    bool preload = true,
    required List<MusicMetadata> musicMetadataList,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      ref
          .read(nowPlayingDetailsProvider.notifier)
          .setNewMetadataList(
            nowPlayingType: nowPlayingType,
            newMetadataList: musicMetadataList,
          );

      await ref
          .read(libraryAudioHandlerProvider)
          .setSongs(musicMetadataList, preload: preload);
    });
  }

  Future<void> nextSong() async {
    state = await AsyncValue.guard(
      () => ref.read(libraryAudioHandlerProvider).skipToNext(),
    );
  }

  Future<void> seekBackwards() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(libraryAudioHandlerProvider).skipToPrevious();
    });
  }

  Future<void> playAlbum({
    required AlbumModel albumDetail,
    required int songIndex,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // If Album has no songs or the songIndex is out of bounds
      if (albumDetail.albumSongs.isEmpty ||
          songIndex >= albumDetail.albumSongs.length) {
        return;
      }
      final nowPlayingDetails = ref.read(nowPlayingDetailsProvider);

      // If the album is already playing
      if (nowPlayingDetails.nowPlayingType == NowPlayingType.album &&
          nowPlayingDetails.currentMetadata?.getAlbumDetail == albumDetail) {
        await playSongAtIndex(songIndex);
        return;
      } else {
        await setAudioSource(
          preload: false,
          nowPlayingType: NowPlayingType.album,
          musicMetadataList: albumDetail.albumSongs,
        );
        await playSongAtIndex(songIndex);
        await setShuffleMode(false);
        Future.delayed(const Duration(milliseconds: 100), play);
      }
    });
  }

  Future<void> playPlaylist({
    required PlaylistModel playlistDetail,
    required int songIndex,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // If Playlist has no songs or the songIndex is out of bounds
      if (playlistDetail.songs.isEmpty ||
          songIndex >= playlistDetail.songs.length) {
        return;
      }
      final nowPlayingDetails = ref.read(nowPlayingDetailsProvider);

      // If the playlist is already playing
      if (nowPlayingDetails.nowPlayingType == NowPlayingType.playlist &&
          listEquals(nowPlayingDetails.metadataList, playlistDetail.songs)) {
        await playSongAtIndex(songIndex);
        return;
      } else {
        await setAudioSource(
          preload: false,
          nowPlayingType: NowPlayingType.playlist,
          musicMetadataList: playlistDetail.songs,
        );
        await playSongAtIndex(songIndex);
        await setShuffleMode(false);
        Future.delayed(const Duration(milliseconds: 100), play);
      }
    });
  }

  Future<void> playSongAtIndex(int index) async {
    state = await AsyncValue.guard(() async {
      if (ref.read(nowPlayingDetailsProvider).currentIndex == index) {
        await _play();
      } else {
        await ref.read(libraryAudioHandlerProvider).select(index);
      }
    });
  }

  Future<void> playSongFromLibrary(String songId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
              NowPlayingType.songs ||
          ref.read(nowPlayingDetailsProvider).metadataList.isEmpty) {
        await setAudioSource(
          musicMetadataList: ref.read(filteredAudioFilesProvider).requireValue,
        );
      }

      //In case the same song is already playing
      if (songId ==
          ref.read(nowPlayingDetailsProvider).currentMetadata?.identity) {
        await _play();
        return;
      }

      final int index = ref
          .read(nowPlayingDetailsProvider)
          .metadataList
          .indexWhere((element) => element.identity == songId);
      if (index < 0) return;
      await ref.read(libraryAudioHandlerProvider).select(index);
    });
  }

  Future<void> togglePlayback() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final handler = ref.read(libraryAudioHandlerProvider);
      if (handler.recovering
          ? handler.wantsPlayback
          : ref.read(audioPlayerProvider).playing) {
        await pause();
      } else {
        await _play();
      }
    });
  }

  Future<void> seekForward() => seekToDuration(
    ref.read(libraryAudioHandlerProvider).displayPosition.inSeconds + 1,
  );

  Future<void> seekBackward() => seekToDuration(
    ref.read(libraryAudioHandlerProvider).displayPosition.inSeconds - 1,
  );

  Future<void> seekToDuration(int targetDurationInSeconds) async {
    state = await AsyncValue.guard(() async {
      final duration =
          ref
              .read(nowPlayingDetailsProvider)
              .currentMetadata
              ?.getTrackDuration ??
          0;
      final target = duration > 0
          ? targetDurationInSeconds.clamp(0, duration ~/ 1000)
          : targetDurationInSeconds.clamp(0, 1 << 31);
      await ref
          .read(libraryAudioHandlerProvider)
          .seek(Duration(seconds: target));
    });
  }
}
