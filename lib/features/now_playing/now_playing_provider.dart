import 'package:classipod/models/metadata.dart';
import 'package:classipod/services/audio_player_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMetadataListProvider =
    NotifierProvider<NowPlayingMetadataListNotifier, List<Metadata>>(
  NowPlayingMetadataListNotifier.new,
);

class NowPlayingMetadataListNotifier extends Notifier<List<Metadata>> {
  NowPlayingMetadataListNotifier() : super();

  @override
  List<Metadata> build() {
    return [];
  }

  set setMetadataList(List<Metadata> value) {
    super.state = value;
  }

  List<Metadata> getEffectiveMetadataList() {
    final effectiveIndices = ref.read(audioPlayerProvider).effectiveIndices;
    if (effectiveIndices != null && effectiveIndices.isNotEmpty) {
      return effectiveIndices.map((index) {
        return state[index];
      }).toList();
    } else {
      return [];
    }
  }
}
