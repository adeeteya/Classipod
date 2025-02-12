import 'dart:async';

import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
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

final audioPlayerServiceProvider =
    AutoDisposeAsyncNotifierProvider<AudioPlayerServiceNotifier, void>(
  AudioPlayerServiceNotifier.new,
);

class AudioPlayerServiceNotifier extends AutoDisposeAsyncNotifier<void> {
  AudioPlayerServiceNotifier() : super();

  @override
  Future<void> build() async {}

  Future<void> play() async {
    await ref.read(audioPlayerProvider).play();
  }

  Future<void> pause() async {
    await ref.read(audioPlayerProvider).pause();
  }

  Future<void> toggleShuffleMode() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).setShuffleModeEnabled(
            !ref.read(audioPlayerProvider).shuffleModeEnabled,
          );
    });
  }

  Future<void> setShuffleMode(bool isShuffleModeEnabled) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(audioPlayerProvider)
          .setShuffleModeEnabled(isShuffleModeEnabled);
    });
  }

  Future<void> shuffleAllSongs() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
          NowPlayingType.songs) {
        await setAudioSource(
          musicMetadataList: ref.read(audioFilesServiceProvider).requireValue,
        );
      }

      await setShuffleMode(true);
      await ref.read(audioPlayerProvider).shuffle();
      await nextSong();

      await ref
          .read(settingsPreferencesControllerProvider.notifier)
          .setInitialRepeatMode();
    });
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).setLoopMode(loopMode);
    });
  }

  Future<void> setAudioSource({
    NowPlayingType nowPlayingType = NowPlayingType.songs,
    required List<Metadata> musicMetadataList,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final List<AudioSource> songSourcePlaylist =
          musicMetadataList.map((e) => e.toAudioSource()).toList();

      await ref.read(audioPlayerProvider).setAudioSource(
            ConcatenatingAudioSource(
              shuffleOrder: DefaultShuffleOrder(),
              children: songSourcePlaylist,
            ),
            initialIndex: 0,
            initialPosition: Duration.zero,
          );

      ref.read(nowPlayingDetailsProvider.notifier).setNewMetadataList(
            nowPlayingType: nowPlayingType,
            newMetadataList: musicMetadataList,
          );
    });
  }

  Future<void> nextSong() async {
    await ref.read(audioPlayerProvider).seekToNext();
  }

  Future<void> seekBackwards() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (ref.read(audioPlayerProvider).position.inSeconds > 3) {
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
      }
    });
  }

  Future<void> playSongAtIndex(int index) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //In case the same song is already playing
      if (ref.read(nowPlayingDetailsProvider).currentIndex == index) {
        return;
      } else {
        await ref.read(audioPlayerProvider).seek(Duration.zero, index: index);
      }
    });
  }

  Future<void> playSongFromOriginalList(int originalIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      //If Album or Playlist is being played then Switch to original List of Songs
      if (ref.read(nowPlayingDetailsProvider).nowPlayingType !=
          NowPlayingType.songs) {
        await setAudioSource(
          musicMetadataList: ref.read(audioFilesServiceProvider).requireValue,
        );
      }

      //In case the same song is already playing
      if (originalIndex ==
          ref
              .read(nowPlayingDetailsProvider)
              .currentMetadata
              ?.originalSongIndex) {
        return;
      }

      final int index = ref
          .read(nowPlayingDetailsProvider)
          .metadataList
          .indexWhere((element) => element.originalSongIndex == originalIndex);
      await ref.read(audioPlayerProvider).seek(Duration.zero, index: index);
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
      final int currentDurationInSeconds =
          ref.read(audioPlayerProvider).position.inSeconds;
      final int maxDurationInSeconds =
          ref.read(audioPlayerProvider).duration?.inSeconds ?? 0;
      if (currentDurationInSeconds + 1 < maxDurationInSeconds) {
        await ref.read(audioPlayerProvider).seek(
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
      await ref.read(audioPlayerProvider).seek(
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
        await ref.read(audioPlayerProvider).seek(
              Duration(
                seconds: targetDurationInSeconds,
              ),
            );
      }
      await ref.read(audioPlayerProvider).seek(
            Duration(
              seconds: targetDurationInSeconds,
            ),
          );
    });
  }

  Future<void> decreaseVolume() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final double currentVolume = ref.read(audioPlayerProvider).volume;
      if (currentVolume > 0) {
        if (currentVolume <= 0.05) {
          await ref.read(audioPlayerProvider).setVolume(0);
        } else {
          await ref.read(audioPlayerProvider).setVolume(currentVolume - 0.05);
        }
      }
    });
  }

  Future<void> increaseVolume() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final double currentVolume = ref.read(audioPlayerProvider).volume;
      if (currentVolume < 1) {
        await ref.read(audioPlayerProvider).setVolume(currentVolume + 0.05);
      }
    });
  }
}
