// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dinka (`din`).
class AppLocalizationsDin extends AppLocalizations {
  AppLocalizationsDin([String locale = 'din']) : super(locale);

  @override
  String get appTitle => 'Akutnhom de diäk';

  @override
  String get menuButtonText => 'MEEN';

  @override
  String get audioAccessPermissionTitle => 'Luɔɔi de Apɛi de Apɛi';

  @override
  String get audioAccessPermissionContent =>
      'Yïn adhil ba athör ë pïŋ ë röl gäm ɣook bïk ɣok puɔ̈l buk käk ë pïŋdu looi.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Kë ye piŋ në wëu ke 100 acï bɛ̈n lueel';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Yïn adhil ba athör ë pïŋ ë thok ë app kënë gäm ë thäät ë thäät yiic ago ɣok ya puɔ̈l buk athör ë thäät ë thäät ë thäät ë thäät.';

  @override
  String get menuScreenTitle => 'kuïn';

  @override
  String get musicMenuScreenTitle => 'Thuur';

  @override
  String get nowPlayingScreenTitle => 'Ku ëmën, ke wïc';

  @override
  String get shuffleSongsMenuTitle => 'Kä ye röt looi';

  @override
  String get shuffleSettingTitle => 'apath';

  @override
  String get settingsScreenTitle => 'Käk';

  @override
  String get aboutScreenTitle => 'Ɣɔ̈n';

  @override
  String get coverFlowScreenTitle => 'Clow';

  @override
  String get artistsScreenTitle => 'kɔc cï thuur';

  @override
  String get albumsScreenTitle => 'Ambum';

  @override
  String get songsScreenTitle => 'Kä rɛc';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Diɛt',
      one: '1 Thuɔɔu',
      zero: 'Acïn Diɛt',
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
      other: '$countString Album',
      one: '1 Albäm',
      zero: 'Acïn Albɔ̈m',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Kuɔ̈c';

  @override
  String get genreSongsScreenTitle => 'Gpiin ëbɛ̈n atɔ̈ thïn';

  @override
  String get deviceColorSettingTitle => 'Kë cï mat';

  @override
  String get touchScreenSettingTitle => 'Kë cï gɔ̈t në athöör yic';

  @override
  String get repeatModeSettingTitle => 'Bɛn looi';

  @override
  String get repeatModeOne => 'Töŋ';

  @override
  String get repeatModeAll => 'Eben';

  @override
  String get vibrateSettingTitle => 'Victor';

  @override
  String get clickWheelSettingTitle => 'Aköl ë Dheel Apɛi';

  @override
  String get splitScreenSettingTitle => 'Sliden Slitn Kë cï lueel';

  @override
  String get touchSoundsDialogTitle => 'Tɛ̈n ë thɛɛr';

  @override
  String get touchSoundsDialogContent =>
      'Tïŋ Kä lëu bïk röt looi tënë ɣän ke tɔ̈ɔ̈u bïk piŋ në röl de cök .';

  @override
  String get immersiveModeSettingTitle => 'Mööl rac';

  @override
  String get showAppTutorialSettingTitle => 'Wɛ̈ɛ̈rë bei';

  @override
  String get changeDirectorySettingTitle => 'Tiɛ̈m de cuɛt';

  @override
  String get donateSettingTitle => 'Kuɔ̈l';

  @override
  String get donateSettingDescription =>
      'Na nhiar app kënë, ke yïn lëu ba wëu gaam.';

  @override
  String get versionAboutScreenTitle => 'Wɛ̈t ye lueel';

  @override
  String get madeWithLoveTitle => 'Made nɔŋ ❤️ .';

  @override
  String get noMusicFilesFound => 'Acïn Music';

  @override
  String get noArtistsFound => 'Acïn kɔc ye thuur';

  @override
  String get noAlbumsFound => 'Acïn Albuth';

  @override
  String get unknownSong => 'këcn lac ŋic';

  @override
  String get unknownArtist => 'kë kuc raan cɔl Art.';

  @override
  String get unknownAlbum => 'Acïn kë ŋic';

  @override
  String get unknownGenre => 'Acïn kɔc cie kɔc Itharel;';

  @override
  String get buttonConfirmText => 'EYEN';

  @override
  String get tileValueOn => 'Nhial';

  @override
  String get tileValueOff => 'Cuëc';

  @override
  String get commonOfText => 'ë';

  @override
  String get pageNotFoundText => 'Apäth cï gäm acï yök .';

  @override
  String get commonErrorText => 'Awuɔ̈c';

  @override
  String get retryButtonText => 'Riɔɔk';

