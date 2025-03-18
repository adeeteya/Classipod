// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Xhosa (`xh`).
class AppLocalizationsXh extends AppLocalizations {
  AppLocalizationsXh([String locale = 'xh']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Imenyu';

  @override
  String get audioAccessPermissionTitle =>
      'Imvume yokufikelela kwi-Audio efunekayo';

  @override
  String get audioAccessPermissionContent =>
      'Nceda unikezele ngeefayile zeaudio ukuba sivumele ukuba sidlale iifayile zakho zomculo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Imvume yokufikelela kwi-Audio ivuliwe';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Nceda unikezele ngeefayile zeaudio zokufikelela kule app kwiseto sefowuni ukusivumela ukuba sidlale iifayile zakho zomculo.';

  @override
  String get menuScreenTitle => 'Imenyu';

  @override
  String get musicMenuScreenTitle => 'Umculo';

  @override
  String get nowPlayingScreenTitle => 'Ngoku Iyadlala';

  @override
  String get shuffleSongsMenuTitle => 'Iingoma ezityibilika';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Izicwangciso';

  @override
  String get aboutScreenTitle => 'Malunga';

  @override
  String get coverFlowScreenTitle => 'I-Cocice Right';

  @override
  String get artistsScreenTitle => 'Amagcisa';

  @override
  String get albumsScreenTitle => 'Ii-albhamu';

  @override
  String get songsScreenTitle => 'Iingoma';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Iingoma',
      one: '1 Ingoma',
      zero: 'Akukho Iingoma',
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
      other: '$countString Iialbham',
      one: '1 Icwecwe',
      zero: 'Akukho ziAlbham',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Iintlobo';

  @override
  String get genreSongsScreenTitle => 'Iingoma zohlobo';

  @override
  String get deviceColorSettingTitle => 'Umbala wesixhobo';

  @override
  String get touchScreenSettingTitle => 'Isikrini se-conta';

  @override
  String get repeatModeSettingTitle => 'Phinda';

  @override
  String get repeatModeOne => 'Nye';

  @override
  String get repeatModeAll => 'Zonke';

  @override
  String get vibrateSettingTitle => 'Hluma';

  @override
  String get clickWheelSettingTitle => 'Nqakraza izandi zezandi';

  @override
  String get splitScreenSettingTitle => 'Yahlula-hluza imowudi yescreen';

  @override
  String get touchSoundsDialogTitle => 'Izandi zokuchukumisa';

  @override
  String get touchSoundsDialogContent =>
      'Nceda wenze izandi zendlela yokuchukumisa ukusuka kuseto lwenkqubo ukuva i-Whee Wheel cop Izandi';

  @override
  String get immersiveModeSettingTitle => 'Imodi yokuntywila';

  @override
  String get showAppTutorialSettingTitle => 'Bonisa i-tutiorial';

  @override
  String get changeDirectorySettingTitle => 'Guqula ulawulo';

  @override
  String get donateSettingTitle => 'Nikela';

  @override
  String get donateSettingDescription =>
      'Ukuba uyayithanda le app, nceda uqaphele ukunikela.';

  @override
  String get versionAboutScreenTitle => 'Inguqulelo';

  @override
  String get madeWithLoveTitle => 'Yenziwe nge-❤️ nge';

  @override
  String get noMusicFilesFound => 'Akukho mculo';

  @override
  String get noArtistsFound => 'Akukho magcisa';

  @override
  String get noAlbumsFound => 'Akukho zi-albhamu';

  @override
  String get unknownSong => 'Ingoma engaziwayo';

  @override
  String get unknownArtist => 'Umculi ongaziwayo';

  @override
  String get unknownAlbum => 'I-albhamu engaziwayo';

  @override
  String get unknownGenre => 'Uhlobo olungaziwayo';

  @override
  String get buttonConfirmText => 'KULUNGILE';

  @override
  String get tileValueOn => 'Kwi';

  @override
  String get tileValueOff => 'Ngaphandle';

  @override
  String get commonOfText => 'ye';

  @override
  String get pageNotFoundText => 'Iphepha elinikiweyo alifumanekanga';

  @override
  String get commonErrorText => 'Impazamo';

  @override
  String get retryButtonText => 'Phinda uzame';

  @override
  String get filePickerDialogTitle => 'Khetha isikhombisi sokuskena umculo';

  @override
  String get searchScreenTitle => 'Ukukhankanya';

  @override
  String get searchEmptyText => 'Akukho ziphumo zokukhangela';

  @override
  String get searchResultsText => 'Iziphumo:';

  @override
  String get resultsForText => 'Iziphumo:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Khubaza ulungiselelo lwebhetri';

  @override
  String get disableBatteryOptimizationContent =>
      'Nceda ukhubaze ulungiselelo lwebhetri kule app kwiseto sefowuni ukuvumela ukudlala umva komculo.';

  @override
  String get languageScreenTitle => 'Ulwimi';

  @override
  String get silverDeviceColor => 'Isilivere';

  @override
  String get blackDeviceColor => 'Mnyama';

  @override
  String get resetSettingsTitle => 'Seta kwakhona';

  @override
  String get browseArtist => 'Bhrawuza i-Artist';

  @override
  String get browseAlbum => 'Bhrawuza i-albhamu';

  @override
  String get cancelText => 'Rhoxisa';

  @override
  String get playlistsScreenTitle => 'Uluhlu lokudlala';

  @override
  String get addToOnTheGoPlaylist => 'Yongeza kwi-e-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Yongeza i-albhamu ukuya kwi-the-go';

  @override
  String get removeSongFromThePlaylist => 'Susa kuluhlu lokudlala';

  @override
  String get allAlbums => 'Zonke ii-albhamu';

  @override
  String get scanningMusicFiles => 'Ukuskena iifayile zomculo';

  @override
  String get newPlaylist => 'Uluhlu olutsha lokudlala';

  @override
  String get savePlaylist => 'Gcina uluhlu lokudlala';

  @override
  String get clearPlaylist => 'Cacisa ukudlala';

  @override
  String get rescanMusicFilesSettingTitle => 'Iifayile zomculo zeRessan';

  @override
  String get deviceControlMenuTutorialText =>
      'Hambisa isithupha sakho kancinci ngevili lokucofa ukuze ungene kwimenyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Cinezela iqhosha leZiko ukukhetha umba oqaqambileyo wemenyu';

  @override
  String get playPauseMenuTutorialText =>
      'Cinezela eli qhosha ukuze udlale okanye unqumle ingoma';

  @override
  String get nextButtonMenuTutorialText =>
      'Cinezela eli qhosha ukutsiba kwingoma elandelayo';

  @override
  String get previousButtonMenuTutorialText =>
      'Cinezela eli qhosha ukuze ubuyele okanye ubuye kwingoma yangaphambili';

  @override
  String get menuButtonTutorialText =>
      'Cinezela eli qhosha ukuze ubuye kwimenyu yangaphambili. Unokucinezela kwaye ubambe kulo naliphi na esinye isikrini ukuya ngqo kwimenyu ephambili.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Esi sisikrini sokubonisa. Iscreen sokuchukumisa kunye ne-spalit yendlela yenziwa ngokungagqibekanga kwaye inokulungiswa ngakumbi kwiseto.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Hambisa isithupha sakho ujikeleze ivili lonqakrazo ukuze ulungelelanise ivolumu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Cinezela iqhosha leZiko ukujikeleza ngokufuna i-bar, i-scrubber bar kunye nesilayidi seShuffle. Cinezela kwaye ubambe iqhosha leZiko ukufikelela kwizinto ongezelelweyo.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Cinezela kwaye ubambe eli qhosha ukuze uqhubeke nengoma';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Cinezela kwaye ubambe eli qhosha ukubuyisela ingoma';

  @override
  String get deviceControlSearchTutorialText =>
      'Hambisa isithupha sakho nge-term ijikeleze ivili lokucofa ukuqaqambisa ialfabhethi';

  @override
  String get centerButtonSearchTutorialText =>
      'Cinezela iqhosha leZiko ukukhetha ialfabhethi eqaqambileyo';

  @override
  String get nextButtonSearchTutorialText =>
      'Cinezela eli qhosha ukongeza indawo';

  @override
  String get previousButtonSearchTutorialText =>
      'Cinezela eli qhosha ukucima umlinganiswa wokugqibela';

  @override
  String get menuButtonSearchTutorialText =>
      'Cinezela eli qhosha ukuvala ikhibhodi kwaye unxibelelane neziphumo zokukhangela';

  @override
  String get allSongs => 'Zonke iingoma';
}
