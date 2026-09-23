import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final nowPlayingDetailsProvider =
    NotifierProvider<NowPlayingDetailsNotifier, NowPlayingModel>(
      NowPlayingDetailsNotifier.new,
    );

class NowPlayingDetailsNotifier extends Notifier<NowPlayingModel> {
  @override
  NowPlayingModel build() {
    final player = ref.read(audioPlayerProvider);
    final handler = ref.read(libraryAudioHandlerProvider);
    final subscriptions = <StreamSubscription<dynamic>>[];
    subscriptions.add(
      handler.indexStream.listen((newIndex) {
        if (newIndex != null &&
            newIndex != state.currentIndex &&
            newIndex < state.metadataList.length) {
          state = state.copyWith(
            currentIndex: newIndex,
            currentMetadata: state.metadataList[newIndex],
          );
        }
      }),
    );

    subscriptions.add(
      player.playingStream.listen((isPlaying) {
        if (isPlaying != state.isPlaying) {
          state = state.copyWith(isPlaying: isPlaying);
        }
      }),
    );

    final loopStream = handler.playbackState
        .map(
          (value) => switch (value.repeatMode) {
            AudioServiceRepeatMode.one => LoopMode.one,
            AudioServiceRepeatMode.all ||
            AudioServiceRepeatMode.group => LoopMode.all,
            AudioServiceRepeatMode.none => LoopMode.off,
          },
        )
        .distinct();
    subscriptions.add(
      loopStream.listen((loopMode) {
        if (loopMode != state.loopMode) {
          state = state.copyWith(loopMode: loopMode);
        }
      }),
    );

    final shuffleStream = handler.playbackState
        .map((value) => value.shuffleMode != AudioServiceShuffleMode.none)
        .distinct();
    subscriptions.add(
      shuffleStream.listen((isShuffleEnabled) {
        if (isShuffleEnabled != state.isShuffleEnabled) {
          state = state.copyWith(isShuffleEnabled: isShuffleEnabled);
        }
      }),
    );
    ref.onDispose(() {
      for (final subscription in subscriptions) {
        unawaited(subscription.cancel());
      }
    });

    return NowPlayingModel(
      currentIndex: 0,
      isPlaying: false,
      nowPlayingType: NowPlayingType.songs,
      metadataList: [],
      loopMode: LoopMode.off,
      isShuffleEnabled: false,
    );
  }

  void setNewMetadataList({
    NowPlayingType? nowPlayingType,
    required List<MusicMetadata> newMetadataList,
  }) {
    state = NowPlayingModel(
      isPlaying: state.isPlaying,
      isShuffleEnabled: state.isShuffleEnabled,
      loopMode: state.loopMode,
      currentIndex: 0,
      nowPlayingType: nowPlayingType ?? state.nowPlayingType,
      currentMetadata: newMetadataList.isNotEmpty ? newMetadataList[0] : null,
      metadataList: newMetadataList,
    );
  }

  Future<void> setCurrentMetadataRating(int val) async {
    if (0 <= val && val <= 5 && state.currentMetadata != null) {
      final newMetadata = state.currentMetadata!.copyWith(rating: val);
      await updateMetadata(newMetadata);
    }
  }

  Future<void> increaseCurrentMetadataRating() async {
    final int? currentRating = state.currentMetadata?.rating;
    if (currentRating != null && currentRating < 5) {
      await setCurrentMetadataRating(currentRating + 1);
    }
  }

  Future<void> decreaseCurrentMetadataRating() async {
    final int? currentRating = state.currentMetadata?.rating;
    if (currentRating != null && currentRating > 0) {
      await setCurrentMetadataRating(currentRating - 1);
    }
  }

  Future<void> updateMetadata(MusicMetadata updatedMetadata) async {
    state = state.copyWith(
      currentMetadata:
          state.currentMetadata?.identity == updatedMetadata.identity
          ? updatedMetadata
          : state.currentMetadata,
      metadataList: [
        for (final metadata in state.metadataList)
          if (metadata.identity == updatedMetadata.identity)
            updatedMetadata
          else
            metadata,
      ],
    );

    if (updatedMetadata.songId != null) {
      await LibraryRepository.updateRating(updatedMetadata);
      ref
          .read(audioFilesServiceProvider.notifier)
          .replaceMetadata(updatedMetadata);
    }
    ref.invalidate(filteredAudioFilesProvider);
    ref.invalidate(albumDetailsProvider);
    ref.invalidate(playlistsProvider);
  }
}
