// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bikol (`bik`).
class AppLocalizationsBik extends AppLocalizations {
  AppLocalizationsBik([String locale = 'bik']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Kaipuhan an Pagtugot sa Audio';

  @override
  String get audioAccessPermissionContent =>
      'Tabi magtao nin access nin audio file tanganing tugutan kaming magtugtog kan saindong mga file nin musika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Pag-abot sa Audio Pagtugot sa Pag-akò .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Tabi magtao nin access nin audio para sa app na ini sa mga lugar nin aparato tanganing tugutan kami na magtugtog kan saindong mga file nin musika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Ngonyan Pag-aling-aling';

  @override
  String get shuffleSongsMenuTitle => 'Mga Awit sa Pag-shoffle .';

  @override
  String get shuffleSettingTitle => 'Mag-shoffle';

  @override
  String get settingsScreenTitle => 'Mga pag-andam';

  @override
  String get aboutScreenTitle => 'Manungod';

  @override
  String get coverFlowScreenTitle => 'Dalagan sa Taklob .';

  @override
  String get artistsScreenTitle => 'Mga artista';

  @override
  String get albumsScreenTitle => 'Mga album';

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
      other: '$countString mga Kanta',
      one: '1 Kanta',
      zero: 'Mayo nin mga Kanta',
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
      zero: 'Mayo nin mga Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mga berde';

  @override
  String get genreSongsScreenTitle => 'Mga Awit sa Gerere .';

  @override
  String get deviceColorSettingTitle => 'Kolor sa aparato';

  @override
  String get touchScreenSettingTitle => 'Puot Iskreen Pinagana .';

  @override
  String get repeatModeSettingTitle => 'Uliton';

  @override
  String get repeatModeOne => 'Saro';

  @override
  String get repeatModeAll => 'Gabos';

  @override
  String get vibrateSettingTitle => 'Mag-uyog';

  @override
  String get clickWheelSettingTitle => 'I-klik an Tunog kan Ruweda .';

  @override
  String get splitScreenSettingTitle => 'Pagbanga sa Mode sa Iskrip .';

  @override
  String get touchSoundsDialogTitle => 'Kapotan Mga Tunog';

  @override
  String get touchSoundsDialogContent =>
      'Paki-Toot na Mga Tunog na Pagduot gikan sa mga Setting sa Sistema tanganing madangog an mga tanog kan ruweda nin pag-klik .';

  @override
  String get immersiveModeSettingTitle => 'Modo nin Pag-arang .';

  @override
  String get showAppTutorialSettingTitle => 'Magpahiling nin Tutorial .';

  @override
  String get changeDirectorySettingTitle => 'Pagbabago Direktoryo';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription =>
      'Kun gusto nindo an app na ini, paki-isip tabi an pagdonar.';

  @override
  String get versionAboutScreenTitle => 'Bersyon';

  @override
  String get madeWithLoveTitle => 'Gibo sa ❤️ sa .';

  @override
  String get noMusicFilesFound => 'Mayo nin Musika';

  @override
  String get noArtistsFound => 'Walay mga Artista .';

  @override
  String get noAlbumsFound => 'Mayo nin mga Album .';

  @override
  String get unknownSong => 'Dai Midbid na Awit .';

  @override
  String get unknownArtist => 'Dai aram na Artista .';

  @override
  String get unknownAlbum => 'Dai midbid si Album .';

  @override
  String get unknownGenre => 'Dai midbid na Gerere .';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Sa ibabaw';

  @override
  String get tileValueOff => 'Punduhon';

  @override
  String get commonOfText => 'nin';

  @override
  String get pageNotFoundText => 'Dai nakua an itinaong pahina .';

  @override
  String get commonErrorText => 'Sala';

  @override
  String get retryButtonText => 'Pagpurbaran giraray';

  @override
  String get filePickerDialogTitle =>
      'Pilion an Direktoryo na Iscan para sa Musika .';

  @override
  String get searchScreenTitle => 'Maghanap';

  @override
  String get searchEmptyText => 'Mayo nin mga Resulta sa Paghanap .';

  @override
  String get searchResultsText => 'Mga Resulta sa Paghanap:';

  @override
  String get resultsForText => 'Mga resulta para sa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Pag-optimisyon sa Pag-agaw nin Kapansanan .';

  @override
  String get disableBatteryOptimizationContent =>
      'Paki-oplitisyon sa baterya na dai nabawalan para sa app na ini sa mga lugar nin aparato tanganing tugutan an pag-aling-aling sa likod kan musika.';

  @override
  String get languageScreenTitle => 'Lenggwahe';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Itom';

  @override
  String get resetSettingsTitle => 'Mga Pag-set sa Pag-uli .';

  @override
  String get browseArtist => 'Artista sa Browse';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'ikansela';

  @override
  String get playlistsScreenTitle => 'Mga parakawat';

  @override
  String get addToOnTheGoPlaylist => 'Idagdag sa On-an-G.';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Idagdag si Album sa On-an-G.';

  @override
  String get removeSongFromThePlaylist => 'Haleon sa Parapalya .';

  @override
  String get allAlbums => 'Gabos Albums .';

  @override
  String get scanningMusicFiles => 'Iscan na mga Sagunson sa Musika .';

  @override
  String get newPlaylist => 'Bagong Paradula';

  @override
  String get savePlaylist => 'I-save an Paratugtog .';

  @override
  String get clearPlaylist => 'Malinaw na Parapalya .';

  @override
  String get rescanMusicFilesSettingTitle => 'Mga File sa Musika sa Reskano .';

  @override
  String get deviceControlMenuTutorialText =>
      'Liwaton nin magaan an saindong muro sa palibot kan Ruweda nin Pag-klik tanganing maglayag sa menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Pinduton an sentro kan buton tanganing mapili an itinampok na bagay na menu .';

  @override
  String get playPauseMenuTutorialText =>
      'Pinduton an butones na ini tanganing mag-awit o magpundo nin sarong awit .';

  @override
  String get nextButtonMenuTutorialText =>
      'Pinduton an butones na ini tanganing laktawan an sunod na kanta .';

  @override
  String get previousButtonMenuTutorialText =>
      'Pinduton an butones na ini tanganing mabalik o makabalik sa nakaaging kanta .';

  @override
  String get menuButtonTutorialText =>
      'Pinduton an butones na ini tanganing makabalik sa nakaaging menu. Puede nindong piriton asin kapotan iyan sa arin man na ibang screen tanganing direktang makaduman sa mayor na menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ini an screen nin pagpahiling. An Modo nin Pagduot sa Iskrin asin Pagbanga nin Bawad pinapangyari nin dai pag-alangan asin puedeng orog pang pag-isipan sa mga kamugtakan.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ibalyo an saindong muro sa palibot kan Ruweda nin Pag-klik tanganing maayos an tomo .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pinduton an buton kan Sentro tanganing magbisikleta sa paagi nin paghanap nin bar, pag-scrubr bar asin pag-iiriwal-iwal. Pinduton asin kapotan an buton kan Sentro tanganing makakua nin dagdag na mga opsyon.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pinduton asin kapotan an butones na ini tanganing marikas an pag-abante kan kanta .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pinduton asin kapotan an butones na ini tanganing mabawi an kanta .';

  @override
  String get deviceControlSearchTutorialText =>
      'Liwaton nin magaan an saindong muro sa palibot kan Ruweda nin Pag-klik tanganing itampok an sarong alpabeto .';

  @override
  String get centerButtonSearchTutorialText =>
      'Pinduton an sentro kan buton tanganing mapili an itinampok na alpabeto .';

  @override
  String get nextButtonSearchTutorialText =>
      'Pinduton an butones na ini tanganing makadagdag nin espasyo .';

  @override
  String get previousButtonSearchTutorialText =>
      'Pinduton an buton tanganing buraon an huring karakter .';

  @override
  String get menuButtonSearchTutorialText =>
      'Pinduton an buton na ini tanganing isara an keyboard asin makipag-ulay sa mga resulta nin paghanap .';

  @override
  String get allSongs => 'Gabos na Awit .';
}
