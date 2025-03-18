// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latin (`la`).
class AppLocalizationsLa extends AppLocalizations {
  AppLocalizationsLa([String locale = 'la']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Audio obvius permission required';

  @override
  String get audioAccessPermissionContent =>
      'Quaeso concessione audio files aditus ut sino nobis ludere vestri musica files.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio obvius permission negavit';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Quaeso concessione audio files aditum hoc app in fabrica occasus ut liceat nobis ludere vestri musica files.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musica';

  @override
  String get nowPlayingScreenTitle => 'Nunc ludens';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle carminum';

  @override
  String get shuffleSettingTitle => 'TERGUM';

  @override
  String get settingsScreenTitle => 'Occasus';

  @override
  String get aboutScreenTitle => 'De';

  @override
  String get coverFlowScreenTitle => 'CREPO';

  @override
  String get artistsScreenTitle => 'Artists';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Carminum';

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
  String get genresScreenTitle => 'Genera';

  @override
  String get genreSongsScreenTitle => 'Genre carminum';

  @override
  String get deviceColorSettingTitle => 'COGNUM';

  @override
  String get touchScreenSettingTitle => 'Tactus screen enabled';

  @override
  String get repeatModeSettingTitle => 'Repetitor';

  @override
  String get repeatModeOne => 'Unus';

  @override
  String get repeatModeAll => 'Cunctis';

  @override
  String get vibrateSettingTitle => 'Vibro';

  @override
  String get clickWheelSettingTitle => 'Click rota sonos';

  @override
  String get splitScreenSettingTitle => 'Scinditur screen modus';

  @override
  String get touchSoundsDialogTitle => 'SINGULTO';

  @override
  String get touchSoundsDialogContent =>
      'Placere enable tactus sonos a ratio occasus ut audire click rota sonos';

  @override
  String get immersiveModeSettingTitle => 'Immersive modus';

  @override
  String get showAppTutorialSettingTitle => 'PRAETENDO';

  @override
  String get changeDirectorySettingTitle => 'Mutare Directory';

  @override
  String get donateSettingTitle => 'DONO';

  @override
  String get donateSettingDescription =>
      'Si vis hoc app, placere consideramus donando.';

  @override
  String get versionAboutScreenTitle => 'Verso';

  @override
  String get madeWithLoveTitle => 'Cum ❤️ per';

  @override
  String get noMusicFilesFound => 'Non musica';

  @override
  String get noArtistsFound => 'Nullus artists';

  @override
  String get noAlbumsFound => 'Non albums';

  @override
  String get unknownSong => 'Ignotum';

  @override
  String get unknownArtist => 'Ignota artifex';

  @override
  String get unknownAlbum => 'Ignotus';

  @override
  String get unknownGenre => 'Ignota genre';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'In';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'ex';

  @override
  String get pageNotFoundText => 'Et data pagina non inveni';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle => 'Select a Directory ad Scan ad Musica';

  @override
  String get searchScreenTitle => 'PRAETENDO';

  @override
  String get searchEmptyText => 'Nulla Search Results';

  @override
  String get searchResultsText => 'Search results:';

  @override
  String get resultsForText => 'Results for:';

  @override
  String get disableBatteryOptimizationTitle => 'Disable altilium Optimization';

  @override
  String get disableBatteryOptimizationContent =>
      'Placere disable altilium Optimization hoc app in fabrica occasus ut background playback ex musica.';

  @override
  String get languageScreenTitle => 'LENTITUDO';

  @override
  String get silverDeviceColor => 'Argentum';

  @override
  String get blackDeviceColor => 'Niger';

  @override
  String get resetSettingsTitle => 'Reset Occasus';

  @override
  String get browseArtist => 'Artist Browse';

  @override
  String get browseAlbum => 'Browse album';

  @override
  String get cancelText => 'Inrito';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Addere ad-in-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Add to-ut on-ire';

  @override
  String get removeSongFromThePlaylist => 'Remove a playlist';

  @override
  String get allAlbums => 'Omnes albums';

  @override
  String get scanningMusicFiles => 'Scanning musica files';

  @override
  String get newPlaylist => 'Novum playlist';

  @override
  String get savePlaylist => 'Nisi playlist';

  @override
  String get clearPlaylist => 'Patet playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Musica files';

  @override
  String get deviceControlMenuTutorialText =>
      'Movere pollice leviter circa click rota ad navigare menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Torcular ad Centrum Puga pyga eligere in luce menu item';

  @override
  String get playPauseMenuTutorialText =>
      'Torcular quod conjunctionem ad ludere vel mora canticum';

  @override
  String get nextButtonMenuTutorialText =>
      'Torcular quod conjunctionem ad skip to altera carmen';

  @override
  String get previousButtonMenuTutorialText =>
      'Torcular quod conjunctionem ad rewind aut ire ad priorem carmen';

  @override
  String get menuButtonTutorialText =>
      'Torcular quod conjunctionem ut ad priorem menu. Potuit premere et tenere ab aliquo screen ad directe ad pelagus menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Hoc est ostentationem screen. Tactus screen et split screen modus sunt enabled per default et potest configurari longius in occasus.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Movere pollicem circa click rota ad adjust in volumine';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Torcular ad centrum puga pyga ad cycle per quaerite bar, scrubber talea et shuffle labor lapsus. Torcular et tenere centrum puga accedere additional optiones.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Torcular et hunc felis ieiunium deinceps carmen';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Torcular et teneat conjunctionem rewind carmen';

  @override
  String get deviceControlSearchTutorialText =>
      'Movere pollice leviter circa click rota ad highlight a alphabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Torcular ad Centrum Puga pyga eligere in luce alphabet';

  @override
  String get nextButtonSearchTutorialText =>
      'Torcular quod conjunctionem addere spatium';

  @override
  String get previousButtonSearchTutorialText =>
      'Torcular quod conjunctionem delere ultimum mores';

  @override
  String get menuButtonSearchTutorialText =>
      'Torcular quod conjunctionem claudere keyboard et penitus per search results';

  @override
  String get allSongs => 'Omnes carmina';
}
