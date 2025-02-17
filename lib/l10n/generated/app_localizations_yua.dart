// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yucateco Yucatec Maya (`yua`).
class AppLocalizationsYua extends AppLocalizations {
  AppLocalizationsYua([String locale = 'yua']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio muuk\' Permiso K\'a\'abéet';

  @override
  String get audioAccessPermissionContent =>
      'Béet conceder audio archivos muuk\' utia\'al permitir k reproducir u archivos paax.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio muuk\' Permiso Deneed';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Béet conceder archivos muuk\' archivos utia\'al le ka\'anatako\'ob ti\' le configuración le dispositivo utia\'al u permitir k reproducir u archivos paax.';

  @override
  String get menuScreenTitle => 'Menú';

  @override
  String get musicMenuScreenTitle => 'Páax';

  @override
  String get nowPlayingScreenTitle => 'Bejla\'e\' báaxal';

  @override
  String get shuffleSongsMenuTitle => 'K\'aayo\'ob Shuffle';

  @override
  String get shuffleSettingTitle => 'Azafate';

  @override
  String get settingsScreenTitle => 'Configuración';

  @override
  String get aboutScreenTitle => 'Yo\'osal';

  @override
  String get coverFlowScreenTitle => 'Cubierta Flujo';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Álbums';

  @override
  String get songsScreenTitle => 'K\'aayo\'ob';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString k\'aayo\'ob',
      one: '1 K\'aay',
      zero: 'Mina\'an k\'aayo\'ob',
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
      one: '1 Álbum',
      zero: 'Mina\'an álbumes',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Géneros';

  @override
  String get genreSongsScreenTitle => 'K\'aayo\'ob Género';

  @override
  String get deviceColorSettingTitle => 'Boonil dispositivo';

  @override
  String get touchScreenSettingTitle => 'Pantalla u toque Habilitado';

  @override
  String get repeatModeSettingTitle => 'Núuk';

  @override
  String get repeatModeOne => 'Jun';

  @override
  String get repeatModeAll => 'Tuláakal';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Mentik clic ti\' sonidos Balk\'es';

  @override
  String get splitScreenSettingTitle => 'Modo u pantalla u ja\'atsal';

  @override
  String get touchSoundsDialogTitle => 'Touch juum';

  @override
  String get touchSoundsDialogContent =>
      'Béet Habilitar sonidos toque u Configuración t.u.m utia\'al u yu\'ubik le sonidos t\'íinche\'balak\' clic';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'We\'esik tutorial';

  @override
  String get changeDirectorySettingTitle => 'Directorio u k\'eexpajal';

  @override
  String get donateSettingTitle => 'Ts\'áaj áantaj';

  @override
  String get donateSettingDescription =>
      'Wa uts a wilik le ka\'anatako\'ob, Béet considere donar.';

  @override
  String get versionAboutScreenTitle => 'Bersion';

  @override
  String get madeWithLoveTitle => 'Meentik yéetel ❤️ tumen';

  @override
  String get noMusicFilesFound => 'Ma\' paax';

  @override
  String get noArtistsFound => 'Ma\' Artistas';

  @override
  String get noAlbumsFound => 'Ma\' Albomos';

  @override
  String get unknownSong => 'K\'aay desconocido';

  @override
  String get unknownArtist => 'Artista desconocido';

  @override
  String get unknownAlbum => 'Álbum desconocido';

  @override
  String get unknownGenre => 'Género desconocido';

  @override
  String get buttonConfirmText => 'MA\'ALOB';

  @override
  String get tileValueOn => 'Yóok\'ol';

  @override
  String get tileValueOff => 'Tuupul';

  @override
  String get commonOfText => 'ti\'';

  @override
  String get pageNotFoundText =>
      'Le linki abas kaambal dada ma\' bin encontrada';

  @override
  String get commonErrorText => 'K\'aas';

  @override
  String get retryButtonText => 'K\'a\' intentar';

  @override
  String get filePickerDialogTitle =>
      'Seleccione jump\'éel Directorio utia\'al u escanear utia\'al u paax';

  @override
  String get searchScreenTitle => 'Kaxan';

  @override
  String get searchEmptyText =>
      'Ma\' Ya\'ala\'al máaxo\'ob máano\'ob xookilo\'';

  @override
  String get searchResultsText => 'Ya\'ala\'al máaxo\'ob máano\'ob xookilo\':';

  @override
  String get resultsForText => 'Ya\'ala\'al máaxo\'ob máano\'ob utia\'al u:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Desactivar u optimización le batería';

  @override
  String get disableBatteryOptimizationContent =>
      'Much desactivar optimización le batería utia\'al le ka\'anatako\'ob ti\' le configuración le dispositivo utia\'al u permitir u ju\'unil tu\'ux yaan u kuxtal kajnáalo\'ob le paaxo\'.';

  @override
  String get languageScreenTitle => 'T\'aan';

  @override
  String get silverDeviceColor => 'Ta\' uj';

  @override
  String get blackDeviceColor => 'Boox';

  @override
  String get resetSettingsTitle => 'Restablecer Configuración';

  @override
  String get browseArtist => 'Navegar artista';

  @override
  String get browseAlbum => 'Navegar u álbum';

  @override
  String get cancelText => 'káanselar';

  @override
  String get playlistsScreenTitle => 'Listas u kuxtal kajnáalo\'ob';

  @override
  String get addToOnTheGoPlaylist => 'Añadir ti\' On-Le-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Añadir álbum ti\' On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Retire ti\' le lista Play';

  @override
  String get allAlbums => 'Tuláakal le álbumes';

  @override
  String get scanningMusicFiles => 'Exploración u Archivos u paax';

  @override
  String get newPlaylist => 'Túumben tsoolol kuxtal kajnáalo\'ob';

  @override
  String get savePlaylist => 'Ahorrar lista u kuxtal kajnáalo\'ob';

  @override
  String get clearPlaylist => 'Bola jul u tsoolol kuxtal kajnáalo\'ob';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivos u paax rescano';

  @override
  String get deviceControlMenuTutorialText =>
      'Péeksik u pulgar ligeramente mentik kex le Brededor Balk\'es utia\'al u navegar le menú';

  @override
  String get centerButtonMenuTutorialText =>
      'Pulse le botón chúumukil utia\'al u seleccionar le elemento menú resaltado';

  @override
  String get playPauseMenuTutorialText =>
      'Presione le botón utia\'al báaxal wa pausar jump\'éel k\'aay';

  @override
  String get nextButtonMenuTutorialText =>
      'Presione le botón utia\'al u saltar ti\' le uláak\' k\'aayo\'';

  @override
  String get previousButtonMenuTutorialText =>
      'Presione le botón utia\'al u rebobinar wa k\'a\' le k\'aayo\' anterior';

  @override
  String get menuButtonTutorialText =>
      'Presione le botón utia\'al u suut ti\' le menú anterior. Podrías pulsar yéetel sostenga tak je\'el ba\'ax uláak\' pantalla utia\'al u Jun bin le menú noj bejo\'.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Lela\' le pantalla ye\'esik. Pantalla táctil yéetel Modo pantalla splien táan habilitados tumen defecto yéetel je\'el u páajtal u configurado asab ti\' le ajustes.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Péeksik u pulgar mentik kex le Brecho Balk\'es utia\'al u ajustar le volumen';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Presione le botón Centro u ciclo yo\'osal kaxtik barra, barra matorcha yéetel deslizante baraja. Presione yéetel mantenga pulsado le botón Centro utia\'al tsáabaltio\'ob áantaj opciones adicionales.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Presione yéetel mantenga pulsado le botón utia\'al u ayunar táanil le k\'aayo\'';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Presione yéetel mantenga pulsado le botón utia\'al u rebobinar le k\'aayo\'';

  @override
  String get deviceControlSearchTutorialText =>
      'Péeksik u pulgar ligeramente mentik kex le Brija Click utia\'al u resaltar jump\'éel alfabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Pulse le botón chúumukil utia\'al u seleccionar le alfabeto resaltado';

  @override
  String get nextButtonSearchTutorialText =>
      'Presione le botón utia\'al u ts\'áabal jump\'éel kúuchil';

  @override
  String get previousButtonSearchTutorialText =>
      'Presione le botón utia\'al u borrar le ts\'ook personaje';

  @override
  String get menuButtonSearchTutorialText =>
      'Presione le botón utia\'al u k\'áalal le teclado yéetel interactuar yéetel ya\'ala\'al máaxo\'ob máano\'ob le xookilo\'';
}
