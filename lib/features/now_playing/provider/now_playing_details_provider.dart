import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final nowPlayingDetailsProvider =
    NotifierProvider<NowPlayingDetailsNotifier, NowPlayingModel>(
  NowPlayingDetailsNotifier.new,
);

class NowPlayingDetailsNotifier extends Notifier<NowPlayingModel> {
  NowPlayingDetailsNotifier() : super();

  @override
  NowPlayingModel build() {
    ref.read(audioPlayerProvider).currentIndexStream.listen((newIndex) {
      if (newIndex != null && state.metadataList.isNotEmpty) {
        state = state.copyWith(
          currentIndex: newIndex,
          currentMetadata: state.metadataList[newIndex],
        );
      }
    });

    ref.read(audioPlayerProvider).playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });

    ref.read(audioPlayerProvider).loopModeStream.listen((loopMode) {
      state = state.copyWith(loopMode: loopMode);
    });

    ref
        .read(audioPlayerProvider)
        .shuffleModeEnabledStream
        .listen((isShuffleEnabled) {
      state = state.copyWith(isShuffleEnabled: isShuffleEnabled);
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
    required List<Metadata> newMetadataList,
  }) {
    super.state = state.copyWith(
      currentIndex: 0,
      nowPlayingType: nowPlayingType,
      currentMetadata: newMetadataList.isNotEmpty ? newMetadataList[0] : null,
      metadataList: newMetadataList,
    );
  }
}
