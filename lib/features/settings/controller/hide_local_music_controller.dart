import 'package:classipod/core/models/shared_preference_keys.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hideLocalMusicProvider = NotifierProvider<HideLocalMusicNotifier, bool>(
  HideLocalMusicNotifier.new,
);

class HideLocalMusicNotifier extends Notifier<bool> {
  @override
  bool build() =>
      ref
          .read(sharedPreferencesWithCacheProvider)
          .requireValue
          .getBool(SharedPreferencesKeys.hideLocalMusic.name) ??
      false;

  Future<void> setHidden(bool hidden) async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .requireValue
        .setBool(SharedPreferencesKeys.hideLocalMusic.name, hidden);
    state = hidden;
  }
}
