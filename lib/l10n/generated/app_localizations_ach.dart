// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Acoli (`ach`).
class AppLocalizationsAch extends AppLocalizations {
  AppLocalizationsAch([String locale = 'ach']) : super(locale);

  @override
  String get appTitle => 'Kilaco';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Kit me donyo ki twero me donyo tye ma mitte.';

  @override
  String get audioAccessPermissionContent =>
      'Wakwayi ni imi botgi file ma kicoyogi me weko wa goyo file me wer.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Kit me donyo i Audio ki moko';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Wakwayi ni imi file ma kicoyo ki dwan pi app man i yub me jami me weko wa goyo file me wer.';

  @override
  String get menuScreenTitle => 'Megi';

  @override
  String get musicMenuScreenTitle => 'Wer';

  @override
  String get nowPlayingScreenTitle => 'Kom tuku dong';

  @override
  String get shuffleSongsMenuTitle => 'Wer mapatpat';

  @override
  String get shuffleSettingTitle => 'jemi';

  @override
  String get settingsScreenTitle => 'Jami ma ki keto';

  @override
  String get aboutScreenTitle => 'Ma kwako';

  @override
  String get coverFlowScreenTitle => 'Malo twal';

  @override
  String get artistsScreenTitle => 'Lugo cal';

  @override
  String get albumsScreenTitle => 'Ngom';

  @override
  String get songsScreenTitle => 'Wer';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Wer',
      one: '1 Wer',
      zero: 'Pe tye wer mo',
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
      other: '$countString Buk wer',
      one: '1 Buk wer',
      zero: 'Pe tye wer mo',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Wel';

  @override
  String get genreSongsScreenTitle => 'Wer me ada';

  @override
  String get deviceColorSettingTitle => 'Kala kala me yubu kala';

  @override
  String get touchScreenSettingTitle => 'Gud jami';

  @override
  String get repeatModeSettingTitle => 'Nwoyo';

  @override
  String get repeatModeOne => 'Acel';

  @override
  String get repeatModeAll => 'Weng';

  @override
  String get vibrateSettingTitle => 'Miyu yujuke';

  @override
  String get clickWheelSettingTitle => 'Dii dwan me wiiyi';

  @override
  String get splitScreenSettingTitle => 'Poko kit me tic pa dano';

  @override
  String get touchSoundsDialogTitle => 'Mako dwan';

  @override
  String get touchSoundsDialogContent =>
      'Walegi ni I tic ki dwan ki i yub me yub me winyo dwan me ngwec pa twer .';

  @override
  String get immersiveModeSettingTitle => 'Mode me ngwec';

  @override
  String get showAppTutorialSettingTitle => 'nyut';

  @override
  String get changeDirectorySettingTitle => 'Alokaloka';

  @override
  String get donateSettingTitle => 'Miyu kony';

  @override
  String get donateSettingDescription =>
      'Ka imaro app man, myero itam i kom miyo mot.';

  @override
  String get versionAboutScreenTitle => 'La kodi';

  @override
  String get madeWithLoveTitle => 'Ki yubu ki ❤️ ki';

  @override
  String get noMusicFilesFound => 'ower';

  @override
  String get noArtistsFound => 'Pe tye luding';

  @override
  String get noAlbumsFound => 'Dwan';

  @override
  String get unknownSong => 'Wer ma pe ki ngeyo';

  @override
  String get unknownArtist => 'Ludiro ma pe ki ngeyo';

  @override
  String get unknownAlbum => 'Albumm ma pe ki ngeyo';

  @override
  String get unknownGenre => 'Gere ma pe ki ngeyo';

  @override
  String get buttonConfirmText => 'AYA';

  @override
  String get tileValueOn => 'I';

  @override
  String get tileValueOff => 'Pe tye';

  @override
  String get commonOfText => 'me';

  @override
  String get pageNotFoundText => 'Pot karatac ma kimiyo ni pe kinongo';

  @override
  String get commonErrorText => 'Bal mo';

