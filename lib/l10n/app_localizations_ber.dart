// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Berber languages (`ber`).
class AppLocalizationsBer extends AppLocalizations {
  AppLocalizationsBer([String locale = 'ber']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'ⵎⵉⵏⵢⵓ';

  @override
  String get audioAccessPermissionTitle => 'ⴰⵙⵇⵙⵉ ⵏ ⵓⴷⵉⵢⵓ ⴰⴽⵜⵓⵔ ⵉⵜⵜⵓⵙⵓⵜⵔⵏ';

  @override
  String get audioAccessPermissionContent => 'ⴰⵔ ⴰⵡⵏ ⵏⵙⵙⵉⵜⵉⵎ ⴰⴷ ⵜⴼⴽⵎ ⵉⴼⴰⵢⵍⵓⵜⵏ ⵏ ⵓⵙⴼⵙⵔ ⵃⵎⴰ ⴰⴷ ⵏⵙⵎⵔⵙ ⵉⴼⴰⵢⵍⵓⵜⵏ ⵏⵏⵓⵏ ⵏ ⵓⵥⴰⵡⴰⵏ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Access Pervision Dened Dened';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'ⴰⵔ ⴰⵡⵏ ⵏⵙⵙⵉⵜⵉⵎ ⴰⴷ ⵜⴼⴽⵎ ⵉ ⵉⴼⴰⵢⵍⵓⵜⵏ ⵏ ⵓⵙⴼⵙⵔ ⴰⴷ ⵏⵙⴽⵔ ⴰⵙⵖⵍ ⵏ ⵜⵙⵏⵙⵍⴽⵉⵎⵜ ⴰⴷ ⴳ ⵉⵙⵎⵔⴰⵙⵏ ⵏ ⵡⴰⵍⵍⴰⵍⵏ ⵃⵎⴰ ⴰⴷ ⵏⵙⵎⵔⴰⵙ ⵉⴼⴰⵢⵍⵓⵜⵏ ⵏⵏⵓⵏ ⵏ ⵓⵥⴰⵡⴰⵏ.';

  @override
  String get menuScreenTitle => 'ⵎⵉⵏⵣⵓ';

  @override
  String get musicMenuScreenTitle => 'ⴰⵥⴰⵡⴰⵏ';

  @override
  String get nowPlayingScreenTitle => 'ⵉⵎⵉⵔ-ⴰ ⴰⵔ ⵜⵜⵓⵔⴰⵔ';

  @override
  String get shuffleSongsMenuTitle => 'ⵉⵣⵍⴰⵏ ⵏ ⵜⵣⵍⴰⵜⵉⵏ';

  @override
  String get shuffleSettingTitle => 'ⵛⵓⴼⵍ';

  @override
  String get settingsScreenTitle => 'ⴰⵙⵜⴰⵍ';

  @override
  String get aboutScreenTitle => 'ⴰⵣⴰⵍ ⵏ';

  @override
  String get coverFlowScreenTitle => 'ⴽⵓⴱⵔ ⴼⵍⵓ';

  @override
  String get artistsScreenTitle => 'ⵉⵏⴰⵥⵓⵔⴻⵏ';

  @override
  String get albumsScreenTitle => 'ⴰⵍⴱⵓⵎⵙ';

  @override
  String get songsScreenTitle => 'ⵉⵣⵍⴰⵏ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ⵜⵉⵣⵍⴰⵜⵉⵏ',
      one: '1 ⵜⵉⵣⵍⵉⵜ',
      zero: 'ⵓⵍⴰⵛ ⵜⵉⵣⵍⴰⵜⵉⵏ',
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
      other: '$countString ⴰⵍⴱⵓⵎⴻⵏ',
      one: '1 ⴰⵍⴱⵓⵎ',
      zero: 'ⵓⵍⴰⵛ ⴰⵍⴱⵓⵎⴻⵏ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ⵊⵉⵏⵔⵉⵙ';

  @override
  String get genreSongsScreenTitle => 'ⵉⵣⵍⴰⵏ ⵏ ⵉⵏⴰⵡⵏ';

  @override
  String get deviceColorSettingTitle => 'ⴰⴽⵍⵓ ⴰⵏⴼⵍⵓⵙ';

  @override
  String get touchScreenSettingTitle => 'Tuch Screen Enabled';

  @override
  String get repeatModeSettingTitle => 'ⵄⴰⵡⴷ';

  @override
  String get repeatModeOne => 'ⵢⵉⵡⴻⵏ';

  @override
  String get repeatModeAll => 'ⴰⴽⴽ';

  @override
  String get vibrateSettingTitle => 'ⴰⵣⵓⵍ';

  @override
  String get clickWheelSettingTitle => 'ⴽⵍⵉⴽ ⵡⵉⵍ ⵙⵓⵏⴷⵙ';

  @override
  String get splitScreenSettingTitle => 'ⵙⴱⵍⵉⵜ ⵙⴽⵔⵉⵏ ⵎⵓⴷ';

  @override
  String get touchSoundsDialogTitle => 'ⵟⵓⵛ ⵙⵓⵏⴷⵙ';

  @override
  String get touchSoundsDialogContent => 'ⴰⵔ ⵜⵜⵔⵖ ⴰⴷ ⵏⵙⴽⵔ ⴰⵙⵖⵍ ⵏ Tuch Sounds ⵙⴳ ⵉⵙⵖⵍⵏ ⵏ ⵓⵏⴳⵔⴰⵡ ⴰⴼⴰⴷ ⴰⴷ ⵜⵙⵍⵍⵡⵉⴷ ⴰⵙⵍⴽⵉⵏ ⵏ ⵓⴽⵛⵛⵓⵎ';

  @override
  String get immersiveModeSettingTitle => 'ⴰⴼⵓⵥⴰⵕ ⴰⵏⴼⵔⴰⴽ';

  @override
  String get showAppTutorialSettingTitle => 'ⵛⵓⵡ ⵟⵓⵜⵓⵔⵢⴰⵍ';

  @override
  String get changeDirectorySettingTitle => 'ⵜⴰⵎⵀⵍⴰ ⵏ ⵓⵙⵏⴼⵍ';

  @override
  String get donateSettingTitle => 'ⴰⵚⴻⴷⴷⴻⵇ';

  @override
  String get donateSettingDescription => 'ⵎⴽ ⵜⵔⵉⴷ ⴰⵙⵍⴽⵉⵏ ⴰⴷ, ⴰⵔ ⵜⵜ ⵙⵙⵓⵜⵓⵔⴷ ⴰⴷ ⵜⴼⴽⴷ ⴰⵙⴼⴽ.';

  @override
  String get versionAboutScreenTitle => 'ⵜⴰⵙⴻⵏⴼⴻⵍⵜ';

  @override
  String get madeWithLoveTitle => 'ⵉⵜⵜⵓⵙⴽⴰⵔ ⵙ ❤️ ⵙ';

  @override
  String get noMusicFilesFound => 'ⵓⵔ ⵍⵍⵉⵏ ⵓⵥⴰⵡⴰⵏ';

  @override
  String get noArtistsFound => 'ⵓⵔ ⵍⵍⵉⵏ ⵉⵏⴰⵥⵓⵕⵏ';

  @override
  String get noAlbumsFound => 'ⵓⵔ ⵍⵍⵉⵏ ⵉⵍⵎⵙⵏ .';

  @override
  String get unknownSong => 'ⵉⵣⵍⴰⵏ ⵓⵔ ⵉⵜⵜⵢⴰⵙⵙⵏⵏ';

  @override
  String get unknownArtist => 'ⴰⵔⵜ ⵓⵔ ⵉⵜⵜⵢⴰⵙⵙⵏ .';

  @override
  String get unknownAlbum => 'ⵓⵔ ⵉⵜⵜⵢⴰⵙⵙⵏ ⵉⵍⴱⵓⵎ';

  @override
  String get unknownGenre => 'ⵓⵔ ⵉⵜⵜⵡⴰⵙⵙⴰⵏ ⵊⴻⵏⵔⵉ';

  @override
  String get buttonConfirmText => 'ⵢⴻⵔⴱⴰⵃ';

  @override
  String get tileValueOn => 'ⵖⴻⴼ';

  @override
  String get tileValueOff => 'ⵢⴻⴼⴼⴻⵖ';

  @override
  String get commonOfText => 'ⵏ';

  @override
  String get pageNotFoundText => 'ⵓⵔ ⵜⵜⵢⴰⴼⴰ ⵜⵙⵏⴰ ⵍⵍⵉ ⴰⵙ ⵉⵜⵜⵓⴼⴽⴰⵏ .';

  @override
  String get commonErrorText => 'ⵜⵓⵛⵛⴹⴰ';

  @override
  String get retryButtonText => 'ⴰⵔ ⵜⵜⵓⵖⵓⵍⵏ';

  @override
  String get filePickerDialogTitle => 'ⴼⵔⵔⵖ ⵢⴰⵏ ⵓⵏⵎⵀⴰⵍ ⵏ ⵓⵥⴰⵡⴰⵏ for Music';

  @override
  String get searchScreenTitle => 'ⴰⵏⴰⴷⵉ';

  @override
  String get searchEmptyText => 'ⵓⵔ ⵍⵍⵉⵏ ⴽⵉⴳⴰⵏ ⵏ ⵜⵢⴰⴼⵓⵜⵉⵏ ⵏ ⵓⵔⵣⵣⵓ';

  @override
  String get searchResultsText => 'ⵜⵉⵢⴰⴼⵓⵜⵉⵏ ⵏ ⵓⵔⵣⵣⵓ:';

  @override
  String get resultsForText => 'ⵜⵉⵢⴰⴼⵓⵜⵉⵏ ⵉ:';

  @override
  String get disableBatteryOptimizationTitle => 'ⴰⵙⵖⵓⴷⵓ ⵏ ⵜⴱⴰⵜⵔⵉⵜ.';

  @override
  String get disableBatteryOptimizationContent => 'ⴰⵔ ⵜⵜⵔⴰⵔⴰⵏ ⴰⵙⵖⵓⴷⵓ ⵏ ⵜⴱⴰⵜⵔⵉⵜ ⵉ ⵜⵙⵏⵙⵍⴽⵉⵎⵜ ⴰⴷ ⴳ ⵉⵙⵖⵉⵡⵙⵏ ⵏ ⵡⴰⵍⵍⴰⵍⵏ ⵃⵎⴰ ⴰⴷ ⵢⴰⵊⵊ ⴰⵙⴼⵙⵔ ⵏ ⵓⵥⴰⵡⴰⵏ ⵏ ⵓⵥⴰⵡⴰⵏ.';

  @override
  String get languageScreenTitle => 'ⵜⵓⵜⵍⴰⵢⵜ';

  @override
  String get silverDeviceColor => 'ⴰⵥⵔⴻⴼ';

  @override
  String get blackDeviceColor => 'ⴰⴱⴻⵔⴽⴰⵏ';

  @override
  String get resetSettingsTitle => 'ⴰⵙⵖⵍ ⵏ ⵓⵙⵏⴼⵍⵓⵍ';

  @override
  String get browseArtist => 'ⴰⵏⴰⵥⵓⵕ ⴰⴱⵔⴷⴰⵏ';

  @override
  String get browseAlbum => 'ⴱⵔⵓⵡⵙ ⴰⵍⴱⵓⵎ';

  @override
  String get cancelText => 'ⵢⴻⴽⴽⴻⵙ';

  @override
  String get playlistsScreenTitle => 'ⵉⵎⵓⵔⴰⵔⵏ';

  @override
  String get addToOnTheGoPlaylist => 'ⵔⵏⵓ-ⴰⵙ ⵖⵔ ⵓⵏ-ⴰ-ⴳⵓ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ⵔⵏⵓ-ⴷ ⴰⵍⴱⵓⵎ ⵖⵔ ⵓⵏ-ⴳⵓ';

  @override
  String get removeSongFromThePlaylist => 'ⴽⴽⴻⵙ-ⴷ ⵙⴻⴳ ⵒⵍⴰⵢⵍⴻⵜ';

  @override
  String get allAlbums => 'ⴽⵓⵍⵍⵓ ⴰⵍⴱⵓⵎⵙ';

  @override
  String get scanningMusicFiles => 'ⵉⴼⴰⵢⵍⵓⵜⵏ ⵏ ⵓⵥⴰⵡⴰⵏ';

  @override
  String get newPlaylist => 'ⴰⵎⴰⵢⵏⵓ ⵏ ⵡⵓⵔⴰⵔ';

  @override
  String get savePlaylist => 'ⴰⵙⵎⴻⵍ ⵏ ⵒⵍⴰⵢⵍⴻⵜ';

  @override
  String get clearPlaylist => 'ⴽⵍⵉⵔ ⴱⵍⴰⵢⵍⵉⵙⵜ';

  @override
  String get rescanMusicFilesSettingTitle => 'ⵉⴼⵉⵍⴰⵏ ⵏ ⵓⵥⴰⵡⴰⵏ ⵏ ⵔⵉⵙⴽⴰⵏ';

  @override
  String get deviceControlMenuTutorialText => 'ⵙⵙⵔⵇⴱ ⴰⵙ ⴰⵙⵎⵓⵎⵎⵓⵢ ⵏⵏⴽ ⵙ ⵜⴼⵙⵙⵉ ⵅⴼ ⴽⵍⵉⴽ Wheel ⵃⵎⴰ ⴰⴷ ⵜⴼⵔⵓⵎ ⴰⵙⵎⵍ';

  @override
  String get centerButtonMenuTutorialText => 'ⵙⵙⵔⵙ ⴰⵙⵍⴽⵉⵏ ⵏ ⵡⴰⵎⵎⴰⵙ ⵃⵎⴰ ⴰⴷ ⵜⴼⵔⵓⵎ ⴰⵙⵍⴽⵉⵏ ⵏ ⵓⵎⵏⵉⴷ ⵏⵏⴰ ⵎⵉ ⵜⵜⵓⵙⴽⴰⵔⵎ';

  @override
  String get playPauseMenuTutorialText => 'ⵙⵙⵔⵙ ⴰⵙⵍⴽⵉⵏ ⴰⴷ ⵃⵎⴰ ⴰⴷ ⵜⵓⵔⴰⵔⴷ ⵏⵖ ⴰⴷ ⵜⵙⴱⴷⴷⴷ ⵢⴰⵜ ⵜⵣⵍⵉⵜ';

  @override
  String get nextButtonMenuTutorialText => 'ⵃⴹⵓ ⴰⵙⴱⴷⴰⴷ ⴰⴷ ⵃⵎⴰ ⴰⴷ ⵜⴼⵍⴷ ⵖⵔ ⵜⵣⵍⵉⵜ ⵍⵍⵉ ⴷ ⵉⴷⴷⴰⵏ';

  @override
  String get previousButtonMenuTutorialText => 'ⵙⵙⵓⴼⵖⴷ ⴰⵙⵍⴽⵉⵏ ⴰⴷ ⵃⵎⴰ ⴰⴷ ⵜⵔⴰⵔⴷ ⵏⵖ ⵓⵖⵓⵍ ⵙ ⵜⵣⵍⵉⵜ ⵉⵣⵔⵉⵏ';

  @override
  String get menuButtonTutorialText => 'ⵙⵙⵓⴼⵖⴷ ⴰⵙⵍⴽⵉⵏ ⴰⴷ ⴰⴼⴰⴷ ⴰⴷ ⵜⴷⵡⵍⴷ ⵖⵔ ⵓⵎⵏⵉⴷ ⵉⵣⵔⵉⵏ. ⵜⵣⵎⵔⵎ ⴰⴷ ⵜⵙⵔⵙⵎ ⴷ ⴰⴷ ⵜ ⵜⵟⵟⴼⵎ ⵙⴳ ⴽⵔⴰ ⵏ ⵓⵙⵎⵍ ⵢⴰⴹⵏ ⵃⵎⴰ ⴰⴷ ⵜⴷⴷⵓ ⵙⵔⵉⴷ ⵖⵔ ⵓⵎⵏⵉⴷ ⴰⴳⵊⴷⴰⵏ.';

  @override
  String get deviceScreenMenuTutorialText => 'ⵡⴰ ⴷ ⴰⵙⵎⴻⵍ ⵏ ⵓⵙⵎⴻⵍ. Tuch Screen and Split Screen Mode ⵜⵜⵓⵙⵎⵔⴰⵙⵏ ⵙ ⵜⴼⵍⵡⵉⵜ ⴰⵔ ⵜⵜⵓⵙⵎⵔⴰⵙⵏ ⵓⴳⴳⴰⵔ ⴳ ⵉⵙⵖⵍⵏ.';

  @override
  String get deviceControlNowPlayingTutorialText => 'ⵙⵙⵔⵇⴱ ⴰⵙ ⴰⵙⴽⴽⵉⵏ ⵏⵏⴽ ⵅⴼ ⴽⵍⵉⴽ ⵡⵉⵍ ⴰⴼⴰⴷ ⴰⴷ ⵜⵙⵙⵎⵔⵙⴷ ⴰⴽⵙⴰⵢ';

  @override
  String get centerButtonNowPlayingTutorialText => 'ⵙⵙⵔⵙ ⴰⵙⵍⴽⵉⵏ ⵏ ⵡⴰⵎⵎⴰⵙ ⵃⵎⴰ ⴰⴷ ⵜⵙⵙⵔⵇⴱⴷ ⵙ ⵜⴱⵔⵉⴷⵜ ⵏ ⵓⴱⴰⵔⴰⵣ, ⴰⵙⴽⴽⵉⵍ ⵏ ⵓⴽⵛⵛⵓⵎ ⴷ ⵓⵏⴳⴰⵍ ⵏ shuffle. ⵟⵟⴼⵎ-ⴷ ⴰⵙⵍⴽⵉⵏ ⵏ ⵡⴰⵎⵎⴰⵙ ⴰⴽⴽⵏ ⴰⴷ ⵜⴽⵛⵎⴷ ⵖⵔ ⵜⴼⵔⵏⵉⵏ ⵏⵏⵉⴹⵏ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'ⵟⵟⴼⵎ-ⴷ ⴰⵙⵍⴽⵉⵏ-ⴰ ⴰⴽⴽⵏ ⴰⴷ ⵜⵙⵙⵔⵇⴱⵎ ⴰⵣⵡⵍ .';

  @override
  String get previousButtonNowPlayingTutorialText => 'ⵟⵟⴼⵎ-ⴷ ⴰⵙⵍⴽⵉⵏ-ⴰ ⴰⴽⴽⵏ ⴰⴷ ⴷ-ⵜⵔⵔⵎ ⵜⵉⵣⵍⵉⵜ';

  @override
  String get deviceControlSearchTutorialText => 'ⵙⵙⵔⵇⴱ ⴰⵙ ⴰⵙⵎⵓⵎⵎⵓⵢ ⵏⵏⴽ ⵙ ⵜⴰⴼⵙⵙⴰⵙⵜ ⵅⴼ ⴽⵍⵉⴽ ⵡⵉⵍ ⴰⴼⴰⴷ ⴰⴷ ⵜⵙⵙⴽⵔⴷ ⵢⴰⵏ ⵓⵙⴽⴽⵉⵍ';

  @override
  String get centerButtonSearchTutorialText => 'ⵙⵙⵔⵙ ⴰⵙⵍⴽⵉⵏ ⵏ ⵡⴰⵎⵎⴰⵙ ⵃⵎⴰ ⴰⴷ ⵜⴼⵔⵓⵎ ⴰⵙⴽⴽⵉⵍ ⵉⵜⵜⵓⵙⵏⴼⵍⵏ .';

  @override
  String get nextButtonSearchTutorialText => 'ⵃⴹⵓ ⴰⵙⴱⴷⴰⴷ ⴰⴷ ⴰⴼⴰⴷ ⴰⴷ ⵜⵔⵏⵓⵎ ⵢⴰⵏ ⵓⵙⴰⵢⵔⴰⵔ';

  @override
  String get previousButtonSearchTutorialText => 'ⵃⴹⵓ ⴰⵙⵍⴽⵉⵏ ⴰⴷ ⵃⵎⴰ ⴰⴷ ⵜⵙⵙⵓⴼⵖⴷ ⴰⵡⵔⵉⴽ ⴰⵏⴳⴳⴰⵔⵓ .';

  @override
  String get menuButtonSearchTutorialText => 'ⵙⵙⵔⵙ ⴰⵙⵍⴽⵉⵏ ⴰⴷ ⵃⵎⴰ ⴰⴷ ⵜⵙⵔⵙⵎ ⴰⵙⵍⴽⵉⵏ ⴰⵔ ⵜⵎⵢⴰⵡⴰⴹⵎ ⴰⴽⴷ ⵜⵢⴰⴼⵓⵜⵉⵏ ⵏ ⵓⵔⵣⵣⵓ';
}