  @override
  String get filePickerDialogTitle =>
      'Kuany kë bï kɔc jääm nhïïm tënë Scan në kë de Kä juëc .';

  @override
  String get searchScreenTitle => 'Wïc';

  @override
  String get searchEmptyText => 'Acïn kë cï yök në rïthäc yic';

  @override
  String get searchResultsText => 'Kë wïc ë yök:';

  @override
  String get resultsForText => 'Kä cï bɛ̈n bei në:';

  @override
  String get disableBatteryOptimizationTitle => 'Tɛ̈ŋ de yic de kä ye röt waar';

  @override
  String get disableBatteryOptimizationContent =>
      'Tääu ë lööŋ ke battery ë thäät ë app kënë në thäät ë thäät yiic ago thäät ë thäät ë thäät ë thäät ë thäät ë thäät.';

  @override
  String get languageScreenTitle => 'Thoŋ';

  @override
  String get silverDeviceColor => 'Wëël';

  @override
  String get blackDeviceColor => 'Thith';

  @override
  String get resetSettingsTitle => 'Kä cï ke mat yiic';

  @override
  String get browseArtist => 'Kɔc ŋic kä thɛɛr';

  @override
  String get browseAlbum => 'Biäk de Krlm';

  @override
  String get cancelText => 'riɔ̈k';

  @override
  String get playlistsScreenTitle => 'Kɔc ye gät';

  @override
  String get addToOnTheGoPlaylist => 'Ku jɔl ya tɔ̈ në On-A-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tääu Almu kë cï tääu në-Kë-Go';

  @override
  String get removeSongFromThePlaylist =>
      'Tääu ë wël ë lëk tënë raan ë gɛ̈t athöör .';

  @override
  String get allAlbums => 'Akut kedhiɛ';

  @override
  String get scanningMusicFiles => 'Tuɔɔc de Mac de Kä ye wec';

  @override
  String get newPlaylist => 'Kɔc ye gät në athör yam';

  @override
  String get savePlaylist => 'Apɛi de Raan';

  @override
  String get clearPlaylist => 'Lëkëny de raan cï piath';

  @override
  String get rescanMusicFilesSettingTitle => 'Kë yenë käŋ tɔ̈ɔ̈u thïn';

  @override
  String get deviceControlMenuTutorialText =>
      'Tääu ë nhomdu piny në Cick Wheel yic ba lɔ në menu yic';

  @override
  String get centerButtonMenuTutorialText =>
      'Tääu ë thëm de ciɛɛl ba kë cï nyuɔɔth de menu cï nyuɔɔth kuany';

  @override
  String get playPauseMenuTutorialText =>
      'Tääu ë ye button kënë ba pol wala ba diɛt cɔk kääc';

  @override
  String get nextButtonMenuTutorialText =>
      'Tääu ë ye button kënë ba lɔ nhial në diɛt kɔ̈k yiic .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tääu ë ye button kënë ba dhuɔ̈kciëën wala dhuk ciëën në diɛt thɛɛr .';

  @override
  String get menuButtonTutorialText =>
      'Tääu ë thäät käk yiic ba dhuk ciëën në thäät thɛɛr yiic. Yïn alëu ba thëm ku muk keek tënë gɛɛr de thëm dɛ̈t bï lɔ ë thëm dït.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Yen ee kë ye nyuɔɔth. Kë tɔ̈u nhial ku Sliden cï gɔ̈t nhial aye keek puɔ̈l në kä cï keek tääu thïn ku kaa lëu bï keek tääu në ɣän cï keek tääu thïn.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tääu ë yï cin në Click Wheel yic ba kë dït ë nhom tääu thïn';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tääu ë thëm de Center ba thëm në thëm de bar, bar ë thëm ku thëm de thëm. Tääu ku dɔm ë thäät ë Center yiic ku yök kä juëc ë lööŋ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tääu ku muk ye button kënë ba diɛt lac tääu tueŋ .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tääu ku dɔm ye button kënë ba diɛt bɛɛr kueen .';

  @override
  String get deviceControlSearchTutorialText =>
      'Tääu ë cindu yic në Cɔ̈k Wheel yic ba kë cï gɔ̈t në alfabet nyuɔɔth';

  @override
  String get centerButtonSearchTutorialText =>
      'Tääu ë thëm de ciɛɛl ba kë cï juiir de alphabet kuany';

  @override
  String get nextButtonSearchTutorialText =>
      'Tääu ë button kënë yic ba të lääu juak thïn .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tääu ë button kënë yic ba kë tɔ̈u ciëën nyaai .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tääu ë ye button kënë ba keyboard thiɔ̈ɔ̈k ku yök kë cï yök .';
}
