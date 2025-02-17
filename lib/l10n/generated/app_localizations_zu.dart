// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AppLocalizationsZu extends AppLocalizations {
  AppLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Umbhalo wokutholakalayo';

  @override
  String get audioAccessPermissionTitle =>
      'Kudingeka imvume yokufinyelela komsindo';

  @override
  String get audioAccessPermissionContent =>
      'Sicela unikeze amafayela womsindo ukufinyelela ukuze usivumele ukudlala amafayela wakho omculo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Imvume yokufinyelela komsindo yenqatshiwe';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Sicela unikeze amafayela womsindo Ukufinyelela kwalolu hlelo lokusebenza kuzilungiselelo zedivayisi ukuvumela ukuthi sidlale amafayela wakho omculo.';

  @override
  String get menuScreenTitle => 'Umbhalo wokutholakalayo';

  @override
  String get musicMenuScreenTitle => 'Umculo';

  @override
  String get nowPlayingScreenTitle => 'Manje ukudlala';

  @override
  String get shuffleSongsMenuTitle => 'Izingoma zeShuffle';

  @override
  String get shuffleSettingTitle => 'Swayijela';

  @override
  String get settingsScreenTitle => 'Amasethingi';

  @override
  String get aboutScreenTitle => 'Maqondana';

  @override
  String get coverFlowScreenTitle => 'Ukumboza ukugeleza';

  @override
  String get artistsScreenTitle => 'Abadwebi bakubo';

  @override
  String get albumsScreenTitle => 'Ama-albhamu e-albhamu';

  @override
  String get songsScreenTitle => 'Izizo';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Izingoma',
      one: '1 Ingoma',
      zero: 'Azikho Izingoma',
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
      other: '$countString Ama-albhamu',
      one: '1 I-albhamu',
      zero: 'Awekho ama-albhamu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Isilinganiso ze -faniko';

  @override
  String get genreSongsScreenTitle => 'Izingoma zohlobo';

  @override
  String get deviceColorSettingTitle => 'Umbala wedivayisi';

  @override
  String get touchScreenSettingTitle => 'Isikrini sokuthinta sinikwe amandla';

  @override
  String get repeatModeSettingTitle => 'Phinda';

  @override
  String get repeatModeOne => 'Okukodwa';

  @override
  String get repeatModeAll => '-Nke';

  @override
  String get vibrateSettingTitle => 'Vevezela';

  @override
  String get clickWheelSettingTitle => 'Chofoza Imisindo Yesondo';

  @override
  String get splitScreenSettingTitle => 'Hlukanisa imodi yesikrini';

  @override
  String get touchSoundsDialogTitle => 'Thinta imisindo';

  @override
  String get touchSoundsDialogContent =>
      'Sicela unike amandla ukuthinta imisindo kusuka kuzilungiselelo zesistimu ukuzwa imisindo yesondo yokuchofoza';

  @override
  String get immersiveModeSettingTitle => 'Imodi yokuntylika';

  @override
  String get showAppTutorialSettingTitle => 'Khombisa okokufundisa';

  @override
  String get changeDirectorySettingTitle => 'Shintsha umkhombandlela';

  @override
  String get donateSettingTitle => 'Nikela';

  @override
  String get donateSettingDescription =>
      'Uma uthanda lolu hlelo lokusebenza, sicela ucabangele ukunikela.';

  @override
  String get versionAboutScreenTitle => 'Ukuhumushela';

  @override
  String get madeWithLoveTitle => 'Yenziwe nge ❤️ ngu';

  @override
  String get noMusicFilesFound => 'Awukho umculo';

  @override
  String get noArtistsFound => 'Abekho abaculi';

  @override
  String get noAlbumsFound => 'Awekho ama-albhamu';

  @override
  String get unknownSong => 'Ingoma engaziwa';

  @override
  String get unknownArtist => 'Umculi ongaziwa';

  @override
  String get unknownAlbum => 'I-albhamu engaziwa';

  @override
  String get unknownGenre => 'Uhlobo olungaziwa';

  @override
  String get buttonConfirmText => 'KULUNGILE';

  @override
  String get tileValueOn => 'Phezu kwa-';

  @override
  String get tileValueOff => 'Cishile';

  @override
  String get commonOfText => 'iwa-';

  @override
  String get pageNotFoundText => 'Ikhasi elinikeziwe alitholakalanga';

  @override
  String get commonErrorText => 'Ukuphambeka';

  @override
  String get retryButtonText => 'MuntuLALA';

  @override
  String get filePickerDialogTitle => 'Khetha umkhombandlela wokuskena umculo';

  @override
  String get searchScreenTitle => 'Sesha';

  @override
  String get searchEmptyText => 'Ayikho imiphumela yokucinga';

  @override
  String get searchResultsText => 'Imiphumela yokucinga:';

  @override
  String get resultsForText => 'Imiphumela ye:';

  @override
  String get disableBatteryOptimizationTitle => 'Khubaza ukusebenza kwebhethri';

  @override
  String get disableBatteryOptimizationContent =>
      'Sicela ukhubaze ukusebenza kwebhethri kwalolu hlelo lokusebenza kuzilungiselelo zedivayisi ukuvumela ukudlalwa kwangemuva komculo.';

  @override
  String get languageScreenTitle => 'Ulimi';

  @override
  String get silverDeviceColor => 'Isiliva';

  @override
  String get blackDeviceColor => '-Mnyama';

  @override
  String get resetSettingsTitle => 'Setha kabusha izilungiselelo';

  @override
  String get browseArtist => 'Dlulisa amehlo kumculi';

  @override
  String get browseAlbum => 'Dlulisa amehlo ku-albhamu';

  @override
  String get cancelText => 'Hlikihla';

  @override
  String get playlistsScreenTitle => 'Uhlu lwadlalwayo';

  @override
  String get addToOnTheGoPlaylist => 'Engeza ku-inthanethi';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ngeza i-albhamu ukuze uhambe';

  @override
  String get removeSongFromThePlaylist => 'Susa ohlwini lwadlalwayo';

  @override
  String get allAlbums => 'Wonke ama-albhamu';

  @override
  String get scanningMusicFiles => 'Ukuskena amafayela omculo';

  @override
  String get newPlaylist => 'Uhlu lwadlalwayo olusha';

  @override
  String get savePlaylist => 'Gcina uhlu lwadlalwayo';

  @override
  String get clearPlaylist => 'Sula uhlu lwadlalwayo';

  @override
  String get rescanMusicFilesSettingTitle => 'Amafayela omculo aseSulan';

  @override
  String get deviceControlMenuTutorialText =>
      'Hambisa isithupha sakho kancane uzungeze isondo lokuchofoza ukuze uzulazule imenyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Cindezela inkinobho yesikhungo ukukhetha into yemenyu egqanyisiwe';

  @override
  String get playPauseMenuTutorialText =>
      'Cindezela le nkinobho ukuze udlale noma ikhefu ingoma';

  @override
  String get nextButtonMenuTutorialText =>
      'Cindezela le nkinobho ukweqa engomeni elandelayo';

  @override
  String get previousButtonMenuTutorialText =>
      'Cindezela le nkinobho ukuze ubuyise emuva noma ubuyele engomeni edlule';

  @override
  String get menuButtonTutorialText =>
      'Cindezela le nkinobho ukuze ubuyele kumenyu edlule. Ungacindezela futhi uyibambe kunoma yisiphi esinye isikrini ukuze uye ngqo kumenyu enkulu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Lesi yisikrini sokubonisa. Isikrini sokuthinta kanye nemodi yesikrini sokuhlukanisa inikwe amandla ngokuzenzakalela futhi ingalungiswa ngokuqhubekayo kuzilungiselelo.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Hambisa isithupha sakho ngokuzungeza isondo lokuchofoza ukuze uguqule ivolumu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Cindezela inkinobho yesikhungo ukuze ujikeleze ibha yokufuna, ibha ye-scrubber nesilayidi esishisayo. Cindezela ubambe inkinobho yesikhungo ukufinyelela izinketho ezengeziwe.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Cindezela ubambe le nkinobho ukuze uqhubeke ngokushesha iculo';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Cindezela bese ubamba le nkinobho ukuze ubuyise kabusha iculo';

  @override
  String get deviceControlSearchTutorialText =>
      'Hambisa isithupha sakho kancane uzungeze isondo lokuchofoza ukugqamisa izinhlamvu';

  @override
  String get centerButtonSearchTutorialText =>
      'Cindezela inkinobho yesikhungo ukukhetha i-Alfabhethi egqanyisiwe';

  @override
  String get nextButtonSearchTutorialText =>
      'Cindezela le nkinobho ukwengeza isikhala';

  @override
  String get previousButtonSearchTutorialText =>
      'Cindezela le nkinobho ukuze ususe umlingiswa wokugcina';

  @override
  String get menuButtonSearchTutorialText =>
      'Cindezela le nkinobho ukuvala ikhibhodi futhi uhlanganyele nemiphumela yokucinga';
}
