// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zapotec (`zap`).
class AppLocalizationsZap extends AppLocalizations {
  AppLocalizationsZap([String locale = 'zap']) : super(locale);

  @override
  String get appTitle => 'ClassiPod .';

  @override
  String get menuButtonText => 'MENÚ .';

  @override
  String get audioAccessPermissionTitle => 'Permisu de acceso audio ni caquiiñeʼ .';

  @override
  String get audioAccessPermissionContent => 'Bidii lugar chuʼ archivu de audio para ganda gucaadiágadu ca archivu stiʼ música stiluʼ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Acceso permisu negada';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Bidii lugar chuʼ archivu de audio para aplicación riʼ lu configuración stiʼ dispositivo ca para ganda gucaadiágadu ca archivu de música stiluʼ.';

  @override
  String get menuScreenTitle => 'Menú .';

  @override
  String get musicMenuScreenTitle => 'Saa';

  @override
  String get nowPlayingScreenTitle => 'Ora maʼ cayuundaluʼ .';

  @override
  String get shuffleSongsMenuTitle => 'Canción de chaffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Configuración .';

  @override
  String get aboutScreenTitle => 'De';

  @override
  String get coverFlowScreenTitle => 'Flujo de tapa';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Canción';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Canción',
      one: '1 Saa',
      zero: 'No canción',
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
      other: '$countString Álbum',
      one: '1 Álbum',
      zero: 'Cadi álbum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Género';

  @override
  String get genreSongsScreenTitle => 'Ca canción stiʼ Género';

  @override
  String get deviceColorSettingTitle => 'Color de dispositivo';

  @override
  String get touchScreenSettingTitle => 'Pantalla de toque ni zanda guicá .';

  @override
  String get repeatModeSettingTitle => 'Rusiropa';

  @override
  String get repeatModeOne => 'Tobi';

  @override
  String get repeatModeAll => 'Guirá';

  @override
  String get vibrateSettingTitle => 'Vibración';

  @override
  String get clickWheelSettingTitle => 'Biʼniʼ clic lu sonidu stiʼ Rueda .';

  @override
  String get splitScreenSettingTitle => 'Modo de pantalón split .';

  @override
  String get touchSoundsDialogTitle => 'Sonido toque .';

  @override
  String get touchSoundsDialogContent => 'Biʼniʼ activar sonidu Toque de ca configuración stiʼ sistema para gucaadiágaluʼ ca sonidu stiʼ rueda de clic .';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'Biluíʼ tutorial .';

  @override
  String get changeDirectorySettingTitle => 'Cambiu Directorio';

  @override
  String get donateSettingTitle => 'Rusiga\'de';

  @override
  String get donateSettingDescription => 'Pa riuuláʼdxiluʼ aplicación riʼ, biiyaʼ pa zanda gudiiluʼ donación.';

  @override
  String get versionAboutScreenTitle => 'Versión';

  @override
  String get madeWithLoveTitle => 'Bizáʼcabe ni né ❤️ pur .';

  @override
  String get noMusicFilesFound => 'Cadi música';

  @override
  String get noArtistsFound => 'Nin ca artista';

  @override
  String get noAlbumsFound => 'Cadi Álbu .';

  @override
  String get unknownSong => 'Canción ni qué runibiaʼnu .';

  @override
  String get unknownArtist => 'Artista ni qué runibiaʼnu';

  @override
  String get unknownAlbum => 'Album ni qué runibiáʼ binni .';

  @override
  String get unknownGenre => 'Género ni qué runibiaʼnu .';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Lu';

  @override
  String get tileValueOff => 'Bisui';

  @override
  String get commonOfText => 'sti';

  @override
  String get pageNotFoundText => 'Maʼ bidxélacabe yaza ni bidiicabe .';

  @override
  String get commonErrorText => 'Ruchee';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle => 'Bicaa ti directoriu para gucaaluʼ música .';

  @override
  String get searchScreenTitle => 'Ruyubi';

  @override
  String get searchEmptyText => 'No Resultados de búsqueda .';

  @override
  String get searchResultsText => 'Resultados de búsqueda:';

  @override
  String get resultsForText => 'Resultadu para:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimización de batería desactivar';

