// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Santali (`sat`).
class AppLocalizationsSat extends AppLocalizations {
  AppLocalizationsSat([String locale = 'sat']) : super(locale);

  @override
  String get appTitle => 'ᱪᱟᱱᱟᱪ ᱠᱚ';

  @override
  String get menuButtonText => 'ᱢᱮᱨᱤ';

  @override
  String get audioAccessPermissionTitle =>
      'ᱨᱤᱭᱟᱠᱴᱤᱵᱷ ᱨᱤᱥᱚᱨᱥ ᱮᱠᱥᱮᱥ ᱞᱟᱹᱠᱛᱤ ᱠᱟᱱᱟ ᱾';

  @override
  String get audioAccessPermissionContent =>
      'ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱟᱞᱮ ᱨᱮᱱ ᱵᱮᱵᱷᱟᱨᱤᱭᱟᱹ ᱠᱚ ᱟᱢᱟᱜ ᱨᱮᱫ ᱠᱚ ᱞᱟᱹᱜᱤᱫ ᱥᱴᱨᱤᱢᱤᱝ ᱨᱮᱫ ᱠᱚ ᱰᱟᱩᱱᱞᱳᱰ ᱢᱮ ᱾';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ᱮᱱᱯᱤᱰᱤ ᱵᱚᱨᱰ ᱦᱚᱛᱮᱛᱮ ᱨᱤᱯᱳᱨᱴᱤᱝ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱱᱚᱣᱟ ᱮᱯ ᱵᱮᱵᱷᱟᱨ ᱠᱟᱛᱮ ᱟᱞᱮ ᱟᱢᱟᱜ ᱰᱤᱵᱷᱟᱭᱤᱥ ᱨᱮ ᱮᱯ ᱰᱟᱩᱱᱞᱳᱰ ᱢᱮ ᱡᱮᱢᱚᱱ ᱟᱢ ᱟᱢᱟᱜ ᱱᱮᱴᱣᱟᱨᱠ ᱞᱟᱹᱜᱤᱫ ᱤᱢᱮᱞ ᱞᱮ ᱮᱢ ᱫᱟᱲᱮᱭᱟᱜᱼᱟ᱾';

  @override
  String get menuScreenTitle => 'ᱮᱢ';

  @override
  String get musicMenuScreenTitle => 'ᱩᱛᱱᱟ.ᱣ';

  @override
  String get nowPlayingScreenTitle => 'ᱱᱤᱛᱚᱜ ᱫᱚ';

  @override
  String get shuffleSongsMenuTitle => 'ᱥᱞᱟᱭᱤᱰ ᱥᱞᱟᱭᱤᱰ';

  @override
  String get shuffleSettingTitle => 'ᱥᱞᱟᱭᱤᱰ';

  @override
  String get settingsScreenTitle => 'ᱥᱮᱴᱤᱝ';

  @override
  String get aboutScreenTitle => 'ᱦᱚᱲ ᱠᱚ ᱥᱟᱶ ᱛᱟᱦᱮᱱ ᱢᱮ᱾';

  @override
  String get coverFlowScreenTitle => 'ᱞᱟᱛᱟᱨ ᱨᱮ';

  @override
  String get artistsScreenTitle => 'ᱟᱨᱟᱵᱤᱰ';

  @override
  String get albumsScreenTitle => 'ᱟᱞᱯᱷᱟ';

  @override
  String get songsScreenTitle => 'ᱥᱴᱨᱚᱥ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ᱥᱴᱨᱚᱥ',
      one: '1 ᱥᱴᱨᱚᱥ',
      zero: '0 ᱥᱴᱨᱚᱥ',
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
      other: '$countString ᱟᱞᱯᱷᱟ',
      one: '1 ᱟᱞᱯᱷᱟ',
      zero: '0 ᱟᱞᱯᱷᱟ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ᱱᱚᱶᱟ ᱠᱚ';

