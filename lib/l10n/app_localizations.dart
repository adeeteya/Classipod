import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ClassiPod'**
  String get appTitle;

  /// The text of the menu button
  ///
  /// In en, this message translates to:
  /// **'MENU'**
  String get menuButtonText;

  /// The title of the audio access permission dialog
  ///
  /// In en, this message translates to:
  /// **'Audio Access Permission Required'**
  String get audioAccessPermissionTitle;

  /// The content of the audio files access permission dialog
  ///
  /// In en, this message translates to:
  /// **'Please grant audio files access to allow us to play your music files.'**
  String get audioAccessPermissionContent;

  /// The title of the audio access permission permanently denied dialog
  ///
  /// In en, this message translates to:
  /// **'Audio Access Permission Denied'**
  String get audioAccessPermissionPermanentlyDeniedTitle;

  /// The content of the audio files access permission permanently denied dialog
  ///
  /// In en, this message translates to:
  /// **'Please grant audio files access for this app in the device settings to allow us to play your music files.'**
  String get audioAccessPermissionPermanentlyDeniedContent;

  /// The title of the menu screen
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menuScreenTitle;

  /// The title of the music menu screen
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get musicMenuScreenTitle;

  /// The title of the now playing screen
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get nowPlayingScreenTitle;

  /// The title of shuffle songs feature
  ///
  /// In en, this message translates to:
  /// **'Shuffle Songs'**
  String get shuffleSongsMenuTitle;

  /// The title of the shuffle setting
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get shuffleSettingTitle;

  /// The title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreenTitle;

  /// The title of the about screen
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutScreenTitle;

  /// The title of the cover flow screen
  ///
  /// In en, this message translates to:
  /// **'Cover Flow'**
  String get coverFlowScreenTitle;

  /// No description provided for @artistsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get artistsScreenTitle;

  /// The title of the albums screen
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albumsScreenTitle;

  /// The title of the songs screen
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get songsScreenTitle;

  /// A message to show number of songs
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Songs} =1{1 Song} other{{count} Songs}}'**
  String nSongs(num count);

  /// A message to show number of albums
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Albums} =1{1 Album} other{{count} Albums}}'**
  String nAlbums(num count);

  /// The title of the genres screen
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genresScreenTitle;

  /// The title of the genre songs screen
  ///
  /// In en, this message translates to:
  /// **'Genre Songs'**
  String get genreSongsScreenTitle;

  /// The title of the device color setting
  ///
  /// In en, this message translates to:
  /// **'Device Color'**
  String get deviceColorSettingTitle;

  /// The title of the touch screen setting
  ///
  /// In en, this message translates to:
  /// **'Touch Screen Enabled'**
  String get touchScreenSettingTitle;

  /// The title of the repeat mode setting
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get repeatModeSettingTitle;

  /// The text of the repeat mode for looping one song
  ///
  /// In en, this message translates to:
  /// **'One'**
  String get repeatModeOne;

  /// The text of the repeat mode for looping all the songs
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get repeatModeAll;

  /// The title of the vibrate setting
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrateSettingTitle;

  /// The title of the click wheel sound setting
  ///
  /// In en, this message translates to:
  /// **'Click Wheel Sounds'**
  String get clickWheelSettingTitle;

  /// The title of the split screen mode setting
  ///
  /// In en, this message translates to:
  /// **'Split Screen Mode'**
  String get splitScreenSettingTitle;

  /// The title of the touch sounds dialog
  ///
  /// In en, this message translates to:
  /// **'Touch Sounds'**
  String get touchSoundsDialogTitle;

  /// The contents of the touch sounds dialog
  ///
  /// In en, this message translates to:
  /// **'Please Enable Touch Sounds from System Settings to hear the click wheel sounds'**
  String get touchSoundsDialogContent;

  /// The title of the immersive mode setting
  ///
  /// In en, this message translates to:
  /// **'Immersive Mode'**
  String get immersiveModeSettingTitle;

  /// The title of the show app tutorial setting
  ///
  /// In en, this message translates to:
  /// **'Show Tutorial'**
  String get showAppTutorialSettingTitle;

  /// The title of the change directory setting
  ///
  /// In en, this message translates to:
  /// **'Change Directory'**
  String get changeDirectorySettingTitle;

  /// The title of the donate setting
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donateSettingTitle;

  /// The description of the donate setting
  ///
  /// In en, this message translates to:
  /// **'If you like this app, please consider donating.'**
  String get donateSettingDescription;

  /// The title of the version tile in the about screen
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionAboutScreenTitle;

  /// The title of the made with love section in the about screen
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ by'**
  String get madeWithLoveTitle;

  /// The message displayed when no music files are found
  ///
  /// In en, this message translates to:
  /// **'No Music'**
  String get noMusicFilesFound;

  /// The message displayed when no artists are found
  ///
  /// In en, this message translates to:
  /// **'No Artists'**
  String get noArtistsFound;

  /// The message displayed when no albums are found
  ///
  /// In en, this message translates to:
  /// **'No Albums'**
  String get noAlbumsFound;

  /// When the name of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Song'**
  String get unknownSong;

  /// When the artist of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Artist'**
  String get unknownArtist;

  /// When the album of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Album'**
  String get unknownAlbum;

  /// When the genre of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Genre'**
  String get unknownGenre;

  /// The text of the confirm button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get buttonConfirmText;

  /// The value of the tile when it is on
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get tileValueOn;

  /// The value of the tile when it is off
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get tileValueOff;

  /// The text 'of'
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get commonOfText;

  /// The message displayed when the page is not found
  ///
  /// In en, this message translates to:
  /// **'The given page was not found'**
  String get pageNotFoundText;

  /// The text 'Error'
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonErrorText;

  /// The text of the retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButtonText;

  /// The title of the file picker dialog
  ///
  /// In en, this message translates to:
  /// **'Select a Directory to Scan for Music'**
  String get filePickerDialogTitle;

  /// The title of the search screen
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchScreenTitle;

  /// The message displayed when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No Search Results'**
  String get searchEmptyText;

  /// The text 'Search Results: ' for the title of the search screen
  ///
  /// In en, this message translates to:
  /// **'Search Results: '**
  String get searchResultsText;

  /// The text 'Results for: ' for the found searches
  ///
  /// In en, this message translates to:
  /// **'Results for: '**
  String get resultsForText;

  /// The title of the disable battery optimization dialog
  ///
  /// In en, this message translates to:
  /// **'Disable Battery Optimization'**
  String get disableBatteryOptimizationTitle;

  /// The content of the disable battery optimization dialog
  ///
  /// In en, this message translates to:
  /// **'Please disable battery optimization for this app in the device settings to allow background playback of music.'**
  String get disableBatteryOptimizationContent;

  /// The title of the language screen
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageScreenTitle;

  /// The name of the silver device color
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get silverDeviceColor;

  /// The name of the black device color
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get blackDeviceColor;

  /// The title of the reset settings dialog
  ///
  /// In en, this message translates to:
  /// **'Reset Settings'**
  String get resetSettingsTitle;

  /// The text of the browse artist option
  ///
  /// In en, this message translates to:
  /// **'Browse Artist'**
  String get browseArtist;

  /// The text of the browse album option
  ///
  /// In en, this message translates to:
  /// **'Browse Album'**
  String get browseAlbum;

  /// The text of the cancel list tile
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelText;

  /// The title of the playlists screen
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlistsScreenTitle;

  /// The text of the add to on-the-go playlist option
  ///
  /// In en, this message translates to:
  /// **'Add to On-The-Go'**
  String get addToOnTheGoPlaylist;

  /// The text of the add album to on-the-go playlist option
  ///
  /// In en, this message translates to:
  /// **'Add Album to On-The-Go'**
  String get addAlbumToOnTheGoPlaylist;

  /// The text of the remove song from the playlist option
  ///
  /// In en, this message translates to:
  /// **'Remove from the Playlist'**
  String get removeSongFromThePlaylist;

  /// The text of the all albums playlist
  ///
  /// In en, this message translates to:
  /// **'All Albums'**
  String get allAlbums;

  /// The text of the scanning music in splash screen
  ///
  /// In en, this message translates to:
  /// **'Scanning Music Files'**
  String get scanningMusicFiles;

  /// The text of the new playlist list tile
  ///
  /// In en, this message translates to:
  /// **'New Playlist'**
  String get newPlaylist;

  /// The text of the save playlist list tile
  ///
  /// In en, this message translates to:
  /// **'Save Playlist'**
  String get savePlaylist;

  /// The text of the clear playlist list tile
  ///
  /// In en, this message translates to:
  /// **'Clear Playlist'**
  String get clearPlaylist;

  /// The text of the rescan music files settings tile
  ///
  /// In en, this message translates to:
  /// **'Rescan Music Files'**
  String get rescanMusicFilesSettingTitle;

  /// The tutorial text for the device controls when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb lightly around the Click Wheel to highlight a menu item.'**
  String get deviceControlMenuTutorialText;

  /// The tutorial text for the center button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the center button to select the highlighted menu item.'**
  String get centerButtonMenuTutorialText;

  /// No description provided for @playPauseMenuTutorialText.
  ///
  /// In en, this message translates to:
  /// **'Press this button to play or pause a song.'**
  String get playPauseMenuTutorialText;

  /// The tutorial text for the next button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to skip to the next song.'**
  String get nextButtonMenuTutorialText;

  /// The tutorial text for the previous button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to rewind or go back to the previous song.'**
  String get previousButtonMenuTutorialText;

  /// The tutorial text for the menu button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to go back to the previous menu. You could press and hold it from any other screen to directly go to the main menu.'**
  String get menuButtonTutorialText;

  /// The tutorial text for the device screen when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'This is the display screen. Touch Screen and Split Screen Mode are enabled by default and can be configured further in the settings.'**
  String get deviceScreenMenuTutorialText;

  /// The tutorial text for the device controls when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb around the Click Wheel to adjust the volume.'**
  String get deviceControlNowPlayingTutorialText;

  /// The tutorial text for the center button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the Center button to cycle through seek bar, scrubber bar and shuffle slider. Press and hold the Center button to access additional options.'**
  String get centerButtonNowPlayingTutorialText;

  /// The tutorial text for the next button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press and hold this button to fast forward the song.'**
  String get nextButtonNowPlayingTutorialText;

  /// The tutorial text for the previous button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press and hold this button to rewind the song.'**
  String get previousButtonNowPlayingTutorialText;

  /// The tutorial text for the device controls when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb lightly around the Click Wheel to highlight a alphabet.'**
  String get deviceControlSearchTutorialText;

  /// The tutorial text for the center button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the center button to select the highlighted alphabet.'**
  String get centerButtonSearchTutorialText;

  /// The tutorial text for the next button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to add a space.'**
  String get nextButtonSearchTutorialText;

  /// The tutorial text for the previous button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to delete the last character.'**
  String get previousButtonSearchTutorialText;

  /// The tutorial text for the menu button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to close the keyboard and interact with the search results.'**
  String get menuButtonSearchTutorialText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
