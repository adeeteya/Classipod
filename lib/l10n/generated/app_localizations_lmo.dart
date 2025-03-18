// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lombard (`lmo`).
class AppLocalizationsLmo extends AppLocalizations {
  AppLocalizationsLmo([String locale = 'lmo']) : super(locale);

  @override
  String get appTitle => 'Svedi';

  @override
  String get menuButtonText => 'Ul';

  @override
  String get audioAccessPermissionTitle => 'L’aprovaziun de la Cort Suprema.';

  @override
  String get audioAccessPermissionContent =>
      'Per piasér, g’he vœur de duperà i tò informaziun sü la tò pagina di impostaziun de la pagina.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'L’aprovaziun de l’inflaziun de la legg.';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Per piasér, g’he vœur de duperà i tò dati de la pagina di schermi de la pagina di schermi di utent che g’he vœut de duperà.';

  @override
  String get menuScreenTitle => 'haver-g';

  @override
  String get musicMenuScreenTitle => 'Musega';

  @override
  String get nowPlayingScreenTitle =>
      'Dal principi de la jentaa de la Crotaa 3 ada, l’è la plu banda.';

  @override
  String get shuffleSongsMenuTitle => 'Sent';

  @override
  String get shuffleSettingTitle => 'corrent';

  @override
  String get settingsScreenTitle => 'Sì';

  @override
  String get aboutScreenTitle => 'Incirca';

  @override
  String get coverFlowScreenTitle => 'Sinte';

  @override
  String get artistsScreenTitle => 'Emereg';

  @override
  String get albumsScreenTitle => 'luxr';

  @override
  String get songsScreenTitle => 'l\'élite';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Canzon',
      one: '1 Canzon',
      zero: 'Nissun canzun',
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
      one: '1 Album',
      zero: 'Nissun album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'l\'era';

  @override
  String get genreSongsScreenTitle => 'giaia.';

  @override
  String get deviceColorSettingTitle => 'Denea';

  @override
  String get touchScreenSettingTitle => 'In de la part de l’inflamaziun.';

  @override
  String get repeatModeSettingTitle => 'Ripeter';

  @override
  String get repeatModeOne => 'Vun';

  @override
  String get repeatModeAll => 'Tuts';

  @override
  String get vibrateSettingTitle => 'linial.';

  @override
  String get clickWheelSettingTitle => 'Clicca sul sit web.';

  @override
  String get splitScreenSettingTitle => 'Sultant';

  @override
  String get touchSoundsDialogTitle => 'l\'è';

  @override
  String get touchSoundsDialogContent =>
      'Per piasér a la part de la pagina di schermi de la pagina di schermi de la pagina di schermi de la pagina.';

  @override
  String get immersiveModeSettingTitle => 'Sam.';

  @override
  String get showAppTutorialSettingTitle => 'La jenezion';

  @override
  String get changeDirectorySettingTitle =>
      'Godeta el noster sistèm de gestiun del noster sistèm.';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription =>
      'Se g’he minga bisogn de savè, l’è minga impurtant.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Foto un’ativitàa.';

  @override
  String get noMusicFilesFound => 'Nessent';

  @override
  String get noArtistsFound => 'Ness';

  @override
  String get noAlbumsFound => 'Us';

  @override
  String get unknownSong => 'Centri';

  @override
  String get unknownArtist => 'Riestart del mund.';

  @override
  String get unknownAlbum => 'Terminio.';

  @override
  String get unknownGenre => 'Terror del Grupp.';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Su';

  @override
  String get tileValueOff => 'Smorz';

  @override
  String get commonOfText => 'di';

  @override
  String get pageNotFoundText => 'El prim l’è stad el prim aggiornament.';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'l\'è';

  @override
  String get filePickerDialogTitle =>
      'Seleziuna un sit web per la vòstra azienda.';

  @override
  String get searchScreenTitle => 'Cercar';

