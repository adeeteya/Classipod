// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Luxembourgish Letzeburgesch (`lb`).
class AppLocalizationsLb extends AppLocalizations {
  AppLocalizationsLb([String locale = 'lb']) : super(locale);

  @override
  String get appTitle => 'Classiipod';

  @override
  String get menuButtonText => 'CENUER ASB';

  @override
  String get audioAccessPermissionTitle =>
      'Audio Access Erlaabnes erfuerderlech';

  @override
  String get audioAccessPermissionContent =>
      'Gitt w.e.g. Audio Dateien Zougang fir datt mir Är Musekdateien ze spillen.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Access Erlaabnes refuséiert';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Gitt w.e.g. Audio Dateien Zougang fir dës App am Apparat Astellunge fir datt mir Är Musekdateien spillen.';

  @override
  String get menuScreenTitle => 'CENUER ASB';

  @override
  String get musicMenuScreenTitle => 'Musek';

  @override
  String get nowPlayingScreenTitle => 'Elo spillen';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Lidder';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Astellunge';

  @override
  String get aboutScreenTitle => 'Iwwer';

  @override
  String get coverFlowScreenTitle => 'Cover Flow';

  @override
  String get artistsScreenTitle => 'Kënschtler';

  @override
  String get albumsScreenTitle => 'Albel';

  @override
  String get songsScreenTitle => 'Lidder';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lidder',
      one: '1 Lidd',
      zero: 'Keng Lidder',
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
      other: '$countString Albumen',
      one: '1 Album',
      zero: 'Keng Albumen',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'GRES';

  @override
  String get genreSongsScreenTitle => 'Genre Lidder';

  @override
  String get deviceColorSettingTitle => 'Ähnann Faarf';

  @override
  String get touchScreenSettingTitle => 'Touch Écran aktivéiert';

  @override
  String get repeatModeSettingTitle => 'Widderhuelen';

  @override
  String get repeatModeOne => 'Eent';

  @override
  String get repeatModeAll => 'Alles';

  @override
  String get vibrateSettingTitle => 'VIRGRISTEN';

  @override
  String get clickWheelSettingTitle => 'Klickt op Rad kléngt';

  @override
  String get splitScreenSettingTitle => 'Split Bildschierm Modus';

  @override
  String get touchSoundsDialogTitle => 'Touch kléngt';

  @override
  String get touchSoundsDialogContent =>
      'Aktivéiert w.e.g. Touch Kläng aus System Astellunge fir de Click-Ricken ze héieren';

  @override
  String get immersiveModeSettingTitle => 'Imlemor Modus';

  @override
  String get showAppTutorialSettingTitle => 'Show Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Austrëller';

  @override
  String get donateSettingTitle => 'Spenden';

  @override
  String get donateSettingDescription =>
      'Wann Dir dës App gär hutt, betruecht w.e.g.';

  @override
  String get versionAboutScreenTitle => 'Erëm';

  @override
  String get madeWithLoveTitle => 'Gemaach mat ❤️ vum';

  @override
  String get noMusicFilesFound => 'Keng Musek';

  @override
  String get noArtistsFound => 'Keng Kënschtler';

  @override
  String get noAlbumsFound => 'Keng Albumen';

  @override
  String get unknownSong => 'Onbekannt Song';

  @override
  String get unknownArtist => 'Onbekannte Kënschtler';

  @override
  String get unknownAlbum => 'Onbekannt Album';

  @override
  String get unknownGenre => 'Onbekannte Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Onemkrech sinn';

  @override
  String get tileValueOff => 'Vun der ze';

  @override
  String get commonOfText => 'vun';

  @override
  String get pageNotFoundText => 'Déi uginn Säit gouf net fonnt';

  @override
  String get commonErrorText => 'Feeler';

  @override
  String get retryButtonText => 'Erëmkréien';

  @override
  String get filePickerDialogTitle =>
      'Wielt e Verzeechnes fir Musek ze scannen';

  @override
  String get searchScreenTitle => 'Sichen';

