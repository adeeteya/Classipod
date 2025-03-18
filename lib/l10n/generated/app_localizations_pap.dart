// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Papiamento (`pap`).
class AppLocalizationsPap extends AppLocalizations {
  AppLocalizationsPap([String locale = 'pap']) : super(locale);

  @override
  String get appTitle => 'KlassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Permiso di Acceso di Audio Rekeri';

  @override
  String get audioAccessPermissionContent =>
      'Por fabor duna audio archivonan di akseso pa permití nos toka bo archivonan di músika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Permiso di Acceso di Audio Nenga';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Por fabor duna audio archivonan akseso pa e app aki den e settings di aparato pa permití nos toka bo archivonan di músika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Músika';

  @override
  String get nowPlayingScreenTitle => 'Awor ta hungando';

  @override
  String get shuffleSongsMenuTitle => 'Canticanan di shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Konfigurashonnan';

  @override
  String get aboutScreenTitle => 'Tokante';

  @override
  String get coverFlowScreenTitle => 'Cubri Fluho';

  @override
  String get artistsScreenTitle => 'Artistanan';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Kantikanan';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Kantikanan',
      one: '1 Kantika',
      zero: 'No tin Kantika',
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
      other: '$countString Albumnan',
      one: '1 Album',
      zero: 'No tin álbum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'generonan';

  @override
  String get genreSongsScreenTitle => 'Canticanan di genero';

  @override
  String get deviceColorSettingTitle => 'Koló di aparato';

  @override
  String get touchScreenSettingTitle => 'Pantalla di toke Habilitá';

  @override
  String get repeatModeSettingTitle => 'Hasi di nobo';

  @override
  String get repeatModeOne => 'Unu';

  @override
  String get repeatModeAll => 'Tur';

  @override
  String get vibrateSettingTitle => 'Vibra';

  @override
  String get clickWheelSettingTitle => 'Klik riba Soundnan di Wiel';

  @override
  String get splitScreenSettingTitle => 'Modo di Pantalla Split';

  @override
  String get touchSoundsDialogTitle => 'Toca Zonido';

  @override
  String get touchSoundsDialogContent =>
      'Por fabor Habilitá Sonidonan di Toke for di Settings di Sistema pa tende e wiel di klik ta zona .';

  @override
  String get immersiveModeSettingTitle => 'Modo inmersivo';

  @override
  String get showAppTutorialSettingTitle => 'Mustra Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Direktorio di Kambio';

  @override
  String get donateSettingTitle => 'Hasi donashon';

  @override
  String get donateSettingDescription =>
      'Si bo ta gusta e app aki, por fabor konsiderá hasi donashon.';

  @override
  String get versionAboutScreenTitle => 'Vershon';

  @override
  String get madeWithLoveTitle => 'Traha ku ❤️ pa';

  @override
  String get noMusicFilesFound => 'No tin Músika';

  @override
  String get noArtistsFound => 'No tin Artista';

  @override
  String get noAlbumsFound => 'No tin Album';

  @override
  String get unknownSong => 'Cancion Desconoci';

  @override
  String get unknownArtist => 'Artista Desconoci';

  @override
  String get unknownAlbum => 'Desconoci Album .';

  @override
  String get unknownGenre => 'Genero Desconoci';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Riba';

  @override
  String get tileValueOff => 'Pagá';

  @override
  String get commonOfText => 'òf';

  @override
  String get pageNotFoundText => 'E pagina duna no a wordo haya .';

  @override
  String get commonErrorText => 'Eror';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle => 'Selektá un Direktorio pa Scan pa Músika';

  @override
  String get searchScreenTitle => 'Buska';

  @override
  String get searchEmptyText => 'No tin Resultadonan di Buskamentu';

  @override
  String get searchResultsText => 'Resultadonan di Busca:';

  @override
  String get resultsForText => 'Resultadonan pa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Deshabilitá Optimalisashon di Bateria';

  @override
  String get disableBatteryOptimizationContent =>
      'Por fabor deshabilitá optimalisashon di bateria pa e app aki den e settingnan di aparato pa permití reprodukshon di fondo di músika.';

  @override
  String get languageScreenTitle => 'Idioma';

  @override
  String get silverDeviceColor => 'Plata';

  @override
  String get blackDeviceColor => 'Pretu';

  @override
  String get resetSettingsTitle => 'Reset Konfigurashonnan';

  @override
  String get browseArtist => 'Artista di Buska';

  @override
  String get browseAlbum => 'Bum di Bum';

  @override
  String get cancelText => 'Kanselá';

  @override
  String get playlistsScreenTitle => 'Lista';

  @override
  String get addToOnTheGoPlaylist => 'Agregá na On-E-Bai';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Agregá Album na On-E-Bai';

  @override
  String get removeSongFromThePlaylist => 'Retira for di e Playlist';

  @override
  String get allAlbums => 'Tur Album';

  @override
  String get scanningMusicFiles => 'Archivonan di Músika di Skan';

  @override
  String get newPlaylist => 'Lista di Play';

  @override
  String get savePlaylist => 'Lista di Spaar Play';

  @override
  String get clearPlaylist => 'Lista di Play';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivonan di Músika di Reskan';

  @override
  String get deviceControlMenuTutorialText =>
      'Move bo duim lihé rònt di e Wiel di Klik pa nabegá e menú .';

  @override
  String get centerButtonMenuTutorialText =>
      'Druk riba e boton di sentro pa selektá e artíkulo di menú resaltá';

  @override
  String get playPauseMenuTutorialText =>
      'Dòbel e boton aki pa toka òf pausa un kantika';

  @override
  String get nextButtonMenuTutorialText =>
      'Druk e boton aki pa salta pa e siguiente kantika';

  @override
  String get previousButtonMenuTutorialText =>
      'Druk e boton aki pa rewind of bay bek na e cantica anterior .';

  @override
  String get menuButtonTutorialText =>
      'Dòbel e boton aki pa bai bèk na e menú anterior. Bo por primi i tene esaki for di kualke otro pantaya pa direktamente bai na e menú prinsipal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Esaki ta e pantaya di display. Pantalla di Toke y Modo di Pantalla Split ta wordo habilita pa default y por wordo configura mas den e configuracionnan.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Move bo duim rònt di e Wiel Klik pa ahusta e volúmen .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Druk riba e boton di Centro pa ciclo door di busca bar, scrubber bar y slider di shuffle. Prensa y tene e boton Centro pa haya acceso na opcionnan adicional.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Prensa y tene e boton aki pa bo yuna e cancion .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Prensa y tene e boton aki pa rewind e cantica .';

  @override
  String get deviceControlSearchTutorialText =>
      'Move bo duim lihé rònt di e Wiel di Klik pa resaltá un alfabèt .';

  @override
  String get centerButtonSearchTutorialText =>
      'Druk riba e boton di sentro pa selektá e alfabet resaltá';

  @override
  String get nextButtonSearchTutorialText =>
      'Dòbel e boton aki pa añadí un espasio .';

  @override
  String get previousButtonSearchTutorialText =>
      'Dòbel e boton aki pa eliminá e último personahe .';

  @override
  String get menuButtonSearchTutorialText =>
      'Druk e boton aki pa sera e teclado i interakshoná ku e resultadonan di búskeda .';

  @override
  String get allSongs => 'Tur Kantika .';
}
