// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਕਲਾਸਿਪੋਡ';

  @override
  String get menuButtonText => 'ਮੇਨੂ';

  @override
  String get audioAccessPermissionTitle => 'ਆਡੀਓ ਪਹੁੰਚ ਇਜਾਜ਼ਤ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get audioAccessPermissionContent => 'ਸਾਨੂੰ ਆਪਣੀਆਂ ਸੰਗੀਤ ਫਾਈਲਾਂ ਚਲਾਉਣ ਦੀ ਆਗਿਆ ਦੇਣ ਲਈ ਆਡੀਓ ਫਾਈਲਾਂ ਪਹੁੰਚ ਪ੍ਰਦਾਨ ਕਰੋ ਜੀ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ਆਡੀਓ ਪਹੁੰਚ ਇਜਾਜ਼ਤ ਤੋਂ ਇਨਕਾਰ ਕਰ ਦਿੱਤਾ ਗਿਆ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'ਸਾਨੂੰ ਆਪਣੀਆਂ ਸੰਗੀਤ ਫਾਈਲਾਂ ਚਲਾਉਣ ਦੀ ਆਗਿਆ ਦੇਣ ਲਈ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਸ ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਆਡੀਓ ਫਾਈਲਾਂ ਐਕਸੈਸ ਦਿਓ.';

  @override
  String get menuScreenTitle => 'ਮੇਨੂ';

  @override
  String get musicMenuScreenTitle => 'ਸੰਗੀਤ';

  @override
  String get nowPlayingScreenTitle => 'ਹੁਣ ਖੇਡਣਾ';

  @override
  String get shuffleSongsMenuTitle => 'ਸ਼ਫਲ ਗਾਣੇ';

  @override
  String get shuffleSettingTitle => 'ਸ਼ਫਲ';

  @override
  String get settingsScreenTitle => 'ਸੈਟਿੰਗਜ਼';

  @override
  String get aboutScreenTitle => 'ਬਾਰੇ';

  @override
  String get coverFlowScreenTitle => 'ਵਹਾਅ ਦਾ ਵਹਾਅ';

  @override
  String get artistsScreenTitle => 'ਕਲਾਕਾਰ';

  @override
  String get albumsScreenTitle => 'ਐਲਬਮ';

  @override
  String get songsScreenTitle => 'ਗਾਣੇ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ਗੀਤ',
      one: '1 ਗੀਤ',
      zero: 'ਕੋਈ ਗੀਤ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String nAlbums(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ਐਲਬਮਾਂ',
      one: '1 ਐਲਬਮ',
      zero: 'ਕੋਈ ਐਲਬਮ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ਸ਼ੈਲੀਆਂ';

  @override
  String get genreSongsScreenTitle => 'ਸ਼ੈਲੀ ਦੇ ਗਾਣੇ';

  @override
  String get deviceColorSettingTitle => 'ਜੰਤਰ ਰੰਗ';

  @override
  String get touchScreenSettingTitle => 'ਟੱਚ ਸਕਰੀਨ ਯੋਗ';

  @override
  String get repeatModeSettingTitle => 'ਦੁਹਰਾਓ';

  @override
  String get repeatModeOne => 'ਇਕ';

  @override
  String get repeatModeAll => 'ਸਾਰੇ';

  @override
  String get vibrateSettingTitle => 'ਵਾਈਬ੍ਰੇਟ';

  @override
  String get clickWheelSettingTitle => 'ਕਲਿਕ ਕਰੋ ਵ੍ਹੀਲ ਆਵਾਜ਼ਾਂ';

  @override
  String get splitScreenSettingTitle => 'ਸਪਲਿਟ ਸਕ੍ਰੀਨ ਮੋਡ';

  @override
  String get touchSoundsDialogTitle => 'ਆਵਾਜ਼ ਆਵਾਜ਼';

  @override
  String get touchSoundsDialogContent => 'ਕਿਰਪਾ ਕਰਕੇ ਕਲਿਕ ਕਰੋ ਵ੍ਹੀਲ ਦੀਆਂ ਆਵਾਜ਼ਾਂ ਸੁਣਨ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਤੋਂ ਟਚ ਆਵਾਜ਼ਾਂ ਨੂੰ ਸਮਰੱਥ ਕਰੋ';

  @override
  String get immersiveModeSettingTitle => 'ਡਰੂਸਿਵ ਮੋਡ';

  @override
  String get showAppTutorialSettingTitle => 'ਟਿ utorial ਟੋਰਿਅਲ ਦਿਖਾਓ';

  @override
  String get changeDirectorySettingTitle => 'ਡਾਇਰੈਕਟਰੀ ਬਦਲੋ';

  @override
  String get donateSettingTitle => 'ਦਾਨ';

  @override
  String get donateSettingDescription => 'ਜੇ ਤੁਸੀਂ ਇਸ ਐਪ ਨੂੰ ਪਸੰਦ ਕਰਦੇ ਹੋ, ਤਾਂ ਕਿਰਪਾ ਕਰਕੇ ਦਾਨ ਕਰਨ \'ਤੇ ਵਿਚਾਰ ਕਰੋ.';

  @override
  String get versionAboutScreenTitle => 'ਵਰਜਨ';

  @override
  String get madeWithLoveTitle => 'ਦੁਆਰਾ ਬਣਾਇਆ';

  @override
  String get noMusicFilesFound => 'ਕੋਈ ਸੰਗੀਤ ਨਹੀਂ';

  @override
  String get noArtistsFound => 'ਕੋਈ ਕਲਾਕਾਰ ਨਹੀਂ';

  @override
  String get noAlbumsFound => 'ਕੋਈ ਐਲਬਮ ਨਹੀਂ';

  @override
  String get unknownSong => 'ਅਣਜਾਣ ਗਾਣਾ';

  @override
  String get unknownArtist => 'ਅਣਜਾਣ ਕਲਾਕਾਰ';

  @override
  String get unknownAlbum => 'ਅਣਜਾਣ ਐਲਬਮ';

  @override
  String get unknownGenre => 'ਅਣਜਾਣ ਸ਼ੈਲੀ';

  @override
  String get buttonConfirmText => 'ਠੀਕ ਹੈ';

  @override
  String get tileValueOn => '\'ਤੇ';

  @override
  String get tileValueOff => 'ਬੰਦ';

  @override
  String get commonOfText => 'ਦੇ';

  @override
  String get pageNotFoundText => 'ਦਿੱਤਾ ਪੇਜ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get commonErrorText => 'ਗਲਤੀ';

  @override
  String get retryButtonText => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get filePickerDialogTitle => 'ਸੰਗੀਤ ਲਈ ਸਕੈਨ ਕਰਨ ਲਈ ਇੱਕ ਡਾਇਰੈਕਟਰੀ ਦੀ ਚੋਣ ਕਰੋ';

  @override
  String get searchScreenTitle => 'ਖੋਜ';

  @override
  String get searchEmptyText => 'ਕੋਈ ਖੋਜ ਨਤੀਜੇ ਨਹੀਂ';

  @override
  String get searchResultsText => 'ਖੋਜ ਨਤੀਜੇ:';

  @override
  String get resultsForText => 'ਦੇ ਨਤੀਜੇ:';

  @override
  String get disableBatteryOptimizationTitle => 'ਬੈਟਰੀ ਅਨੁਕੂਲਤਾ ਨੂੰ ਅਯੋਗ ਕਰੋ';

  @override
  String get disableBatteryOptimizationContent => 'ਕਿਰਪਾ ਕਰਕੇ ਸੰਗੀਤ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਸ ਐਪ ਲਈ ਬੈਟਰੀ ਅਨੁਕੂਲਤਾ ਨੂੰ ਅਯੋਗ ਕਰੋ ਜੋ ਸੰਗੀਤ ਦੇ ਪਿਛੋਕੜ ਦੇ ਪਲੇਅਬੈਕ ਦੀ ਆਗਿਆ ਦੇਣ ਲਈ.';

  @override
  String get languageScreenTitle => 'ਭਾਸ਼ਾ';

  @override
  String get silverDeviceColor => 'ਚਾਂਦੀ';

  @override
  String get blackDeviceColor => 'ਕਾਲਾ';

  @override
  String get resetSettingsTitle => 'ਸੈਟਿੰਗਜ਼ ਰੀਸੈਟ ਕਰੋ';

  @override
  String get browseArtist => 'ਬ੍ਰਾ se ਜ਼ ਆਰਟੋਸਟ';

  @override
  String get browseAlbum => 'ਬ੍ਰਾ .ਜ਼ ਐਲਬਮ';

  @override
  String get cancelText => 'ਰੱਦ ਕਰੋ';

  @override
  String get playlistsScreenTitle => 'ਪਲੇਲਿਸਟਸ';

  @override
  String get addToOnTheGoPlaylist => 'ਆਨ-ਟੂ-ਇਨ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ਐਲਬਮ ਨੂੰ ਆਨ-ਰੂਟ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get removeSongFromThePlaylist => 'ਪਲੇਲਿਸਟ ਤੋਂ ਹਟਾਓ';

  @override
  String get allAlbums => 'ਸਾਰੀਆਂ ਐਲਬਮਾਂ';

  @override
  String get scanningMusicFiles => 'ਸੰਗੀਤ ਦੀਆਂ ਫਾਈਲਾਂ ਨੂੰ ਸਕੈਨ ਕਰਨਾ';

  @override
  String get newPlaylist => 'ਨਵੀਂ ਪਲੇਲਿਸਟ';

  @override
  String get savePlaylist => 'ਪਲੇਲਿਸਟ ਸੇਵ ਕਰੋ';

  @override
  String get clearPlaylist => 'ਸਾਫ਼ ਪਲੇਲਿਸਟ';

  @override
  String get rescanMusicFilesSettingTitle => 'ਮੁੜ ਸੰਗੀਤ ਫਾਈਲਾਂ';

  @override
  String get deviceControlMenuTutorialText => 'ਮੀਨੂ ਨੇਵੀਗੇਟ ਕਰਨ ਲਈ ਕਲਿਕ ਵੀ ਪਹੀਏ ਦੇ ਦੁਆਲੇ ਹਲਕੇ ਚੱਕਰ ਨੂੰ ਹਲਕੇ ਰੂਪ ਵਿੱਚ ਹਿਲਾਓ';

  @override
  String get centerButtonMenuTutorialText => 'ਹਾਈਲਾਈਟ ਕੀਤੇ ਮੀਨੂ ਆਈਟਮ ਨੂੰ ਚੁਣਨ ਲਈ ਸੈਂਟਰ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get playPauseMenuTutorialText => 'ਇੱਕ ਗਾਣੇ ਨੂੰ ਖੇਡਣ ਜਾਂ ਰੋਕਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get nextButtonMenuTutorialText => 'ਅਗਲੇ ਗਾਣੇ ਤੇ ਜਾਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get previousButtonMenuTutorialText => 'ਪਿਛਲੇ ਗਾਣੇ ਤੇ ਵਾਪਸ ਜਾਣ ਜਾਂ ਜਾਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get menuButtonTutorialText => 'ਪਿਛਲੇ ਮੀਨੂੰ ਤੇ ਵਾਪਸ ਜਾਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ. ਮੁੱਖ ਮੇਨੂ ਤੇ ਸਿੱਧੇ ਤੌਰ ਤੇ ਮੇਨ ਮੀਨੂੰ ਤੇ ਜਾਣ ਲਈ ਤੁਸੀਂ ਕਿਸੇ ਵੀ ਹੋਰ ਸਕ੍ਰੀਨ ਤੋਂ ਕਿਸੇ ਵੀ ਸਕ੍ਰੀਨ ਤੋਂ ਦਬਾ ਸਕਦੇ ਹੋ ਅਤੇ ਹੋਲਡ ਕਰ ਸਕਦੇ ਹੋ.';

  @override
  String get deviceScreenMenuTutorialText => 'ਇਹ ਡਿਸਪਲੇਅ ਸਕ੍ਰੀਨ ਹੈ. ਟੱਚ ਸਕ੍ਰੀਨ ਅਤੇ ਸਪਲਿਟ ਸਕ੍ਰੀਨ ਮੋਡ ਨੂੰ ਮੂਲ ਰੂਪ ਵਿੱਚ ਸਮਰੱਥ ਬਣਾਇਆ ਜਾਂਦਾ ਹੈ ਅਤੇ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਹੋਰ ਕੌਂਫਿਗਰ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ.';

  @override
  String get deviceControlNowPlayingTutorialText => 'ਵਾਲੀਅਮ ਨੂੰ ਵਿਵਸਥਤ ਕਰਨ ਲਈ ਕਲਿਕ ਪਹੀਏ ਦੇ ਦੁਆਲੇ ਆਪਣੇ ਅੰਗੂਠੇ ਨੂੰ ਹਿਲਾਓ';

  @override
  String get centerButtonNowPlayingTutorialText => 'ਬਾਰ, ਰਗੜ ਪੱਟੀ ਅਤੇ ਸ਼ਫਲਡ ਸਲਾਇਡਰ ਨੂੰ ਵੇਖਣ ਲਈ ਸਾਈਕਲ ਬਟਨ ਨੂੰ ਦਬਾਓ. ਵਾਧੂ ਵਿਕਲਪਾਂ ਤਕ ਪਹੁੰਚਣ ਲਈ ਸੈਂਟਰ ਬਟਨ ਨੂੰ ਦਬਾਓ ਅਤੇ ਹੋਲਡ ਕਰੋ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'ਗਾਣੇ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਅੱਗੇ ਵਧਾਉਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ ਅਤੇ ਹੋਲਡ ਕਰੋ';

  @override
  String get previousButtonNowPlayingTutorialText => 'ਗਾਣੇ ਨੂੰ ਮੁੜ ਸੁਰਜੀਤ ਕਰਨ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ ਅਤੇ ਹੋਲਡ ਕਰੋ';

  @override
  String get deviceControlSearchTutorialText => 'ਵਰਣਮਾਲਾ ਨੂੰ ਉਜਾਗਰ ਕਰਨ ਲਈ ਕਲਿਕ ਵੀ ਵ੍ਹੀਲੇ ਦੇ ਦੁਆਲੇ ਹਲਕੇ ਪਹੀਏ ਨੂੰ ਹਲਕੇ ਜਿਹੇ ਹਿਲਾਓ';

  @override
  String get centerButtonSearchTutorialText => 'ਹਾਈਲਾਈਟ ਕੀਤੇ ਅੱਖਰ ਨੂੰ ਚੁਣਨ ਲਈ ਸੈਂਟਰ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get nextButtonSearchTutorialText => 'ਇੱਕ ਸਪੇਸ ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get previousButtonSearchTutorialText => 'ਆਖਰੀ ਅੱਖਰ ਨੂੰ ਮਿਟਾਉਣ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';

  @override
  String get menuButtonSearchTutorialText => 'ਕੀਬੋਰਡ ਨੂੰ ਬੰਦ ਕਰਨ ਅਤੇ ਖੋਜ ਨਤੀਜਿਆਂ ਨਾਲ ਗੱਲਬਾਤ ਕਰਨ ਲਈ ਇਸ ਬਟਨ ਨੂੰ ਦਬਾਓ';
}
