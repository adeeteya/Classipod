// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Manipuri (`mni`).
class AppLocalizationsMni extends AppLocalizations {
  AppLocalizationsMni([String locale = 'mni']) : super(locale);

  @override
  String get appTitle => 'ꯀ꯭ꯂꯥꯁꯤꯄꯣꯗ';

  @override
  String get menuButtonText => 'ꯃꯦꯅꯨ';

  @override
  String get audioAccessPermissionTitle => 'ꯑꯣꯗꯤꯑꯣ ꯑꯦꯛꯁꯦꯁꯀꯤ ꯑꯌꯥꯕꯥ ꯂꯧꯕꯥ ꯃꯊꯧ ꯇꯥꯏ';

  @override
  String get audioAccessPermissionContent =>
      'ꯆꯥꯅꯕꯤꯗꯨꯅꯥ ꯑꯗꯣꯃꯒꯤ ꯃ꯭ꯌꯨꯖꯤꯛ ꯐꯥꯏꯂꯁꯤꯡ ꯄ꯭ꯂꯦ ꯇꯧꯕꯥ ꯌꯥꯅꯕꯥ ꯑꯣꯗꯤꯑꯣ ꯐꯥꯏꯂꯁꯤꯡ ꯑꯦꯛꯁꯦꯁ ꯇꯧꯕꯤꯌꯨ꯫';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ꯑꯣꯗꯤꯑꯣ ꯑꯦꯛꯁꯦꯁꯀꯤ ꯑꯌꯥꯕꯥ ꯄꯤꯕꯥ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ꯆꯥꯅꯕꯤꯗꯨꯅꯥ ꯑꯗꯣꯃꯒꯤ ꯃ꯭ꯌꯨꯖꯤꯛ ꯐꯥꯏꯂꯁꯤꯡ ꯄ꯭ꯂꯦ ꯇꯧꯕꯥ ꯌꯥꯅꯕꯥ ꯗꯤꯚꯥꯏꯁ ꯁꯦꯇꯤꯡꯁꯤꯡꯗꯥ ꯑꯦꯞ ꯑꯁꯤꯒꯤꯗꯃꯛꯇꯥ ꯑꯣꯗꯤꯑꯣ ꯐꯥꯏꯂꯁꯤꯡ ꯑꯦꯛꯁꯦꯁ ꯇꯧꯕꯤꯌꯨ꯫';

  @override
  String get menuScreenTitle => 'ꯃꯦꯅꯨ';

  @override
  String get musicMenuScreenTitle => 'ꯏꯁꯩ ꯅꯣꯡꯃꯥꯏ';

  @override
  String get nowPlayingScreenTitle => 'ꯍꯧꯖꯤꯛ ꯁꯥꯟꯅꯔꯤ';

  @override
  String get shuffleSongsMenuTitle => 'ꯁꯨꯐꯝ ꯊꯣꯀꯄꯥ ꯏꯁꯩꯁꯤꯡ';

  @override
  String get shuffleSettingTitle => 'ꯁꯨꯐꯝ ꯊꯣꯀꯄꯥ';

  @override
  String get settingsScreenTitle => 'ꯁꯦꯇꯤꯡꯁꯤꯡ ꯑꯗꯨ .';

  @override
  String get aboutScreenTitle => 'ꯃꯔꯝꯗꯤ';

  @override
  String get coverFlowScreenTitle => 'ꯀꯚꯔ ꯐ꯭ꯂꯣ ꯇꯧꯕꯥ';

  @override
  String get artistsScreenTitle => 'ꯑꯥꯔꯇꯤꯁ꯭ꯇꯁꯤꯡꯅꯥ ꯑꯦꯝ.';

  @override
  String get albumsScreenTitle => 'ꯑꯦꯂꯕꯥꯝ ꯑꯃꯥ ꯑꯣꯏꯅꯥ ꯂꯧꯕꯥ ꯌꯥꯏ꯫';

