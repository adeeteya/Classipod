// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Seselwa Creole French (`crs`).
class AppLocalizationsCrs extends AppLocalizations {
  AppLocalizationsCrs([String locale = 'crs']) : super(locale);

  @override
  String get appTitle => 'Klasik';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Permisyon Akse Odyo ki ganny demande';

  @override
  String get audioAccessPermissionContent =>
      'Silvouple donn bann dosye odyo akse pour permet nou zwe ou bann dosye lanmizik.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Permisyon Akse Odyo Denye';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Silvouple donn bann dosye odyo akse pour sa app dan bann laranzman laparey pour permet nou zwe ou bann dosye lanmizik.';

  @override
  String get menuScreenTitle => 'Meni';

  @override
  String get musicMenuScreenTitle => 'Lanmizik';

  @override
  String get nowPlayingScreenTitle => 'Aprezan pe zwe';

  @override
  String get shuffleSongsMenuTitle => 'Bann sanson ki melanze';

  @override
  String get shuffleSettingTitle => 'Move';

  @override
  String get settingsScreenTitle => 'Paramet';

  @override
  String get aboutScreenTitle => 'Lo';

  @override
  String get coverFlowScreenTitle => 'Koul Kouf';

  @override
  String get artistsScreenTitle => 'Bann artis';

  @override
  String get albumsScreenTitle => 'Bann albonm';

  @override
  String get songsScreenTitle => 'Bann sanson';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Albums',
      one: '1 Album',
      zero: 'No Albums',
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
      other: '$countString Albums',
      one: '1 Album',
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Bann zanr';

  @override
  String get genreSongsScreenTitle => 'Bann sanson zanr';

  @override
  String get deviceColorSettingTitle => 'Kouler laparey';

  @override
  String get touchScreenSettingTitle => 'Tous tous Lekran ki ganny aktive';

  @override
  String get repeatModeSettingTitle => 'repet(e)';

  @override
  String get repeatModeOne => 'Enn';

  @override
  String get repeatModeAll => 'Tou';

  @override
  String get vibrateSettingTitle => 'Vibre';

  @override
  String get clickWheelSettingTitle => 'Klik Son Larou';

  @override
  String get splitScreenSettingTitle => 'Mod Lekran Depar';

  @override
  String get touchSoundsDialogTitle => 'Son tous';

  @override
  String get touchSoundsDialogContent =>
      'Silvouple Aktiv bann Son Laranzman Sistenm pour tann bann son larou klik';

  @override
  String get immersiveModeSettingTitle => 'Mod modes';

  @override
  String get showAppTutorialSettingTitle => 'Montre leson';

  @override
  String get changeDirectorySettingTitle => 'Sanz repertwar';

  @override
  String get donateSettingTitle => 'Donnen';

  @override
  String get donateSettingDescription =>
      'Si zot kontan sa app, silvouple konsider fer donasyon.';

  @override
  String get versionAboutScreenTitle => 'Versyon';

  @override
  String get madeWithLoveTitle => 'Fer avek ❤️ par';

  @override
  String get noMusicFilesFound => 'Napa Lanmizik';

  @override
  String get noArtistsFound => 'Napa Artis';

  @override
  String get noAlbumsFound => 'Napa Album';

  @override
  String get unknownSong => 'Kantik enkoni';

  @override
  String get unknownArtist => 'Artis enkoni';

  @override
  String get unknownAlbum => 'Album enkoni';

  @override
  String get unknownGenre => 'Zanr enkoni';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Lo';

  @override
  String get tileValueOff => 'Of';

  @override
  String get commonOfText => 'avek';

  @override
  String get pageNotFoundText => 'Sa paz ki ti ganny donnen pa ti ganny trouve';

  @override
  String get commonErrorText => 'Lerer';

  @override
  String get retryButtonText => 'Re-esey';

  @override
  String get filePickerDialogTitle =>
      'Selekte en Repertwar pour Skann pour Lanmizik';

  @override
  String get searchScreenTitle => 'Rode';

  @override
  String get searchEmptyText => 'Napa rezilta resers';

  @override
  String get searchResultsText => 'Rezilta resers:';

  @override
  String get resultsForText => 'Rezilta pour:';

  @override
  String get disableBatteryOptimizationTitle => 'Opsyon lo batri ki dezaktive';

  @override
  String get disableBatteryOptimizationContent =>
      'Silvouple dezaktive loptimasyon batri pour sa app dan bann paramet laparey pour permet zwe lanmizik dan fon.';

  @override
  String get languageScreenTitle => 'Langaz';

  @override
  String get silverDeviceColor => 'Larzan';

  @override
  String get blackDeviceColor => 'Nwanr';

  @override
  String get resetSettingsTitle => 'Paramet Rezi set';

  @override
  String get browseArtist => 'Artis marmit';

  @override
  String get browseAlbum => 'Album Vinev';

  @override
  String get cancelText => 'kennsel';

  @override
  String get playlistsScreenTitle => 'Bann lalis zwe';

  @override
  String get addToOnTheGoPlaylist => 'Azout avek lo-A-Ale';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Azout Album dan Lo-A-Ale';

  @override
  String get removeSongFromThePlaylist => 'Retir dan lalis zwe';

  @override
  String get allAlbums => 'Tou bann Album';

  @override
  String get scanningMusicFiles => 'Bann dosye Lanmizik ki pe rod bann dosye';

  @override
  String get newPlaylist => 'Nouvo lalis zwe';

  @override
  String get savePlaylist => 'Lalis zwe ekonomize';

  @override
  String get clearPlaylist => 'Lalis zwe kler';

  @override
  String get rescanMusicFilesSettingTitle => 'Dosye Lanmizik Reske';

  @override
  String get deviceControlMenuTutorialText =>
      'Bouz ou pous lezeman otour Larou Klik pour navig meni';

  @override
  String get centerButtonMenuTutorialText =>
      'Pez bouton sant pour swazir sa itenm meni ki\'n ganny fer resorti';

  @override
  String get playPauseMenuTutorialText =>
      'Pez sa bouton pour zwe oubyen poz en sanson';

  @override
  String get nextButtonMenuTutorialText =>
      'Pez sa bouton pour sot lo sa lot sanson';

  @override
  String get previousButtonMenuTutorialText =>
      'Pez sa bouton pour rebobin oubyen retourn lo sanson avan';

  @override
  String get menuButtonTutorialText =>
      'Pez sa bouton pour retourn lo meni avan. Ou ti kapab pez e tenir li lo nenport ki lot lekran pour direkteman al lo meni prensipal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Sa i lekran ekspozisyon. Mod Lekran Tous ek Lekran Fanze i ganny aktivize par defo e i kapab ganny konfigire pli lwen dan bann laranzman.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Bouz ou pous otour Larou Klik pour aziste volim';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pez bouton Sant pour mont lo nivo bar, bar frotman ek glisman melanz. Pez e tenir bouton Sant pour ganny akse avek bann opsyon adisyonnel.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pez e tenir sa bouton pour zennen devan sanson';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pez e tenir sa bouton pour rebobin sanson';

  @override
  String get deviceControlSearchTutorialText =>
      'Bouz ou pous lezeman otour Larou Klik pour fer resorti en alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Pez bouton sant pour swazir sa alfabet ki\'n ganny fer resorti';

  @override
  String get nextButtonSearchTutorialText =>
      'Pez sa bouton pour azout en lespas';

  @override
  String get previousButtonSearchTutorialText =>
      'Pez sa bouton pour efas dernyen karakter';

  @override
  String get menuButtonSearchTutorialText =>
      'Pez sa bouton pour ferm klavye e enterakte avek rezilta resers';
}
