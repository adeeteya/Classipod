// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menú';

  @override
  String get audioAccessPermissionTitle =>
      'Permís d\'accés a l\'àudio necessari';

  @override
  String get audioAccessPermissionContent =>
      'Doneu accés als fitxers d\'àudio per permetre\'ns reproduir els vostres fitxers de música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'El permís d\'accés a l\'àudio denegat';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Doneu accés als fitxers d\'àudio per a aquesta aplicació a la configuració del dispositiu per permetre\'ns reproduir els vostres fitxers de música.';

  @override
  String get menuScreenTitle => 'Menú';

  @override
  String get musicMenuScreenTitle => 'Música';

  @override
  String get nowPlayingScreenTitle => 'Ara jugant';

  @override
  String get shuffleSongsMenuTitle => 'Cançons de barreja';

  @override
  String get shuffleSettingTitle => 'Barrejar';

  @override
  String get settingsScreenTitle => 'Configuració';

  @override
  String get aboutScreenTitle => 'Al voltant de';

  @override
  String get coverFlowScreenTitle => 'Flux de coberta';

  @override
  String get artistsScreenTitle => 'Artistes';

  @override
  String get albumsScreenTitle => 'Àlbums';

  @override
  String get songsScreenTitle => 'Cançons';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString cançons',
      one: '1 cançó',
      zero: 'no hi ha cançons',
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
      other: '$countString àlbums',
      one: '1 àlbum',
      zero: 'No hi ha àlbums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gèneres';

  @override
  String get genreSongsScreenTitle => 'Cançons de gènere';

  @override
  String get deviceColorSettingTitle => 'Color del dispositiu';

  @override
  String get touchScreenSettingTitle => 'Activa la pantalla tàctil';

  @override
  String get repeatModeSettingTitle => 'Repetir';

  @override
  String get repeatModeOne => 'U';

  @override
  String get repeatModeAll => 'Totes';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Feu clic a les rodes Sons';

  @override
  String get splitScreenSettingTitle => 'Mode de pantalla dividida';

  @override
  String get touchSoundsDialogTitle => 'Touch sons';

  @override
  String get touchSoundsDialogContent =>
      'Activeu els sons tàctils de la configuració del sistema per escoltar els sons de la roda del clic';

  @override
  String get immersiveModeSettingTitle => 'Mode immersiu';

  @override
  String get showAppTutorialSettingTitle => 'Mostra el tutorial';

  @override
  String get changeDirectorySettingTitle => 'Canvieu el directori';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription =>
      'Si us agrada aquesta aplicació, considereu la donació.';

  @override
  String get versionAboutScreenTitle => 'Versió';

  @override
  String get madeWithLoveTitle => 'Fet amb ❤️ per';

  @override
  String get noMusicFilesFound => 'Sense música';

  @override
  String get noArtistsFound => 'Sense artistes';

  @override
  String get noAlbumsFound => 'Sense àlbums';

  @override
  String get unknownSong => 'Cançó desconeguda';

  @override
  String get unknownArtist => 'Artista desconegut';

  @override
  String get unknownAlbum => 'Àlbum desconegut';

  @override
  String get unknownGenre => 'Gènere desconegut';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Al damunt de';

  @override
  String get tileValueOff => 'Apagada';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'La pàgina donada no es va trobar';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Tornar a ratllar';

  @override
  String get filePickerDialogTitle =>
      'Seleccioneu un directori per escanejar la música';

  @override
  String get searchScreenTitle => 'Buscar';

  @override
  String get searchEmptyText => 'Sense resultats de la cerca';

  @override
  String get searchResultsText => 'Resultats de la cerca:';

  @override
  String get resultsForText => 'Resultats de:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Desactiva l’optimització de la bateria';

  @override
  String get disableBatteryOptimizationContent =>
      'Desactiveu l’optimització de la bateria per a aquesta aplicació a la configuració del dispositiu per permetre la reproducció de fons de la música.';

  @override
  String get languageScreenTitle => 'Llengua';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Negre';

  @override
  String get resetSettingsTitle => 'Restableix la configuració';

  @override
  String get browseArtist => 'Artista de navegació';

  @override
  String get browseAlbum => 'Àlbum de navegació';

  @override
  String get cancelText => 'Cancel·lar';

  @override
  String get playlistsScreenTitle => 'Llistes de reproducció';

  @override
  String get addToOnTheGoPlaylist => 'Afegiu a la sortida';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Afegiu un àlbum a ON-THE-GO';

  @override
  String get removeSongFromThePlaylist =>
      'Traieu -la de la llista de reproducció';

  @override
  String get allAlbums => 'Tots els àlbums';

  @override
  String get scanningMusicFiles => 'Escaneig de fitxers de música';

  @override
  String get newPlaylist => 'Nova llista de reproducció';

  @override
  String get savePlaylist => 'Desar la llista de reproducció';

  @override
  String get clearPlaylist => 'Llista de reproducció clara';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan fitxers de música';

  @override
  String get deviceControlMenuTutorialText =>
      'Moveu el polze lleugerament al voltant de la roda de clic per navegar pel menú';

  @override
  String get centerButtonMenuTutorialText =>
      'Premeu el botó Centre per seleccionar l\'element del menú ressaltat';

  @override
  String get playPauseMenuTutorialText =>
      'Premeu aquest botó per reproduir o fer una pausa d\'una cançó';

  @override
  String get nextButtonMenuTutorialText =>
      'Premeu aquest botó per saltar -se a la cançó següent';

  @override
  String get previousButtonMenuTutorialText =>
      'Premeu aquest botó per rebobinar o tornar a la cançó anterior';

  @override
  String get menuButtonTutorialText =>
      'Premeu aquest botó per tornar al menú anterior. Podeu prémer i mantenir -lo mantingut des de qualsevol altra pantalla per anar directament al menú principal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Aquesta és la pantalla de visualització. La pantalla tàctil i el mode de pantalla dividida estan habilitats de manera predeterminada i es pot configurar més a la configuració.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Moveu el polze al voltant de la roda de clic per ajustar el volum';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Premeu el botó Centre per anar a través de la barra de cerca, la barra de fregament i el control lliscant. Manteniu premut el botó Centre per accedir a opcions addicionals.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Premeu i manteniu premut aquest botó per reenviar la cançó';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Premeu i manteniu premut aquest botó per rebobinar la cançó';

  @override
  String get deviceControlSearchTutorialText =>
      'Moveu el polze lleugerament al voltant de la roda de clic per ressaltar un alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Premeu el botó Centre per seleccionar l’alfabet ressaltat';

  @override
  String get nextButtonSearchTutorialText =>
      'Premeu aquest botó per afegir un espai';

  @override
  String get previousButtonSearchTutorialText =>
      'Premeu aquest botó per eliminar l\'últim personatge';

  @override
  String get menuButtonSearchTutorialText =>
      'Premeu aquest botó per tancar el teclat i interactuar amb els resultats de la cerca';

  @override
  String get allSongs => 'Totes les cançons';
}
