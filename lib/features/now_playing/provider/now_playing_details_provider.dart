import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:just_audio/just_audio.dart';

final nowPlayingDetailsProvider =
    NotifierProvider<NowPlayingDetailsNotifier, NowPlayingModel>(
      NowPlayingDetailsNotifier.new,
    );

class NowPlayingDetailsNotifier extends Notifier<NowPlayingModel> {
  @override
  NowPlayingModel build() {
    ref.read(audioPlayerProvider).currentIndexStream.listen((newIndex) {
      if (newIndex != null &&
          newIndex != state.currentIndex &&
          state.metadataList.isNotEmpty) {
        state = state.copyWith(
          currentIndex: newIndex,
          currentMetadata: state.metadataList[newIndex],
        );
      }
    });

    ref.read(audioPlayerProvider).playingStream.listen((isPlaying) {
      if (isPlaying != state.isPlaying) {
        state = state.copyWith(isPlaying: isPlaying);
      }
    });

    ref.read(audioPlayerProvider).loopModeStream.listen((loopMode) {
      if (loopMode != state.loopMode) {
        state = state.copyWith(loopMode: loopMode);
      }
    });

    ref.read(audioPlayerProvider).shuffleModeEnabledStream.listen((
      isShuffleEnabled,
    ) {
      if (isShuffleEnabled != state.isShuffleEnabled) {
        state = state.copyWith(isShuffleEnabled: isShuffleEnabled);
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
    state = state.copyWith(
      currentIndex: 0,
      nowPlayingType: nowPlayingType,
      currentMetadata: newMetadataList.isNotEmpty ? newMetadataList[0] : null,
      metadataList: newMetadataList,
    );
  }

  Future<void> setCurrentMetadataRating(int val) async {
    if (0 <= val && val <= 5 && state.currentMetadata != null) {
      final newMetadata = state.currentMetadata!.copyWith(rating: val);
      state = state.copyWith(
        currentMetadata: newMetadata,
        metadataList: [
          for (final metadata in state.metadataList)
            if (metadata.originalSongIndex ==
                state.currentMetadata!.originalSongIndex)
              newMetadata
            else
              metadata,
        ],
      );
      final Box<MusicMetadata> metadataBox = Hive.box<MusicMetadata>(
        Constants.metadataBoxName,
      );
      await metadataBox.putAt(newMetadata.originalSongIndex, newMetadata);
      ref.invalidate(audioFilesServiceProvider);
      ref.invalidate(albumDetailsProvider);
      ref.invalidate(playlistsProvider);
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
}
