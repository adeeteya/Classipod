// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kekchí (`kek`).
class AppLocalizationsKek extends AppLocalizations {
  AppLocalizationsKek([String locale = 'kek']) : super(locale);

  @override
  String get appTitle => 'ClasdiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Xk’ulub’ankil li Audio Li na’ajmank .';

  @override
  String get audioAccessPermissionContent =>
      'B’aanu usilal, k’e reheb’ li archivo re li son re naq tooruuq chixb’ichankileb’ laa archivo re li son.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Xk’ulub’il li ok sa’ li Audio Denied .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'B’aanu usilal, k’e reheb’ li archivo re li son choq’ re li aplicación a’in sa’ li k’uub’anb’il na’leb’ re li k’anjeleb’aal re naq tooruuq chixb’ichankileb’ laa archivo re li son.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Son';

  @override
  String get nowPlayingScreenTitle => 'Anaqwan';

  @override
  String get shuffleSongsMenuTitle => 'B’ich re li b’atz’unk';

  @override
  String get shuffleSettingTitle => 'Rajom';

  @override
  String get settingsScreenTitle => 'Xwotzb’al';

  @override
  String get aboutScreenTitle => 'Sa\' xb\'een';

  @override
  String get coverFlowScreenTitle => 'Xnumsihom li tz’apleb’';

  @override
  String get artistsScreenTitle => 'Ebʼ laj bʼatzʼunel';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'B’ich re li b’ich';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Ebʼ li bʼich',
      one: '1 B\'ich',
      zero: 'Maak’a’eb’ li b’ich',
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
      other: '$countString Ebʼ li bʼichlebʼaal',
      one: '1 Li b\'ichleb\'aal',
      zero: 'Maak’a’eb’ li b’ichleb’aal',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Atinas';

  @override
  String get genreSongsScreenTitle => 'B’ich re li genre';

  @override
  String get deviceColorSettingTitle => 'Xb’onol li k’anjeleb’aal';

  @override
  String get touchScreenSettingTitle => 'Toch’b’il K’ab’a’ej Enabled .';

  @override
  String get repeatModeSettingTitle => 'Junsut';

  @override
  String get repeatModeOne => 'Jun';

  @override
  String get repeatModeAll => 'Chi xjunil';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'K’e li Sounds .';

  @override
  String get splitScreenSettingTitle => 'Modo de scripeen de split';

  @override
  String get touchSoundsDialogTitle => 'Yos';

  @override
  String get touchSoundsDialogContent => 'B’aanu usilal, Xk’eeb’al chi touch .';

  @override
  String get immersiveModeSettingTitle => 'Modo sub’e’k';

  @override
  String get showAppTutorialSettingTitle => 'Kʼut li seeraqʼ';

  @override
  String get changeDirectorySettingTitle => 'Xjalb’al li k’anjel';

  @override
  String get donateSettingTitle => 'Siib\'al';

  @override
  String get donateSettingDescription =>
      'Wi nawulak chawu li aplicación a’in, b’aanu usilal, k’oxla li tenq’ank.';

  @override
  String get versionAboutScreenTitle => 'Yeeman';

  @override
  String get madeWithLoveTitle => 'B’aanunb’il rik’in ❤️ rik’in .';

  @override
  String get noMusicFilesFound => 'Maak’a’ li Musiq’ej';

  @override
  String get noArtistsFound => 'Maajun Artistas';

  @override
  String get noAlbumsFound => 'Maak’a’eb’ li Albums';

  @override
  String get unknownSong => 'Xb’ichankil li ink’a’ nawb’il ru';

  @override
  String get unknownArtist => 'Artista ink’a’ nawb’il ru';

  @override
  String get unknownAlbum => 'Ink\'a\' nawb\'il Album';

  @override
  String get unknownGenre => 'Ink\'a\' nawb\'il ru Genre';

  @override
  String get buttonConfirmText => 'US';

  @override
  String get tileValueOn => 'Sa';

  @override
  String get tileValueOff => 'Re';

  @override
  String get commonOfText => 're';

  @override
  String get pageNotFoundText => 'Li perel k’eeb’il ink’a’ kitawman .';

  @override
  String get commonErrorText => 'Ka\'us el';

  @override
  String get retryButtonText => 'Xrankil';

  @override
  String get filePickerDialogTitle =>
      'Sik’ ru jun li Directory sa’ li Escena choq’ re li Musiq’ej .';

  @override
  String get searchScreenTitle => 'Sikok';