  @override
  String get songsScreenTitle => 'ꯒꯤꯠ ꯴.';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ꯏꯁꯩꯁꯤꯡ',
      one: '1 ꯒꯤ ꯏꯁꯩ',
      zero: 'ꯏꯁꯩ ꯂꯩꯇꯦ',
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
      other: '$countString ꯑꯦꯂꯕꯃꯁꯤꯡ',
      one: '1 ꯑꯦꯂꯕꯝ',
      zero: 'ꯑꯂꯕꯝ ꯂꯩꯇꯕꯥ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ꯖꯤꯅꯁꯤꯡ ꯑꯁꯤ .';

  @override
  String get genreSongsScreenTitle => 'ꯖꯦꯅꯔꯦ ꯒ꯭ꯔꯟ ꯒꯤꯠ';

  @override
  String get deviceColorSettingTitle => 'ꯗꯤꯚꯥꯏꯁ ꯃꯆꯨ .';

  @override
  String get touchScreenSettingTitle => 'ꯇꯆ ꯁ꯭ꯛꯔꯤꯟ ꯏꯅꯦꯕꯜ ꯇꯧꯕꯥ';

  @override
  String get repeatModeSettingTitle => 'ꯍꯟꯖꯤꯟꯕ';

  @override
  String get repeatModeOne => 'ꯑꯃ';

  @override
  String get repeatModeAll => 'ꯄꯨꯝꯅꯃꯛ';

  @override
  String get vibrateSettingTitle => 'ꯚꯥꯏꯕ꯭ꯔꯦꯠ ꯇꯧꯕꯥ';

  @override
  String get clickWheelSettingTitle => 'ꯀ꯭ꯂꯤꯛ ꯍꯨꯏꯜ ꯁꯥꯎꯟꯗꯁꯤꯡ .';

  @override
  String get splitScreenSettingTitle => 'ꯁ꯭ꯞꯂꯤꯠ ꯁ꯭ꯛꯔꯤꯟ ꯃꯣꯗ .';

  @override
  String get touchSoundsDialogTitle => 'ꯇꯆ ꯁꯥꯎꯟꯗꯁꯤꯡ';

  @override
  String get touchSoundsDialogContent =>
      'ꯆꯥꯅꯕꯤꯗꯨꯅꯥ ꯀ꯭ꯂꯤꯛ ꯍꯨꯏꯜ ꯁꯥꯎꯟꯗꯁꯤꯡ ꯇꯥꯅꯕꯒꯤꯗꯃꯛ ꯁꯤꯁ꯭ꯇꯦꯝ ꯁꯦꯇꯤꯡꯁꯤꯡꯗꯒꯤ ꯇꯆ ꯁꯥꯎꯟꯗꯁꯤꯡ ꯏꯅꯦꯕꯜ ꯇꯧꯕꯤꯌꯨ';

  @override
  String get immersiveModeSettingTitle => 'ꯏꯃꯔꯁꯤꯕ ꯃꯣꯗ ꯴.';

  @override
  String get showAppTutorialSettingTitle => 'ꯇꯤꯎꯇꯣꯔꯤꯌꯥꯜ ꯎꯠꯄꯥ';

  @override
  String get changeDirectorySettingTitle => 'ꯗꯥꯏꯔꯦꯛꯇꯣꯔꯤ ꯍꯣꯡꯗꯣꯀꯄꯥ .';

  @override
  String get donateSettingTitle => 'ꯗꯥꯟ ꯇꯧꯕ';

  @override
  String get donateSettingDescription =>
      'ꯀꯔꯤꯒꯨꯝꯕꯥ ꯅꯍꯥꯛꯅꯥ ꯑꯦꯞ ꯑꯁꯤ ꯄꯥꯝꯂꯕꯗꯤ, ꯆꯥꯅꯕꯤꯗꯨꯅꯥ ꯗꯥꯟ ꯇꯧꯅꯕꯥ ꯈꯟꯅꯕꯤꯌꯨ꯫';

