// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lingala (`ln`).
class AppLocalizationsLn extends AppLocalizations {
  AppLocalizationsLn([String locale = 'ln']) : super(locale);

  @override
  String get appTitle => 'Classipod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Ndingisa ya kokɔta na audio esengeli .';

  @override
  String get audioAccessPermissionContent =>
      'Svp pesa accès na ba fichiers audio pona ko permettre biso to beta ba fichiers na yo ya musique.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ndingisa ya kokɔta na audio eboyami .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Svp pesa accès ya ba fichiers audio pona app oyo na paramètres ya appareil pona ko permettre biso to beta ba fichiers na yo ya musique.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Miziki';

  @override
  String get nowPlayingScreenTitle => 'Sikoyo kosakana .';

  @override
  String get shuffleSongsMenuTitle => 'Ba nzembo ya kosala ba shuffle .';

  @override
  String get shuffleSettingTitle => 'Kosala ba shuffle .';

  @override
  String get settingsScreenTitle => 'Paramètres .';

  @override
  String get aboutScreenTitle => 'Pene';

  @override
  String get coverFlowScreenTitle => 'Kozipa ezipeli .';

  @override
  String get artistsScreenTitle => 'Ba artistes .';

  @override
  String get albumsScreenTitle => 'Ba albums .';

  @override
  String get songsScreenTitle => 'Nzembo .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nzembo',
      one: '1 Loyembo',
      zero: 'Ba Nzembo Te',
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
      other: '$countString Ba albums ya ba albums',
      one: '1 Album na yango',
      zero: 'Ba Albums te',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ba genres .';

  @override
  String get genreSongsScreenTitle => 'Ba nzembo ya genre .';

  @override
  String get deviceColorSettingTitle => 'Langi ya aparɛyi .';

  @override
  String get touchScreenSettingTitle => 'Ecran tactile activé .';

  @override
  String get repeatModeSettingTitle => 'Kozongela';

  @override
  String get repeatModeOne => 'Moko';

  @override
  String get repeatModeAll => 'Nyonso';

  @override
  String get vibrateSettingTitle => 'Vibrer .';

  @override
  String get clickWheelSettingTitle => 'Finá makɛlɛlɛ ya roue .';

  @override
  String get splitScreenSettingTitle => 'Mode ya écran ya kokabwana .';

  @override
  String get touchSoundsDialogTitle => 'Ba sons ya kosimba .';

  @override
  String get touchSoundsDialogContent =>
      'Svp activer ba sons ya touch oyo ewutaka na ba paramètres ya système pona koyoka ba sons ya roue ya cliquage .';

  @override
  String get immersiveModeSettingTitle => 'Mode Immersif .';

  @override
  String get showAppTutorialSettingTitle => 'kolakisa mateya .';

  @override
  String get changeDirectorySettingTitle => 'Bobongola répertoire .';

  @override
  String get donateSettingTitle => 'Kopesa libonza';

  @override
  String get donateSettingDescription =>
      'Soki osepeli na app oyo, kanisá kopesa makabo.';

  @override
  String get versionAboutScreenTitle => 'Ya';

  @override
  String get madeWithLoveTitle => 'Esalemi na ❤️ na .';

  @override
  String get noMusicFilesFound => 'Miziki te .';

  @override
  String get noArtistsFound => 'Ba artistes te .';

  @override
  String get noAlbumsFound => 'Ba albums eza te .';

  @override
  String get unknownSong => 'Nzembo eyebani te .';

  @override
  String get unknownArtist => 'Mosali ya mayele oyo ayebani te .';

  @override
  String get unknownAlbum => 'Album oyo eyebani te .';

  @override
  String get unknownGenre => 'Genre oyo eyebani te .';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Likolo ya';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Lokasa oyo bapesi ezwamaki te .';

  @override
  String get commonErrorText => 'Libunga';

  @override
  String get retryButtonText => 'Komeka lisusu .';

  @override
  String get filePickerDialogTitle =>
      'Pona répertoire moko pona ko scanner pona musique .';

  @override
  String get searchScreenTitle => 'Koluka';

