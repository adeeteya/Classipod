import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/model/now_playing_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingDetailsProvider =
    NotifierProvider<NowPlayingDetailsNotifier, NowPlayingDetails>(
  NowPlayingDetailsNotifier.new,
);

class NowPlayingDetailsNotifier extends Notifier<NowPlayingDetails> {
  NowPlayingDetailsNotifier() : super();

  @override
  NowPlayingDetails build() {
    ref.read(audioPlayerProvider).currentIndexStream.listen((newIndex) {
      if (newIndex != null) {
        state = state.copyWith(
          currentIndex: newIndex,
          currentMetadata: state.metadataList[newIndex],
        );
      }
    });

    ref.read(audioPlayerProvider).playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });

    return NowPlayingDetails(
      currentIndex: 0,
      isPlaying: false,
      nowPlayingType: NowPlayingType.songs,
      metadataList: [],
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