  @override
  String get versionAboutScreenTitle => 'ꯃꯈꯜ';

  @override
  String get madeWithLoveTitle => '❤️ ꯒꯤ ꯃꯇꯦꯡꯅꯥ ꯁꯦꯝꯕꯥ .';

  @override
  String get noMusicFilesFound => 'ꯅꯣ ꯃꯤꯎꯖꯤꯛ';

  @override
  String get noArtistsFound => 'ꯑꯥꯔꯇꯤꯁ꯭ꯠ ꯑꯃꯠꯇꯥ ꯂꯩꯇꯦ';

  @override
  String get noAlbumsFound => 'ꯑꯦꯂꯕꯝ ꯑꯃꯠꯇꯥ ꯂꯩꯇꯦ';

  @override
  String get unknownSong => 'ꯃꯃꯤꯡ ꯂꯩꯔꯕꯥ ꯏꯁꯩ';

  @override
  String get unknownArtist => 'ꯃꯃꯤꯡ ꯂꯩꯔꯕꯥ ꯀꯂꯥꯀꯥꯔ';

  @override
  String get unknownAlbum => 'ꯃꯃꯤꯡ ꯂꯩꯔꯕꯥ ꯑꯦꯂꯕꯝ ꯑꯃꯥ';

  @override
  String get unknownGenre => 'ꯃꯃꯤꯡ ꯂꯩꯔꯕꯥ ꯖꯤꯅꯒꯤ ꯃꯇꯥꯡꯗꯥ ꯋꯥꯐꯝ ꯀꯌꯥ ꯊꯃꯈꯤ꯫';

  @override
  String get buttonConfirmText => 'ꯑꯣꯀꯦ';

  @override
  String get tileValueOn => 'on ꯒꯤ ꯃꯇꯥꯡꯗꯥ ꯋꯥ ꯉꯥꯡꯈꯤ꯫';

  @override
  String get tileValueOff => 'ꯑꯣꯐ ꯇꯧꯕꯥ';

  @override
  String get commonOfText => 'of of of';

  @override
  String get pageNotFoundText => 'ꯄꯤꯔꯤꯕꯥ ꯄꯦꯖ ꯑꯁꯤ ꯐꯪꯈꯤꯗꯦ .';

  @override
  String get commonErrorText => 'ꯑꯁꯣꯏꯕ';

  @override
  String get retryButtonText => 'ꯑꯃꯨꯛ ꯍꯟꯅꯥ ꯍꯣꯠꯅꯕꯥ';

  @override
  String get filePickerDialogTitle =>
      'ꯃ꯭ꯌꯨꯖꯤꯛ ꯁ꯭ꯀꯦꯟ ꯇꯧꯅꯕꯥ ꯗꯥꯏꯔꯦꯛꯇꯣꯔꯤ ꯑꯃꯥ ꯈꯅꯕꯤꯌꯨ .';

  @override
  String get searchScreenTitle => 'ꯊꯤꯕ';

  @override
  String get searchEmptyText => 'ꯅꯣ ꯁꯥꯔꯆ ꯔꯤꯖꯜꯇ';

  @override
  String get searchResultsText => 'ꯊꯤꯖꯤꯅꯕꯒꯤ ꯐꯂꯁꯤꯡ:';

  @override
  String get resultsForText => 'ꯔꯤꯖꯜꯇꯁꯤꯡ ꯑꯁꯤ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ꯕꯦꯠꯇꯔꯤ ꯑꯣꯞꯇꯤꯃꯥꯏꯖꯦꯁꯟ ꯗꯤꯁꯦꯕꯜ ꯇꯧꯕꯥ';

