// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Eastern Huasteca Nahuatl (`nhe`).
class AppLocalizationsNhe extends AppLocalizations {
  AppLocalizationsNhe([String locale = 'nhe']) : super(locale);

  @override
  String get appTitle => 'ClasePod';

  @override
  String get menuButtonText => 'MENI';

  @override
  String get audioAccessPermissionTitle => 'Audio Acceso Permiso tlen monequi';

  @override
  String get audioAccessPermissionContent =>
      'Xijmaka archivos tlen audio ma techkaua ma tijtsontekontlalikaj nopa archivos tlen música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Acceso Permiso Denicio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Xijmaka archivos tlen audio ipan ni aplicación ipan nopa teposme tlen eltok ipan nopa dispositivo para ma tijtsontekontlalikaj nopa archivos tlen música.';

  @override
  String get menuScreenTitle => 'Mensa';

  @override
  String get musicMenuScreenTitle => 'Tlatsotsonalistli';

  @override
  String get nowPlayingScreenTitle => 'Amantsi tlachiua';

  @override
  String get shuffleSongsMenuTitle => 'Tlajtoli tlen Shuffle';

  @override
  String get shuffleSettingTitle => 'kuaka';

  @override
  String get settingsScreenTitle => 'lakya';

  @override
  String get aboutScreenTitle => 'Tlen tlachke';

  @override
  String get coverFlowScreenTitle => 'taxkali';

  @override
  String get artistsScreenTitle => 'Tlachichitiani';

  @override
  String get albumsScreenTitle => 'Alquillaje';

  @override
  String get songsScreenTitle => 'uikatiali';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tlatsotsonali',
      one: '1 Tlauikali',
      zero: 'Ax onka tlatsotsonali',
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
      zero: 'Ax onka álbumes',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'genes';

  @override
  String get genreSongsScreenTitle => 'Género Canciones';

  @override
  String get deviceColorSettingTitle => 'Tlamantli';

  @override
  String get touchScreenSettingTitle => 'Tlamantli tlen nesi ipan pantalla.';

  @override
  String get repeatModeSettingTitle => 'Sampayanok';

  @override
  String get repeatModeOne => 'Se';

  @override
  String get repeatModeAll => 'Nochimej';

  @override
  String get vibrateSettingTitle => 'Xitlatlani';

  @override
  String get clickWheelSettingTitle => 'Xijchiua clic ipan ruedas';

  @override
  String get splitScreenSettingTitle => 'Tlajtlanili tlen nopa pantalla';

  @override
  String get touchSoundsDialogTitle => 'Techmaka';

  @override
  String get touchSoundsDialogContent => 'Xijchiua se favor.';

  @override
  String get immersiveModeSettingTitle => 'Modelo importido';

  @override
  String get showAppTutorialSettingTitle => 'Xijnexti tlamachtili';

  @override
  String get changeDirectorySettingTitle => 'Tlapatlalistli Directory';

  @override
  String get donateSettingTitle => 'Temaktia';

  @override
  String get donateSettingDescription =>
      'Tlaj tijneki ni aplicación, ximoiljui tijmakas tomij.';

  @override
  String get versionAboutScreenTitle => 'Mokamanalis';

  @override
  String get madeWithLoveTitle => 'Quichijtoque ica ❤️ por';

  @override
  String get noMusicFilesFound => 'amo música';

  @override
  String get noArtistsFound => 'Niyolijtok se tlamachtili';

  @override
  String get noAlbumsFound => 'amo albañas';

  @override
  String get unknownSong => 'ntsi';

  @override
  String get unknownArtist => 'Arnista tlen amo moixmati';

  @override
  String get unknownAlbum => 'ajkakki Album';

  @override
  String get unknownGenre => 'Género tlen ax tijmatij';

  @override
  String get buttonConfirmText => 'KUALI';

  @override
  String get tileValueOn => 'Tlen';

  @override
  String get tileValueOff => 'Sejtok';

  @override
  String get commonOfText => 'in';

  @override
  String get pageNotFoundText => 'Nopa página tlen kimakakej amo kipantik .';

  @override
  String get commonErrorText => 'Kuapololi';

  @override
  String get retryButtonText => 'ixtlalis';

  @override
  String get filePickerDialogTitle =>
      'Xijtlapejpeni se Dirección para Escán para Music .';

  @override
  String get searchScreenTitle => 'Temoli';

  @override
  String get searchEmptyText => 'Amo onka Resultados tlen Tlatemolistli';

  @override
  String get searchResultsText => 'Tlatemolistli tlen tlatemoli:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Nopa tlamantli tlen ax hueli tijtzacuas nopa batería';

