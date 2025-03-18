// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Waray (`war`).
class AppLocalizationsWar extends AppLocalizations {
  AppLocalizationsWar([String locale = 'war']) : super(locale);

  @override
  String get appTitle => 'KlasePod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Kinahanglan an Pagtugot ha Audio';

  @override
  String get audioAccessPermissionContent =>
      'Alayon paghatag hin audio nga mga file nga makasulod para makatugot kami nga magtokar han iyo mga file han musika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Access Pagtugot Gindidiwara';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Alayon paghatag hin audio nga mga file nga access para hini nga app ha mga device nga mga kahimtang para makatugot kami nga magmulay han iyo mga file han musika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Yana Pag-uyag';

  @override
  String get shuffleSongsMenuTitle => 'Mga Kanta ha Pag-ubos';

  @override
  String get shuffleSettingTitle => 'Magsaragdon';

  @override
  String get settingsScreenTitle => 'Mga setting';

  @override
  String get aboutScreenTitle => 'Mga';

  @override
  String get coverFlowScreenTitle => 'Tabuni an agos';

  @override
  String get artistsScreenTitle => 'Mga Artista';

  @override
  String get albumsScreenTitle => 'Mga album';

  @override
  String get songsScreenTitle => 'Mga Kanta';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mga kanta',
      one: '1 Kanta',
      zero: 'Waray Mga Kanta',
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
      other: '$countString Mga album',
      one: '1 Album',
      zero: 'Waray mga Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'mga Genre';

  @override
  String get genreSongsScreenTitle => 'Mga Kanta nga Kanta';

  @override
  String get deviceColorSettingTitle => 'Hubad nga Kolor';

  @override
  String get touchScreenSettingTitle => 'Pagkapot nga Screen Nahimo';

  @override
  String get repeatModeSettingTitle => 'Pag utro';

  @override
  String get repeatModeOne => 'Usa';

  @override
  String get repeatModeAll => 'Ngatanan';

  @override
  String get vibrateSettingTitle => 'pag-uyog';

  @override
  String get clickWheelSettingTitle => 'I-klik an Lingog nga Tinog';

  @override
  String get splitScreenSettingTitle => 'Mode sa Screen Screen';

  @override
  String get touchSoundsDialogTitle => 'Mga Tunog nga Pagkapot';

  @override
  String get touchSoundsDialogContent =>
      'Alayon Paghimo hin mga Tinog tikang ha Sistema nga mga Pagbutang basi mabatian an mga tunog han pag-klik';

  @override
  String get immersiveModeSettingTitle => 'Luoy nga Mode';

  @override
  String get showAppTutorialSettingTitle => 'Ipakita an Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Pagbag-o han Direktory';

  @override
  String get donateSettingTitle => 'Pagdonar';

  @override
  String get donateSettingDescription =>
      'Kun naruruyag kamo hini nga app, alayon paghunahuna hin pagdonar.';

  @override
  String get versionAboutScreenTitle => 'Bersyon';

  @override
  String get madeWithLoveTitle => 'Ginhimo nga may ❤️ han';

  @override
  String get noMusicFilesFound => 'Waray Musika';

  @override
  String get noArtistsFound => 'Waray mga Artista';

  @override
  String get noAlbumsFound => 'Waray mga Album';

  @override
  String get unknownSong => 'Waray Kilala nga Anta';

  @override
  String get unknownArtist => 'Waray kilala nga Artista';

  @override
  String get unknownAlbum => 'Waray kilala nga Album';

  @override
  String get unknownGenre => 'Waray Hibaroi nga Genre';

  @override
  String get buttonConfirmText => 'SIGE';

  @override
  String get tileValueOn => 'Ha';

  @override
  String get tileValueOff => 'Ginpagawas';

  @override
  String get commonOfText => 'han';

  @override
  String get pageNotFoundText => 'Waray makita an iginhatag nga pahina';

  @override
  String get commonErrorText => 'Sayop';

  @override
  String get retryButtonText => 'Pangalimbasog';

  @override
  String get filePickerDialogTitle =>
      'Pilia an Direktory ha Pag-scan para ha Musika';

