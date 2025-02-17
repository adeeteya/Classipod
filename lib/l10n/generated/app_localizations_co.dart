// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Corsican (`co`).
class AppLocalizationsCo extends AppLocalizations {
  AppLocalizationsCo([String locale = 'co']) : super(locale);

  @override
  String get appTitle => 'Classepood';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle =>
      'Permissione d\'Accessu Audio necessariu';

  @override
  String get audioAccessPermissionContent =>
      'Per piacè cuncessione l\'accessu di i schedari audio per permette di ghjucà i vostri fugliali di musica.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'U permessu d\'accessu audio hà nigatu';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Per piacè, cuncessione di l\'accessu di i schedari audio per questa app in i paràmetri di u dispositivu per permette di ghjucà i vostri fugliali di musica.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musica';

  @override
  String get nowPlayingScreenTitle => 'Avà ghjucendu';

  @override
  String get shuffleSongsMenuTitle => 'Canzoni di Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Configurazioni';

  @override
  String get aboutScreenTitle => 'Circa à';

  @override
  String get coverFlowScreenTitle => 'Flussu di copre';

  @override
  String get artistsScreenTitle => 'Artisti';

  @override
  String get albumsScreenTitle => 'Albums';

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
      other: '$countString Canzoni',
      one: '1 Canzona',
      zero: 'Nisuna canzone',
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
      zero: 'Nisun album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Generi';

  @override
  String get genreSongsScreenTitle => 'Canzoni genre';

  @override
  String get deviceColorSettingTitle => 'Culore di dispusitivu';

  @override
  String get touchScreenSettingTitle => 'TOUCH SCHENS Attivata';

  @override
  String get repeatModeSettingTitle => 'Ripetè';

  @override
  String get repeatModeOne => 'Unu';

  @override
  String get repeatModeAll => 'Tuttu';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Cliccate nantu à a rota';

  @override
  String get splitScreenSettingTitle => 'Modu di Screen Split';

  @override
  String get touchSoundsDialogTitle => 'Toccu sonu';

  @override
  String get touchSoundsDialogContent =>
      'Per piacè attivà u toccu sona da i paràmetri di u sistema per sente u clic di rota di cliccà';

  @override
  String get immersiveModeSettingTitle => 'Modu Immerifichi';

  @override
  String get showAppTutorialSettingTitle => 'Mostra tutoriale';

  @override
  String get changeDirectorySettingTitle => 'Cambia repertoriu';

  @override
  String get donateSettingTitle => 'Donate';

  @override
  String get donateSettingDescription =>
      'Se ti piace sta app, per piacè cunsiderà a donazione.';

  @override
  String get versionAboutScreenTitle => 'Versione';

  @override
  String get madeWithLoveTitle => 'Fatta cù ❤️ per';

  @override
  String get noMusicFilesFound => 'Nisuna Music';

  @override
  String get noArtistsFound => 'Nisun artisti';

  @override
  String get noAlbumsFound => 'Nisun albums';

  @override
  String get unknownSong => 'Canzona scunnisciutu';

  @override
  String get unknownArtist => 'Artista scunnisciutu';

  @override
  String get unknownAlbum => 'Album UNKNECON';

  @override
  String get unknownGenre => 'Genere scunnisciutu';

  @override
  String get buttonConfirmText => 'Va bè';

  @override
  String get tileValueOn => 'Avanti';

  @override
  String get tileValueOff => 'Spinu';

  @override
  String get commonOfText => 'di';

  @override
  String get pageNotFoundText => 'A pagina data ùn hè stata trovata';

  @override
  String get commonErrorText => 'Errore';

  @override
  String get retryButtonText => 'Ritruvà';

  @override
  String get filePickerDialogTitle =>
      'Selezziunate un repertoriu per scopre per a musica';

  @override
  String get searchScreenTitle => 'CERCAZZA';

  @override
  String get searchEmptyText => 'Nisun Risultati di ricerca';

  @override
  String get searchResultsText => 'RISULTATI DI A RICERCATE:';

  @override
  String get resultsForText => 'Risultati per:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disattivate l\'ottimisazione di a bateria';

  @override
  String get disableBatteryOptimizationContent =>
      'Per piacè Disattivate l\'ottimisazione di a bateria per questa app in i paràmetri di u dispositivu per permette u riproduzione di u fondo di musica.';

  @override
  String get languageScreenTitle => 'Lingua';

  @override
  String get silverDeviceColor => 'Argentu';

  @override
  String get blackDeviceColor => 'Neru';

  @override
  String get resetSettingsTitle => 'Resettate i paràmetri';

  @override
  String get browseArtist => 'Sfoglia Artista';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Annulla';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Aghjustate à On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aghjunghje l\'album à On-Go';

  @override
  String get removeSongFromThePlaylist => 'Elimina da a playlist';

  @override
  String get allAlbums => 'Tutti l\'album';

  @override
  String get scanningMusicFiles => 'Scanning file di musica';

  @override
  String get newPlaylist => 'Novu playlist';

  @override
  String get savePlaylist => 'Salvà a playlist';

  @override
  String get clearPlaylist => 'Chjara Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'File di Music Restcan';

  @override
  String get deviceControlMenuTutorialText =>
      'Move u to pollice ligeramente intornu à a rota cliccate per navigà u menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pulse u buttone centru per selezziunate l\'elementu di menu evidenziatu';

  @override
  String get playPauseMenuTutorialText =>
      'Pulse stu buttone per ghjucà o pause una canzone';

  @override
  String get nextButtonMenuTutorialText =>
      'Pulse stu buttone per saltà à a prossima canzone';

  @override
  String get previousButtonMenuTutorialText =>
      'Pulse stu buttone per rimpruverà o vultate à a canzone precedente';

  @override
  String get menuButtonTutorialText =>
      'Pulse stu buttone per vultà à u menù precedente. Puderebbe pressu è tene da qualsiasi altra schermu per andà direttamente à u menu principale.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Questa hè a schermu di visualizazione. U modalità di schermu di toccu è u modalità di schermu di Split sò attivati ​​per automaticamente è pò esse cunfiguratu in più in i paràmetri.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Move u to pollice intornu à a rota cliccate per aghjustà u voluminu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pulsà u buttone centru per ciclu per mezu di veh, barra di scrubbu è slider shutle. Pulse è manteneu u buttone centru per accede à l\'opzioni supplementari.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pulse è mantene stu buttone per rinvià a canzone';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pulse è tenite stu buttone per rimpruverà a canzone';

  @override
  String get deviceControlSearchTutorialText =>
      'Move u to pollice ligeramente intornu à a rota di cliccà per evidenziare un alfabetu';

  @override
  String get centerButtonSearchTutorialText =>
      'Pulse u buttone centru per selezziunate l\'alfabetu evidenziatu';

  @override
  String get nextButtonSearchTutorialText =>
      'Pulse stu buttone per aghjunghje un spaziu';

  @override
  String get previousButtonSearchTutorialText =>
      'Pulse stu buttone per sguassà l\'ultimu caratteru';

  @override
  String get menuButtonSearchTutorialText =>
      'Pulse stu buttone per chjude u teclatu è interagisce cù i risultati di ricerca';
}