  @override
  String get searchEmptyText => 'Maak’a’ li Results .';

  @override
  String get searchResultsText => 'Xsik’b’al:';

  @override
  String get resultsForText => 'Lix k’ulub’il li:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Xsik’b’al li batería li ink’a’ naru xjalb’al .';

  @override
  String get disableBatteryOptimizationContent =>
      'B’aanu usilal, isi li optimización re li batería choq’ re li aplicación a’in sa’ li k’uub’anb’il na’leb’ re li k’anjeleb’aal re naq taawanq li b’atz’unk sa’ li b’ich.';

  @override
  String get languageScreenTitle => 'Atinobal';

  @override
  String get silverDeviceColor => 'Pek terto';

  @override
  String get blackDeviceColor => 'Qeq';

  @override
  String get resetSettingsTitle => 'Xk’uub’ankil li k’anjel';

  @override
  String get browseArtist => 'Chesikaq ru';

  @override
  String get browseAlbum => 'Tento naq';

  @override
  String get cancelText => 'Inka chik';

  @override
  String get playlistsScreenTitle => 'Eb’ li b’atz’unk';

  @override
  String get addToOnTheGoPlaylist => 'Xk’eeb’al sa’ On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Xk’eeb’al li Album sa’ On-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Isi chaq sa’ li Playlist .';

  @override
  String get allAlbums => 'Chixjunileb’ li Album';

  @override
  String get scanningMusicFiles => 'Eb’ li Archivos de Música escaneos';

  @override
  String get newPlaylist => 'Ak’ aj b’atz’unel';

  @override
  String get savePlaylist => 'Save Playlist';

  @override
  String get clearPlaylist => 'Ch’olch’o';

  @override
  String get rescanMusicFilesSettingTitle => 'Archivos de Música rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'K’am laa nim uq’ chi kok’ aj xsa’ sa’ xsutam li Wheel re xb’eresinkil li menú .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tat-ok sa’ li boton sa’ xyi re xsik’b’al ru li k’a’aq re ru re li menú li k’eeb’il xwankil .';

  @override
  String get playPauseMenuTutorialText =>
      'Taak’e li boton a’in re xb’ichankil malaj xk’eeb’al jun li b’ich .';

  @override
  String get nextButtonMenuTutorialText =>
      'Taak’e li boton a’in re xnumsinkil li jun chik b’ich .';

  @override
  String get previousButtonMenuTutorialText =>
      'Taak’e li boton a’in re naq tatsutq’iiq malaj tatsutq’iiq sa’ li b’ich li ak xnume’ .';

  @override
  String get menuButtonTutorialText =>
      'Tat-ok sa’ li boton a’in re sutq’iik sa’ li menú li ak wan chaq. Naru taapitz’ ut taachap sa’ yalaq chik li pantalla re naq tatxik chi tiik sa’ li menú principal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'A’an a’in li pantalla re li k’utb’esink. Li Modo de Screen Screen ut Split re li toch’olal neke’k’eeman chi k’anjelak chi k’uub’anb’il ut naru neke’k’uub’aman chi us sa’ li k’uub’anb’il na’leb’.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'K’am laa nim uq’ sa’ xsutam li Rueda de Click re xjalb’al li xyaab’ kuxej .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tat-ok sa’ li boton re li Centro re naq taa’ok sa’ li b’eleb’aal ch’iich’ sa’ li bar sik’b’il, li barra de scrubber ut li deslizador re li b’atz’unk. Tat-ok sa’ li boton re li Centro re naq taa’ok sa’ jalan chik li na’leb’.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Taqab’ ut chap li boton a’in re naq taa’ayuun chi us li b’ich .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Taqab’i ut chap li boton a’in re xk’eeb’al wi’chik li b’ich .';

  @override
  String get deviceControlSearchTutorialText =>
      'K’am laa nim uq’ chi kok’ aj xsa’ sa’ xsutam li Wheel Click re xk’eeb’al chi nawe’k jun li tz’iib’leb’ .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tat-ok sa’ li boton sa’ xyi re xsik’b’al ru li tz’iib’anb’il esil li k’eeb’il chi ilmank .';

  @override
  String get nextButtonSearchTutorialText =>
      'Taak’e li boton a’in re xk’eeb’al jun li na’ajej .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tat-ok sa’ li boton a’in re xsachb’al li roso’jik tz’iib’ .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tat-ok sa’ li boton a’in re xtz’apb’al li teclado ut chi wank sa’ komonil rik’in li sik’ok .';
}