  @override
  String get disableBatteryOptimizationContent =>
      'ꯆꯥꯅꯕꯤꯗꯨꯅꯥ ꯃ꯭ꯌꯨꯖꯤꯀꯀꯤ ꯕꯦꯀꯒ꯭ꯔꯥꯎꯟꯗ ꯄ꯭ꯂꯦꯕꯦꯛ ꯑꯌꯥꯕꯥ ꯄꯤꯅꯕꯥ ꯗꯤꯚꯥꯏꯁ ꯁꯦꯇꯤꯡꯁꯤꯡꯗꯥ ꯑꯦꯞ ꯑꯁꯤꯒꯤꯗꯃꯛꯇꯥ ꯕꯦꯠꯇꯔꯤ ꯑꯣꯞꯇꯤꯃꯥꯏꯖꯦꯁꯟ ꯗꯤꯁꯦꯕꯜ ꯇꯧꯕꯤꯌꯨ꯫';

  @override
  String get languageScreenTitle => 'ꯂꯣꯜ';

  @override
  String get silverDeviceColor => 'ꯂꯨꯄꯥ';

  @override
  String get blackDeviceColor => 'ꯑꯃꯨꯕ';

  @override
  String get resetSettingsTitle => 'ꯁꯦꯇꯤꯡꯁꯤꯡ ꯑꯗꯨ ꯑꯃꯨꯛ ꯍꯟꯅꯥ ꯁꯦꯃꯖꯤꯅꯈꯤ';

  @override
  String get browseArtist => 'ꯕ꯭ꯔꯥꯎꯖ ꯇꯧꯕꯥ ꯑꯥꯔꯇꯤꯁ꯭ꯠ';

  @override
  String get browseAlbum => 'ꯑꯦꯂꯕꯥꯝ ꯑꯃꯥ ꯕ꯭ꯔꯎꯖ ꯇꯧꯕꯥ';

  @override
  String get cancelText => 'ꯀꯛꯄ';

  @override
  String get playlistsScreenTitle => 'ꯄ꯭ꯂꯦꯂꯤꯁ꯭ꯇꯁꯤꯡ';

  @override
  String get addToOnTheGoPlaylist => 'ꯑꯣꯟ-ꯗꯤ-ꯒꯣꯗꯥ ꯍꯥꯄꯆꯤꯅꯕꯥ .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ꯑꯣꯟ-ꯗꯤ-ꯒꯣꯗꯥ ꯑꯦꯂꯕꯝ ꯍꯥꯄꯆꯤꯜꯂꯨ';

  @override
  String get removeSongFromThePlaylist => 'ꯄ꯭ꯂꯦꯂꯤꯁ꯭ꯠ ꯑꯗꯨꯗꯒꯤ ꯂꯧꯊꯣꯀꯎ';

  @override
  String get allAlbums => 'ꯑꯦꯂꯕꯝ ꯄꯨꯝꯅꯃꯛ .';

  @override
  String get scanningMusicFiles => 'ꯃ꯭ꯌꯨꯖꯤꯛ ꯐꯥꯏꯂꯁꯤꯡ ꯁ꯭ꯀꯦꯟ ꯇꯧꯕꯥ';

  @override
  String get newPlaylist => 'ꯑꯅꯧꯕꯥ ꯄ꯭ꯂꯦꯂꯤꯁ꯭ꯠ ꯑꯃꯥ';

  @override
  String get savePlaylist => 'ꯄ꯭ꯂꯦꯂꯤꯁ꯭ꯠ ꯁꯦꯚ ꯇꯧꯕꯥ';

  @override
  String get clearPlaylist => 'ꯀ꯭ꯂꯤꯌꯥꯔ ꯄ꯭ꯂꯦꯂꯤꯁ꯭ꯠ';

  @override
  String get rescanMusicFilesSettingTitle => 'ꯔꯤꯁ꯭ꯀꯦꯟ ꯃꯤꯎꯖꯤꯛ ꯐꯥꯏꯂꯁꯤꯡ';

