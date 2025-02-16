// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pangasinan (`pag`).
class AppLocalizationsPag extends AppLocalizations {
  AppLocalizationsPag([String locale = 'pag']) : super(locale);

  @override
  String get appTitle => 'KlasePodid';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Say Audio ya Permisyon na Permisyon ya Inkaukolan .';

  @override
  String get audioAccessPermissionContent => 'Ipangasin ikdan kayo na audio file pian makapantogtog kami na saray file na musika yo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Ausoen ya Insindag na Permisyon';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Ipangasin ikdan kayo na saray audio file parad sayan app diad saray pasen na kagawaan pian makapantogtog kami na saray file na musika yo.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Natan Say Pan-play';

  @override
  String get shuffleSongsMenuTitle => 'I-ssnple Kaning';

  @override
  String get shuffleSettingTitle => 'Islip so';

  @override
  String get settingsScreenTitle => 'Saray panag-set';

  @override
  String get aboutScreenTitle => 'Nipaakar ed';

  @override
  String get coverFlowScreenTitle => 'Koloran na Agos';

  @override
  String get artistsScreenTitle => 'Saray artista';

  @override
  String get albumsScreenTitle => 'Saray album';

  @override
  String get songsScreenTitle => 'Saray kansion';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Kanta',
      one: '1 Kansyon',
      zero: 'Anggapoy Kanta',
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
      other: '$countString Saray album',
      one: '1 Album',
      zero: 'Anggapoy Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Saray agregmga';

  @override
  String get genreSongsScreenTitle => 'Guena Kanta';

  @override
  String get deviceColorSettingTitle => 'Kolor na Katabaan';

  @override
  String get touchScreenSettingTitle => 'Nasabi so Iskrin so Ag-onsaew .';

  @override
  String get repeatModeSettingTitle => 'Uliten';

  @override
  String get repeatModeOne => 'Sakey';

  @override
  String get repeatModeAll => 'Amin';

  @override
  String get vibrateSettingTitle => 'Paliis';

  @override
  String get clickWheelSettingTitle => 'Pindoten so Saray tanol na Wheel .';

  @override
  String get splitScreenSettingTitle => 'Pakintab na Esterio';

  @override
  String get touchSoundsDialogTitle => 'Idiwit so tanol';

  @override
  String get touchSoundsDialogContent => 'Paki-onsabi na Pangdem Nareng ng Sistema Sttein parang makita ang tunog na piligo .';

  @override
  String get immersiveModeSettingTitle => 'Pamarakep so Mode .';

  @override
  String get showAppTutorialSettingTitle => 'Ipanengneng so Tutoryal .';

  @override
  String get changeDirectorySettingTitle => 'Umanen so Direkrin';

  @override
  String get donateSettingTitle => 'Idonasyon';

  @override
  String get donateSettingDescription => 'No labay mo iyan app, isipen mo pa so mandonasyon.';

  @override
  String get versionAboutScreenTitle => 'Bersion';

  @override
  String get madeWithLoveTitle => 'Nagawaan na ❤️ na .';

  @override
  String get noMusicFilesFound => 'Walay Musika .';

  @override
  String get noArtistsFound => 'Wala ray Artist';

  @override
  String get noAlbumsFound => 'Wala ray Album';

  @override
  String get unknownSong => 'Ag-amta so Kanta .';

  @override
  String get unknownArtist => 'Ag-amta ya Artist .';

  @override
  String get unknownAlbum => 'Ag-amta ya Album';

  @override
  String get unknownGenre => 'Ag-amta a Genre .';

  @override
  String get buttonConfirmText => 'OKAY';

  @override
  String get tileValueOn => 'Diad';

  @override
  String get tileValueOff => 'Akaerep';

  @override
  String get commonOfText => 'ed';

  @override
  String get pageNotFoundText => 'Say niter a pahina so ag-aromog .';

  @override
  String get commonErrorText => 'Lingo';

  @override
  String get retryButtonText => 'Pawil';

  @override
  String get filePickerDialogTitle => 'Pilien so Direktorya ed Scan Parad Musika .';

  @override
  String get searchScreenTitle => 'Anapen';

