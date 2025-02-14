import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Clase';

  @override
  String get menuButtonText => 'MENÚ';

  @override
  String get audioAccessPermissionTitle => 'Se requiere permiso de acceso de audio';

  @override
  String get audioAccessPermissionContent => 'Otorgue a los archivos de audio acceso para permitirnos reproducir sus archivos de música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Permiso de acceso de audio denegado';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Occione el acceso a los archivos de audio para esta aplicación en la configuración del dispositivo para permitirnos reproducir sus archivos de música.';

  @override
  String get menuScreenTitle => 'Menú';

  @override
  String get musicMenuScreenTitle => 'Música';

  @override
  String get nowPlayingScreenTitle => 'Ahora jugando';

  @override
  String get shuffleSongsMenuTitle => 'Canciones de baraja';

  @override
  String get shuffleSettingTitle => 'Barajar';

  @override
  String get settingsScreenTitle => 'Ajustes';

  @override
  String get aboutScreenTitle => 'Acerca de';

  @override
  String get coverFlowScreenTitle => 'Flujo de tapa';

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
      other: '$countString canciones',
      one: '1 canción',
      zero: 'sin canciones',
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
      other: '$countString Álbumes',
      one: '1 álbum',
      zero: 'sin álbumes',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Géneros';

  @override
  String get genreSongsScreenTitle => 'Canciones de género';

  @override
  String get deviceColorSettingTitle => 'Color del dispositivo';

  @override
  String get touchScreenSettingTitle => 'Pantalla táctil habilitada';

  @override
  String get repeatModeSettingTitle => 'Repetir';

  @override
  String get repeatModeOne => 'Uno';

  @override
  String get repeatModeAll => 'Todo';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Haga clic en los sonidos de la rueda';

  @override
  String get splitScreenSettingTitle => 'Modo de pantalla dividida';

  @override
  String get touchSoundsDialogTitle => 'Sonidos táctiles';

  @override
  String get touchSoundsDialogContent => 'Habilite los sonidos táctiles desde la configuración del sistema para escuchar los sonidos de la rueda de clics';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial de espectáculos';

  @override
  String get changeDirectorySettingTitle => 'Directorio de cambio';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription => 'Si le gusta esta aplicación, considere donar.';

  @override
  String get versionAboutScreenTitle => 'Versión';

  @override
  String get madeWithLoveTitle => 'Hecho con ❤️ por';

  @override
  String get noMusicFilesFound => 'No hay música';

  @override
  String get noArtistsFound => 'No hay artistas';

  @override
  String get noAlbumsFound => 'Sin álbumes';

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
  String get pageNotFoundText => 'La página dada no fue encontrada';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Rever';

  @override
  String get filePickerDialogTitle => 'Seleccione un directorio para escanear música';

  @override
  String get searchScreenTitle => 'Buscar';

  @override
  String get searchEmptyText => 'Sin resultados de búsqueda';

  @override
  String get searchResultsText => 'Resultados de la búsqueda:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle => 'Deshabilitar la optimización de la batería';

  @override
  String get disableBatteryOptimizationContent => 'Desactive la optimización de la batería para esta aplicación en la configuración del dispositivo para permitir la reproducción de música de fondo.';

  @override
  String get languageScreenTitle => 'Idioma';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Negro';

  @override
  String get resetSettingsTitle => 'Configuración de reinicio';

  @override
  String get browseArtist => 'Navegar por el artista';

  @override
  String get browseAlbum => 'Álbum de navegación';

  @override
  String get cancelText => 'Cancelar';

  @override
  String get playlistsScreenTitle => 'Listas de reproducción';

  @override
  String get addToOnTheGoPlaylist => 'Agregar a la marcha';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Agregar álbum a la marcha';

  @override
  String get removeSongFromThePlaylist => 'Eliminar de la lista de reproducción';

  @override
  String get allAlbums => 'Todos los álbumes';

  @override
  String get scanningMusicFiles => 'Escaneo de archivos de música';

  @override
  String get newPlaylist => 'Nueva lista de reproducción';

  @override
  String get savePlaylist => 'Guardar lista de reproducción';

  @override
  String get clearPlaylist => 'Lista de reproducción clara';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivos de reestructuración de música';

  @override
  String get deviceControlMenuTutorialText => 'Mueva el pulgar ligeramente alrededor de la rueda de clic para navegar por el menú';

  @override
  String get centerButtonMenuTutorialText => 'Presione el botón central para seleccionar el elemento de menú resaltado';

  @override
  String get playPauseMenuTutorialText => 'Presione este botón para reproducir o pausar una canción';

  @override
  String get nextButtonMenuTutorialText => 'Presione este botón para saltar a la siguiente canción';

  @override
  String get previousButtonMenuTutorialText => 'Presione este botón para rebobinar o volver a la canción anterior';

  @override
  String get menuButtonTutorialText => 'Presione este botón para volver al menú anterior. Puede presionarlo y mantenerlo desde cualquier otra pantalla para ir directamente al menú principal.';

  @override
  String get deviceScreenMenuTutorialText => 'Esta es la pantalla. La pantalla táctil y el modo de pantalla dividida están habilitados de forma predeterminada y se pueden configurar más en la configuración.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Mueva el pulgar alrededor de la rueda de clic para ajustar el volumen';

  @override
  String get centerButtonNowPlayingTutorialText => 'Presione el botón central para recorrer la barra de búsqueda, la barra de depuración y el control deslizante de barajas. Mantenga presionado el botón central para acceder a opciones adicionales.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Mantenga presionado este botón para avanzar rápidamente la canción';

  @override
  String get previousButtonNowPlayingTutorialText => 'Mantenga presionado este botón para rebobinar la canción';

  @override
  String get deviceControlSearchTutorialText => 'Mueva el pulgar ligeramente alrededor de la rueda de clic para resaltar un alfabeto';

  @override
  String get centerButtonSearchTutorialText => 'Presione el botón central para seleccionar el alfabeto resaltado';

  @override
  String get nextButtonSearchTutorialText => 'Presione este botón para agregar un espacio';

  @override
  String get previousButtonSearchTutorialText => 'Presione este botón para eliminar el último personaje';

  @override
  String get menuButtonSearchTutorialText => 'Presione este botón para cerrar el teclado e interactuar con los resultados de la búsqueda';
}