  @override
  String get deviceControlMenuTutorialText =>
      'ꯃꯦꯅꯨꯗꯥ ꯆꯠꯅꯕꯥ ꯀ꯭ꯂꯤꯛ ꯍꯨꯏꯜ ꯑꯗꯨꯒꯤ ꯃꯅꯨꯡꯗꯥ ꯅꯍꯥꯛꯀꯤ ꯊꯣꯡꯅꯥꯎ ꯑꯗꯨ ꯂꯥꯏꯅꯥ ꯂꯧꯊꯣꯀꯎ';

  @override
  String get centerButtonMenuTutorialText =>
      'ꯍꯥꯏꯂꯥꯏꯠ ꯇꯧꯔꯕꯥ ꯃꯦꯅꯨ ꯑꯥꯏꯇꯦꯝ ꯑꯗꯨ ꯈꯅꯕꯗꯥ ꯁꯦꯟꯇꯔ ꯕꯇꯟ ꯑꯗꯨ ꯊꯝꯃꯨ꯫';

  @override
  String get playPauseMenuTutorialText =>
      'ꯏꯁꯩ ꯑꯃꯥ ꯇꯥꯕꯥ ꯅꯠꯔꯒꯥ ꯄꯣꯖ ꯇꯧꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ .';

  @override
  String get nextButtonMenuTutorialText => 'ꯃꯊꯪꯒꯤ ꯏꯁꯩꯗꯥ ꯆꯠꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ .';

  @override
  String get previousButtonMenuTutorialText =>
      'ꯔꯤꯋꯥꯏꯟꯗ ꯇꯧꯅꯕꯥ ꯅꯠꯠꯔꯒꯥ ꯃꯃꯥꯡꯒꯤ ꯏꯁꯩꯗꯥ ꯑꯃꯨꯛ ꯍꯟꯅꯥ ꯆꯪꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ .';

  @override
  String get menuButtonTutorialText =>
      'ꯃꯃꯥꯡꯒꯤ ꯃꯦꯅꯨꯗꯥ ꯑꯃꯨꯛ ꯍꯟꯅꯥ ꯆꯪꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ꯫ ꯅꯍꯥꯛꯅꯥ ꯃꯗꯨ ꯃꯦꯟ ꯃꯦꯅꯨꯗꯥ ꯍꯀꯊꯦꯡꯅꯅꯥ ꯆꯠꯅꯕꯥ ꯑꯇꯣꯞꯄꯥ ꯁ꯭ꯛꯔꯤꯟ ꯑꯃꯍꯦꯛꯇꯗꯒꯤ ꯄ꯭ꯔꯦꯁ ꯇꯧꯕꯥ ꯑꯃꯁꯨꯡ ꯊꯝꯕꯥ ꯌꯥꯏ꯫';