  @override
  String get genreSongsScreenTitle => 'ᱥᱮᱨᱮᱧ ᱠᱚ';

  @override
  String get deviceColorSettingTitle => 'ᱰᱤᱞᱟᱨ ᱠᱚ';

  @override
  String get touchScreenSettingTitle => 'ᱥᱞᱟᱭᱤᱰᱟᱨ ᱠᱚ ᱟᱞᱜᱟ ᱜᱮᱭᱟ';

  @override
  String get repeatModeSettingTitle => 'ᱤᱣᱮᱱᱴ';

  @override
  String get repeatModeOne => 'ᱢᱤᱫ';

  @override
  String get repeatModeAll => 'ᱥᱟᱹᱨᱤ ᱜᱮ';

  @override
  String get vibrateSettingTitle => 'ᱟᱨᱴᱤᱯᱷᱤᱥᱤᱭᱟᱞ';

  @override
  String get clickWheelSettingTitle => 'ᱥᱞᱟᱭᱤᱰ ᱨᱮ ᱞᱤᱱ ᱢᱮ';

  @override
  String get splitScreenSettingTitle => 'ᱯᱞᱟᱴᱯᱷᱚᱨᱢ ᱥᱠᱨᱤᱱ';

  @override
  String get touchSoundsDialogTitle => 'ᱥᱞᱚᱴ ᱠᱚ';

  @override
  String get touchSoundsDialogContent =>
      'ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱥᱱᱮᱯᱪᱮᱴ ᱠᱷᱚᱱ ᱥᱟᱰᱮ ᱥᱟᱰᱮ ᱪᱟᱹᱞᱩᱭ ᱢᱮ ᱟᱨᱵᱟᱝ ᱠᱷᱟᱱ ᱥᱞᱚᱴ ᱥᱮᱴᱤᱝ ᱠᱷᱚᱱ ᱥᱤᱜᱽᱱᱟᱞ ᱟᱸᱡᱚᱢ ᱢᱮ ᱾';

  @override
  String get immersiveModeSettingTitle => 'ᱤᱢᱟᱨᱡᱮᱱᱥᱤ ᱚᱠᱛᱚ';

  @override
  String get showAppTutorialSettingTitle => 'ᱥᱤᱱᱛᱷᱮᱴᱤᱠᱥ';

  @override
  String get changeDirectorySettingTitle => 'ᱯᱨᱚᱢᱚᱥᱚᱱ';

  @override
  String get donateSettingTitle => 'ᱟᱠᱤᱱ';

  @override
  String get donateSettingDescription =>
      'ᱡᱩᱫᱤ ᱟᱢ ᱱᱚᱣᱟᱢ ᱠᱩᱥᱤᱭᱟᱜ-ᱟ, ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱫᱟᱭᱟ ᱠᱟᱛᱮ ᱱᱚᱣᱟ ᱧᱮᱞ ᱢᱮ᱾';

  @override
  String get versionAboutScreenTitle => 'ᱯᱷᱤᱞᱢ';

  @override
  String get madeWithLoveTitle => 'ᱢᱟᱢᱞᱟ ᱥᱟᱶ ᱦᱚᱸ ᱾';

  @override
  String get noMusicFilesFound => 'ᱡᱮᱞᱠᱟ ᱠᱟᱞᱤ';

  @override
  String get noArtistsFound => 'ᱟᱨ ᱵᱟᱝ';

  @override
  String get noAlbumsFound => 'ᱪᱮᱫ ᱦᱚᱸ ᱵᱟᱝ';

  @override
  String get unknownSong => 'ᱵᱟᱝ ᱦᱟᱦᱟᱲᱟ ᱠᱟᱨᱚᱱ';

  @override
  String get unknownArtist => 'ᱥᱚᱥᱤᱭᱟᱞ ᱢᱤᱰᱤᱭᱟ ᱨᱮ ᱵᱟᱝ ᱾';