  @override
  String get disableBatteryOptimizationContent =>
      'Xijtlajtlanica para ma mocualtlali nopa batería para ni app ipan nopa tlayejyecoli tlen nopa dispositivo para ma onca se tlanextili tlen nopa tlatzotzonali.';

  @override
  String get languageScreenTitle => 'Tlajtoli';

  @override
  String get silverDeviceColor => 'Istateokuauitl';

  @override
  String get blackDeviceColor => 'Yayauik';

  @override
  String get resetSettingsTitle => 'tlapouali';

  @override
  String get browseArtist => 'Astrón Art Dios';

  @override
  String get browseAlbum => 'Xijtemo nopa álbum';

  @override
  String get cancelText => 'tlatiluauani';

  @override
  String get playlistsScreenTitle => 'tlatzotzonali';

  @override
  String get addToOnTheGoPlaylist => 'Xijtlali ipan On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Xijtlali Album ipan On-Go .';

  @override
  String get removeSongFromThePlaylist => 'Xijkixti tlen nopa Lista de Playa';

  @override
  String get allAlbums => 'Nochi nopa albumsas';

  @override
  String get scanningMusicFiles => 'Tlamantli tlen itoca “Aquillas de música”';

  @override
  String get newPlaylist => 'yankuik lista tlen yankuik';

  @override
  String get savePlaylist => 'Save linerista';

  @override
  String get clearPlaylist => 'Tlapajtli';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Nopa archivos tlen Música de rescate';

  @override
  String get deviceControlMenuTutorialText =>
      'Xijpatla mometz san pilquentzi ipan nopa rueda tlen itoca Clic para tijnejnemiltis nopa menú .';

  @override
  String get centerButtonMenuTutorialText =>
      'Xijtlatzquiltili nopa botón tlen tlatlajco para tijtlapejpenis nopa tlamantli tlen nopa menú tlen eltoc .';

  @override
  String get playPauseMenuTutorialText =>
      'Xijtlatzquiltili ni botón para tijtzotzonas o tijquetzas se huicatl .';

  @override
  String get nextButtonMenuTutorialText =>
      'Xijtlatzquiltili ni botón para tijpanoltis nopa seyoc huicatl .';

  @override
  String get previousButtonMenuTutorialText =>
      'Xijtlatzquiltili ni botón para timocuepas o ximocuepa ipan nopa huicatl tlen achtohui .';

  @override
  String get menuButtonTutorialText =>
      'Xijtlatzquiltili ni botón para sampa tiyas ipan nopa menú tlen achtohui. Uelis tijtsonpechilis uan tijtsakuas tlen seyok pantalla uan xiya ipan nopa menú tlen tlauel ipati.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ni eli nopa pantalla tlen kinextia. Nopa Modelo tlen nopa pantalla tlen itoka Touch uan nopa Modo Splecre Spcreen, kipaleuia nopa tlamantli tlen amo kuali uan uelis mosentlalis más ipan nopa tlamantli tlen kitlaliaj.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Xijpatla mometz ipan nopa Bruja Clic para ma eli nopa volumen .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Xijtlatzquiltili nopa botón tlen nopa Centro ipan ciclo ica barra tlen tijtemos, barra tlen escrubador huan nopa slider tlen motlalana. Xijtlapejpeni uan xijpixto nopa botón Centro para tijpantis sekinok tlamantli.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Xijtlatzquiltili huan xijpixto ni botón para tijtoquilis nopa huicatl .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Xijtsonpechili uan xijpixto ni botón para tijkuepilis nopa uikatl .';

  @override
  String get deviceControlSearchTutorialText =>
      'Xijpatla mometz san pilquentzi campa hueli ipan nopa rueda Click para tijnextis se alfabeto .';

  @override
  String get centerButtonSearchTutorialText =>
      'Xijtlatzquiltili nopa botón tlen tlatlajco para tijtlapejpenis nopa alfabeto tlen más nesi .';

  @override
  String get nextButtonSearchTutorialText =>
      'Xijtlatzquiltili ni botón para tijtlalis se lugar .';

  @override
  String get previousButtonSearchTutorialText =>
      'Xijtlachili ni botón para tijtlamiltis nopa último personaje';

  @override
  String get menuButtonSearchTutorialText =>
      'Xijtlatzquiltili ni botón para tijtzacuas nopa teclado huan ximocamahui ica nopa tlayejyecoli tlen tijtemos .';

  @override
  String get allSongs => 'Nochi huicalistli';
}