  @override
  String get retryButtonText => 'dwogo';

  @override
  String get filePickerDialogTitle => 'Yer latela me Scan pi wer';

  @override
  String get searchScreenTitle => 'Moyo';

  @override
  String get searchEmptyText => 'Yeny pi yenyo';

  @override
  String get searchResultsText => 'Yeny adwogi ne:';

  @override
  String get resultsForText => 'Adwogi me:';

  @override
  String get disableBatteryOptimizationTitle => 'Tic maber';

  @override
  String get disableBatteryOptimizationContent =>
      'Wakwayi ni ibed ka poko jami ma twero kelo alokaloka i kom app man i kom jami ma kiketo i cim wek owek kituk wer ma i ngeye cen.';

  @override
  String get languageScreenTitle => 'Leb';

  @override
  String get silverDeviceColor => 'Mola';

  @override
  String get blackDeviceColor => 'Ma col';

  @override
  String get resetSettingsTitle => 'Medo';

  @override
  String get browseArtist => 'Lok ma mako tic';

  @override
  String get browseAlbum => 'Nen';

  @override
  String get cancelText => 'Ngolo';

  @override
  String get playlistsScreenTitle => 'Coc ma ki coyo';

  @override
  String get addToOnTheGoPlaylist => 'Med i kom lok';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Med Arbum I-Gwok .';

  @override
  String get removeSongFromThePlaylist => 'Kwany ki i kom lawer';

  @override
  String get allAlbums => 'Album ducu';

  @override
  String get scanningMusicFiles => 'Kwero file me wer';

  @override
  String get newPlaylist => 'Yub me wer manyen';

  @override
  String get savePlaylist => 'Gwok lacung pi';

  @override
  String get clearPlaylist => 'Rwom me nongo gum';

  @override
  String get rescanMusicFilesSettingTitle => 'Jami me wer me wer';

  @override
  String get deviceControlMenuTutorialText =>
      'Kwany lwet cingi manok i kom ler ma ki lwongo ni Woel me cito ka neno jami ma tye i menyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Diyo but me dyere me yero gin ma kinyuto';

  @override
  String get playPauseMenuTutorialText =>
      'Dii but man me tuko nyo cung i kom wer mo';

  @override
  String get nextButtonMenuTutorialText =>
      'Dii but man me ngwec ki wer ma lubo';

  @override
  String get previousButtonMenuTutorialText =>
      'Dii but man me dok cen nyo dok cen i wer macon .';

  @override
  String get menuButtonTutorialText =>
      'Dii bute man me dok cen i menu macon. Itwero diyo dok imako ki i skrin mo keken me cito i menyu madit.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Man aye gin ma ki nyutu. Labol me tic ki yat ma kitiyo kwede me keto yat ma kitiyo kwede me cango two. 災 Lu piny ki kit me keto jami ma ki keto i kom jami ma ki keto i cim ni ki twero keto ne i kom jami ma ki keto i yub ni.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Dwok lwet-ni i kom dwan malongo wek ilok dwan ma tye iye';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Diyo bute me Cender me ngwec ki i yenyo bar, bar ki yamo ma ngweco. Dii ki mako bute ma ki lwongo ni dul me nongo jami mukene.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Dii ki mako bute man me keto wer ni anyim';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Dii ki mako bute ni me dwoko cen wer ni';

  @override
  String get deviceControlSearchTutorialText =>
      'Kwany lwet cingi manok i kom yat ma ki lwongo ni alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Diyo but ma idyere me yero alfabet ma kinyuto';

  @override
  String get nextButtonSearchTutorialText => 'Dii but man me medo kabedo';

  @override
  String get previousButtonSearchTutorialText =>
      'Dii but man me kwanyo kit me agikki .';

  @override
  String get menuButtonSearchTutorialText =>
      'Dii but man me cego kibodbod ci ilok ki adwogi me yenyo';

  @override
  String get allSongs => 'Wer weng';
}
