// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Iloko (`ilo`).
class AppLocalizationsIlo extends AppLocalizations {
  AppLocalizationsIlo([String locale = 'ilo']) : super(locale);

  @override
  String get appTitle => 'Classipod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Masapul ti pammalubos ti Audio Access .';

  @override
  String get audioAccessPermissionContent =>
      'Pangngaasiyo ta ipaayyo ti Audio Files iti access tapno mapalubosankami a mangtokar kadagiti music files-yo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Napagkedkedan ti pammalubos ti Audio Access .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Pangngaasiyo ta ipaayyo ti Audio Files Access para iti daytoy nga app kadagiti setting ti device tapno mapalubosankami a mangtokar kadagiti music files-yo.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Ita nga agay-ayam .';

  @override
  String get shuffleSongsMenuTitle => 'Dagiti kanta ti Shuffle .';

  @override
  String get shuffleSettingTitle => 'Panag-shuffle .';

  @override
  String get settingsScreenTitle => 'Dagiti setting .';

  @override
  String get aboutScreenTitle => 'Maipapan';

  @override
  String get coverFlowScreenTitle => 'Agayus nga abbong .';

  @override
  String get artistsScreenTitle => 'Dagiti artista .';

  @override
  String get albumsScreenTitle => 'Dagiti Album .';

