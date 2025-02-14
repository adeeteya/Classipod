// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENÚ';

  @override
  String get audioAccessPermissionTitle => 'Se requiere permiso de acceso al audio';

  @override
  String get audioAccessPermissionContent => 'Conceda acceso a los archivos de audio para permitirnos reproducir sus archivos de música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Permiso de acceso de audio denegado';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Conceda acceso a los archivos de audio para esta aplicación en la configuración del dispositivo para permitirnos reproducir sus archivos de música.';

  @override
  String get menuScreenTitle => 'Menú';

  @override
  String get musicMenuScreenTitle => 'Música';

  @override
  String get nowPlayingScreenTitle => 'Ahora jugando';

  @override
  String get shuffleSongsMenuTitle => 'Mezclar canciones';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Ajustes';

  @override
  String get aboutScreenTitle => 'Acerca de';

  @override
  String get coverFlowScreenTitle => 'Flujo de cobertura';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Álbumes';

  @override
  String get songsScreenTitle => 'Canciones';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Songs',
      one: '1 Song',
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
      other: '$countString Albums',
      one: '1 Album',
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre Songs';

  @override
  String get deviceColorSettingTitle => 'Device Color';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Enabled';

  @override
  String get repeatModeSettingTitle => 'Modo de repetición';

  @override
  String get repeatModeOne => 'One';

  @override
  String get repeatModeAll => 'All';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Sonidos de la rueda de clic';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Sonidos táctiles';

  @override
  String get touchSoundsDialogContent => 'Habilite los sonidos táctiles desde la configuración del sistema para escuchar los sonidos de la rueda de clic';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'Show Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Cambiar directorio';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription => 'If you like this app, please consider donating.';

  @override
  String get versionAboutScreenTitle => 'Versión';

  @override
  String get madeWithLoveTitle => 'Hecho con ❤️ por';

  @override
  String get noMusicFilesFound => 'Sin música';

  @override
  String get noArtistsFound => 'No Artists';

  @override
  String get noAlbumsFound => 'No Albums';

  @override
  String get unknownSong => 'Canción desconocida';

  @override
  String get unknownArtist => 'Artista desconocido';

  @override
  String get unknownAlbum => 'Álbum desconocido';

  @override
  String get unknownGenre => 'Género desconocido';

  @override
  String get buttonConfirmText => 'DE ACUERDO';

  @override
  String get tileValueOn => 'En';

  @override
  String get tileValueOff => 'Apagado';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'The given page was not found';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Rever';

  @override
  String get filePickerDialogTitle => 'Seleccione un directorio para buscar música';

  @override
  String get searchScreenTitle => 'Search';

  @override
  String get searchEmptyText => 'No Search Results';

  @override
  String get searchResultsText => 'Search Results: ';

  @override
  String get resultsForText => 'Results for: ';

  @override
  String get disableBatteryOptimizationTitle => 'Disable Battery Optimization';

  @override
  String get disableBatteryOptimizationContent => 'Please disable battery optimization for this app in the device settings to allow background playback of music.';

  @override
  String get languageScreenTitle => 'Language';

  @override
  String get silverDeviceColor => 'Silver';

  @override
  String get blackDeviceColor => 'Black';

  @override
  String get resetSettingsTitle => 'Reset Settings';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Cancel';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Add to On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Add Album to On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Remove from the Playlist';

  @override
  String get allAlbums => 'All Albums';

  @override
  String get scanningMusicFiles => 'Scanning Music Files';

  @override
  String get newPlaylist => 'New Playlist';

  @override
  String get savePlaylist => 'Save Playlist';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Move your thumb lightly around the Click Wheel to navigate the menu';

  @override
  String get centerButtonMenuTutorialText => 'Press the center button to select the highlighted menu item';

  @override
  String get playPauseMenuTutorialText => 'Press this button to play or pause a song';

  @override
  String get nextButtonMenuTutorialText => 'Press this button to skip to the next song';

  @override
  String get previousButtonMenuTutorialText => 'Press this button to rewind or go back to the previous song';

  @override
  String get menuButtonTutorialText => 'Press this button to go back to the previous menu. You could press and hold it from any other screen to directly go to the main menu.';

  @override
  String get deviceScreenMenuTutorialText => 'This is the display screen. Touch Screen and Split Screen Mode are enabled by default and can be configured further in the settings.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Move your thumb around the Click Wheel to adjust the volume';

  @override
  String get centerButtonNowPlayingTutorialText => 'Press the Center button to cycle through seek bar, scrubber bar and shuffle slider. Press and hold the Center button to access additional options.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Press and hold this button to fast forward the song';

  @override
  String get previousButtonNowPlayingTutorialText => 'Press and hold this button to rewind the song';

  @override
  String get deviceControlSearchTutorialText => 'Move your thumb lightly around the Click Wheel to highlight a alphabet';

  @override
  String get centerButtonSearchTutorialText => 'Press the center button to select the highlighted alphabet';

  @override
  String get nextButtonSearchTutorialText => 'Press this button to add a space';

  @override
  String get previousButtonSearchTutorialText => 'Press this button to delete the last character';

  @override
  String get menuButtonSearchTutorialText => 'Press this button to close the keyboard and interact with the search results';
}
