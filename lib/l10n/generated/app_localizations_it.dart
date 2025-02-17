// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Autorizzazione dell\'accesso audio richiesto';

  @override
  String get audioAccessPermissionContent =>
      'Si prega di concedere l\'accesso ai file audio per consentirci di riprodurre i tuoi file musicali.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Autorizzazione dell\'accesso audio negato';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Si prega di concedere l\'accesso ai file audio per questa app nelle impostazioni del dispositivo per consentirci di riprodurre i tuoi file musicali.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musica';

  @override
  String get nowPlayingScreenTitle => 'Ora giocando';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Impostazioni';

  @override
  String get aboutScreenTitle => 'Di';

  @override
  String get coverFlowScreenTitle => 'Flusso di copertura';

  @override
  String get artistsScreenTitle => 'Artisti';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Canzoni';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString canzoni',
      one: '1 canzone',
      zero: 'No Songs',
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
      other: '$countString album',
      one: '1 album',
      zero: 'Nessun album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Generi';

  @override
  String get genreSongsScreenTitle => 'Canzoni di genere';

  @override
  String get deviceColorSettingTitle => 'Colore del dispositivo';

  @override
  String get touchScreenSettingTitle => 'Touch screen abilitato';

  @override
  String get repeatModeSettingTitle => 'Ripetere';

  @override
  String get repeatModeOne => 'Uno';

  @override
  String get repeatModeAll => 'Tutto';

  @override
  String get vibrateSettingTitle => 'Vibrare';

  @override
  String get clickWheelSettingTitle => 'Fai clic su suoni della ruota';

  @override
  String get splitScreenSettingTitle => 'Modalità schermo divisa';

  @override
  String get touchSoundsDialogTitle => 'Toccare i suoni';

  @override
  String get touchSoundsDialogContent =>
      'Abilita i suoni touch dalle impostazioni del sistema per ascoltare i suoni della ruota clicca';

  @override
  String get immersiveModeSettingTitle => 'Modalità immersiva';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial dello spettacolo';

  @override
  String get changeDirectorySettingTitle => 'Cambia directory';

  @override
  String get donateSettingTitle => 'Donare';

  @override
  String get donateSettingDescription =>
      'Se ti piace questa app, ti preghiamo di prendere in considerazione la donazione.';

  @override
  String get versionAboutScreenTitle => 'Versione';

  @override
  String get madeWithLoveTitle => 'Realizzato con ❤️ da';

  @override
  String get noMusicFilesFound => 'Nessuna musica';

  @override
  String get noArtistsFound => 'Nessun artisti';

  @override
  String get noAlbumsFound => 'Nessun album';

  @override
  String get unknownSong => 'Canzone sconosciuta';

  @override
  String get unknownArtist => 'Artista sconosciuto';

  @override
  String get unknownAlbum => 'Album sconosciuto';

  @override
  String get unknownGenre => 'Genere sconosciuto';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'SU';

  @override
  String get tileValueOff => 'Spento';

  @override
  String get commonOfText => 'Di';

  @override
  String get pageNotFoundText => 'La pagina data non è stata trovata';

  @override
  String get commonErrorText => 'Errore';

  @override
  String get retryButtonText => 'Riprovare';

  @override
  String get filePickerDialogTitle =>
      'Seleziona una directory per scansionare la musica';

  @override
  String get searchScreenTitle => 'Ricerca';

  @override
  String get searchEmptyText => 'Nessun risultato di ricerca';

  @override
  String get searchResultsText => 'Risultati della ricerca:';

  @override
  String get resultsForText => 'Risultati per:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disabilita l\'ottimizzazione della batteria';

  @override
  String get disableBatteryOptimizationContent =>
      'Si prega di disabilitare l\'ottimizzazione della batteria per questa app nelle impostazioni del dispositivo per consentire la riproduzione in background della musica.';

  @override
  String get languageScreenTitle => 'Lingua';

  @override
  String get silverDeviceColor => 'Argento';

  @override
  String get blackDeviceColor => 'Nero';

  @override
  String get resetSettingsTitle => 'Ripristina le impostazioni';

  @override
  String get browseArtist => 'Sfoglia artista';

  @override
  String get browseAlbum => 'Sfoglia l\'album';

  @override
  String get cancelText => 'Cancellare';

  @override
  String get playlistsScreenTitle => 'Playlist';

  @override
  String get addToOnTheGoPlaylist => 'Aggiungi a The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aggiungi album a on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Togliere dalla playlist';

  @override
  String get allAlbums => 'Tutti gli album';

  @override
  String get scanningMusicFiles => 'Scansione di file musicali';

  @override
  String get newPlaylist => 'Nuova playlist';

  @override
  String get savePlaylist => 'Salva playlist';

  @override
  String get clearPlaylist => 'Playlist chiara';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music File';

  @override
  String get deviceControlMenuTutorialText =>
      'Sposta leggermente il pollice attorno alla ruota del clic per navigare nel menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Premere il pulsante Centro per selezionare la voce di menu evidenziata';

  @override
  String get playPauseMenuTutorialText =>
      'Premere questo pulsante per riprodurre o mettere in pausa una canzone';

  @override
  String get nextButtonMenuTutorialText =>
      'Premere questo pulsante per saltare alla canzone successiva';

  @override
  String get previousButtonMenuTutorialText =>
      'Premere questo pulsante per riavvolgere o tornare alla canzone precedente';

  @override
  String get menuButtonTutorialText =>
      'Premere questo pulsante per tornare al menu precedente. È possibile premere e trattenerlo da qualsiasi altra schermata per andare direttamente al menu principale.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Questo è lo schermo del display. Il touchscreen e la modalità schermata divisa sono abilitati per impostazione predefinita e possono essere configurati ulteriormente nelle impostazioni.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Sposta il pollice attorno alla ruota del clic per regolare il volume';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Premere il pulsante Centro per scorrere attraverso la barra di ricerca, la barra di scrubber e il cursore di mescola. Premere e tenere premuto il pulsante Centro per accedere alle opzioni aggiuntive.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Premere e tieni presente questo pulsante per inoltrare velocemente la canzone';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Premere e tenere premuto questo pulsante per riavvolgere la canzone';

  @override
  String get deviceControlSearchTutorialText =>
      'Sposta leggermente il pollice attorno alla ruota del clic per evidenziare un alfabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Premere il pulsante Centro per selezionare l\'alfabeto evidenziato';

  @override
  String get nextButtonSearchTutorialText =>
      'Premere questo pulsante per aggiungere uno spazio';

  @override
  String get previousButtonSearchTutorialText =>
      'Premere questo pulsante per eliminare l\'ultimo carattere';

  @override
  String get menuButtonSearchTutorialText =>
      'Premere questo pulsante per chiudere la tastiera e interagire con i risultati di ricerca';
}
