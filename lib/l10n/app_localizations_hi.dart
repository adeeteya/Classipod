// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'क्लासिपॉड';

  @override
  String get menuButtonText => 'मेन्यू';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्सेस अनुमति आवश्यक है';

  @override
  String get audioAccessPermissionContent => 'कृपया हमें आपकी संगीत फ़ाइलें चलाने की अनुमति देने के लिए ऑडियो फ़ाइलों तक पहुंच प्रदान करें।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ऑडियो एक्सेस अनुमति अस्वीकृत';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'कृपया हमें आपकी संगीत फ़ाइलें चलाने की अनुमति देने के लिए डिवाइस सेटिंग में इस ऐप के लिए ऑडियो फ़ाइलों तक पहुंच प्रदान करें।';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अब खेल रहे हैं';

  @override
  String get shuffleSongsMenuTitle => 'गानों की अदला बदली करें';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'सेटिंग्स';

  @override
  String get aboutScreenTitle => 'के बारे में';

  @override
  String get coverFlowScreenTitle => 'कवर फ्लो';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एलबम';

  @override
  String get songsScreenTitle => 'गीत';

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
  String get repeatModeSettingTitle => 'मोड दोहराएँ';

  @override
  String get repeatModeOne => 'One';

  @override
  String get repeatModeAll => 'All';

  @override
  String get vibrateSettingTitle => 'कंपन';

  @override
  String get clickWheelSettingTitle => 'व्हील साउंड्स पर क्लिक करें';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श ध्वनि';

  @override
  String get touchSoundsDialogContent => 'कृपया क्लिक व्हील ध्वनि सुनने के लिए सिस्टम सेटिंग्स से टच ध्वनि सक्षम करें';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिव मोड';

  @override
  String get showAppTutorialSettingTitle => 'Show Tutorial';

  @override
  String get changeDirectorySettingTitle => 'निर्देशिका बदलें';

  @override
  String get donateSettingTitle => 'दान करें';

  @override
  String get donateSettingDescription => 'If you like this app, please consider donating.';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ द्वारा बनाया गया';

  @override
  String get noMusicFilesFound => 'कोई संगीत नहीं';

  @override
  String get noArtistsFound => 'No Artists';

  @override
  String get noAlbumsFound => 'No Albums';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अज्ञात एल्बम';

  @override
  String get unknownGenre => 'अज्ञात शैली';

  @override
  String get buttonConfirmText => 'ठीक है';

  @override
  String get tileValueOn => 'पर';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'का';

  @override
  String get pageNotFoundText => 'The given page was not found';

  @override
  String get commonErrorText => 'गलती';

  @override
  String get retryButtonText => 'पुन: प्रयास करें';

  @override
  String get filePickerDialogTitle => 'संगीत को स्कैन करने के लिए एक निर्देशिका का चयन करें';

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