  @override
  String get searchEmptyText => 'Keng Sichresultater';

  @override
  String get searchResultsText => 'Sichresultater:';

  @override
  String get resultsForText => 'Resultater fir:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Desaktivéiere Batterie Optimiséierung';

  @override
  String get disableBatteryOptimizationContent =>
      'Desaktivéiere Batterie Optimiséierung fir dës App am Apparat Astellunge fir den Hannergrond Playback vun der Musek z\'erméiglechen.';

  @override
  String get languageScreenTitle => 'Sprooche';

  @override
  String get silverDeviceColor => 'Sëlfnäpp';

  @override
  String get blackDeviceColor => 'Schwaarz';

  @override
  String get resetSettingsTitle => 'Reset Astellungen';

  @override
  String get browseArtist => 'Browser Kënschtler';

  @override
  String get browseAlbum => 'Liwweren Album';

  @override
  String get cancelText => 'Ofbriechen';

  @override
  String get playlistsScreenTitle => 'Spillsaachen';

  @override
  String get addToOnTheGoPlaylist => 'Füügt op op-der-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Add Album op op den-goen';

  @override
  String get removeSongFromThePlaylist => 'Ewechzehuelen vun der Playlist';

  @override
  String get allAlbums => 'All Abum';

  @override
  String get scanningMusicFiles => 'Scannen Musek Dateien';

  @override
  String get newPlaylist => 'Nei Playlist';

  @override
  String get savePlaylist => 'Späichert Playlist';

  @override
  String get clearPlaylist => 'Kloer Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Musekdateien';

  @override
  String get deviceControlMenuTutorialText =>
      'Réckelt Ären Daum liicht ronderëm de Klickhimmel fir de Menü navigéieren';

  @override
  String get centerButtonMenuTutorialText =>
      'Dréckt op den Zentrum Knäppchen fir den Highlight Menü Artikel ze wielen';

  @override
  String get playPauseMenuTutorialText =>
      'Press dëse Knäppchen fir e Song ze spillen oder ze pausen';

  @override
  String get nextButtonMenuTutorialText =>
      'Dréckt dëse Knäppchen fir an dat nächst Lidd ze iwwersprangen';

  @override
  String get previousButtonMenuTutorialText =>
      'Dréckt dëse Knäppchen fir zréckzekommen oder zréck an de viregte Lidd ze goen';

  @override
  String get menuButtonTutorialText =>
      'Press dëse Knäppchen fir zréck op de viregte Menu. Dir kënnt drécken an halen et vun engem aneren Écran fir direkt an den Haaptmenu ze goen.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dëst ass den Displaybildschierm. Touch Écran a Splitbildschiermbezuel sinn am Standard aktivéiert a ka weider an den Astellunge konfiguréiert ginn.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Réckelt Ären Daumen ronderëm de Klickhimmel fir de Volumen unzepassen';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Dréckt op den Zentrum Knäppchen fir duerch Seiger Bar ze verzöltegen, Scrubber Bar an Shuffle Schieber. Dréckt an hält den Zentrum Knäppchen fir op zousätzlech Optiounen ze kréien.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Dréckt op an hält dëse Knäppchen fir de Song weiderzeféieren';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Dréckt an hält dëse Knäppchen fir d\'Lidd ze widderhuelen';

  @override
  String get deviceControlSearchTutorialText =>
      'Réckelt Ären Daum liicht ronderëm de Klickrad fir en Alfabet ze markéieren';

  @override
  String get centerButtonSearchTutorialText =>
      'Dréckt op den Zentrum Knäppchen fir den Highlighted Alphabet ze wielen';

  @override
  String get nextButtonSearchTutorialText =>
      'Dréckt dëse Knäppchen fir e Raum ze addéieren';

  @override
  String get previousButtonSearchTutorialText =>
      'Dréckt dëse Knäppchen fir de leschte Charakter ze läschen';

  @override
  String get menuButtonSearchTutorialText =>
      'Press dëse Knäppchen fir d\'Tastatur zoumaachen an interagéieren mat de Sichresultater';
}
