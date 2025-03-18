// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Cebuano (`ceb`).
class AppLocalizationsCeb extends AppLocalizations {
  AppLocalizationsCeb([String locale = 'ceb']) : super(locale);

  @override
  String get appTitle => 'Klasipikasyon';

  @override
  String get menuButtonText => 'Listahan sa mga potahe';

  @override
  String get audioAccessPermissionTitle =>
      'Gikinahanglan ang Audio Access Permiso';

  @override
  String get audioAccessPermissionContent =>
      'Palihug hatagi ang mga audio file nga pag-access aron tugutan kami nga magdula sa imong mga file sa musika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ang pagtugot sa Audio Access Denied';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Palihug hatagi ang mga audio file nga pag-access alang sa kini nga app sa mga setting sa aparato aron tugutan kami nga magdula sa imong mga file sa musika.';

  @override
  String get menuScreenTitle => 'Listahan sa mga potahe';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Karon Pagdula';

  @override
  String get shuffleSongsMenuTitle => 'Mga kanta sa shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Mga Setting';

  @override
  String get aboutScreenTitle => 'Labot sa';

  @override
  String get coverFlowScreenTitle => 'Tabon nga pag-agos';

  @override
  String get artistsScreenTitle => 'Artista';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Mga kanta';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mga Kanta',
      one: '1 Kanta',
      zero: 'Walay Kanta',
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
      zero: 'Walay Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genre';

  @override
  String get genreSongsScreenTitle => 'Mga kanta sa Genre';

  @override
  String get deviceColorSettingTitle => 'Kolor sa Device';

  @override
  String get touchScreenSettingTitle => 'Gipalihok ang Touch Screen';

  @override
  String get repeatModeSettingTitle => 'Usbon';

  @override
  String get repeatModeOne => 'Usa';

  @override
  String get repeatModeAll => 'Tanan';

  @override
  String get vibrateSettingTitle => 'Mokurog';

  @override
  String get clickWheelSettingTitle => 'Pag-klik sa ligid nga tunog';

  @override
  String get splitScreenSettingTitle => 'Bahin sa Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Touch Sounds';

  @override
  String get touchSoundsDialogContent =>
      'Palihug himua ang mga tunog sa touch gikan sa mga setting sa sistema aron madungog ang mga tunog sa ligid sa pag-klik';

  @override
  String get immersiveModeSettingTitle => 'Imberstive mode';

  @override
  String get showAppTutorialSettingTitle => 'Ipakita ang Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Pag-usab sa Directory';

  @override
  String get donateSettingTitle => 'Mohatag';

  @override
  String get donateSettingDescription =>
      'Kung gusto nimo kini nga app, palihug hunahunaa ang pagdonar.';

  @override
  String get versionAboutScreenTitle => 'Batbat';

  @override
  String get madeWithLoveTitle => 'Gihimo uban ang ❤️ pinaagi sa';

  @override
  String get noMusicFilesFound => 'Walay musika';

  @override
  String get noArtistsFound => 'Walay mga artista';

  @override
  String get noAlbumsFound => 'Walay mga album';

  @override
  String get unknownSong => 'Wala mailhi nga kanta';

  @override
  String get unknownArtist => 'Wala mailhi nga artista';

  @override
  String get unknownAlbum => 'Wala mailhi nga album';

  @override
  String get unknownGenre => 'Wala mailhi nga genre';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Ibabaw sa';

  @override
  String get tileValueOff => 'Sa ngitngit';

  @override
  String get commonOfText => 'sa';

  @override
  String get pageNotFoundText => 'Ang gihatag nga panid wala makit-an';

  @override
  String get commonErrorText => 'Sayop';

  @override
  String get retryButtonText => 'Mopasundog';

  @override
  String get filePickerDialogTitle =>
      'Pagpili usa ka Directory aron ma-scan ang musika';

  @override
  String get searchScreenTitle => 'Mangita';

  @override
  String get searchEmptyText => 'Wala\'y mga resulta sa pagpangita';

  @override
  String get searchResultsText => 'Mga resulta sa pagpangita:';

  @override
  String get resultsForText => 'Mga Resulta alang sa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'I-disable ang pag-optimize sa baterya';

  @override
  String get disableBatteryOptimizationContent =>
      'Palihug isalikway ang pag-optimize sa baterya alang sa kini nga app sa mga setting sa aparato aron tugutan ang pag-playb sa background sa musika.';

  @override
  String get languageScreenTitle => 'Sinultihan';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Itum';

  @override
  String get resetSettingsTitle => 'I-reset ang mga setting';

  @override
  String get browseArtist => 'Pag-browse sa artista';

  @override
  String get browseAlbum => 'Pag-browse album';

  @override
  String get cancelText => 'Kanselahon';

  @override
  String get playlistsScreenTitle => 'Magdudula';

  @override
  String get addToOnTheGoPlaylist => 'Idugang sa ON-THE-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Idugang ang album sa On-the-Go';

  @override
  String get removeSongFromThePlaylist => 'Kuhaa gikan sa playlist';

  @override
  String get allAlbums => 'Tanan nga mga album';

  @override
  String get scanningMusicFiles => 'Pag-scan sa mga file sa musika';

  @override
  String get newPlaylist => 'Bag-ong Playlist';

  @override
  String get savePlaylist => 'I-save ang Playlist';

  @override
  String get clearPlaylist => 'Tin-aw nga Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Mga file sa musika sa Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Ibalhin ang imong kumagko sa palibot sa click wheel aron ma-navigate ang menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pindota ang button sa Center aron mapili ang gipasabut nga butang sa menu';

  @override
  String get playPauseMenuTutorialText =>
      'Padayon kini nga butones aron magdula o mohunong usa ka kanta';

  @override
  String get nextButtonMenuTutorialText =>
      'Padayon kini nga butones aron laktawan ang sunod nga kanta';

  @override
  String get previousButtonMenuTutorialText =>
      'Ipadayon ang kini nga butones aron ma-rewind o balik sa miaging kanta';

  @override
  String get menuButtonTutorialText =>
      'Padayon kini nga butones aron makabalik sa miaging menu. Mahimo nimo ipadayon ug kuptan kini gikan sa bisan unsang ubang screen aron direkta nga moadto sa main menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Kini ang screen sa display. Ang Touch Screen ug Split Screen mode gipadagan sa default ug mahimong ma-configure sa dugang sa mga setting.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ibalhin ang imong kumagko sa pag-klik sa ligid aron ma-adjust ang gidaghanon';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Ipadayon ang button sa Center aron ma-cycle pinaagi sa pagpangita sa bar, scrubber bar ug sluffle slider. Padayon ug hupti ang button sa Center aron ma-access ang dugang nga mga kapilian.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Padayon ug hupti kini nga butones aron mapadayon ang Awit';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Padayon ug hupti kini nga buton aron i-rewind ang kanta';

  @override
  String get deviceControlSearchTutorialText =>
      'Ibalhin ang imong kumagko sa palibot sa click wheel aron ipasiugda ang usa ka alpabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Ipadayon ang button sa Center aron mapili ang gipasiugda nga alpabeto';

  @override
  String get nextButtonSearchTutorialText =>
      'Padayon kini nga butones aron makadugang usa ka wanang';

  @override
  String get previousButtonSearchTutorialText =>
      'Ipadayon kini nga buton aron mapapas ang katapusan nga kinaiya';

  @override
  String get menuButtonSearchTutorialText =>
      'Ipadayon kini nga butones aron isara ang keyboard ug makig-uban sa mga resulta sa pagpangita';

  @override
  String get allSongs => 'Tanan nga mga kanta';
}