  @override
  String get unknownAlbum => 'ᱵᱟᱝ ᱵᱟᱰᱟᱭ ᱟᱠᱟᱱ ᱠᱮᱥ';

  @override
  String get unknownGenre => 'ᱵᱟᱭᱵᱟᱞ ᱦᱚᱛᱮᱛᱮ';

  @override
  String get buttonConfirmText => '~';

  @override
  String get tileValueOn => '€ ᱖';

  @override
  String get tileValueOff => 'ᱫᱟᱜ';

  @override
  String get commonOfText => 'ᱡᱮ';

  @override
  String get pageNotFoundText => 'ᱥᱟᱦᱴᱟ ᱫᱚ ᱵᱟᱝ ᱧᱟᱢ ᱞᱮᱱᱟ ᱾';

  @override
  String get commonErrorText => 'ᱟᱨ';

  @override
  String get retryButtonText => 'ᱟᱨ';

  @override
  String get filePickerDialogTitle => 'ᱥᱮᱨᱮᱧ ᱰᱟᱭᱨᱮᱠᱴᱚᱨᱤ ᱞᱟᱹᱜᱤᱫ ᱥᱮᱨᱮᱧ ᱵᱟᱪᱷᱟᱣ ᱢᱮ';

  @override
  String get searchScreenTitle => 'ᱮᱥᱴᱤ';

  @override
  String get searchEmptyText => 'ᱞᱟᱛᱟᱨ ᱨᱮ ᱮᱢ ᱟᱠᱟᱱ ᱱᱚᱴᱤᱯᱷᱤᱠᱮᱥᱚᱱ';

  @override
  String get searchResultsText => 'ᱚᱨᱡᱚ: ᱴᱮᱵᱩᱞ';

  @override
  String get resultsForText => 'ᱚᱨᱡᱚ: ᱵᱤᱰᱟᱹᱣ';

  @override
  String get disableBatteryOptimizationTitle => 'ᱵᱟᱹᱲᱛᱤ ᱥᱯᱤᱰ ᱞᱟᱹᱜᱤᱫ ᱵᱮᱱᱰᱣᱤᱰ᱾';

  @override
  String get disableBatteryOptimizationContent =>
      'ᱱᱚᱣᱟ ᱥᱮᱴᱤᱝ ᱫᱚ ᱢᱚᱵᱟᱭᱤᱞ ᱥᱟᱫᱷᱚᱱ ᱠᱚ ᱞᱟᱹᱜᱤᱫ ᱟᱞᱜᱟ ᱜᱮᱭᱟ ᱪᱮᱫᱟᱜ ᱥᱮ ᱱᱚᱣᱟ ᱫᱚ ᱚᱯᱥᱚᱱᱟᱞ ᱢᱚᱰ ᱨᱮ ᱣᱤᱰᱤᱭᱚ ᱢᱚᱰ ᱨᱮ ᱨᱩᱣᱟᱹᱲᱚᱜᱼᱟ ᱾';

  @override
  String get languageScreenTitle => 'ᱯᱟᱹᱨᱥᱤ';

  @override
  String get silverDeviceColor => 'ᱟᱰᱟᱢᱥ';

  @override
  String get blackDeviceColor => 'ᱯᱩᱸᱰ';

  @override
  String get resetSettingsTitle => 'ᱥᱮᱴᱤᱝ ᱨᱮ ᱥᱮᱴ ᱢᱮ';

  @override
  String get browseArtist => 'ᱟᱨᱴᱤᱯᱷᱤᱥᱤᱭᱟᱞ ᱤᱱᱴᱤᱞᱤᱡᱮᱱᱥ';

  @override
  String get browseAlbum => 'ᱢᱮᱴᱨᱤᱠᱥ';

  @override
  String get cancelText => 'ᱥᱤ';

  @override
  String get playlistsScreenTitle => 'ᱠᱷᱤᱞᱟᱲᱤᱭᱟᱹ ᱠᱚ';