  @override
  String get searchEmptyText => 'Ba résultats ya recherche ezali te .';

  @override
  String get searchResultsText => 'Ba résultats ya recherche:';

  @override
  String get resultsForText => 'Ba résultats ya:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Désactiver optimisation ya pile .';

  @override
  String get disableBatteryOptimizationContent =>
      'Svp désactiver optimisation ya pile pona app oyo na ba paramètres ya appareil pona ko permettre lecture ya fond ya musique.';

  @override
  String get languageScreenTitle => 'Lokota';

  @override
  String get silverDeviceColor => 'Palata';

  @override
  String get blackDeviceColor => 'Moindo';

  @override
  String get resetSettingsTitle =>
      'Bozongisa ba paramètres na esika na yango .';

  @override
  String get browseArtist => 'Parcourir artiste .';

  @override
  String get browseAlbum => 'Tala na album .';

  @override
  String get cancelText => 'Kolongola';

  @override
  String get playlistsScreenTitle => 'Ba playlists .';

  @override
  String get addToOnTheGoPlaylist => 'Bobakisa na-na-kokende';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Bakisa album na on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Longola na liste ya ba playlistes .';

  @override
  String get allAlbums => 'Ba albums nionso .';

  @override
  String get scanningMusicFiles => 'Kosala scanner ya ba fichiers ya miziki .';

  @override
  String get newPlaylist => 'Liste ya ba playlistes ya sika .';

  @override
  String get savePlaylist => 'Bomba liste ya ba play-plague .';

  @override
  String get clearPlaylist => 'Liste ya ba plays ya polele .';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Ba fichiers ya musique ya Rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'Bokende na mosapi na bino ya monene na pete zingazinga ya roue ya kofina mpo na kokende na menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Finá na butɔ ya katikati mpo na kopona eloko ya menu oyo ezali na elembo .';

  @override
  String get playPauseMenuTutorialText =>
      'Finá butɔ oyo mpo na kobɛta to kosala pause na nzembo moko .';

  @override
  String get nextButtonMenuTutorialText =>
      'Finá bouton oyo mpo na kopumbwa na nzembo oyo elandi .';

  @override
  String get previousButtonMenuTutorialText =>
      'Finá bouton oyo mpo na kozongisa nsima to kozonga na nzembo oyo eleki .';

  @override
  String get menuButtonTutorialText =>
      'Finá na butɔ oyo mpo na kozonga na menu oyo eleki. Okoki kofina mpe kokanga yango uta na écran mosusu nyonso mpo na kokende mbala moko na menu monene.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Oyo ezali écran ya kolakisa. Ecran tactile mpe mode ya écran split ezali activé par défaut mpe ekoki kozala configuré lisusu na ba paramètres.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tia mosapi monene na yo zingazinga ya roue ya kofina mpo na kobongisa volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Finá bouton ya katikati mpo na kosala cycle na nzela ya bar ya Seek, barre ya scrubber mpe shuffle slider. Finá mpe simbá bouton ya katikati mpo na kokɔta na ba options mosusu.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Finá mpe simbá bouton oyo mpo na kotinda nzembo yango nokinoki .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Finá mpe simbá bouton oyo mpo na kozongisa nzembo yango .';

  @override
  String get deviceControlSearchTutorialText =>
      'Bokende na mosapi na bino ya monene na pete zingazinga ya roue ya cliquage mpo na kosala ete alfabɛ́ moko ezala na ntina mingi .';

  @override
  String get centerButtonSearchTutorialText =>
      'Finá na butɔ ya katikati mpo na kopona alfabɛ oyo ezali na elembo ya malamu .';

  @override
  String get nextButtonSearchTutorialText =>
      'Finá butɔ oyo mpo na kobakisa esika moko .';

  @override
  String get previousButtonSearchTutorialText =>
      'Finá na butɔ oyo mpo na kosilisa elembo ya nsuka .';

  @override
  String get menuButtonSearchTutorialText =>
      'Finá na butɔ oyo mpo na kokanga klaviatware mpe kosala boyokani na ba résultats ya bolukiluki .';
}