  @override
  String get searchEmptyText => 'Wala ray Resulta ed Panag-anap .';

  @override
  String get searchResultsText => 'Resulta ed Panag-anap:';

  @override
  String get resultsForText => 'Resulta parad:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimisa ed Baterya na Kapansan';

  @override
  String get disableBatteryOptimizationContent => 'Ipangasin walay kapansanan ya panag-inuman na baterya parad sayan app diad saray pasen ya pangiparaan na musika ed beneg.';

  @override
  String get languageScreenTitle => 'Lenguahe';

  @override
  String get silverDeviceColor => 'Pilak';

  @override
  String get blackDeviceColor => 'Andeket';

  @override
  String get resetSettingsTitle => 'Saray Pan-set na Pan-set .';

  @override
  String get browseArtist => 'Artik na Kabangiha';

  @override
  String get browseAlbum => 'Kakabatan Album';

  @override
  String get cancelText => 'Kanselaen';

  @override
  String get playlistsScreenTitle => 'Saray manag-awit';

  @override
  String get addToOnTheGoPlaylist => 'Idagdag so On-On-Onsabi .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Idagdag so Album ed On-On-On-On.';

  @override
  String get removeSongFromThePlaylist => 'Ekal ed listaan ​​.';

  @override
  String get allAlbums => 'Amin ya Album';

  @override
  String get scanningMusicFiles => 'I-scan Musiles .';

  @override
  String get newPlaylist => 'Balon Lilya';

  @override
  String get savePlaylist => 'Iligtas so Liliber';

  @override
  String get clearPlaylist => 'Malinew ya Liliber';

  @override
  String get rescanMusicFilesSettingTitle => 'Musika na Mescan';

  @override
  String get deviceControlMenuTutorialText => 'Igalaw mon magano so thumb mo ed kaliberliber na Pindoten ya Alahas pian nakaran so menu .';

  @override
  String get centerButtonMenuTutorialText => 'Pindoten so sentro na buton pian napili so nipabitar ya bengatlan menu .';

  @override
  String get playPauseMenuTutorialText => 'Pindoten iyan buton pian man-play odino ontunda so sakey a kanta .';

  @override
  String get nextButtonMenuTutorialText => 'Pindoten iyan buton pian onlaknab ed ontumbok ya kansion .';

  @override
  String get previousButtonMenuTutorialText => 'Pindoten iyan buton pian naala lamet odino ompawil ed samay akaunan kansion .';

  @override
  String get menuButtonTutorialText => 'Pindoten iyan buton pian makapawil ed samay akaunan menu. Sarag mon ipilit tan bembenan itan ed arum ya iskrin pian direktan onlad manunan menu.';

  @override
  String get deviceScreenMenuTutorialText => 'Saya so pangipanengneng na screen. Say Pan-screen tan Kasmak ya Mode so napakiwas panamegley na kakulangan tan nayarin lalon kompigurado ed saray kipapasen.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Igalaw so thumb mo ed kaliberliber na Pindoten pian ni-adjust so tomo .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Pindoten so buton na Sentro pian manbisikleta diad pananap na bar, panagkiskis tan panag-slip. Pindoten tan bembenan so buton na Sentro pian makagamor na kaaruman iran opsyon.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Pindoten tan bembenan mo iyan buton pian naayunal so kansion .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Pindoten tan bembenan mo iyan buton pian naala lamet so kansion .';

  @override
  String get deviceControlSearchTutorialText => 'Igalaw mon magano so thumb mo ed kaliberliber na Pindoten ya Alahas pian ipabitar so alpabeto .';

  @override
  String get centerButtonSearchTutorialText => 'I-press so sentro na buton pian napili so nipabitar ya albeta .';

  @override
  String get nextButtonSearchTutorialText => 'Pindoten iyan buton pian makadagdag na espasyo .';

  @override
  String get previousButtonSearchTutorialText => 'Pindoten iyan buton pian buralen so unor a karakter .';

  @override
  String get menuButtonSearchTutorialText => 'Pindoten iyan buton pian nasara so keyboard tan makapideneng ed panag-anap so resulta .';
}