  @override
  String get searchEmptyText => 'Normania.';

  @override
  String get searchResultsText => 'Risposta:';

  @override
  String get resultsForText => 'Risposta:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Reportament de l’installaziun de la CBS.';

  @override
  String get disableBatteryOptimizationContent =>
      'Per piasér, g’hem de vèss duperà per i utent de la fotocamera de la fotocamera de la lista di schermi de la pagina di schermi.';

  @override
  String get languageScreenTitle => 'Lengua';

  @override
  String get silverDeviceColor => 'Arjent';

  @override
  String get blackDeviceColor => 'Neger';

  @override
  String get resetSettingsTitle => 'Tegnir el sistema.';

  @override
  String get browseArtist => 'Lar';

  @override
  String get browseAlbum => 'al fin';

  @override
  String get cancelText => 'scancella';

  @override
  String get playlistsScreenTitle => 'Sentii tri fotocamere';

  @override
  String get addToOnTheGoPlaylist => 'G’he sun 4.';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aggiungi el tatuagg de l\'IP.';

  @override
  String get removeSongFromThePlaylist => 'Sentiti i hardware.';

  @override
  String get allAlbums => 'Tüt i dü.';

  @override
  String get scanningMusicFiles => 'Scrivero de l\'inflamazion.';

  @override
  String get newPlaylist => 'Sultant ciav a l\'Area';

  @override
  String get savePlaylist => 'Sì';

  @override
  String get clearPlaylist => 'Sentì in de la part püsee volta.';

  @override
  String get rescanMusicFilesSettingTitle => 'Sviluppa un’ativitàa.';

  @override
  String get deviceControlMenuTutorialText =>
      'Clicca sü la tò pagina de la fotocamera de la buttiglia de la buttiglia de la pagina.';

  @override
  String get centerButtonMenuTutorialText =>
      'Clicca sul sit web de la fotocamera de la fotocamera.';

  @override
  String get playPauseMenuTutorialText =>
      'Certo un tatuagg de un taxi de un tatuagg de un’oltra.';

  @override
  String get nextButtonMenuTutorialText =>
      'Cerca el prim post in de la fotocamera de la fotocamera.';

  @override
  String get previousButtonMenuTutorialText =>
      'Certo che l’è minga una foto de la fotocamera che l’è drèe a fà el schermu.';

  @override
  String get menuButtonTutorialText =>
      'Cerca el temp de la fotocamera per la prima volta. Pudevet esattament el nomm de la fotocamera e g’he stà de vèss sicür che g’he stà de fär.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Chesta l’è la versiun püsee precisa de la foto. In de la seziun 2 e i schermi de cuntrol de la seziun de la seziun de la red e i erur de la posiziun de la red.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Clicca sul pulsant de la buttega de la buttega de la scheda.';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Clicca sü la spiaggia de la buttiglia de la buttiglia de la buttiglia, e dopu s’cioppo de la buttiglia de la buttiglia. Clicca sul sit web e illegal de la scheda de la scheda.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Clicca sü la fotocamera e la g’ha de vèss sicür che l’è stà el prim post.';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Clicca sü la foto e l’è la prima volta in de la lista.';

  @override
  String get deviceControlSearchTutorialText =>
      'Clicca sü la part superiur de la schermata de la schermata de la vostra eletricità.';

  @override
  String get centerButtonSearchTutorialText =>
      'Clicca sul sit web de la logo per la prima volta in de la gamba.';

  @override
  String get nextButtonSearchTutorialText =>
      'Clicca sü un spazi per illustraziun de la foto.';

  @override
  String get previousButtonSearchTutorialText =>
      'Cerca el numer de la fotocamera per la prima volta.';

  @override
  String get menuButtonSearchTutorialText =>
      'Clicca sul sit web de la memoria e i dat che g’he sun di dat che g’he sun.';

  @override
  String get allSongs => 'Tüt';
}
