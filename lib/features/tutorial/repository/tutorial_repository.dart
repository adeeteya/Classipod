import 'package:classipod/core/models/shared_preference_keys.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tutorialRepositoryProvider =
    Provider.autoDispose<TutorialRepository>((ref) {
  return TutorialRepository(
    ref.read(sharedPreferencesWithCacheProvider).requireValue,
  );
});

class TutorialRepository {
  final SharedPreferencesWithCache _sharedPreferencesWithCache;

  TutorialRepository(this._sharedPreferencesWithCache);

  bool getMenuOpenedFirstTime() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.isMenuFirstTime.name) ??
        true;
  }

  bool getNowPlayingFirstTime() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.isNowPlayingFirstTime.name) ??
        true;
  }

  bool getSearchFirstTime() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.isSearchFirstTime.name) ??
        true;
  }

  Future<void> setMenuTutorialCompleted({bool isMenuFirstTime = false}) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.isMenuFirstTime.name,
      isMenuFirstTime,
    );
  }

  Future<void> setNowPlayingTutorialCompleted({
    bool isNowPlayingFirstTime = false,
  }) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.isNowPlayingFirstTime.name,
      isNowPlayingFirstTime,
    );
  }

  Future<void> setSearchTutorialCompleted({
    bool isSearchFirstTime = false,
  }) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.isSearchFirstTime.name,
      isSearchFirstTime,
    );
  }
}
