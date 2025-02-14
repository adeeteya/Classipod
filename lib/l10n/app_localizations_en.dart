import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Access Permission Required';

  @override
  String get audioAccessPermissionContent => 'Please grant audio files access to allow us to play your music files.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Access Permission Denied';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Please grant audio files access for this app in the device settings to allow us to play your music files.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Music';

  @override
  String get nowPlayingScreenTitle => 'Now Playing';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Settings';

  @override
  String get aboutScreenTitle => 'About';

  @override
  String get coverFlowScreenTitle => 'Cover Flow';

  @override
  String get artistsScreenTitle => 'Artists';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Songs';

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
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre Songs';

  @override
  String get deviceColorSettingTitle => 'Device Color';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Enabled';

  @override
  String get repeatModeSettingTitle => 'Repeat';

  @override
  String get repeatModeOne => 'One';

  @override
  String get repeatModeAll => 'All';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Click Wheel Sounds';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Touch Sounds';

  @override
  String get touchSoundsDialogContent => 'Please Enable Touch Sounds from System Settings to hear the click wheel sounds';

  @override
  String get immersiveModeSettingTitle => 'Immersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'Show Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Change Directory';

  @override
  String get donateSettingTitle => 'Donate';

  @override
  String get donateSettingDescription => 'If you like this app, please consider donating.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Made with ❤️ by';

  @override
  String get noMusicFilesFound => 'No Music';

  @override
  String get noArtistsFound => 'No Artists';

  @override
  String get noAlbumsFound => 'No Albums';

  @override
  String get unknownSong => 'Unknown Song';

  @override
  String get unknownArtist => 'Unknown Artist';

  @override
  String get unknownAlbum => 'Unknown Album';

  @override
  String get unknownGenre => 'Unknown Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'of';

  @override
  String get pageNotFoundText => 'The given page was not found';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle => 'Select a Directory to Scan for Music';

  @override
  String get searchScreenTitle => 'Search';

  @override
  String get searchEmptyText => 'No Search Results';

  @override
  String get searchResultsText => 'Search Results: ';

  @override
  String get resultsForText => 'Results for: ';

  @override
  String get disableBatteryOptimizationTitle => 'Disable Battery Optimization';

  @override
  String get disableBatteryOptimizationContent => 'Please disable battery optimization for this app in the device settings to allow background playback of music.';

  @override
  String get languageScreenTitle => 'Language';

  @override
  String get silverDeviceColor => 'Silver';

  @override
  String get blackDeviceColor => 'Black';

  @override
  String get resetSettingsTitle => 'Reset Settings';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Cancel';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Add to On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Add Album to On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Remove from the Playlist';

  @override
  String get allAlbums => 'All Albums';

  @override
  String get scanningMusicFiles => 'Scanning Music Files';

  @override
  String get newPlaylist => 'New Playlist';

  @override
  String get savePlaylist => 'Save Playlist';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Move your thumb lightly around the Click Wheel to navigate the menu';

  @override
  String get centerButtonMenuTutorialText => 'Press the center button to select the highlighted menu item';

  @override
  String get playPauseMenuTutorialText => 'Press this button to play or pause a song';

  @override
  String get nextButtonMenuTutorialText => 'Press this button to skip to the next song';

  @override
  String get previousButtonMenuTutorialText => 'Press this button to rewind or go back to the previous song';

  @override
  String get menuButtonTutorialText => 'Press this button to go back to the previous menu. You could press and hold it from any other screen to directly go to the main menu.';

  @override
  String get deviceScreenMenuTutorialText => 'This is the display screen. Touch Screen and Split Screen Mode are enabled by default and can be configured further in the settings.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Move your thumb around the Click Wheel to adjust the volume';

  @override
  String get centerButtonNowPlayingTutorialText => 'Press the Center button to cycle through seek bar, scrubber bar and shuffle slider. Press and hold the Center button to access additional options.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Press and hold this button to fast forward the song';

  @override
  String get previousButtonNowPlayingTutorialText => 'Press and hold this button to rewind the song';

  @override
  String get deviceControlSearchTutorialText => 'Move your thumb lightly around the Click Wheel to highlight a alphabet';

  @override
  String get centerButtonSearchTutorialText => 'Press the center button to select the highlighted alphabet';

  @override
  String get nextButtonSearchTutorialText => 'Press this button to add a space';

  @override
  String get previousButtonSearchTutorialText => 'Press this button to delete the last character';

  @override
  String get menuButtonSearchTutorialText => 'Press this button to close the keyboard and interact with the search results';
}
