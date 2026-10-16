import 'package:classipod/core/models/shared_preference_keys.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deletePodcastsAfterPlayingProvider =
    NotifierProvider<DeletePodcastsAfterPlayingNotifier, bool>(
      DeletePodcastsAfterPlayingNotifier.new,
    );

class DeletePodcastsAfterPlayingNotifier extends Notifier<bool> {
  @override
  bool build() =>
      ref
          .read(sharedPreferencesWithCacheProvider)
          .requireValue
          .getBool(SharedPreferencesKeys.deletePodcastsAfterPlaying.name) ??
      false;

  Future<void> setEnabled(bool enabled) async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .requireValue
        .setBool(
          SharedPreferencesKeys.deletePodcastsAfterPlaying.name,
          enabled,
        );
    state = enabled;
  }
}
