// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latgalian (`ltg`).
class AppLocalizationsLtg extends AppLocalizations {
  AppLocalizationsLtg([String locale = 'ltg']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio pīkļuvis atļuovis praseja .';

  @override
  String get audioAccessPermissionContent => 'Lyudzu, dolit pīkļuot audio failim, kab ļautu atskaņuot jūs muzykys failus.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio pīkļuvis atļuovis nūraideja .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Lyudzu, dolit audio failus pīkļuvei itai lītai īreiču īstatejumūs, lai ļautu mums atskaņuot jūs muzykys failus.';

  @override
  String get menuScreenTitle => 'Izvēlne';

  @override
  String get musicMenuScreenTitle => 'Muzyka';

  @override
  String get nowPlayingScreenTitle => 'Niu Spēlēt';

  @override
  String get shuffleSongsMenuTitle => '100 doc#1163 .';

  @override
  String get shuffleSettingTitle => 'šaušam';

  @override
  String get settingsScreenTitle => 'īreicieja';

  @override
  String get aboutScreenTitle => 'Par';

  @override
  String get coverFlowScreenTitle => 'Apsegšonys plyusma .';

  @override
  String get artistsScreenTitle => '100 doc#1159 muokslinīks';

  @override
  String get albumsScreenTitle => 'Albumi';

  @override
  String get songsScreenTitle => 'Dzīsmis';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Dzīsmis',
      one: '1 Dzīsme',
      zero: 'Nikaidu dzīšmu',
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
      zero: 'Nav albumu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'žauļs';

  @override
  String get genreSongsScreenTitle => 'žanru dzīsmis';

  @override
  String get deviceColorSettingTitle => 'Īreice krāsa';

  @override
  String get touchScreenSettingTitle => 'Pīsaskar ekrans Īspiejams .';

  @override
  String get repeatModeSettingTitle => 'Atkuortuot';

  @override
  String get repeatModeOne => 'Vīns';

  @override
  String get repeatModeAll => 'Vysi';

  @override
  String get vibrateSettingTitle => 'vibrej';

  @override
  String get clickWheelSettingTitle => '100 doc#1159 Nūspīd iz Ritu skaņu .';

  @override
  String get splitScreenSettingTitle => 'Sadaleits ekrana režims';

  @override
  String get touchSoundsDialogTitle => 'Pīsaskart skanis .';

  @override
  String get touchSoundsDialogContent => '100 doc#1159 Lyudzu , Īspējoj pīskuorīņa skaņu nu Sistemys īstatejumim , lai dzierdātu klikšķu riteņu skanis .';

  @override
  String get immersiveModeSettingTitle => 'Immersivais režims';

  @override
  String get showAppTutorialSettingTitle => 'Paruodit vuiceibu 100 doc#1163 .';

  @override
  String get changeDirectorySettingTitle => 'Izmaineit direktoreju .';

  @override
  String get donateSettingTitle => 'Zīduot';

  @override
  String get donateSettingDescription => 'Ka pateik itei līta, lyudzu, apsverit zīduošonu.';

  @override
  String get versionAboutScreenTitle => 'Verseja';

  @override
  String get madeWithLoveTitle => 'Izgataveits ar ❤️ ar 199 doc#1163 .';

  @override
  String get noMusicFilesFound => 'Nikaida Muzyka .';

  @override
  String get noArtistsFound => 'Nikaidu muokslinīku .';

  @override
  String get noAlbumsFound => 'Nikaidu Albumu .';

  @override
  String get unknownSong => 'Nazynoma Dzīsme .';

  @override
  String get unknownArtist => 'Nazynoms muokslinīks .';

  @override
  String get unknownAlbum => 'Nazynoms Albums .';

  @override
  String get unknownGenre => 'Nazynoms žanrs .';

  @override
  String get buttonConfirmText => 'LABI';

  @override
  String get tileValueOn => 'Iz';

  @override
  String get tileValueOff => 'Izslāgts';

  @override
  String get commonOfText => 'nu';

  @override
  String get pageNotFoundText => 'Deituo lopa nabeja atrosta .';

  @override
  String get commonErrorText => 'Klaida';

  @override
  String get retryButtonText => 'atlaseit';

  @override
  String get filePickerDialogTitle => '100 doc#1159 Izvēlētīs direktoreju , kū skenēt muzykai .';

  @override
  String get searchScreenTitle => 'Meklēt';

  @override
  String get searchEmptyText => '100 doc#1281 Nav mekliešonys rezultatu .';

  @override
  String get searchResultsText => 'Mekliešonys rezultati:';

  @override
  String get resultsForText => 'Rezultati par:';

  @override
  String get disableBatteryOptimizationTitle => 'Atspējot akumulatora optimizaceju .';

  @override
  String get disableBatteryOptimizationContent => 'Lyudzu, atspējojit akumulatora optimizaceju itai lītai īreiču īstatejumūs, lai ļautu muzykys fona atskaņuošonai.';

  @override
  String get languageScreenTitle => 'Volūda';

  @override
  String get silverDeviceColor => 'Sudobrs';

  @override
  String get blackDeviceColor => 'Malns';

  @override
  String get resetSettingsTitle => 'Atjaunuot īstatejumus';

  @override
  String get browseArtist => 'Puorlūkuošonys muokslinīks .';

  @override
  String get browseAlbum => 'Pārlūceit Albums';

  @override
  String get cancelText => 'atceļt';

  @override
  String get playlistsScreenTitle => 'Atskaņuotuoji';

  @override
  String get addToOnTheGoPlaylist => 'Pīvīnojit Op-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Pīvīnojit Albumu, lai īslāgtu-Go .';

  @override
  String get removeSongFromThePlaylist => '100 doc#1159 Izjimt nu Atskaņuošonys saroksta .';

  @override
  String get allAlbums => 'Vysi Albumi .';

  @override
  String get scanningMusicFiles => 'Skeniešonys muzykys faili .';

  @override
  String get newPlaylist => 'Jauns spielis saroksts';

  @override
  String get savePlaylist => 'Taupeit Playlist';

  @override
  String get clearPlaylist => 'Skaidrys skaņuošonys saroksts';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskānu muzykys faili .';

  @override
  String get deviceControlMenuTutorialText => '100 doc#1159 Pōrvītoj sovu īkšķi vīgli ap Click Wheel , lai navigāceitu izvēlni .';

  @override
  String get centerButtonMenuTutorialText => '100 doc#1159 Nūspīž centra pogu , lai izvālātu izcaltū izvēļnis punktu .';

  @override
  String get playPauseMenuTutorialText => '100 doc#1159 Nūspīž itū pogu , lai atskaņuotu voi pauzeitu dzīsmi .';

  @override
  String get nextButtonMenuTutorialText => '100 doc#1159 Nūspīž itū pogu , lai izlaistu iz nuokamū dzīsmi .';

  @override
  String get previousButtonMenuTutorialText => '100 doc#1159 Nūspīž itū pogu , lai attīktu voi dūtūs atpakaļ iz īprīkšejū dzīsmi .';

  @override
  String get menuButtonTutorialText => 'Nūspīž itū pogu, lai atsagrīztu īprīkšejā izvēlnē. Varātu nūspīst i turēt nu sevkura cyta ekrana, kab tīši ītu iz golvonū izvēlni.';

  @override
  String get deviceScreenMenuTutorialText => 'Tys ir displeja ekrans. Pīsaskar ekrans i Split Ekrana režims ir īspiejams piec nūklusājuma i tū var konfigurēt tuoļuok īstatejumūs.';

  @override
  String get deviceControlNowPlayingTutorialText => '100 doc#1159 Pōrvītoj īkšķi ap ​​Click Wheel , lai pīlāguotu skaļumu .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Nūspīž Centra pogu, lai brauktu ar velosipedu caur mekliešonu stygu, skruberi stygu i slīkšņa slīdi. Nūspīd i turēt Centra pogu, lai pīkļyutu papyldu opcejis.';

  @override
  String get nextButtonNowPlayingTutorialText => '100 doc#1159 Nūspīž i turi itū pogu, lai gavētu iz prīšku dzīsmi .';

  @override
  String get previousButtonNowPlayingTutorialText => '100 doc#1159 Nūspīž i turi itū pogu, lai attīcynuotu dzīsmi .';

  @override
  String get deviceControlSearchTutorialText => '100 doc#1159 Pōrvītoj sovu īkšķi vīgli ap Click Wheel , lai izceļ ābeci .';

  @override
  String get centerButtonSearchTutorialText => '100 doc#1159 Nūspīž centra pogu , lai atlaseitu izcaltū ābeci .';

  @override
  String get nextButtonSearchTutorialText => '100 doc#1159 Nūspīž itū pogu , lai pīvīnuotu telpu .';

  @override
  String get previousButtonSearchTutorialText => '100 doc#1159 Nūspīž itū pogu , lai izdzēstu pādejū raksturu .';

  @override
  String get menuButtonSearchTutorialText => '100 doc#1159 Nūspīž itū pogu , lai aiztaiseitu klaviaturu i sasadorbuotu ar mekliešonys rezultatim .';
}