  @override
  String get deviceScreenMenuTutorialText =>
      'ꯃꯁꯤ ꯗꯤꯁꯞꯂꯦ ꯁ꯭ꯛꯔꯤꯅꯅꯤ꯫ ꯇꯆ ꯁ꯭ꯛꯔꯤꯟ ꯑꯃꯁꯨꯡ ꯁ꯭ꯞꯂꯤꯠ ꯁ꯭ꯛꯔꯤꯟ ꯃꯣꯗ ꯑꯁꯤ ꯗꯤꯐꯣꯜꯇ ꯑꯣꯏꯅꯥ ꯏꯅꯦꯕꯜ ꯑꯣꯏ ꯑꯃꯁꯨꯡ ꯁꯦꯇꯤꯡꯁꯤꯡꯗꯥ ꯃꯈꯥ ꯇꯥꯅꯥ ꯀꯅꯐꯤꯒꯔ ꯇꯧꯕꯥ ꯌꯥꯏ꯫';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ꯚꯣꯜꯌꯨꯝ ꯑꯗꯨ ꯑꯦꯗꯖꯁ꯭ꯠ ꯇꯧꯅꯕꯥ ꯀ꯭ꯂꯤꯛ ꯍꯨꯏꯜ ꯑꯗꯨꯒꯤ ꯑꯀꯣꯌꯕꯗꯥ ꯅꯍꯥꯛꯀꯤ ꯊꯣꯡꯅꯥꯎ ꯑꯗꯨ ꯂꯧꯊꯣꯀꯎ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ꯁꯤꯛ ꯕꯥꯔ, ꯁ꯭ꯛꯔꯕꯔ ꯕꯥꯔ ꯑꯃꯁꯨꯡ ꯁ꯭ꯂꯥꯏꯗꯔꯒꯤ ꯃꯔꯛꯇꯥ ꯁꯥꯏꯀꯜ ꯊꯧꯅꯕꯥ ꯁꯦꯟꯇꯔ ꯕꯇꯟ ꯑꯗꯨ ꯊꯝꯃꯨ꯫ ꯑꯍꯦꯅꯕꯥ ꯑꯣꯄꯁꯅꯁꯤꯡ ꯑꯦꯛꯁꯦꯁ ꯇꯧꯅꯕꯥ ꯁꯦꯟꯇꯔ ꯕꯇꯟ ꯑꯗꯨ ꯊꯝꯃꯨ ꯑꯃꯁꯨꯡ ꯊꯝꯃꯨ꯫';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ꯏꯁꯩ ꯑꯁꯤ ꯌꯥꯝꯅꯥ ꯊꯨꯅꯥ ꯃꯥꯡꯂꯣꯃꯗꯥ ꯆꯪꯁꯤꯟꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ ꯑꯃꯁꯨꯡ ꯊꯝꯃꯨ .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ꯏꯁꯩ ꯑꯁꯤ ꯔꯤꯋꯥꯏꯟꯗ ꯇꯧꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ ꯑꯃꯁꯨꯡ ꯊꯝꯃꯨ .';

  @override
  String get deviceControlSearchTutorialText =>
      'ꯑꯂꯐꯥꯕꯦꯠ ꯑꯃꯥ ꯍꯥꯏꯂꯥꯏꯠ ꯇꯧꯅꯕꯥ ꯀ꯭ꯂꯤꯛ ꯍꯨꯏꯜ ꯑꯗꯨꯒꯤ ꯑꯀꯣꯌꯕꯗꯥ ꯅꯍꯥꯛꯀꯤ ꯊꯣꯡꯅꯥꯎ ꯑꯗꯨ ꯂꯥꯏꯅꯥ ꯂꯧꯊꯣꯀꯎ';

  @override
  String get centerButtonSearchTutorialText =>
      'ꯍꯥꯏꯂꯥꯏꯠ ꯇꯧꯔꯕꯥ ꯑꯥꯂꯐꯥꯕꯦꯠ ꯑꯗꯨ ꯈꯅꯕꯗꯥ ꯁꯦꯟꯇꯔ ꯕꯇꯟ ꯑꯗꯨ ꯊꯝꯃꯨ꯫';

  @override
  String get nextButtonSearchTutorialText =>
      'ꯁ꯭ꯄꯦꯁ ꯑꯃꯥ ꯍꯥꯄꯆꯤꯟꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ .';

  @override
  String get previousButtonSearchTutorialText =>
      'ꯑꯔꯣꯏꯕꯥ ꯆꯦꯛꯔꯦꯇꯔ ꯑꯗꯨ ꯃꯨꯠꯊꯠꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ .';

  @override
  String get menuButtonSearchTutorialText =>
      'ꯀꯤꯕꯣꯔꯗ ꯂꯣꯗ ꯇꯧꯅꯕꯥ ꯑꯃꯁꯨꯡ ꯁꯥꯔꯆ ꯔꯤꯖꯜꯇꯁꯤꯡꯒꯥ ꯏꯟꯇꯔꯦꯛꯇ ꯇꯧꯅꯕꯥ ꯕꯇꯟ ꯑꯁꯤ ꯊꯝꯃꯨ';

  @override
  String get allSongs => 'All Songs';
}