  @override
  String get songsScreenTitle => 'Kanta .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${countString}Sango',
      one: '1 a kanta',
      zero: 'Awan dagiti kanta',
    );
    return '$_temp0 .';
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
      other: '$countString Dagiti album',
      one: '1 Album',
      zero: 'Awan ti Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Dagiti henero .';

  @override
  String get genreSongsScreenTitle => 'Dagiti Kanta ti Genre .';

  @override
  String get deviceColorSettingTitle => 'Kolor ti alikamen .';

  @override
  String get touchScreenSettingTitle => 'Touch screen ti na-enable .';

  @override
  String get repeatModeSettingTitle => 'Uliten';

  @override
  String get repeatModeOne => 'Maysa';

  @override
  String get repeatModeAll => 'Amin';

  @override
  String get vibrateSettingTitle => 'agtayyek .';

  @override
  String get clickWheelSettingTitle => 'I-click dagiti uni ti pilid .';

  @override
  String get splitScreenSettingTitle => 'Split screen mode .';

  @override
  String get touchSoundsDialogTitle => 'Dagiti uni a mangsagid iti uni .';

  @override
  String get touchSoundsDialogContent =>
      'Pangngaasi nga ipalubos dagiti uni ti panangsagid manipud kadagiti setting ti sistema tapno mangngeg dagiti uni ti click wheel .';

  @override
  String get immersiveModeSettingTitle => 'Immersive nga Modo .';

  @override
  String get showAppTutorialSettingTitle => 'Ipakita ti tutorial .';

  @override
  String get changeDirectorySettingTitle => 'Baliwan ti Direktorio .';

  @override
  String get donateSettingTitle => 'Agidonar';

  @override
  String get donateSettingDescription =>
      'No magustuam daytoy nga app, pangngaasim ta ibilangmo ti agdonar.';

  @override
  String get versionAboutScreenTitle => 'Bersion';

  @override
  String get madeWithLoveTitle => 'Naaramid iti ❤️ babaen ti .';

  @override
  String get noMusicFilesFound => 'Awan ti musika .';

  @override
  String get noArtistsFound => 'Awan dagiti artista .';

  @override
  String get noAlbumsFound => 'Awan dagiti album .';

  @override
  String get unknownSong => 'Di ammo a kanta .';

  @override
  String get unknownArtist => 'Di ammo nga artista .';

  @override
  String get unknownAlbum => 'Di ammo nga album .';

  @override
  String get unknownGenre => 'Di ammo a henero .';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Ayan ti';

  @override
  String get tileValueOff => 'Naisina';

  @override
  String get commonOfText => 'iti';

  @override
  String get pageNotFoundText => 'Ti naited a panid ket saan a nasarakan .';

  @override
  String get commonErrorText => 'Biddut';

  @override
  String get retryButtonText => 'Padasen manen .';

  @override
  String get filePickerDialogTitle =>
      'Pilien ti direktorio a pang-scan iti musika .';

  @override
  String get searchScreenTitle => 'Agbirok';

  @override
  String get searchEmptyText => 'Awan ti resulta ti panagsapul .';

  @override
  String get searchResultsText => 'Resulta ti panagsapul:';

  @override
  String get resultsForText => 'Resulta para iti:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Isardeng ti panag-optimisar ti bateria .';

  @override
  String get disableBatteryOptimizationContent =>
      'Pangngaasiyo ta i-disable ti battery optimization para iti daytoy nga app kadagiti setting ti device tapno maipalubos ti background playback ti musika.';

  @override
  String get languageScreenTitle => 'Lengguahe';

  @override
  String get silverDeviceColor => 'Pirak';

  @override
  String get blackDeviceColor => 'Nangisit';

  @override
  String get resetSettingsTitle => 'I-reset dagiti setting .';

  @override
  String get browseArtist => 'Agbirok iti artista .';

  @override
  String get browseAlbum => 'I-browse ti album .';

  @override
  String get cancelText => 'Ikansela';

  @override
  String get playlistsScreenTitle => 'Dagiti playlist .';

  @override
  String get addToOnTheGoPlaylist => 'Inayon iti on-the-go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Inayon ti album iti on-the-go .';

  @override
  String get removeSongFromThePlaylist => 'Ikkaten iti playlist .';

  @override
  String get allAlbums => 'Amin nga album .';

  @override
  String get scanningMusicFiles => 'Panang-scan kadagiti file ti musika .';

  @override
  String get newPlaylist => 'Baro a playlist .';

  @override
  String get savePlaylist => 'Idulin ti playlist .';

  @override
  String get clearPlaylist => 'Nalawag a playlist .';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Dagiti file ti musika ti rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'Iyakarmo a nalag-an ti abaga ti imam iti aglawlaw ti click wheel tapno ag-navigate iti menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Pinduten ti center button tapno pilien ti nai-highlight a menu item .';

  @override
  String get playPauseMenuTutorialText =>
      'Pinduten daytoy a buton tapno agtokar wenno agsardeng iti kanta .';

  @override
  String get nextButtonMenuTutorialText =>
      'Pinduten daytoy a buton tapno laksiden ti sumaruno a kanta .';

  @override
  String get previousButtonMenuTutorialText =>
      'Pinduten daytoy a buton tapno ag-rewind wenno agsubli iti napalabas a kanta .';

  @override
  String get menuButtonTutorialText =>
      'Pinduten daytoy a buton tapno agsubli iti napalabas a menu. Mabalinmo nga i-press ken i-hold dayta manipud iti aniaman a sabali nga iskrin tapno direkta a mapan iti main menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Daytoy ti display screen. Ti touch screen ken split screen mode ket na-enable babaen ti default ken mabalin nga ad-adda a maikonfigura kadagiti settings.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Iyakarmo ti abaga ti imam iti aglawlaw ti pilid ti panagpidut tapno maitunos ti volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pinduten ti center button tapno agbisikleta babaen ti Seek bar, scrubber bar ken shuffle slider. Pinduten ken i-hold ti center button tapno makastrek kadagiti kanayonan a pagpilian.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pinduten ken i-hold daytoy a buton tapno mapapartak ti kanta .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pinduten ken i-hold daytoy a buton tapno mai-rewind ti kanta .';

  @override
  String get deviceControlSearchTutorialText =>
      'Iyakarmo a nalag-an ti abaga ti imam iti aglawlaw ti click wheel tapno maitampok ti alpabeto .';

  @override
  String get centerButtonSearchTutorialText =>
      'Pinduten ti center button tapno pilien ti nai-highlight nga alpabeto .';

  @override
  String get nextButtonSearchTutorialText =>
      'Pinduten daytoy a buton tapno mangnayon iti espasio .';

  @override
  String get previousButtonSearchTutorialText =>
      'Pinduten daytoy a buton tapno mapunas ti maudi a karakter .';

  @override
  String get menuButtonSearchTutorialText =>
      'Pinduten daytoy a buton tapno maiserra ti teklado ken makilangen kadagiti resulta ti panagsapul .';

  @override
  String get allSongs => 'Amin a kanta .';
}