  @override
  String get addToOnTheGoPlaylist => 'ᱥᱟᱱᱟᱢ ᱠᱚ ᱞᱟᱹᱜᱤᱫ----';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ᱥᱟᱱᱟᱢ ᱠᱷᱚᱱ ᱵᱮᱥ------';

  @override
  String get removeSongFromThePlaylist => 'ᱥᱟᱱᱟᱢ ᱠᱷᱚᱱ ᱞᱚᱜᱚᱱ ᱨᱤᱞᱤᱡᱽ';

  @override
  String get allAlbums => 'ᱥᱟᱱᱟᱢ ᱱᱟᱹᱢᱩᱱᱟ';

  @override
  String get scanningMusicFiles => 'ᱥᱮᱨᱮᱧ ᱥᱮᱨᱮᱧ ᱠᱚ';

  @override
  String get newPlaylist => 'ᱱᱟᱶᱟ ᱠᱷᱮᱞ';

  @override
  String get savePlaylist => 'ᱯᱞᱟᱴᱯᱷᱚᱨᱢ ᱠᱚ';

  @override
  String get clearPlaylist => 'ᱱᱮᱴᱯᱷᱞᱤᱠᱥ ᱠᱚ';

  @override
  String get rescanMusicFilesSettingTitle => 'ᱥᱮᱨᱮᱧ ᱠᱚ ᱫᱚ ᱯᱷᱤᱡᱤᱠᱥ';

  @override
  String get deviceControlMenuTutorialText =>
      'ᱟᱢ ᱨᱮᱱ ᱯᱩᱥᱤ ᱠᱚ ᱨᱮ ᱞᱤᱱ ᱠᱟᱛᱮ ᱟᱢ ᱨᱮᱱ ᱡᱤᱭᱩᱥ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get centerButtonMenuTutorialText =>
      'ᱵᱩᱛᱟᱹᱢ ᱞᱤᱱ ᱠᱟᱛᱮ ᱵᱩᱛᱟᱹᱢ ᱵᱩᱛᱟᱹᱢ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get playPauseMenuTutorialText =>
      'ᱱᱚᱣᱟ ᱠᱚᱨᱟᱣ ᱞᱟᱹᱜᱤᱫ ᱟᱨ ᱵᱟᱝ ᱯᱚᱯ ᱥᱮᱨᱮᱧ ᱵᱮᱵᱷᱟᱨ ᱢᱮ ᱾';

  @override
  String get nextButtonMenuTutorialText =>
      'ᱱᱚᱣᱟ ᱥᱮᱨᱮᱧ ᱞᱟᱹᱜᱤᱫ ᱫᱚᱥᱟᱨ ᱵᱩᱛᱟᱢ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get previousButtonMenuTutorialText =>
      'ᱞᱟᱦᱟ ᱥᱮᱱᱚᱜ ᱢᱮ ᱟᱨ ᱵᱟᱝᱠᱷᱟᱱ ᱞᱤᱱ ᱢᱮ ᱱᱚᱣᱟ ᱫᱚ ᱴᱨᱤᱠ ᱵᱟᱝᱠᱷᱟᱱ ᱮᱯᱞ ᱨᱮ ᱥᱮᱱᱚᱜ ᱢᱮ ᱾';

  @override
  String get menuButtonTutorialText =>
      'ᱞᱟᱦᱟ ᱥᱮᱱᱚᱜ ᱞᱟᱹᱜᱤᱫ ᱱᱚᱣᱟ ᱢᱮᱱᱩ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾ ᱟᱢ ᱱᱚᱣᱟ ᱥᱠᱨᱤᱱ ᱨᱮ ᱥᱮᱱᱚᱜ ᱫᱟᱲᱮᱭᱟᱜᱼᱟᱢ ᱟᱨ ᱚᱱᱟ ᱛᱟᱭᱚᱢ ᱨᱮ ᱢᱮᱱᱟᱜ ᱠᱤᱵᱚᱨᱰ ᱨᱮ ᱞᱤᱱ ᱠᱟᱛᱮ ᱾';

