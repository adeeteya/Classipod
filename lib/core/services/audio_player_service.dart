import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/playback/android_audio_handler.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = Provider<AudioPlayer>((_) {
  return AudioPlayer();
});

final usesAndroidQueue = !kIsWeb && Platform.isAndroid;

final androidAudioHandlerProvider = Provider<AndroidAudioHandler>((ref) {
  final handler = AndroidAudioHandler(ref.read(audioPlayerProvider));
  ref.onDispose(() => unawaited(handler.dispose()));
  return handler;
});

final audioPlayerServiceProvider =
    AsyncNotifierProvider<AudioPlayerServiceNotifier, void>(
      AudioPlayerServiceNotifier.new,
    );

class AudioPlayerServiceNotifier extends AsyncNotifier<void> {
  AudioPlayerServiceNotifier() : super();

  @override
  Future<void> build() async {}

  Future<void> play() async {
    if (ref.read(audioPlayerProvider).playing) {
      return;
    }
    if (usesAndroidQueue) {
      await ref.read(androidAudioHandlerProvider).play();
    } else {
      await ref.read(audioPlayerProvider).play();
    }
  }

  Future<void> pause() async {
    if (usesAndroidQueue) {
      await ref.read(androidAudioHandlerProvider).pause();
    } else if (ref.read(audioPlayerProvider).playing) {
      await ref.read(audioPlayerProvider).pause();
    }
  }

  Future<void> stop() async {
    if (usesAndroidQueue) {
      await ref.read(androidAudioHandlerProvider).stop();
    } else {
      await ref.read(audioPlayerProvider).stop();
    }
  }

  Future<void> toggleShuffleMode() async {
    await setShuffleMode(!ref.read(nowPlayingDetailsProvider).isShuffleEnabled);
  }

  Future<void> setShuffleMode(bool enabled) async {
    state = await AsyncValue.guard(() async {
      if (usesAndroidQueue) {
        await ref
            .read(androidAudioHandlerProvider)
            .setShuffleMode(
              enabled
                  ? AudioServiceShuffleMode.all
                  : AudioServiceShuffleMode.none,
            );
      } else {
        await ref.read(audioPlayerProvider).setShuffleModeEnabled(enabled);
      }
    });
  }

  Future<void> shuffleAllSongs() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
          NowPlayingType.songs) {
        await setAudioSource(
          musicMetadataList: ref.read(filteredAudioFilesProvider).requireValue,
        );
      }

      await setShuffleMode(true);
      if (!usesAndroidQueue) {
        await ref.read(audioPlayerProvider).shuffle();
      }
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
      if (usesAndroidQueue) {
        await ref.read(androidAudioHandlerProvider).setRepeatMode(
          switch (loopMode) {
            LoopMode.off => AudioServiceRepeatMode.none,
            LoopMode.one => AudioServiceRepeatMode.one,
            LoopMode.all => AudioServiceRepeatMode.all,
          },
        );
      } else {
        await ref.read(audioPlayerProvider).setLoopMode(loopMode);
      }
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
      if (usesAndroidQueue) {
        await ref
            .read(androidAudioHandlerProvider)
            .setSongs(musicMetadataList, preload: preload);
      } else {
        await ref
            .read(audioPlayerProvider)
            .setAudioSources(
              musicMetadataList.map((song) => song.toAudioSource()).toList(),
              preload: preload,
              initialIndex: 0,
              initialPosition: Duration.zero,
              shuffleOrder: DefaultShuffleOrder(),
            );
      }
    });
  }

  Future<void> nextSong() async {
    if (usesAndroidQueue) {
      await ref.read(androidAudioHandlerProvider).skipToNext();
    } else {
      await ref.read(audioPlayerProvider).seekToNext();
    }
  }

  Future<void> seekBackwards() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (usesAndroidQueue) {
        await ref.read(androidAudioHandlerProvider).skipToPrevious();
      } else if (ref.read(audioPlayerProvider).position.inSeconds > 3) {
        await ref.read(audioPlayerProvider).seek(Duration.zero);
      } else {
        await ref.read(audioPlayerProvider).seekToPrevious();
      }
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
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //In case the same song is already playing
      if (ref.read(nowPlayingDetailsProvider).currentIndex == index) {
        unawaited(play());
        return;
      } else {
        if (usesAndroidQueue) {
          await ref.read(androidAudioHandlerProvider).select(index);
          return;
        }
        await ref.read(audioPlayerProvider).seek(Duration.zero, index: index);
        Future.delayed(const Duration(milliseconds: 100), play);
      }
    });
  }

  Future<void> playSongFromLibrary(String songId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
          NowPlayingType.songs) {
        await setAudioSource(
          musicMetadataList: ref.read(filteredAudioFilesProvider).requireValue,
        );
      }

      //In case the same song is already playing
      if (songId ==
          ref.read(nowPlayingDetailsProvider).currentMetadata?.identity) {
        unawaited(play());
        return;
      }

      final int index = ref
          .read(nowPlayingDetailsProvider)
          .metadataList
          .indexWhere((element) => element.identity == songId);
      if (index < 0) return;
      if (usesAndroidQueue) {
        await ref.read(androidAudioHandlerProvider).select(index);
        return;
      }
      await ref.read(audioPlayerProvider).seek(Duration.zero, index: index);
      Future.delayed(const Duration(milliseconds: 200), play);
    });
  }

  Future<void> togglePlayback() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (ref.read(audioPlayerProvider).playing) {
        await pause();
      } else {
        await play();
      }
    });
  }

  Future<void> seekForward() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final int currentDurationInSeconds = ref
          .read(audioPlayerProvider)
          .position
          .inSeconds;
      final int maxDurationInSeconds =
          ref.read(audioPlayerProvider).duration?.inSeconds ?? 0;
      if (currentDurationInSeconds + 1 < maxDurationInSeconds) {
        await ref
            .read(audioPlayerProvider)
            .seek(
              Duration(
                seconds: ref.read(audioPlayerProvider).position.inSeconds + 1,
              ),
            );
      }
    });
  }

  Future<void> seekBackward() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(audioPlayerProvider)
          .seek(
            Duration(
              seconds: ref.read(audioPlayerProvider).position.inSeconds - 1,
            ),
          );
    });
  }

  Future<void> seekToDuration(int targetDurationInSeconds) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final int maxDurationInSeconds =
          ref.read(audioPlayerProvider).duration?.inSeconds ?? 0;
      if (targetDurationInSeconds > 0 &&
          targetDurationInSeconds <= maxDurationInSeconds) {
        await ref
            .read(audioPlayerProvider)
            .seek(Duration(seconds: targetDurationInSeconds));
      }
      await ref
          .read(audioPlayerProvider)
          .seek(Duration(seconds: targetDurationInSeconds));
    });
  }
}
