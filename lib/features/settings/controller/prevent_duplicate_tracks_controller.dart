import 'package:classipod/core/models/shared_preference_keys.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preventDuplicateTracksProvider =
    NotifierProvider<PreventDuplicateTracksNotifier, bool>(
      PreventDuplicateTracksNotifier.new,
    );

class PreventDuplicateTracksNotifier extends Notifier<bool> {
  @override
  bool build() =>
      ref
          .read(sharedPreferencesWithCacheProvider)
          .requireValue
          .getBool(SharedPreferencesKeys.preventDuplicateTracks.name) ??
      false;

  Future<void> setEnabled(bool enabled) async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .requireValue
        .setBool(SharedPreferencesKeys.preventDuplicateTracks.name, enabled);
    state = enabled;
  }
}
