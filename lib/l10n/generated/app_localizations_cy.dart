// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get appTitle => 'Nosbarthiadau';

  @override
  String get menuButtonText => 'Bwydlen';

  @override
  String get audioAccessPermissionTitle => 'Mae angen caniatâd mynediad sain';

  @override
  String get audioAccessPermissionContent =>
      'Rhowch fynediad i ffeiliau sain i ganiatáu inni chwarae\'ch ffeiliau cerddoriaeth.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Gwrthodwyd caniatâd mynediad sain';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Rhowch fynediad i ffeiliau sain ar gyfer yr app hon yn y gosodiadau dyfais er mwyn caniatáu inni chwarae\'ch ffeiliau cerddoriaeth.';

  @override
  String get menuScreenTitle => 'Bwydlen';

  @override
  String get musicMenuScreenTitle => 'Ngherddoriaeth';

  @override
  String get nowPlayingScreenTitle => 'Nawr yn chwarae';

  @override
  String get shuffleSongsMenuTitle => 'Caneuon Siffrwd';

  @override
  String get shuffleSettingTitle => 'Siffrwd';

  @override
  String get settingsScreenTitle => 'Ngosodiadau';

  @override
  String get aboutScreenTitle => 'Yn ymwneud';

  @override
  String get coverFlowScreenTitle => 'Llif gorchudd';

  @override
  String get artistsScreenTitle => 'Artistiaid';

  @override
  String get albumsScreenTitle => 'Albymau';

  @override
  String get songsScreenTitle => 'Caneuon';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Caneuon',
      one: '1 Cân',
      zero: 'Dim Caneuon',
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
      other: '$countString Albymau',
      one: '1 Albwm',
      zero: 'Dim Albymau',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Caneuon Genre';

  @override
  String get deviceColorSettingTitle => 'Lliw dyfais';

  @override
  String get touchScreenSettingTitle => 'Sgrin gyffwrdd wedi\'i alluogi';

  @override
  String get repeatModeSettingTitle => 'Hailadroddwch';

  @override
  String get repeatModeOne => 'Un';

  @override
  String get repeatModeAll => 'Phob un';

  @override
  String get vibrateSettingTitle => 'Ddirgrynwch';

  @override
  String get clickWheelSettingTitle => 'Cliciwch Seiniau Olwyn';

  @override
  String get splitScreenSettingTitle => 'Modd Sgrin Hollti';

  @override
  String get touchSoundsDialogTitle => 'Cyffwrdd synau';

  @override
  String get touchSoundsDialogContent =>
      'Os gwelwch yn dda galluogi synau cyffwrdd o osodiadau system i glywed y synau olwyn clicio';

  @override
  String get immersiveModeSettingTitle => 'Modd trochi';

  @override
  String get showAppTutorialSettingTitle => 'Dangos Tiwtorial';

  @override
  String get changeDirectorySettingTitle => 'Newid cyfeiriadur';

  @override
  String get donateSettingTitle => 'Rhoion';

  @override
  String get donateSettingDescription =>
      'Os ydych chi\'n hoffi\'r app hon, ystyriwch roi.';

  @override
  String get versionAboutScreenTitle => 'Fersiwn';

  @override
  String get madeWithLoveTitle => 'Wedi\'i wneud gyda ❤️ gan';

  @override
  String get noMusicFilesFound => 'Dim Cerddoriaeth';

  @override
  String get noArtistsFound => 'Dim Artistiaid';

  @override
  String get noAlbumsFound => 'Dim Albymau';

  @override
  String get unknownSong => 'Cân Anhysbys';

  @override
  String get unknownArtist => 'Artist Anhysbys';

  @override
  String get unknownAlbum => 'Albwm Anhysbys';

  @override
  String get unknownGenre => 'Genre anhysbys';

  @override
  String get buttonConfirmText => 'Iawn';

  @override
  String get tileValueOn => 'Ymlaen';

  @override
  String get tileValueOff => 'I ffwrdd';

  @override
  String get commonOfText => 'o';

  @override
  String get pageNotFoundText => 'Ni ddarganfuwyd y dudalen a roddwyd';

  @override
  String get commonErrorText => 'Gwallau';

  @override
  String get retryButtonText => 'Chyrchwch';

  @override
  String get filePickerDialogTitle =>
      'Dewiswch gyfeiriadur i sganio ar gyfer cerddoriaeth';

  @override
  String get searchScreenTitle => 'Chwiloon';

  @override
  String get searchEmptyText => 'Dim canlyniadau chwilio';

  @override
  String get searchResultsText => 'Canlyniadau chwilio:';

  @override
  String get resultsForText => 'Canlyniadau ar gyfer:';

  @override
  String get disableBatteryOptimizationTitle => 'Analluogi Optimeiddio Batri';

  @override
  String get disableBatteryOptimizationContent =>
      'Analluoga optimeiddio batri ar gyfer yr ap hwn yn y gosodiadau dyfais i ganiatáu chwarae cefndir o gerddoriaeth.';

  @override
  String get languageScreenTitle => 'Hiaith';

  @override
  String get silverDeviceColor => 'Harian';

  @override
  String get blackDeviceColor => 'Duon';

  @override
  String get resetSettingsTitle => 'Ailosod gosodiadau';

  @override
  String get browseArtist => 'Pori Artist';

  @override
  String get browseAlbum => 'Pori Albwm';

  @override
  String get cancelText => 'Chansliff';

  @override
  String get playlistsScreenTitle => 'Restrau chwarae';

  @override
  String get addToOnTheGoPlaylist => 'Ychwanegwch at wrth fynd';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ychwanegu albwm i fynd';

  @override
  String get removeSongFromThePlaylist => 'Tynnwch o\'r rhestr chwarae';

  @override
  String get allAlbums => 'Pob albwm';

  @override
  String get scanningMusicFiles => 'Sganio ffeiliau cerddoriaeth';

  @override
  String get newPlaylist => 'Rhestr chwarae newydd';

  @override
  String get savePlaylist => 'Rhestr Chwarae Arbed';

  @override
  String get clearPlaylist => 'Rhestr Chwarae Clir';

  @override
  String get rescanMusicFilesSettingTitle => 'Ffeiliau Cerdd Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Symudwch eich bawd yn ysgafn o amgylch yr olwyn clicio i lywio\'r ddewislen';

  @override
  String get centerButtonMenuTutorialText =>
      'Pwyswch y botwm canol i ddewis yr eitem ddewislen a amlygwyd';

  @override
  String get playPauseMenuTutorialText =>
      'Pwyswch y botwm hwn i chwarae neu oedi cân';

  @override
  String get nextButtonMenuTutorialText =>
      'Pwyswch y botwm hwn i hepgor i\'r gân nesaf';

  @override
  String get previousButtonMenuTutorialText =>
      'Pwyswch y botwm hwn i ailddirwyn neu fynd yn ôl i\'r gân flaenorol';

  @override
  String get menuButtonTutorialText =>
      'Pwyswch y botwm hwn i fynd yn ôl i\'r ddewislen flaenorol. Fe allech chi ei wasgu a\'i ddal o unrhyw sgrin arall i fynd i\'r brif ddewislen yn uniongyrchol.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dyma\'r sgrin arddangos. Mae Modd Sgrin Cyffwrdd a Sgrin Hollt yn cael eu galluogi yn ddiofyn a gellir ei ffurfweddu ymhellach yn y gosodiadau.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Symudwch eich bawd o amgylch yr olwyn clicio i addasu\'r gyfrol';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pwyswch y botwm canol i feicio trwy\'r bar ceisio, bar sgwrio a llithrydd siffrwd. Pwyswch a dal y botwm canol i gael mynediad at opsiynau ychwanegol.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pwyswch a dal y botwm hwn i gyflymu\'r gân';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pwyswch a dal y botwm hwn i ailddirwyn y gân';

  @override
  String get deviceControlSearchTutorialText =>
      'Symudwch eich bawd yn ysgafn o amgylch yr olwyn clicio i dynnu sylw at wyddor';

  @override
  String get centerButtonSearchTutorialText =>
      'Pwyswch y botwm canol i ddewis yr wyddor a amlygwyd';

  @override
  String get nextButtonSearchTutorialText =>
      'Pwyswch y botwm hwn i ychwanegu lle';

  @override
  String get previousButtonSearchTutorialText =>
      'Pwyswch y botwm hwn i ddileu\'r cymeriad olaf';

  @override
  String get menuButtonSearchTutorialText =>
      'Pwyswch y botwm hwn i gau\'r bysellfwrdd a rhyngweithio â\'r canlyniadau chwilio';

  @override
  String get allSongs => 'Pob Cân';
}
