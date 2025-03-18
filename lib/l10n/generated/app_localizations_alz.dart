// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Alur (`alz`).
class AppLocalizationsAlz extends AppLocalizations {
  AppLocalizationsAlz([String locale = 'alz']) : super(locale);

  @override
  String get appTitle => 'Cul';

  @override
  String get menuButtonText => 'MAKA 1 MOKU MAKA MOKU MAKU';

  @override
  String get audioAccessPermissionTitle =>
      'I ng’eye, edok etimo tic pare mi lembanyong’a i adhura ma tung’ tung’.';

  @override
  String get audioAccessPermissionContent =>
      'Wakwayu nia imii iri karatasi mi wec m’uwinji kara wawek file mwa mi wer.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Access mi gwoko lembe mi ng’om .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Wakwayu nia imii karatasi mi lwong’o dhanu kara gibed ku twero mi tio ku app maeni i kusika mwa mir Internet kara wabed ku file mi wer mwa.';

  @override
  String get menuScreenTitle => 'Andhandha';

  @override
  String get musicMenuScreenTitle => 'Wer';

  @override
  String get nowPlayingScreenTitle => 'Kawoni dong';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle';

  @override
  String get shuffleSettingTitle => 'Ndhu ndhu';

  @override
  String get settingsScreenTitle => 'mingo';

  @override
  String get aboutScreenTitle => 'Ikum';

  @override
  String get coverFlowScreenTitle => 'Kugweno';

  @override
  String get artistsScreenTitle => 'Jururieko';

  @override
  String get albumsScreenTitle => 'Ndhu';

  @override
  String get songsScreenTitle => 'sawa';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Songs',
      one: '1 Song',
      zero: 'No Songs',
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
  String get genresScreenTitle => 'gor';

  @override
  String get genreSongsScreenTitle => 'Dhu\'kondha';

  @override
  String get deviceColorSettingTitle =>
      'Jakwenda mi Konisa mi Kokor mi Kotako mi Kotako mi Kotako.';

  @override
  String get touchScreenSettingTitle => 'Ku lapor, .';

  @override
  String get repeatModeSettingTitle => 'Nwoy';

  @override
  String get repeatModeOne => 'Acel';

  @override
  String get repeatModeAll => 'Ceke';

  @override
  String get vibrateSettingTitle => 'Kwan';

  @override
  String get clickWheelSettingTitle => 'Dii iwi Wheel .';

  @override
  String get splitScreenSettingTitle => 'Split Screen.';

  @override
  String get touchSoundsDialogTitle => 'Ju mapol';

  @override
  String get touchSoundsDialogContent =>
      'Wakwayu nia ibed ku ng’eyong’ec ma cuu iwi lembe m’uneno System Seetting pi niwinjo dwand ng’atu m’utimo lembene .';

  @override
  String get immersiveModeSettingTitle => 'Dwoko piny';

  @override
  String get showAppTutorialSettingTitle => 'Nyuth';

  @override
  String get changeDirectorySettingTitle => 'Lokruok';

  @override
  String get donateSettingTitle => 'Miki';

  @override
  String get donateSettingDescription =>
      'Ka imaro app maeni, keth paru peri ubed tek.';

  @override
  String get versionAboutScreenTitle => 'Yokurucel';

  @override
  String get madeWithLoveTitle => 'Made gi ❤️ .';

  @override
  String get noMusicFilesFound => 'Nongo';

  @override
  String get noArtistsFound => 'Jururieko mi Anitiki.';

  @override
  String get noAlbumsFound => 'Onge';

  @override
  String get unknownSong => 'Ka ok ong’eyo';

  @override
  String get unknownArtist => 'Jugor mi lembe mi ng’om';

  @override
  String get unknownAlbum => 'Ka ok ong’ere';

  @override
  String get unknownGenre => 'Ka ok gin jo ma ne ok gin adier';

  @override
  String get buttonConfirmText => 'AYA DO';

  @override
  String get tileValueOn => 'Iwi';

  @override
  String get tileValueOff => 'Ocidho';

  @override
  String get commonOfText => 'pa';

  @override
  String get pageNotFoundText => 'Ju ma jumio igi lembe moko ginwang’u .';

