// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ವರ್ಗದವಳು';

  @override
  String get menuButtonText => 'ಮೆನು';

  @override
  String get audioAccessPermissionTitle => 'ಆಡಿಯೊ ಪ್ರವೇಶ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get audioAccessPermissionContent =>
      'ನಿಮ್ಮ ಸಂಗೀತ ಫೈಲ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡಲು ನಮಗೆ ಅನುಮತಿಸಲು ದಯವಿಟ್ಟು ಆಡಿಯೊ ಫೈಲ್‌ಗಳ ಪ್ರವೇಶವನ್ನು ನೀಡಿ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ಆಡಿಯೊ ಪ್ರವೇಶ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ನಿಮ್ಮ ಸಂಗೀತ ಫೈಲ್‌ಗಳನ್ನು ಪ್ಲೇ ಮಾಡಲು ನಮಗೆ ಅನುಮತಿಸಲು ದಯವಿಟ್ಟು ಸಾಧನ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಈ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ ಆಡಿಯೊ ಫೈಲ್‌ಗಳನ್ನು ಪ್ರವೇಶಿಸಿ.';

  @override
  String get menuScreenTitle => 'ಮೆನು';

  @override
  String get musicMenuScreenTitle => 'ಸಂಗೀತ';

  @override
  String get nowPlayingScreenTitle => 'ಈಗ ಆಡುತ್ತಿದೆ';

  @override
  String get shuffleSongsMenuTitle => 'ಹಾಡುಗಳನ್ನು ಷಫಲ್ ಮಾಡಿ';

  @override
  String get shuffleSettingTitle => 'ಷಫಗನ';

  @override
  String get settingsScreenTitle => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get aboutScreenTitle => 'ಬಗ್ಗೆ';

  @override
  String get coverFlowScreenTitle => 'ಕವರ್ ಹರಿ';

  @override
  String get artistsScreenTitle => 'ಕಲಾವಿದರು';

  @override
  String get albumsScreenTitle => 'ಉಚ್ಚಾರಣಾ';

  @override
  String get songsScreenTitle => 'ಗೀತೆ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ಹಾಡುಗಳು',
      one: '1 ಹಾಡು',
      zero: 'ಹಾಡುಗಳಿಲ್ಲ',
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
      other: '$countString ಆಲ್ಬಮ್‌ಗಳು',
      one: '1 ಆಲ್ಬಮ್',
      zero: 'ಯಾವುದೇ ಆಲ್ಬಮ್‌ಗಳಿಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ಪ್ರಕಾರದ';

  @override
  String get genreSongsScreenTitle => 'ಪ್ರಕಾರದ ಹಾಡುಗಳು';

  @override
  String get deviceColorSettingTitle => 'ಸಾಧನದ ಬಣ್ಣ';

  @override
  String get touchScreenSettingTitle => 'ಟಚ್ ಸ್ಕ್ರೀನ್ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get repeatModeSettingTitle => 'ಪುನರಾವರ್ತಿಸು';

  @override
  String get repeatModeOne => 'ಒಂದು';

  @override
  String get repeatModeAll => 'ಎಲ್ಲರೂ';

  @override
  String get vibrateSettingTitle => 'ಚಿರಿಸು';

  @override
  String get clickWheelSettingTitle => 'ವೀಲ್ ಸೌಂಡ್ಸ್ ಕ್ಲಿಕ್ ಮಾಡಿ';

  @override
  String get splitScreenSettingTitle => 'ಸ್ಪ್ಲಿಟ್ ಸ್ಕ್ರೀನ್ ಮೋಡ್';

  @override
  String get touchSoundsDialogTitle => 'ಸ್ಪರ್ಶ ಶಬ್ದಗಳು';

  @override
  String get touchSoundsDialogContent =>
      'ಕ್ಲಿಕ್ ವೀಲ್ ಶಬ್ದಗಳನ್ನು ಕೇಳಲು ದಯವಿಟ್ಟು ಸಿಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಂದ ಟಚ್ ಶಬ್ದಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get immersiveModeSettingTitle => 'ಮುಳುಗಿಸುವ ಕ್ರಮ';

  @override
  String get showAppTutorialSettingTitle => 'ಟ್ಯುಟೋರಿಯಲ್ ತೋರಿಸಿ';

  @override
  String get changeDirectorySettingTitle => 'ಡೈರೆಕ್ಟರಿ ಬದಲಾಯಿಸಿ';

  @override
  String get donateSettingTitle => 'ದಾನ ಮಾಡು';

  @override
  String get donateSettingDescription =>
      'ನೀವು ಈ ಅಪ್ಲಿಕೇಶನ್ ಬಯಸಿದರೆ, ದಯವಿಟ್ಟು ದಾನ ಮಾಡುವುದನ್ನು ಪರಿಗಣಿಸಿ.';

  @override
  String get versionAboutScreenTitle => 'ಆವೃತ್ತಿ';

  @override
  String get madeWithLoveTitle => '❤ ಯೊಂದಿಗೆ ತಯಾರಿಸಲಾಗುತ್ತದೆ';

  @override
  String get noMusicFilesFound => 'ಸಂಗೀತವಿಲ್ಲ';

  @override
  String get noArtistsFound => 'ಯಾವುದೇ ಕಲಾವಿದರು ಇಲ್ಲ';

  @override
  String get noAlbumsFound => 'ಯಾವುದೇ ಆಲ್ಬಂಗಳು ಇಲ್ಲ';

  @override
  String get unknownSong => 'ಅಜ್ಞಾತ ಹಾಡು';

  @override
  String get unknownArtist => 'ಅಜ್ಞಾತ ಕಲಾವಿದ';

  @override
  String get unknownAlbum => 'ಅಜ್ಞಾತ ಆಲ್ಬಮ್';

  @override
  String get unknownGenre => 'ಅಜ್ಞಾತ ಪ್ರಕಾರ';

  @override
  String get buttonConfirmText => 'ಸರಿ';

  @override
  String get tileValueOn => 'ಮೇಲೆ';

  @override
  String get tileValueOff => 'ತಟ್ಟಿಸು';

  @override
  String get commonOfText => 'ಇದಕ್ಕೆ';

  @override
  String get pageNotFoundText => 'ಕೊಟ್ಟಿರುವ ಪುಟವು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get commonErrorText => 'ದೋಷ';

  @override
  String get retryButtonText => 'ಮರುಪರಿಶೀಲಿಸು';

  @override
  String get filePickerDialogTitle =>
      'ಸಂಗೀತಕ್ಕಾಗಿ ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಡೈರೆಕ್ಟರಿಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get searchScreenTitle => 'ಶೋಧನೆ';

  @override
  String get searchEmptyText => 'ಹುಡುಕಾಟ ಫಲಿತಾಂಶಗಳಿಲ್ಲ';

  @override
  String get searchResultsText => 'ಹುಡುಕಾಟ ಫಲಿತಾಂಶಗಳು:';

  @override
  String get resultsForText => 'ಇದಕ್ಕಾಗಿ ಫಲಿತಾಂಶಗಳು:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ಬ್ಯಾಟರಿ ಆಪ್ಟಿಮೈಸೇಶನ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get disableBatteryOptimizationContent =>
      'ಸಂಗೀತದ ಹಿನ್ನೆಲೆ ಪ್ಲೇಬ್ಯಾಕ್ ಅನ್ನು ಅನುಮತಿಸಲು ದಯವಿಟ್ಟು ಸಾಧನ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಈ ಅಪ್ಲಿಕೇಶನ್‌ಗಾಗಿ ಬ್ಯಾಟರಿ ಆಪ್ಟಿಮೈಸೇಶನ್ ಅನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get languageScreenTitle => 'ಭಾಷೆ';

  @override
  String get silverDeviceColor => 'ಬೆಳ್ಳಿ';

  @override
  String get blackDeviceColor => 'ಕಪ್ಪು';

  @override
  String get resetSettingsTitle => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String get browseArtist => 'ಕಲಾವಿದ ಬ್ರೌಸ್';

  @override
  String get browseAlbum => 'ಬ್ರೌಸ್ ಆಲ್ಬಮ್';

  @override
  String get cancelText => 'ರದ್ದುಮಾಡು';

  @override
  String get playlistsScreenTitle => 'ಪ್ಲೇಪಟ್ಟಿಗಳು';

  @override
  String get addToOnTheGoPlaylist => 'ಪ್ರಯಾಣದಲ್ಲಿರುವಾಗ ಸೇರಿಸಿ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ಪ್ರಯಾಣದಲ್ಲಿರುವಾಗ ಆಲ್ಬಮ್ ಸೇರಿಸಿ';

  @override
  String get removeSongFromThePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯಿಂದ ತೆಗೆದುಹಾಕಿ';

  @override
  String get allAlbums => 'ಎಲ್ಲಾ ಆಲ್ಬಂಗಳು';

  @override
  String get scanningMusicFiles => 'ಸಂಗೀತ ಫೈಲ್‌ಗಳನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಲಾಗುತ್ತಿದೆ';

  @override
  String get newPlaylist => 'ಹೊಸ ಪ್ಲೇಪಟ್ಟಿ';

  @override
  String get savePlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ಉಳಿಸಿ';

  @override
  String get clearPlaylist => 'ಪ್ಲೇಪಟ್ಟಿಯನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get rescanMusicFilesSettingTitle => 'ಸಂಗೀತ ಫೈಲ್‌ಗಳು';

  @override
  String get deviceControlMenuTutorialText =>
      'ಮೆನುವನ್ನು ನ್ಯಾವಿಗೇಟ್ ಮಾಡಲು ನಿಮ್ಮ ಹೆಬ್ಬೆರಳನ್ನು ಕ್ಲಿಕ್ ಚಕ್ರದ ಸುತ್ತಲೂ ಲಘುವಾಗಿ ಸರಿಸಿ';

  @override
  String get centerButtonMenuTutorialText =>
      'ಹೈಲೈಟ್ ಮಾಡಿದ ಮೆನು ಐಟಂ ಆಯ್ಕೆ ಮಾಡಲು ಸೆಂಟರ್ ಬಟನ್ ಒತ್ತಿರಿ';

  @override
  String get playPauseMenuTutorialText =>
      'ಹಾಡನ್ನು ನುಡಿಸಲು ಅಥವಾ ವಿರಾಮಗೊಳಿಸಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ';

  @override
  String get nextButtonMenuTutorialText =>
      'ಮುಂದಿನ ಹಾಡಿಗೆ ತೆರಳಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ';

  @override
  String get previousButtonMenuTutorialText =>
      'ರಿವೈಂಡ್ ಮಾಡಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ ಅಥವಾ ಹಿಂದಿನ ಹಾಡಿಗೆ ಹಿಂತಿರುಗಿ';

  @override
  String get menuButtonTutorialText =>
      'ಹಿಂದಿನ ಮೆನುಗೆ ಹಿಂತಿರುಗಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ. ಮುಖ್ಯ ಮೆನುಗೆ ನೇರವಾಗಿ ಹೋಗಲು ನೀವು ಅದನ್ನು ಬೇರೆ ಯಾವುದೇ ಪರದೆಯಿಂದ ಒತ್ತಿ ಮತ್ತು ಹಿಡಿದಿಟ್ಟುಕೊಳ್ಳಬಹುದು.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ಇದು ಪ್ರದರ್ಶನ ಪರದೆ. ಟಚ್ ಸ್ಕ್ರೀನ್ ಮತ್ತು ಸ್ಪ್ಲಿಟ್ ಸ್ಕ್ರೀನ್ ಮೋಡ್ ಅನ್ನು ಪೂರ್ವನಿಯೋಜಿತವಾಗಿ ಸಕ್ರಿಯಗೊಳಿಸಲಾಗಿದೆ ಮತ್ತು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಮತ್ತಷ್ಟು ಕಾನ್ಫಿಗರ್ ಮಾಡಬಹುದು.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ಪರಿಮಾಣವನ್ನು ಸರಿಹೊಂದಿಸಲು ನಿಮ್ಮ ಹೆಬ್ಬೆರಳನ್ನು ಕ್ಲಿಕ್ ಚಕ್ರದ ಸುತ್ತಲೂ ಸರಿಸಿ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ಸೀಕ್ ಬಾರ್, ಸ್ಕ್ರಬ್ಬರ್ ಬಾರ್ ಮತ್ತು ಶಫಲ್ ಸ್ಲೈಡರ್ ಮೂಲಕ ಸೈಕಲ್ ಮಾಡಲು ಸೆಂಟರ್ ಬಟನ್ ಒತ್ತಿರಿ. ಹೆಚ್ಚುವರಿ ಆಯ್ಕೆಗಳನ್ನು ಪ್ರವೇಶಿಸಲು ಸೆಂಟರ್ ಬಟನ್ ಒತ್ತಿ ಮತ್ತು ಹಿಡಿದುಕೊಳ್ಳಿ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ಹಾಡನ್ನು ವೇಗವಾಗಿ ಫಾರ್ವರ್ಡ್ ಮಾಡಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ ಮತ್ತು ಹಿಡಿದುಕೊಳ್ಳಿ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ಹಾಡನ್ನು ರಿವೈಂಡ್ ಮಾಡಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ ಮತ್ತು ಹಿಡಿದುಕೊಳ್ಳಿ';

  @override
  String get deviceControlSearchTutorialText =>
      'ವರ್ಣಮಾಲೆಯನ್ನು ಹೈಲೈಟ್ ಮಾಡಲು ನಿಮ್ಮ ಹೆಬ್ಬೆರಳನ್ನು ಕ್ಲಿಕ್ ಚಕ್ರದ ಸುತ್ತಲೂ ಲಘುವಾಗಿ ಸರಿಸಿ';

  @override
  String get centerButtonSearchTutorialText =>
      'ಹೈಲೈಟ್ ಮಾಡಿದ ವರ್ಣಮಾಲೆಯನ್ನು ಆಯ್ಕೆ ಮಾಡಲು ಸೆಂಟರ್ ಬಟನ್ ಒತ್ತಿರಿ';

  @override
  String get nextButtonSearchTutorialText =>
      'ಜಾಗವನ್ನು ಸೇರಿಸಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ';

  @override
  String get previousButtonSearchTutorialText =>
      'ಕೊನೆಯ ಅಕ್ಷರವನ್ನು ಅಳಿಸಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ';

  @override
  String get menuButtonSearchTutorialText =>
      'ಕೀಬೋರ್ಡ್ ಮುಚ್ಚಲು ಈ ಗುಂಡಿಯನ್ನು ಒತ್ತಿ ಮತ್ತು ಹುಡುಕಾಟ ಫಲಿತಾಂಶಗಳೊಂದಿಗೆ ಸಂವಹನ ನಡೆಸಿ';

  @override
  String get allSongs => 'ಎಲ್ಲಾ ಹಾಡುಗಳು';
}