  @override
  String get deviceScreenMenuTutorialText =>
      'ᱱᱚᱣᱟ ᱫᱚ ᱥᱠᱨᱤᱱ ᱩᱫᱩᱜ ᱟ᱾ ᱥᱴᱨᱤᱝ ᱟᱨ ᱨᱤᱢᱚᱴ ᱥᱠᱨᱤᱱ ᱨᱮ ᱥᱮᱴᱤᱝ ᱫᱚ ᱟᱞᱜᱟ ᱛᱮ ᱪᱟᱹᱞᱩ ᱟᱠᱟᱱᱟ ᱟᱨ ᱥᱴᱨᱤᱝ ᱫᱚ ᱥᱴᱨᱤᱝ ᱨᱮ ᱪᱟᱞᱟᱜ ᱠᱟᱱᱟ ᱾';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ᱟᱢᱟᱜ ᱯᱞᱟᱜᱤᱱ ᱨᱮ ᱞᱤᱱ ᱠᱟᱛᱮ ᱟᱢ ᱨᱮᱱ ᱵᱩᱛᱟᱢ ᱨᱮ ᱞᱤᱱ ᱢᱮ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ᱵᱟᱨ ᱥᱤᱲᱦᱤ ᱨᱮ ᱢᱤᱫ ᱵᱮᱨᱮᱞ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱠᱞᱤᱠ ᱢᱮ, ᱟᱨ ᱛᱟᱭᱚᱢ ᱛᱮ ᱢᱤᱫ ᱵᱮᱫᱷᱟᱣ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱫᱚᱦᱚᱭ ᱢᱮ ᱾ ᱞᱟᱛᱟᱨ ᱨᱮ ᱮᱢ ᱟᱠᱟᱱ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱚᱛᱟᱭ ᱢᱮ ᱟᱨ ᱵᱟᱹᱲᱛᱤ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱚᱛᱟᱭ ᱢᱮ ᱾';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ᱮᱛᱚᱦᱚᱵ ᱞᱟᱹᱜᱤᱫ ᱱᱚᱣᱟ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱟᱨ ᱴᱮᱯ ᱢᱮ ᱾';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ᱱᱚᱣᱟ ᱠᱚᱨᱟᱣ ᱢᱮ ᱟᱨ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get deviceControlSearchTutorialText =>
      'ᱟᱢᱟᱜ ᱢᱟᱨᱥᱟᱞ ᱪᱮᱛᱟᱱ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱡᱮᱢᱚᱱ ᱦᱟᱭᱞᱟᱭᱤᱴᱤᱝ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get centerButtonSearchTutorialText =>
      'ᱞᱮᱵᱮᱞ ᱜᱞᱩᱴᱮᱱ ᱵᱩᱛᱟᱹᱢ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get nextButtonSearchTutorialText =>
      'ᱥᱮᱴᱤᱝ ᱨᱮ ᱞᱤᱱ ᱠᱟᱛᱮ ᱱᱚᱣᱟ ᱥᱮᱞᱮᱫ ᱢᱮ ᱾';

  @override
  String get previousButtonSearchTutorialText =>
      'ᱞᱟᱛᱟᱨ ᱨᱮ ᱮᱢ ᱟᱠᱟᱱ ᱰᱟᱭᱜᱽᱨᱟᱢ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';

  @override
  String get menuButtonSearchTutorialText =>
      'ᱞᱟᱛᱟᱨ ᱨᱮ ᱮᱢ ᱟᱠᱟᱱ ᱠᱤᱵᱚᱨᱰ ᱨᱮ ᱠᱞᱤᱠ ᱢᱮ ᱟᱨ ᱱᱚᱣᱟ ᱥᱮᱸᱫᱽᱨᱟ ᱚᱨᱡᱚ ᱨᱮ ᱞᱤᱱ ᱢᱮ ᱾';
}
