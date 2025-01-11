import 'package:classipod/core/models/metadata.dart';
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
}
