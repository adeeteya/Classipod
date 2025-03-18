// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hiligaynon (`hil`).
class AppLocalizationsHil extends AppLocalizations {
  AppLocalizationsHil([String locale = 'hil']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Kinahanglanon nga Pagtugot sa Audio Pag-access .';

  @override
  String get audioAccessPermissionContent =>
      'Palihog hatag sang mga audio file ang access sa pagtugot sa amon nga magtokar sang imo mga file sa musika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Pagtugot sa Pag-access sa Audio Ginpanghiwala .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Palihog grant sang mga audio file nga access para sa sini nga app sa mga setting sang device agud tugutan kami nga magtokar sang imo mga file sang musika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Karon Pagdula .';

  @override
  String get shuffleSongsMenuTitle => 'Mga Asong Songs .';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'mga setting';

  @override
  String get aboutScreenTitle => 'Parte sa';

  @override
  String get coverFlowScreenTitle => 'Pag-ilig sa Tabunan .';

  @override
  String get artistsScreenTitle => 'Mga artista';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Mga ambahanon';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mga ambahanon',
      one: '1 Kanta',
      zero: 'Wala sing mga Ambahanon',
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
      other: '$countString Mga Album',
      one: '1 Album',
      zero: 'Wala sing mga Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mga gender';

  @override
  String get genreSongsScreenTitle => 'Mga Kanta sa Gere .';

  @override
  String get deviceColorSettingTitle => 'Kolor sa Device .';

  @override
  String get touchScreenSettingTitle => 'Pagtandog sa Screen nga Gihimo .';

  @override
  String get repeatModeSettingTitle => 'Liwaton';

  @override
  String get repeatModeOne => 'Isa';

  @override
  String get repeatModeAll => 'Tanan';

  @override
  String get vibrateSettingTitle => 'Pag-uyog';

  @override
  String get clickWheelSettingTitle => 'I-klik ang mga Tunog nga Balaan .';

  @override
  String get splitScreenSettingTitle => 'Mode sa Screen sa split .';

  @override
  String get touchSoundsDialogTitle => 'Mga Tulunod nga mga Tunog .';

  @override
  String get touchSoundsDialogContent =>
      'Palihug Pag-enable Magtandog sang mga Tunog gikan sa System Settings agud mabatian ang mga tunog sang ruweda sang pag-klik .';

  @override
  String get immersiveModeSettingTitle => 'Mode sa Immersive .';

  @override
  String get showAppTutorialSettingTitle => 'Ipakita ang Tutorial .';

  @override
  String get changeDirectorySettingTitle => 'Direktoryo sa Pagbag-o .';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription =>
      'Kon gusto mo ini nga app, palihog binagbinaga ang pagdonar.';

  @override
  String get versionAboutScreenTitle => 'Bersion';

  @override
  String get madeWithLoveTitle => 'Ginhimo nga may ❤️ ni .';

  @override
  String get noMusicFilesFound => 'Wala sing Musika';

  @override
  String get noArtistsFound => 'Wala Artista';

  @override
  String get noAlbumsFound => 'Wala Albums';

  @override
  String get unknownSong => 'Wala mahibal-an nga Ambahanon .';

  @override
  String get unknownArtist => 'Wala Mahibaluan nga Artista .';

  @override
  String get unknownAlbum => 'Wala makilal-an nga Album';

  @override
  String get unknownGenre => 'Wala mahibal-an nga Genre .';

  @override
  String get buttonConfirmText => 'SIGE';

  @override
  String get tileValueOn => 'Sa';

  @override
  String get tileValueOff => 'Patya';

  @override
  String get commonOfText => 'sang';

  @override
  String get pageNotFoundText => 'Wala nakit-an ang gihatag nga page .';

  @override
  String get commonErrorText => 'Kalautan';

  @override
  String get retryButtonText => 'Tinguhai liwat';

  @override
  String get filePickerDialogTitle =>
      'Pilia ang Direktoryo nga Scan para sa Musika .';

  @override
  String get searchScreenTitle => 'Magpangita';

  @override
  String get searchEmptyText => 'Wala Mga Resulta sa Pagpangita .';

  @override
  String get searchResultsText => 'Mga Resulta sa Pagpangita:';

  @override
  String get resultsForText => 'Mga Resulta para sa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disable nga Pagpili sa Baterya .';

  @override
  String get disableBatteryOptimizationContent =>
      'Palihog disable ang pag-optimize sang baterya para sa sini nga app sa mga setting sang device agud tugutan ang background nga pag-play sang musika.';

  @override
  String get languageScreenTitle => 'Lenggwahe';

  @override
  String get silverDeviceColor => 'Pilak';

  @override
  String get blackDeviceColor => 'Itom';

  @override
  String get resetSettingsTitle => 'Mga Setting sa Pag-reset .';

  @override
  String get browseArtist => 'Mag-browse nga Artista .';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'I-kansel';

  @override
  String get playlistsScreenTitle => 'Mga Playlist .';

  @override
  String get addToOnTheGoPlaylist => 'Idugang sa On-Ang-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Idugang ang Album sa On-Ang-Go .';

  @override
  String get removeSongFromThePlaylist => 'Kuhaa sa Playlist .';

  @override
  String get allAlbums => 'Ang tanan nga mga Album .';

  @override
  String get scanningMusicFiles => 'Pag-scan sa mga File sa Musika .';

  @override
  String get newPlaylist => 'Bag-o nga Playlilista .';

  @override
  String get savePlaylist => 'Luwasa ang Playlilista .';

  @override
  String get clearPlaylist => 'Klaro nga Playlilista .';

  @override
  String get rescanMusicFilesSettingTitle => 'Mga File sa Musika sa Rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'Ibalhin ang imo thumb sing mahapos sa palibot sang Click Wheel agod mag-navigate sa menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Pindota ang button sa sentro sa pagpili sang gin-highlight nga butang sa menu .';

  @override
  String get playPauseMenuTutorialText =>
      'Pindota ini nga buton para magtokar ukon mag-untat sang isa ka kanta .';

  @override
  String get nextButtonMenuTutorialText =>
      'Pindota ini nga buton para maglaktaw sa masunod nga kanta .';

  @override
  String get previousButtonMenuTutorialText =>
      'Pindota ini nga buton para mag-rewind ukon magbalik sa nauna nga kanta .';

  @override
  String get menuButtonTutorialText =>
      'Pindota ini nga buton para magbalik sa nauna nga menu. Mahimo mo ini i-press kag huptan sa bisan ano nga iban nga screen agud direkta nga magkadto sa panguna nga menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Amo ini ang display screen. Hikap ang Screen kag Split Screen Mode gina-enable sang default kag mahimo nga ma-configure pa gid sa mga setting.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ibalhin ang imo thumb sa palibot sang Click Wheel sa pag-adjust sang volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'I-press ang button sang Sentro agud magbisikleta sa pagpangita sang bar, scrubber bar kag slider sang shuffle. Pindota kag hupti ang button sang Sentro agud ma-access ang dugang nga mga kapilian.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pindota kag hupti ini nga buton para mapadasig ang kanta .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pindota kag hupti ini nga buton para ma-rewind ang kanta .';

  @override
  String get deviceControlSearchTutorialText =>
      'Ibalhin ang imo kumalagko sing mahapos sa palibot sang Click Wheel agod ipadaku ang isa ka alpabeto .';

  @override
  String get centerButtonSearchTutorialText =>
      'Pindota ang button sa sentro sa pagpili sang gin-highlight nga alpabeto .';

  @override
  String get nextButtonSearchTutorialText =>
      'Pindota ini nga buton para makadugang sang espasyo .';

  @override
  String get previousButtonSearchTutorialText =>
      'Pindota ini nga buton para ma-delete ang katapusan nga karakter .';

  @override
  String get menuButtonSearchTutorialText =>
      'Pindota ini nga buton sa pagsira sang keyboard kag makig-angot sa mga resulta sang pagpangita .';

  @override
  String get allSongs => 'Ang tanan nga mga Ambahanon .';
}
