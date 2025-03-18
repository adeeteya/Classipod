// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Jamaican Creole English (`jam`).
class AppLocalizationsJam extends AppLocalizations {
  AppLocalizationsJam([String locale = 'jam']) : super(locale);

  @override
  String get appTitle => 'KlasisiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Aadio Akses Permishan Riquired .';

  @override
  String get audioAccessPermissionContent =>
      'Pliiz gi aadibl fail akses fi lou wi fi plie yu myuuzik fail.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Aadio Akses Permishan Deniid .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Pliiz gi aadibl fail akses fi dis ap ina di divais setn fi lou wi fi plie yu myuuzik fail.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Music';

  @override
  String get nowPlayingScreenTitle => 'Nou Plies';

  @override
  String get shuffleSongsMenuTitle => 'Shufl Sangs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Setins';

  @override
  String get aboutScreenTitle => 'Bout';

  @override
  String get coverFlowScreenTitle => 'Kova Fluo';

  @override
  String get artistsScreenTitle => 'Aatis';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Sangs';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Sangs',
      one: '1 Sang',
      zero: 'No Sangs',
    );
    return '$_temp0.';
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
      other: '$countString Album',
      one: '1 Albom',
      zero: 'No Alboms',
    );
    return '$_temp0.';
  }

  @override
  String get genresScreenTitle => 'Genress';

  @override
  String get genreSongsScreenTitle => 'Genre Songs';

  @override
  String get deviceColorSettingTitle => 'Divais Kola';

  @override
  String get touchScreenSettingTitle => 'Toch Skriin Enabled .';

  @override
  String get repeatModeSettingTitle => 'Seh ova an ova';

  @override
  String get repeatModeOne => 'Waan';

  @override
  String get repeatModeAll => 'All';

  @override
  String get vibrateSettingTitle => 'Vibret';

  @override
  String get clickWheelSettingTitle => 'Klik Wiel Sauns .';

  @override
  String get splitScreenSettingTitle => 'Split Skriin Mod .';

  @override
  String get touchSoundsDialogTitle => 'Toch Sauns';

  @override
  String get touchSoundsDialogContent =>
      'Pliiz Enabl Toch Sauns fram Sistim Setinz fi hier di klik wiel soun .';

  @override
  String get immersiveModeSettingTitle => 'Imerzaiv Mod';

  @override
  String get showAppTutorialSettingTitle => 'Show Tutoorial';

  @override
  String get changeDirectorySettingTitle => 'Chienj Dairekta';

  @override
  String get donateSettingTitle => 'Gi';

  @override
  String get donateSettingDescription =>
      'Ef yu laik dis ya ap, pliiz kansida fi gi.';

  @override
  String get versionAboutScreenTitle => 'Vershan';

  @override
  String get madeWithLoveTitle => 'Mek wid ❤️ bai .';

  @override
  String get noMusicFilesFound => 'No Myuuzik';

  @override
  String get noArtistsFound => 'No Aatistiks';

  @override
  String get noAlbumsFound => 'nuh naboms';

  @override
  String get unknownSong => 'No nuo Sang';

  @override
  String get unknownArtist => 'No nuo Aatistik';

  @override
  String get unknownAlbum => 'No nuo Album';

  @override
  String get unknownGenre => 'No nuo se Genre .';

  @override
  String get buttonConfirmText => 'ARIGHT';

  @override
  String get tileValueOn => 'Pon';

  @override
  String get tileValueOff => 'Aaf';

  @override
  String get commonOfText => 'af';

  @override
  String get pageNotFoundText => 'Di gien piej neva fain';

  @override
  String get commonErrorText => 'Mistake';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle =>
      'Silek wan Dairekchri tu Skan fi Myuuzik .';

  @override
  String get searchScreenTitle => 'Luk fah';

  @override
  String get searchEmptyText => 'No Saach Rizolt';

  @override
  String get searchResultsText => 'Saach Rizolt:';

  @override
  String get resultsForText => 'Rizolt fi:';

  @override
  String get disableBatteryOptimizationTitle => 'Disabl Batari Optimizashan .';

  @override
  String get disableBatteryOptimizationContent =>
      'Pliiz disabl bachri optimizashan fi dis ap ina di divais setn fi lou bakgrong pliebak a myuuzik.';

  @override
  String get languageScreenTitle => 'Langwij';

  @override
  String get silverDeviceColor => 'Silva';

  @override
  String get blackDeviceColor => 'Black';

  @override
  String get resetSettingsTitle => 'Reset Setins';

  @override
  String get browseArtist => 'Bruuz Aatistik';

  @override
  String get browseAlbum => 'Bruuzz Album';

  @override
  String get cancelText => 'Shet dung';

  @override
  String get playlistsScreenTitle => 'Pliess';

  @override
  String get addToOnTheGoPlaylist => 'Ad tu On-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ad Albom tu On-Go .';

  @override
  String get removeSongFromThePlaylist => 'Rimouv fram di Plies .';

  @override
  String get allAlbums => 'Aal Albom';

  @override
  String get scanningMusicFiles => 'Skanin Myuuzik Failz .';

  @override
  String get newPlaylist => 'Nyuu Plies';

  @override
  String get savePlaylist => 'Siev Plays';

  @override
  String get clearPlaylist => 'Klier Plays';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskan Myuuzik Failz .';

  @override
  String get deviceControlMenuTutorialText =>
      'Muuv yu tumbu lait roun di Klik Wiel fi navigieshan di menyu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Pres di senta boton fi silek di hailait menyu item .';

  @override
  String get playPauseMenuTutorialText =>
      'Pres dis button fi plie ar paas wan sang .';

  @override
  String get nextButtonMenuTutorialText =>
      'Pres dis button fi skip tu di neks sang .';

  @override
  String get previousButtonMenuTutorialText =>
      'Pres dis button fi riwind ar go bak tu di prii- sang .';

  @override
  String get menuButtonTutorialText =>
      'Press dis button fi go bak tu di prii-y menyu. Yu kuda pres an uol it fram eni ada skriin fi dairekli go a di mien menyu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dis a di displie skriin. Toch Skriin ah Split Skriin Mod ena-mek bai difault ah kiah kanfiguor muo ina di setn.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Muuv yu tumbu roun di Klik Wiel fi adjuus di volyum .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pres di Senta button fi saikl chuu luk baal, skruuba baal ahn shub-saaf sliida. Pres ahn huol di Senta button fi akses ada opshan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pres ahn huol dis button fi faas forda di sang .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pres ahn huol dis button fi riwind di sang .';

  @override
  String get deviceControlSearchTutorialText =>
      'Muuv yu tumbu lait roun di Klik Wiel fi hailai wan alfabet .';

  @override
  String get centerButtonSearchTutorialText =>
      'Pres di senta boton fi silek di hailait alfabet .';

  @override
  String get nextButtonSearchTutorialText =>
      'Pres dis button fi ad wan spies .';

  @override
  String get previousButtonSearchTutorialText =>
      'Pres dis button fi diliit di laas kiarakta .';

  @override
  String get menuButtonSearchTutorialText =>
      'Pres dis button fi kluoz di kiibuod ah intarak wid di saach rizolt .';

  @override
  String get allSongs => 'Aal Sangs';
}
