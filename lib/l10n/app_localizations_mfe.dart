// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Morisyen (`mfe`).
class AppLocalizationsMfe extends AppLocalizations {
  AppLocalizationsMfe([String locale = 'mfe']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MANU';

  @override
  String get audioAccessPermissionTitle => 'Permision pou gagn akse a odio';

  @override
  String get audioAccessPermissionContent => 'Silvouple donn akse bann fisie odio pou permet nou zwe ou bann fisie lamizik.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Permision pou gagn akse odio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Silvouple donn akse bann fisie odio pou sa app-la dan bann paramet laparey-la pou permet nou zwe ou bann fisie lamizik.';

  @override
  String get menuScreenTitle => 'Meni';

  @override
  String get musicMenuScreenTitle => 'Lamizik';

  @override
  String get nowPlayingScreenTitle => 'Aster pe zwe';

  @override
  String get shuffleSongsMenuTitle => 'Bann sante pou fer bann sante';

  @override
  String get shuffleSettingTitle => 'Melanz';

  @override
  String get settingsScreenTitle => 'Paramet';

  @override
  String get aboutScreenTitle => 'Lor';

  @override
  String get coverFlowScreenTitle => 'Debi kouvertir';

  @override
  String get artistsScreenTitle => 'Bann artis';

  @override
  String get albumsScreenTitle => 'Bann album';

  @override
  String get songsScreenTitle => 'Bann sante';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bann sante',
      one: '1 Sante',
      zero: 'Pena sante',
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
      other: '$countString Albem',
      one: '1 Albem',
      zero: 'Pena albem',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Bann zenn';

  @override
  String get genreSongsScreenTitle => 'Bann sante lor bann jennge';

  @override
  String get deviceColorSettingTitle => 'Kouler laparey';

  @override
  String get touchScreenSettingTitle => 'Lekran pou tous';

  @override
  String get repeatModeSettingTitle => 'Repete';

  @override
  String get repeatModeOne => 'Enn';

  @override
  String get repeatModeAll => 'Tou';

  @override
  String get vibrateSettingTitle => 'Vibre';

  @override
  String get clickWheelSettingTitle => 'Klik lor bann son larou';

  @override
  String get splitScreenSettingTitle => 'Mod lor lekran fann';

  @override
  String get touchSoundsDialogTitle => 'Bann son tous';

  @override
  String get touchSoundsDialogContent => 'Aktive bann son touch depi Paramet system pou tann bann son larou klik';

  @override
  String get immersiveModeSettingTitle => 'Mod imerzif';

  @override
  String get showAppTutorialSettingTitle => 'Montre titorial';

  @override
  String get changeDirectorySettingTitle => 'Repertwar sanzman';

  @override
  String get donateSettingTitle => 'Donasion';

  @override
  String get donateSettingDescription => 'Si ou kontan sa app-la, silvouple konsider fer donasion.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Finn fer avek ❤️ par';

  @override
  String get noMusicFilesFound => 'Pa bizin Lamizik';

  @override
  String get noArtistsFound => 'Pena okenn artis';

  @override
  String get noAlbumsFound => 'Pa ena album';

  @override
  String get unknownSong => 'Kantik inkoni';

  @override
  String get unknownArtist => 'Artis inkoni';

  @override
  String get unknownAlbum => 'Album inkoni';

  @override
  String get unknownGenre => 'Genre indiab';

  @override
  String get buttonConfirmText => 'DAKOR';

  @override
  String get tileValueOn => 'Lor';

  @override
  String get tileValueOff => 'Teign';

  @override
  String get commonOfText => 'depi';

  @override
  String get pageNotFoundText => 'Pa finn trouv paz ki finn done';

  @override
  String get commonErrorText => 'Erer';

  @override
  String get retryButtonText => 'Re-esey';

  @override
  String get filePickerDialogTitle => 'Seleksionn enn Repertwar dan skane pou Lamizik';

  @override
  String get searchScreenTitle => 'Resers';

  @override
  String get searchEmptyText => 'Pa ena rezilta resers';

  @override
  String get searchResultsText => 'Rezilta resers:';

  @override
  String get resultsForText => 'Rezilta pou:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimizasion lor batri pou enn andikap';

  @override
  String get disableBatteryOptimizationContent => 'Silvouple, dezaktive optimizasion batri pou sa app-la dan bann paramet laparey pou permet enn zwe lamizik an aryer-plan.';

  @override
  String get languageScreenTitle => 'Langaz';

  @override
  String get silverDeviceColor => 'Larzan';

  @override
  String get blackDeviceColor => 'Nwar';

  @override
  String get resetSettingsTitle => 'Remet bann paramet';

  @override
  String get browseArtist => 'Artis navigasion';

  @override
  String get browseAlbum => 'Album navig';

  @override
  String get cancelText => 'Kennsel';

  @override
  String get playlistsScreenTitle => 'Bann zwe';

  @override
  String get addToOnTheGoPlaylist => 'Azout ar On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Azout Album lor-An-Go';

  @override
  String get removeSongFromThePlaylist => 'Retir lor Lalis-la';

  @override
  String get allAlbums => 'Tou bann Album';

  @override
  String get scanningMusicFiles => 'Bann fisie lamizik ki pe scann';

  @override
  String get newPlaylist => 'Nouvo zwe';

  @override
  String get savePlaylist => 'Anrezistre zwe';

  @override
  String get clearPlaylist => 'Echelist efface';

  @override
  String get rescanMusicFilesSettingTitle => 'Bann fisie lamizik Reskan';

  @override
  String get deviceControlMenuTutorialText => 'Bouz ou pous lezeman otour Clik lor larou pou navig meni-la';

  @override
  String get centerButtonMenuTutorialText => 'Pez bouton santral pou swazir item meni ki finn souligne';

  @override
  String get playPauseMenuTutorialText => 'Pez sa bouton-la pou zwe ou poz enn sante';

  @override
  String get nextButtonMenuTutorialText => 'Pez sa bouton-la pou sot lor prosin sante';

  @override
  String get previousButtonMenuTutorialText => 'Pez sa bouton-la pou rebobinn ou retourn lor sante avan';

  @override
  String get menuButtonTutorialText => 'Pez sa bouton-la pou retourn lor meni avan. Ou kapav pez ek tini li depi ninport ki lezot lekran pou al direk lor meni prinsipal.';

  @override
  String get deviceScreenMenuTutorialText => 'Sa li lekran afis. Mod Lekran ek Skreeen Touch zot aktive par defo ek kapav konfigire ankor plis dan bann paramet.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Bouz ou pous otour Larou Klike pou aziste volim';

  @override
  String get centerButtonNowPlayingTutorialText => 'Pez bouton Sant pou fer sikl atraver rod bar, bar frotman ek kurser melanz. Pez ek tini bouton Sant pou gagn akse a bann opsion anplis.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Pez ek tini sa bouton-la pou fer sante-la avanse vit-vit';

  @override
  String get previousButtonNowPlayingTutorialText => 'Pez ek tini sa bouton-la pou rebobinn sante-la';

  @override
  String get deviceControlSearchTutorialText => 'Bouz ou pous lezeman otour Larou-la pou met an evidans enn alfabet';

  @override
  String get centerButtonSearchTutorialText => 'Pez bouton santral pou swazir alfabet ki finn souligne';

  @override
  String get nextButtonSearchTutorialText => 'Pez sa bouton-la pou azout enn lespas';

  @override
  String get previousButtonSearchTutorialText => 'Pez sa bouton-la pou efas dernie personaz-la';

  @override
  String get menuButtonSearchTutorialText => 'Pez sa bouton-la pou ferm klavie ek interazir avek bann rezilta resers';
}
