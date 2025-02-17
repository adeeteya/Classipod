// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kachin Jingpho (`kac`).
class AppLocalizationsKac extends AppLocalizations {
  AppLocalizationsKac([String locale = 'kac']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio lu la na ahkang ra ai';

  @override
  String get audioAccessPermissionContent =>
      'Na a mahkawn file ni hpe anhte hpe madat na matu audio file ni hpe access jaw mai ai.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio lu la na ahkang hpe ningdang kau ai';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ndai app a matu audio file ni hpe device setting ni hta bang da nna, na a music file ni hpe dum mai ai.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Yu-ngwi';

  @override
  String get nowPlayingScreenTitle => 'Ya gaw ginsup nga ai';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Mahkawn ni';

  @override
  String get shuffleSettingTitle => 'shu hte';

  @override
  String get settingsScreenTitle => 'settings';

  @override
  String get aboutScreenTitle => 'A lam';

  @override
  String get coverFlowScreenTitle => 'shabyi ya ai';

  @override
  String get artistsScreenTitle => 'Artists';

  @override
  String get albumsScreenTitle => 'Lit nga ai';

  @override
  String get songsScreenTitle => 'Mahkawn ni';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mahkawn ni',
      one: '1 Mahkawn ni',
      zero: 'No Mahkawn ni',
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
      other: '$countString Lit nga ai',
      one: '1 Lit nga ai',
      zero: 'No Lit nga ai',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre Mahkawn ni';

  @override
  String get deviceColorSettingTitle => 'Device a nsam';

  @override
  String get touchScreenSettingTitle => 'Screen hpe hkra ai';

  @override
  String get repeatModeSettingTitle => 'Kahtap tsun ai';

  @override
  String get repeatModeOne => 'Langai';

  @override
  String get repeatModeAll => 'Yawng';

  @override
  String get vibrateSettingTitle => 'Gaw';

  @override
  String get clickWheelSettingTitle => 'Wheel Nsen ni hpe dip dat u';

  @override
  String get splitScreenSettingTitle => 'Split Screen sumla hkrung';

  @override
  String get touchSoundsDialogTitle => 'Touch sounds';

  @override
  String get touchSoundsDialogContent =>
      'System Settings kaw na click leng nsen ni hpe na lu na matu Touch Sounds hpe hkam la lu na re';

  @override
  String get immersiveModeSettingTitle => 'Immersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial hpe madun u';

  @override
  String get changeDirectorySettingTitle => 'Galai shai ai lam';

  @override
  String get donateSettingTitle => 'Gam jaw ai';

  @override
  String get donateSettingDescription =>
      'Ndai app hpe ra sharawng ai rai yang, alu gumhpraw hpe myit yu u.';

  @override
  String get versionAboutScreenTitle => 'Ga gale tawn ai lam';

  @override
  String get madeWithLoveTitle => '❤️ hte galaw ai.';

  @override
  String get noMusicFilesFound => 'Mahkawn n nga ai';

  @override
  String get noArtistsFound => 'Hkrang shala ai ni n nga ai';

  @override
  String get noAlbumsFound => 'N rai Album';

  @override
  String get unknownSong => 'N chye ai mahkawn';

  @override
  String get unknownArtist => 'N chye ai Artist';

  @override
  String get unknownAlbum => 'N chye ai Album';

  @override
  String get unknownGenre => 'N chye ai Genre';

  @override
  String get buttonConfirmText => 'MAI SA';

  @override
  String get tileValueOn => 'Ntsa hta';

  @override
  String get tileValueOff => 'Jahkring ai';

  @override
  String get commonOfText => 'na';

  @override
  String get pageNotFoundText => 'Laika man hpe n mu lu ai';

  @override
  String get commonErrorText => 'Shut ai lam';

  @override
  String get retryButtonText => 'Bai nhtang wa ai; bai htang ai';

  @override
  String get filePickerDialogTitle =>
      'Music a matu Scan hpe Directory lata la u';

  @override
  String get searchScreenTitle => 'Gasawk';

  @override
  String get searchEmptyText => 'Search mahtai n nga ai';

  @override
  String get searchResultsText => 'Mahtai ni hpe tam u:';

  @override
  String get resultsForText => 'Mahtai:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disable Battery hpe grau kaja hkra galaw ai';

  @override
  String get disableBatteryOptimizationContent =>
      'Ndai app a matu battery hpe n mai lang hkra galaw ya rit, device settings ni hta mahkawn ni hpe background galaw ya lu na matu.';

  @override
  String get languageScreenTitle => 'Ga';

  @override
  String get silverDeviceColor => 'Gumhpraw';

  @override
  String get blackDeviceColor => 'Chyang ai';

  @override
  String get resetSettingsTitle => 'Settings hpe bai gram lajang u';

  @override
  String get browseArtist => 'Artists hpe Browse Artist .';

  @override
  String get browseAlbum => 'Album hpe hkan tam u';

  @override
  String get cancelText => 'dawm kau ai';

  @override
  String get playlistsScreenTitle => 'dum ai ni';

  @override
  String get addToOnTheGoPlaylist => 'On-The-Go hpe jat bang u';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Album hpe On-The-Go de bang dat u';

  @override
  String get removeSongFromThePlaylist => 'Playlist kaw na shaw la na';

  @override
  String get allAlbums => 'Yawng gaw Album ni';

  @override
  String get scanningMusicFiles => 'Scanning Music Files';

  @override
  String get newPlaylist => 'Playlist nnan';

  @override
  String get savePlaylist => 'Playlist hpe save galaw u';

  @override
  String get clearPlaylist => 'Clear Play laika';

  @override
  String get rescanMusicFilesSettingTitle => 'Music Files ni';

  @override
  String get deviceControlMenuTutorialText =>
      'Na a layung hpe Click Wheel grup yin hta loi loi hte htawt nna, menu hpe hkawm sa u';

  @override
  String get centerButtonMenuTutorialText =>
      'Dai majaw, n-gun ja ai menu hpe lata na matu, center button hpe dip u';

  @override
  String get playPauseMenuTutorialText =>
      'Ndai button hpe dip nna mahkawn langai hpe dum u (sh) hkring sa la mai ai .';

  @override
  String get nextButtonMenuTutorialText =>
      'Ndai button hpe dip nna hpang na mahkawn de skip galaw u';

  @override
  String get previousButtonMenuTutorialText =>
      'Ndai button hpe dip nna, rewind (sh) shawng na mahkawn de bai nhtang wa u .';

  @override
  String get menuButtonTutorialText =>
      'Ndai button hpe dip nna, shawng na menu de bai nhtang wa u. Kaga screen langai ngai kaw na dip nna hkam la nna, main menu de direct sa mai ai.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ndai gaw display screen re. Touch Screen hte Split Screen Mode hpe default hku nna hpaw da ai rai nna, setting ni hta grau nna configure galaw mai ai.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Na a lata hpe Click Wheel grup yin de htawt nna, nsen hpe gram lajang u';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Centre ngu ai hpe dip dat jang, bar, scrubber bar hte shuffle slider hpe tam na matu cycle hte hkawm sa wa na re. Kaga lata la mai ai lam ni hpe lu la na matu Centre ngu ai hpe dip nna jum da u.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Mahkawn hpe lawan ai hku shawng de sit sa na matu ndai button hpe dip nna jum da u';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Ndai button hpe dip nna jum da nna mahkawn hpe bai nhtang wa na .';

  @override
  String get deviceControlSearchTutorialText =>
      'Na a layung hpe Click Wheel grup yin hta loi loi hte htawt nna, alphabet langai hpe madi madun u';

  @override
  String get centerButtonSearchTutorialText =>
      'Dai hpe madi madun da ai laika buk hpe lata na matu center button hpe dip u .';

  @override
  String get nextButtonSearchTutorialText =>
      'Ndai button hpe dip nna shara langai mi bang u';

  @override
  String get previousButtonSearchTutorialText =>
      'Hpang jahtum na hkrang hpe delete galaw na matu ndai button hpe dip u';

  @override
  String get menuButtonSearchTutorialText =>
      'Ndai button hpe dip nna keyboard hpe pat nna tam ai mahtai ni hte matut mahkai mai ai';
}
