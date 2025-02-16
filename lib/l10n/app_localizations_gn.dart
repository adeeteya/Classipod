// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Guarani (`gn`).
class AppLocalizationsGn extends AppLocalizations {
  AppLocalizationsGn([String locale = 'gn']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menú rehegua';

  @override
  String get audioAccessPermissionTitle => 'Oñeikotevẽ permiso ojeike hag̃ua audio rehegua';

  @override
  String get audioAccessPermissionContent => 'Eme’ẽmi umi archivo audio rehegua ikatu hag̃uáicha rembopu ore rembiapokue purahéi rehegua.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'audio jeike permiso oñenegava’ekue';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Eme’ẽ eme’ẽ hag̃ua umi archivo audio rehegua ko app-pe g̃uarã umi tembipuru’i ñembohekorãme ikatu hag̃uáicha roñembosarái ne mba’epu’apu’a.';

  @override
  String get menuScreenTitle => 'Menú rehegua';

  @override
  String get musicMenuScreenTitle => 'Mba\'epu';

  @override
  String get nowPlayingScreenTitle => 'Ko\'ágã oñembosarái';

  @override
  String get shuffleSongsMenuTitle => 'Purahéi ñemongu\'e';

  @override
  String get shuffleSettingTitle => 'shuffle';

  @override
  String get settingsScreenTitle => 'Ñe’ẽñemi';

  @override
  String get aboutScreenTitle => 'Upéva rehegua';

  @override
  String get coverFlowScreenTitle => 'Flujo de Cubierta rehegua';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Álbum-kuéra rehegua';

  @override
  String get songsScreenTitle => 'Purahéi';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Purahéi',
      one: '1 Purahéi',
      zero: 'Ndaipóri Purahéi',
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
      other: '$countString Álbum-kuéra',
      one: '1 Álbum rehegua',
      zero: 'Ndaipóri Álbum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Géneros rehegua';

  @override
  String get genreSongsScreenTitle => 'purahéi género rehegua';

  @override
  String get deviceColorSettingTitle => 'Dispositivo Color rehegua';

  @override
  String get touchScreenSettingTitle => 'Pantalla táctil rehegua oñembohapéva';

  @override
  String get repeatModeSettingTitle => 'Je\'ejey';

  @override
  String get repeatModeOne => 'Peteĩ';

  @override
  String get repeatModeAll => 'Opavave';

  @override
  String get vibrateSettingTitle => 'Vibración rehegua';

  @override
  String get clickWheelSettingTitle => 'Click Wheel Sounds';

  @override
  String get splitScreenSettingTitle => 'Modo pantalla dividida rehegua';

  @override
  String get touchSoundsDialogTitle => 'Umi tyapu toque rehegua';

  @override
  String get touchSoundsDialogContent => 'Emboguata umi tyapu táctil sistema ñemboheko guive ehendu hag̃ua umi tyapu Click Wheel rehegua';

  @override
  String get immersiveModeSettingTitle => 'Modo inmerso rehegua';

  @override
  String get showAppTutorialSettingTitle => 'Ohechauka mbo\'epy';

  @override
  String get changeDirectorySettingTitle => 'Omoambue Directorio';

  @override
  String get donateSettingTitle => 'Me\'ẽrei';

  @override
  String get donateSettingDescription => 'Oiméramo ndegusta ko app, por favor, econsidera donación.';

  @override
  String get versionAboutScreenTitle => 'Je\'eháicha';

  @override
  String get madeWithLoveTitle => 'Ojejapo ❤️ reheve';

  @override
  String get noMusicFilesFound => 'Ndaipóri Música';

  @override
  String get noArtistsFound => 'Ndaipóri artista';

  @override
  String get noAlbumsFound => 'Ndaipóri álbum';

  @override
  String get unknownSong => 'Purahéi ojekuaa\'ỹva';

  @override
  String get unknownArtist => 'Artista ndojekuaáiva';

  @override
  String get unknownAlbum => 'Álbum ndojekuaáiva';

  @override
  String get unknownGenre => 'Género ndojekuaáiva';

  @override
  String get buttonConfirmText => 'OĨMA';

  @override
  String get tileValueOn => 'Pe';

  @override
  String get tileValueOff => 'Oguehápe';

  @override
  String get commonOfText => 'gua';

  @override
  String get pageNotFoundText => 'Pe páhina oñemeʼẽva ndojejuhúi';

  @override
  String get commonErrorText => 'Jejavy';

  @override
  String get retryButtonText => 'oñeha’ã jey';

  @override
  String get filePickerDialogTitle => 'Eiporavo peteĩ kundaha reescanea hag̃ua mba’epu rehegua';

  @override
  String get searchScreenTitle => 'Jeheka';

  @override
  String get searchEmptyText => 'Ndaipóri resultado de búsqueda';

  @override
  String get searchResultsText => 'Resultados de búsqueda:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle => 'Ojedesactiva hagua batería optimización';

  @override
  String get disableBatteryOptimizationContent => 'Por favor, embogue optimización batería rehegua ko app-pe g̃uarã umi tembipuru ñembohekorãme ikatu hag̃uáicha rembopu tapykuehoha purahéi rehegua.';

  @override
  String get languageScreenTitle => 'Ñe\'ẽ';

  @override
  String get silverDeviceColor => 'Viru';

  @override
  String get blackDeviceColor => 'Hũ';

  @override
  String get resetSettingsTitle => 'Oñemohenda jey haguã';

  @override
  String get browseArtist => 'Eheka Artista';

  @override
  String get browseAlbum => 'Eheka Álbum';

  @override
  String get cancelText => 'Heja';

  @override
  String get playlistsScreenTitle => 'Lista de reproducción rehegua';

  @override
  String get addToOnTheGoPlaylist => 'Oñemoĩve On-the-Go-pe';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Oñemoĩve álbum-pe';

  @override
  String get removeSongFromThePlaylist => 'Ojepe’a pe lista de reproducción-gui';

  @override
  String get allAlbums => 'Opaite álbum';

  @override
  String get scanningMusicFiles => 'Escaneando archivos de música rehegua';

  @override
  String get newPlaylist => 'Lista de reproducción pyahu';

  @override
  String get savePlaylist => 'Ñongatu lista de reproducción rehegua';

  @override
  String get clearPlaylist => 'Lista de reproducción hesakãva';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivos de música rescan rehegua';

  @override
  String get deviceControlMenuTutorialText => 'Emoinge michĩmi nde poguasu pe rueda clic jerére reguata hag̃ua pe menúpe';

  @override
  String get centerButtonMenuTutorialText => 'Emboguapy pe botón mbytegua eiporavo hag̃ua pe elemento menúpegua ojehechaukáva';

  @override
  String get playPauseMenuTutorialText => 'Emboguapy ko botón rembopu térã repytuʼu hag̃ua peteĩ purahéi';

  @override
  String get nextButtonMenuTutorialText => 'Emboguejy ko botón resalta hag̃ua pe purahéi oúvape';

  @override
  String get previousButtonMenuTutorialText => 'Emboguapy ko botón rembojere hag̃ua térã reho jey hag̃ua purahéi mboyveguápe';

  @override
  String get menuButtonTutorialText => 'Emboguejy ko botón reho jey hag̃ua pe menú yma guarépe. Ikatu remboguejy ha reñongatu oimeraẽ ambue pantalla-gui reho hag̃ua directamente menú principal-pe.';

  @override
  String get deviceScreenMenuTutorialText => 'Kóva ha’e pe pantalla jehechaukarã. Pantalla táctil ha pantalla dividida modo oñembohapéva por defecto ha ikatu oñembohekove umi configuración-pe.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Emoinge nde pulgar pe rueda clic jerére remohenda hagua pe volumen';

  @override
  String get centerButtonNowPlayingTutorialText => 'Ojepyso pe botón centro ojejapo hagua ciclo barra de búsqueda rupive, barra de fregadora ha deslizador de baraja. Ojepyso ha ojejoko pe botón centro ojeike hag̃ua opciones adicionales-pe.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Emboguapy ha eñongatu ko botón rembohasa pya\'e hag̃ua purahéi';

  @override
  String get previousButtonNowPlayingTutorialText => 'Emboguejy ha eñongatu ko botón rembojere hag̃ua pe purahéi';

  @override
  String get deviceControlSearchTutorialText => 'Emoinge michĩmi nde poguasu pe rueda clic jerére rerresalta hag̃ua peteĩ alfabeto';

  @override
  String get centerButtonSearchTutorialText => 'Ojepyso pe botón mbytegua ojeporavo hag̃ua pe alfabeto ojerresaltáva';

  @override
  String get nextButtonSearchTutorialText => 'Emboguejy ko botón remoĩ hag̃ua peteĩ espacio';

  @override
  String get previousButtonSearchTutorialText => 'Emboguejy ko botón embogue hag̃ua pe karameg̃ua paha';

  @override
  String get menuButtonSearchTutorialText => 'Emboguejy ko botón emboty hag̃ua teclado ha eñembojoaju hag̃ua umi jeheka renda ndive';
}