  @override
  String get searchScreenTitle => 'Pamiling';

  @override
  String get searchEmptyText => 'Waray mga Resulta ha Pagbiling';

  @override
  String get searchResultsText => 'Mga Resulta ha Pagbiling:';

  @override
  String get resultsForText => 'Mga resulta para ha:';

  @override
  String get disableBatteryOptimizationTitle => 'Baterya nga Optimisar';

  @override
  String get disableBatteryOptimizationContent =>
      'Alayon pag-abat hin baterya nga pag-optimisar para hini nga app ha mga device nga mga kahimtang para makatugot hin luyo nga pag-uyag hin musika.';

  @override
  String get languageScreenTitle => 'Yinaknan';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Itom';

  @override
  String get resetSettingsTitle => 'Mga Pagbutang hin Pagbag-o';

  @override
  String get browseArtist => 'Artista sa Browse';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Pagkansela';

  @override
  String get playlistsScreenTitle => 'Mga lay-an';

  @override
  String get addToOnTheGoPlaylist => 'Dugangi ha-Gika-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Idugang an Album ha-Gan-go';

  @override
  String get removeSongFromThePlaylist => 'Kuhaa tikang ha Nag-uuyag';

  @override
  String get allAlbums => 'Tanan nga Album';

  @override
  String get scanningMusicFiles => 'Mga Kabag-o han Pag-scan';

  @override
  String get newPlaylist => 'Bag-o nga Nag-uuyag';

  @override
  String get savePlaylist => 'Tipigi an Pag-uyag';

  @override
  String get clearPlaylist => 'Klaro nga Lamlaw';

  @override
  String get rescanMusicFilesSettingTitle => 'Mga Kabag-o ha Musika';

  @override
  String get deviceControlMenuTutorialText =>
      'Ibalhin an imo tudlo ha tiil hin magaan ha palibot han Pag-klik nga Ligid basi mag-agi ha menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pindota an sentro nga buton basi makapili han ginpabug-atan nga menu';

  @override
  String get playPauseMenuTutorialText =>
      'Pindota ini nga buton para magtokar o mag-undang hin kanta';

  @override
  String get nextButtonMenuTutorialText =>
      'Pindota ini nga buton para laktawan ngadto ha sunod nga kanta';

  @override
  String get previousButtonMenuTutorialText =>
      'Pindota ini nga butones para mag-reland o bumalik ha nauna nga kanta';

  @override
  String get menuButtonTutorialText =>
      'Pindota ini nga buton para bumalik ha nauna nga menu. Mahimo mo ito ipirit ngan kaptan tikang ha bisan ano nga iba nga iskrin basi direkta nga kumadto ha nangunguna nga menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Amo ini an iskrin han pagpakita. Paghikap nga Pag-abat nga Mode nga may-ada hini nga default ngan mahimo pa ig-upod ha mga lugar.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ibalhin an imo tudlo ha palibot han I-klik nga Ligid basi ipahiuyon an kadamu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pindota an butones han Sentro basi magbisikleta pinaagi hin pagbiling hin bar, pag-utod nga bar ngan pag-uwang. Pindota ngan kapti an buton han Sentro para maka-access hin kadugangan nga mga kapilian.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pindota ngan kapti ini nga buton para mag-una pag-abante an kanta';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pindota ngan kapti ini nga buton para mabalik an kanta';

  @override
  String get deviceControlSearchTutorialText =>
      'Ibalhin an imo tudlo ha tiil hin magaan ha palibot han Pag-klik nga Ligid basi maipakita an usa nga alpabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Pindota an sentro nga buton basi makapili han ginpabug-atan nga alpabeto';

  @override
  String get nextButtonSearchTutorialText =>
      'Pindota ini nga buton para makadugang hin espasyo';

  @override
  String get previousButtonSearchTutorialText =>
      'Pindota ini nga buton para mabura an urhi nga karakter';

  @override
  String get menuButtonSearchTutorialText =>
      'Pindota ini nga buton para masara an keyboard ngan makig-upod ha mga resulta han pagbiling';

  @override
  String get allSongs => 'Tanan nga mga Kanta .';
}
