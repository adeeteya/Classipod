import 'dart:async';

import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/now_playing/now_playing_provider.dart';
import 'package:classipod/features/settings/repository/settings_preferences_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = Provider<AudioPlayer>((_) {
  return AudioPlayer();
});

final currentAudioPlayerPlayingStreamProvider = StreamProvider<bool>((ref) {
  return ref.read(audioPlayerProvider).playingStream;
});

final currentAudioPlayerIndexStreamProvider = StreamProvider<int?>((ref) {
  return ref.read(audioPlayerProvider).currentIndexStream;
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
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).play();
    });
  }

  Future<void> pause() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).pause();
    });
  }

  Future<void> shuffle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final metadataList =
          ref.read(audioFilesServiceProvider).requireValue.toList();
      metadataList.shuffle();
      await setAudioSource(metadataList);

      final isLoopModeEnabled =
          ref.read(settingsPreferencesRepositoryProvider).getRepeat();
      if (isLoopModeEnabled) {
        await setLoopMode(LoopMode.all);
      } else {
        await setLoopMode(LoopMode.off);
      }
    });
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).setLoopMode(loopMode);
    });
  }

  Future<void> setAudioSource(List<Metadata> musicMetadataList) async {
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

      ref.read(nowPlayingMetadataListProvider.notifier).setMetadataList =
          musicMetadataList;
    });
  }

  Future<void> nextSong() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).seekToNext();
    });
  }

  Future<void> previousSong() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(audioPlayerProvider).seekToPrevious();
    });
  }

  Future<void> playSongAtIndex(int index) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (ref.read(audioPlayerProvider).effectiveIndices?.length !=
          ref.read(audioFilesServiceProvider).requireValue.length) {
        await setAudioSource(ref.read(audioFilesServiceProvider).requireValue);
      }
      await pause();
      await ref.read(audioPlayerProvider).seek(Duration.zero, index: index);
      await play();
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