  @override
  String get disableBatteryOptimizationContent => 'Biʼniʼ desactivar optimización de batería para aplicación riʼ lu ca configuración stiʼ dispositivo ca para ganda guiree música lu fondo stiʼ música.';

  @override
  String get languageScreenTitle => 'Diidxa';

  @override
  String get silverDeviceColor => 'Plataforma';

  @override
  String get blackDeviceColor => 'Nayaase';

  @override
  String get resetSettingsTitle => 'Restablecer configuración .';

  @override
  String get browseArtist => 'Biiyaʼ Artista';

  @override
  String get browseAlbum => 'Biiyaʼ Album';

  @override
  String get cancelText => 'runi cancelar';

  @override
  String get playlistsScreenTitle => 'Lista de reproducción';

  @override
  String get addToOnTheGoPlaylist => 'Bicaa lu On-La-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Bicaa Album lu On-Las .';

  @override
  String get removeSongFromThePlaylist => 'Biree de lu lista de reproducción .';

  @override
  String get allAlbums => 'Guiráʼ Album';

  @override
  String get scanningMusicFiles => 'Biʼniʼ escanear ca archivu de música';

  @override
  String get newPlaylist => 'Lista de reproducción cubi';

  @override
  String get savePlaylist => 'Guluu lista de reproducción .';

  @override
  String get clearPlaylist => 'Lista de reproducción limpia';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivo de música rescana';

  @override
  String get deviceControlMenuTutorialText => 'Bicaa pulgar stiluʼ ti ratuhuiiniʼ guidubi vuelta de Rueda de Click para gúʼyaluʼ menú .';

  @override
  String get centerButtonMenuTutorialText => 'Biʼniʼ clic lu botón central para cuiluʼ ni cá lu menú ni maʼ guca resaltar .';

  @override
  String get playPauseMenuTutorialText => 'Biʼniʼ clic lu botón riʼ para gucaaluʼ o gucueezaluʼ ti canción .';

  @override
  String get nextButtonMenuTutorialText => 'Biʼniʼ clic lu botón riʼ para guireeluʼ lu sti canción .';

  @override
  String get previousButtonMenuTutorialText => 'Biʼniʼ clic lu botón riʼ para guni rebobinarluʼ o guibiguétaluʼ lu canción ni guyuu ante .';

  @override
  String get menuButtonTutorialText => 'Biʼniʼ clic lu botón riʼ para guibiguétaluʼ lu menú ni guyuu ante. Zanda gucaaluʼ ni ne gucaaluʼ ni de sti pantalla para cheluʼ directu lu menú principal.';

  @override
  String get deviceScreenMenuTutorialText => 'Ndiʼ nga pantalla stiʼ pantalla. Pantalla toque ne Modo de Pantalla de Disparo ca raca activar cani pur defectu ne zanda gaca configurar cani jma lu ca configuración.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Bicaa pulgar stiluʼ guidubi vuelta de Rueda Click para ganda guchaaluʼ volumen stini .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Biʼniʼ clic lu botón Centru para gúniluʼ ciclo lu barra de búsqueda, barra de fregadero ne deslizador de rechazo. Biʼniʼ clic lu botón Centru para ganda guidxélaluʼ xcaadxi opción.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Biʼniʼ presionar botón riʼ para ganda guiree canción ca nagueendaca .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Biʼniʼ presionar ne biʼniʼ recabar botón riʼ para guni rebobinar canción ca .';

  @override
  String get deviceControlSearchTutorialText => 'Bicaa pulgar stiluʼ ti ratuhuiiniʼ guidubi vuelta de Rueda Click para gusihuínniluʼ ti abecedariu .';

  @override
  String get centerButtonSearchTutorialText => 'Biʼniʼ clic lu botón central para cuiluʼ abecedariu ni maʼ bihuinni .';

  @override
  String get nextButtonSearchTutorialText => 'Biʼniʼ clic lu botón riʼ para ganda gucaaluʼ ti lugar .';

  @override
  String get previousButtonSearchTutorialText => 'Biʼniʼ clic lu botón riʼ para gucaaluʼ últimu carácter .';

  @override
  String get menuButtonSearchTutorialText => 'Biʼniʼ presionar botón riʼ para guseeguʼ tecladu ne guni interactuar né ca resultadu stiʼ búsqueda .';
}
