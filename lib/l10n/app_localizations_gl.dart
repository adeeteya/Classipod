// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menú';

  @override
  String get audioAccessPermissionTitle => 'Permiso de acceso de audio necesario';

  @override
  String get audioAccessPermissionContent => 'Por favor, conceda o acceso de ficheiros de audio para permitirnos reproducir os teus ficheiros de música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Permiso de acceso de audio negado';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Concede os ficheiros de audio acceso a esta aplicación na configuración do dispositivo para permitirnos reproducir os teus ficheiros de música.';

  @override
  String get menuScreenTitle => 'Menú';

  @override
  String get musicMenuScreenTitle => 'Música';

  @override
  String get nowPlayingScreenTitle => 'Agora xogando';

  @override
  String get shuffleSongsMenuTitle => 'Cancións de barras';

  @override
  String get shuffleSettingTitle => 'Baralla';

  @override
  String get settingsScreenTitle => 'Configuración';

  @override
  String get aboutScreenTitle => 'Sobre';

  @override
  String get coverFlowScreenTitle => 'Fluxo de cuberta';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Álbums';

  @override
  String get songsScreenTitle => 'Cancións';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString cancións',
      one: '1 canción',
      zero: 'sen cancións',
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
      other: '$countString Álbums',
      one: '1 álbum',
      zero: 'sen álbums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Xéneros';

  @override
  String get genreSongsScreenTitle => 'Cancións de xénero';

  @override
  String get deviceColorSettingTitle => 'Cor do dispositivo';

  @override
  String get touchScreenSettingTitle => 'Pantalla táctil habilitada';

  @override
  String get repeatModeSettingTitle => 'Repetir';

  @override
  String get repeatModeOne => 'Un';

  @override
  String get repeatModeAll => 'Todo';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Faga clic en sons das rodas';

  @override
  String get splitScreenSettingTitle => 'Modo de pantalla dividida';

  @override
  String get touchSoundsDialogTitle => 'Toca sons';

  @override
  String get touchSoundsDialogContent => 'Activa os sons táctiles desde a configuración do sistema para escoitar os sons da roda de clic';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'Mostrar tutorial';

  @override
  String get changeDirectorySettingTitle => 'Cambiar directorio';

  @override
  String get donateSettingTitle => 'Doar';

  @override
  String get donateSettingDescription => 'Se che gusta esta aplicación, considere doar.';

  @override
  String get versionAboutScreenTitle => 'Versión';

  @override
  String get madeWithLoveTitle => 'Feito con ❤️ por';

  @override
  String get noMusicFilesFound => 'Sen música';

  @override
  String get noArtistsFound => 'Sen artistas';

  @override
  String get noAlbumsFound => 'Non hai álbums';

  @override
  String get unknownSong => 'Canción descoñecida';

  @override
  String get unknownArtist => 'Artista descoñecido';

  @override
  String get unknownAlbum => 'Álbum descoñecido';

  @override
  String get unknownGenre => 'Xénero descoñecido';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Sobre';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'Non se atopou a páxina dada';

  @override
  String get commonErrorText => 'Erro';

  @override
  String get retryButtonText => 'Intentar';

  @override
  String get filePickerDialogTitle => 'Selecciona un directorio para buscar a música';

  @override
  String get searchScreenTitle => 'Busca';

  @override
  String get searchEmptyText => 'Non hai resultados de busca';

  @override
  String get searchResultsText => 'Resultados de busca:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle => 'Desactivar a optimización da batería';

  @override
  String get disableBatteryOptimizationContent => 'Desactiva a optimización da batería para esta aplicación na configuración do dispositivo para permitir a reprodución de música de fondo.';

  @override
  String get languageScreenTitle => 'Idioma';

  @override
  String get silverDeviceColor => 'Prata';

  @override
  String get blackDeviceColor => 'Negro';

  @override
  String get resetSettingsTitle => 'Configuración de restablecemento';

  @override
  String get browseArtist => 'Examinar artista';

  @override
  String get browseAlbum => 'Album de navegación';

  @override
  String get cancelText => 'Cancelar';

  @override
  String get playlistsScreenTitle => 'Listas de reprodución';

  @override
  String get addToOnTheGoPlaylist => 'Engadir a on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Engade álbum a on-the';

  @override
  String get removeSongFromThePlaylist => 'Elimina da lista de reprodución';

  @override
  String get allAlbums => 'Todos os álbums';

  @override
  String get scanningMusicFiles => 'Analizar ficheiros de música';

  @override
  String get newPlaylist => 'Nova lista de reprodución';

  @override
  String get savePlaylist => 'Gardar a lista de reprodución';

  @override
  String get clearPlaylist => 'Lista de reprodución clara';

  @override
  String get rescanMusicFilesSettingTitle => 'Resan ficheiros de música';

  @override
  String get deviceControlMenuTutorialText => 'Mova o polgar lixeiramente ao redor da roda de clic para navegar polo menú';

  @override
  String get centerButtonMenuTutorialText => 'Prema o botón central para seleccionar o elemento do menú resaltado';

  @override
  String get playPauseMenuTutorialText => 'Preme este botón para reproducir ou pausa unha canción';

  @override
  String get nextButtonMenuTutorialText => 'Preme este botón para saltar á seguinte canción';

  @override
  String get previousButtonMenuTutorialText => 'Prema este botón para rebobinar ou volver á canción anterior';

  @override
  String get menuButtonTutorialText => 'Prema este botón para volver ao menú anterior. Podes premer e mantelo desde calquera outra pantalla para ir directamente ao menú principal.';

  @override
  String get deviceScreenMenuTutorialText => 'Esta é a pantalla de visualización. A pantalla táctil e o modo de pantalla dividida están habilitados de xeito predeterminado e pódense configurar máis na configuración.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Mova o dedo pulgar pola roda de clic para axustar o volume';

  @override
  String get centerButtonNowPlayingTutorialText => 'Pulse o botón central para percorrer a barra de busca, barra de lavadoiros e control deslizante. Prema e manteña o botón central para acceder a opcións adicionais.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Prema e manteña este botón para avanzar na canción';

  @override
  String get previousButtonNowPlayingTutorialText => 'Prema e manteña este botón para rebobinar a canción';

  @override
  String get deviceControlSearchTutorialText => 'Mova o polgar lixeiramente ao redor da roda de clic para resaltar un alfabeto';

  @override
  String get centerButtonSearchTutorialText => 'Prema o botón central para seleccionar o alfabeto resaltado';

  @override
  String get nextButtonSearchTutorialText => 'Preme este botón para engadir un espazo';

  @override
  String get previousButtonSearchTutorialText => 'Preme este botón para eliminar o último personaxe';

  @override
  String get menuButtonSearchTutorialText => 'Prema este botón para pechar o teclado e interactúa cos resultados da busca';
}