  @override
  String get commonErrorText => 'Bal';

  @override
  String get retryButtonText => 'Ekwenda';

  @override
  String get filePickerDialogTitle => 'Yier Japonji mi Scan .';

  @override
  String get searchScreenTitle => 'Sayo';

  @override
  String get searchEmptyText => 'Onge Sescules .';

  @override
  String get searchResultsText => 'Lembe ma jugoro:';

  @override
  String get resultsForText => 'Resul mi lembe maeni:';

  @override
  String get disableBatteryOptimizationTitle => 'Lembe maber';

  @override
  String get disableBatteryOptimizationContent =>
      'Wakwayu nia ibed ku ng’eyong’ec ma cuu iwi app maeni i kusika mwa mir Internet kara iwek lembe mi ng’om ubed m’ukwayu jutim.';

  @override
  String get languageScreenTitle => 'Dhok';

  @override
  String get silverDeviceColor => 'Mila';

  @override
  String get blackDeviceColor => 'Col';

  @override
  String get resetSettingsTitle => 'Reset ma nyen';

  @override
  String get browseArtist => 'Jarawec ma tung’ tung’ .';

  @override
  String get browseAlbum => 'Dhu\'';

  @override
  String get cancelText => 'ngol';

  @override
  String get playlistsScreenTitle => 'Jukristo';

  @override
  String get addToOnTheGoPlaylist => 'Inyalo keto e On-To-G .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Med Album ku On-T.';

  @override
  String get removeSongFromThePlaylist => 'Remo ma wuok elistliksi';

  @override
  String get allAlbums => 'ceke';

  @override
  String get scanningMusicFiles =>
      'Ka ng’ato otimo gik ma nyiso ni en ng’at ma nigi nyalo mar timo kamano .';

  @override
  String get newPlaylist => 'Jururieko mi ng’om mi ng’om mi ng’om zoo.';

  @override
  String get savePlaylist => 'Jugor mi lembe mi ng’om mi ng’om zoo.';

  @override
  String get clearPlaylist => 'Jugor mi lembe mi ng’om zoo.';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescocan mi lembe mi ng’om .';

  @override
  String get deviceControlMenuTutorialText =>
      'Move mbau peri mayot i ng’et Click Wheel pi ni ketho menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Keth button mi center mi ng’io piny ma pire tek .';

  @override
  String get playPauseMenuTutorialText =>
      'Keth button maeni pi nituko kunoke ni ketho wer moko .';

  @override
  String get nextButtonMenuTutorialText =>
      'Keth button maeni i kum wer m’ubino .';

  @override
  String get previousButtonMenuTutorialText =>
      'Keth button maeno icak nidok kendo i wer ma con .';

  @override
  String get menuButtonTutorialText =>
      'Keth button maeni idok i menu ma con. Icopo ng’io man icopo ketho lembene kud i screen mange kara icidhi i menu ma dit.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Eno tie screen mi screen. I ng’eye, edok etimo tic pare mi lembanyong’a i adhura ma tung’ tung’.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Movembur peri i ng’et Click Wheel pi niloko volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Keth cing’i i kum button mi Center pi nisayu bar, ng’atu m’utimo lembe m’ukwayere. Di man iketh button mi Center ni nwang’u lembe mange.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Diss kendo imak button ma kamano mondo odhi nyime gi werno .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Diss kendo imak button ma kamano mondo owek wer .';

  @override
  String get deviceControlSearchTutorialText =>
      'Move mbau mari mayot e alwora mar Click Wheel mondo onyis ng’at ma nigi alfabe .';

  @override
  String get centerButtonSearchTutorialText =>
      'Keth button mi center ma juketho i ie alfabe ma pire tek .';

  @override
  String get nextButtonSearchTutorialText =>
      'Keth button maeni imed kabedo moko .';

  @override
  String get previousButtonSearchTutorialText =>
      'Keth button maeni i kum lembe maeni .';

  @override
  String get menuButtonSearchTutorialText =>
      'Keth button maeni pi ni ketho lembe ma pigi tek man ni ketho lembe ma jubeyenyo .';

  @override
  String get allSongs => 'ceke';
}
