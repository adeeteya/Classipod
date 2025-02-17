// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'പന്ത്രള്ളായിത്ത';

  @override
  String get menuButtonText => 'മെനു';

  @override
  String get audioAccessPermissionTitle => 'ഓഡിയോ ആക്സസ് അനുമതി ആവശ്യമാണ്';

  @override
  String get audioAccessPermissionContent =>
      'നിങ്ങളുടെ സംഗീത ഫയലുകൾ പ്ലേ ചെയ്യാൻ ഞങ്ങളെ അനുവദിക്കുന്നതിന് ദയവായി ഓഡിയോ ഫയലുകൾ അനുവദിക്കുക.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ഓഡിയോ ആക്സസ് അനുമതി നിരസിച്ചു';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'നിങ്ങളുടെ സംഗീത ഫയലുകൾ പ്ലേ ചെയ്യാൻ ഞങ്ങളെ അനുവദിക്കുന്നതിന് ഉപകരണ ക്രമീകരണങ്ങളിൽ ദയവായി ഓഡിയോ ഫയലുകൾ അനുവദിക്കുക.';

  @override
  String get menuScreenTitle => 'മെനു';

  @override
  String get musicMenuScreenTitle => 'സംഗീതം';

  @override
  String get nowPlayingScreenTitle => 'ഇപ്പോൾ കളിക്കുന്നു';

  @override
  String get shuffleSongsMenuTitle => 'ഷഫിൾ ഗാനങ്ങൾ';

  @override
  String get shuffleSettingTitle => 'ഷഫിൾ ചെയ്യുക';

  @override
  String get settingsScreenTitle => 'ക്രമീകരണങ്ങൾ';

  @override
  String get aboutScreenTitle => 'കുറിച്ച്';

  @override
  String get coverFlowScreenTitle => 'കവർ ഫ്ലോ';

  @override
  String get artistsScreenTitle => 'കലാകാരന്മാർ';

  @override
  String get albumsScreenTitle => 'ആൽബങ്ങൾ';

  @override
  String get songsScreenTitle => 'പാട്ടുകൾ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ഗാനങ്ങൾ',
      one: '1 ഗാനം',
      zero: 'പാട്ടുകളൊന്നുമില്ല',
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
      other: '$countString ആൽബങ്ങൾ',
      one: '1 ആൽബം',
      zero: 'ആൽബങ്ങളൊന്നുമില്ല',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'വിഭാഗങ്ങൾ';

  @override
  String get genreSongsScreenTitle => 'വ്യുദ്ധ ഗാനങ്ങൾ';

  @override
  String get deviceColorSettingTitle => 'ഉപകരണ നിറം';

  @override
  String get touchScreenSettingTitle => 'ടച്ച് സ്ക്രീൻ പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get repeatModeSettingTitle => 'ആവര്ത്തിക്കുക';

  @override
  String get repeatModeOne => 'ഒന്ന്';

  @override
  String get repeatModeAll => 'എല്ലാം';

  @override
  String get vibrateSettingTitle => 'വിറയ്ക്കുക';

  @override
  String get clickWheelSettingTitle => 'ചക്രമായ ശബ്ദങ്ങൾ ക്ലിക്കുചെയ്യുക';

  @override
  String get splitScreenSettingTitle => 'സ്പ്ലിറ്റ് സ്ക്രീൻ മോഡ്';

  @override
  String get touchSoundsDialogTitle => 'സ്പർശിക്കുക';

  @override
  String get touchSoundsDialogContent =>
      'ക്ലിക്ക് വീൽ ശബ്ദങ്ങൾ കേൾക്കാൻ സിസ്റ്റം ക്രമീകരണങ്ങളിൽ നിന്ന് സ്പർശനങ്ങൾ പ്രാപ്തമാക്കുക';

  @override
  String get immersiveModeSettingTitle => 'അമൂർജ്ജ മോഡ്';

  @override
  String get showAppTutorialSettingTitle => 'ട്യൂട്ടോറിയൽ കാണിക്കുക';

  @override
  String get changeDirectorySettingTitle => 'ഡയറക്ടറി മാറ്റുക';

  @override
  String get donateSettingTitle => 'സംഭാവനചെയ്യുക';

  @override
  String get donateSettingDescription =>
      'നിങ്ങൾക്ക് ഈ അപ്ലിക്കേഷൻ ഇഷ്ടമാണെങ്കിൽ, ദയവായി സംഭാവന ചെയ്യുക.';

  @override
  String get versionAboutScreenTitle => 'ഭാഷം';

  @override
  String get madeWithLoveTitle => 'ഉപയോഗിച്ച് നിർമ്മിച്ചത്';

  @override
  String get noMusicFilesFound => 'സംഗീതമില്ല';

  @override
  String get noArtistsFound => 'കലാകാരന്മാരുമില്ല';

  @override
  String get noAlbumsFound => 'ആൽബങ്ങളൊന്നുമില്ല';

  @override
  String get unknownSong => 'അജ്ഞാത ഗാനം';

  @override
  String get unknownArtist => 'അജ്ഞാത കലാകാരൻ';

  @override
  String get unknownAlbum => 'അജ്ഞാത ആൽബം';

  @override
  String get unknownGenre => 'അജ്ഞാത വിഭാഗം';

  @override
  String get buttonConfirmText => 'ശരി';

  @override
  String get tileValueOn => 'മേല്';

  @override
  String get tileValueOff => 'ദൂരെ';

  @override
  String get commonOfText => 'ആല്';

  @override
  String get pageNotFoundText => 'നൽകിയ പേജ് കണ്ടെത്തിയില്ല';

  @override
  String get commonErrorText => 'പിശക്';

  @override
  String get retryButtonText => 'വീണ്ടുംരി ചെയ്യുക';

  @override
  String get filePickerDialogTitle =>
      'സംഗീതത്തിനായി സ്കാൻ ചെയ്യുന്നതിന് ഒരു ഡയറക്ടറി തിരഞ്ഞെടുക്കുക';

  @override
  String get searchScreenTitle => 'അനേഷണം';

  @override
  String get searchEmptyText => 'തിരയൽ ഫലങ്ങളൊന്നുമില്ല';

  @override
  String get searchResultsText => 'തിരയൽ ഫലങ്ങൾ:';

  @override
  String get resultsForText => 'ഇതിനുള്ള ഫലങ്ങൾ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ബാറ്ററി ഒപ്റ്റിമൈസേഷൻ അപ്രാപ്തമാക്കുക';

  @override
  String get disableBatteryOptimizationContent =>
      'സംഗീതത്തിന്റെ പശ്ചാത്തല പ്ലേബാക്ക് അനുവദിക്കുന്നതിന് ഉപകരണ ക്രമീകരണങ്ങളിൽ ദയവായി ഈ അപ്ലിക്കേഷനായി ബാറ്ററി ഒപ്റ്റിമൈസേഷൻ അപ്രാപ്തമാക്കുക.';

  @override
  String get languageScreenTitle => 'ഭാഷ';

  @override
  String get silverDeviceColor => 'വെള്ളി';

  @override
  String get blackDeviceColor => 'കറുത്ത';

  @override
  String get resetSettingsTitle => 'ക്രമീകരണങ്ങൾ പുന reset സജ്ജമാക്കുക';

  @override
  String get browseArtist => 'കലാകാരൻ ബ്ര rowse സ് ചെയ്യുക';

  @override
  String get browseAlbum => 'ബ്ര rowse സുചെയ്യുക ആൽബം';

  @override
  String get cancelText => 'റദ്ദാക്കുക';

  @override
  String get playlistsScreenTitle => 'പ്ലേലിസ്റ്റുകൾ';

  @override
  String get addToOnTheGoPlaylist => 'ഓൺ-ഓൺ-ഓൺ-ഓഫ്';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ഓൺ-ഓൺ-ലേക്ക് ആൽബം ചേർക്കുക';

  @override
  String get removeSongFromThePlaylist => 'പ്ലേലിസ്റ്റിൽ നിന്ന് നീക്കംചെയ്യുക';

  @override
  String get allAlbums => 'എല്ലാ ആൽബങ്ങളും';

  @override
  String get scanningMusicFiles => 'സംഗീത ഫയലുകൾ സ്കാൻ ചെയ്യുന്നു';

  @override
  String get newPlaylist => 'പുതിയ പ്ലേലിസ്റ്റ്';

  @override
  String get savePlaylist => 'പ്ലേലിസ്റ്റ് സംരക്ഷിക്കുക';

  @override
  String get clearPlaylist => 'പ്ലേലിസ്റ്റ് മായ്ക്കുക';

  @override
  String get rescanMusicFilesSettingTitle => 'റിസർച്ച് മ്യൂസിക് ഫയലുകൾ';

  @override
  String get deviceControlMenuTutorialText =>
      'മെനു നാവിഗേറ്റുചെയ്യുന്നതിന് ക്ലിക്ക് ചക്രത്തിന് ചുറ്റും നിങ്ങളുടെ തള്ളവിരൽ ലഘുവായി നീക്കുക';

  @override
  String get centerButtonMenuTutorialText =>
      'ഹൈലൈറ്റ് ചെയ്ത മെനു ഇനം തിരഞ്ഞെടുക്കാൻ സെന്റർ ബട്ടൺ അമർത്തുക';

  @override
  String get playPauseMenuTutorialText =>
      'ഒരു ഗാനം പ്ലേ ചെയ്യാനോ താൽക്കാലികമായി നിർത്താനോ ഈ ബട്ടൺ അമർത്തുക';

  @override
  String get nextButtonMenuTutorialText =>
      'അടുത്ത ഗാനത്തിലേക്ക് ഒഴിവാക്കാൻ ഈ ബട്ടൺ അമർത്തുക';

  @override
  String get previousButtonMenuTutorialText =>
      'റിവൈൻഡ് ചെയ്യുന്നതിന് ഈ ബട്ടൺ അമർത്തുക അല്ലെങ്കിൽ മുമ്പത്തെ ഗാനത്തിലേക്ക് മടങ്ങുക';

  @override
  String get menuButtonTutorialText =>
      'മുമ്പത്തെ മെനുവിലേക്ക് മടങ്ങുന്നതിന് ഈ ബട്ടൺ അമർത്തുക. പ്രധാന മെനുവിലേക്ക് നേരിട്ട് പോകാൻ നിങ്ങൾക്ക് മറ്റേതെങ്കിലും സ്ക്രീനിൽ നിന്നും അത് അമർത്തിപ്പിടിക്കാം.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ഇതാണ് ഡിസ്പ്ലേ സ്ക്രീൻ. ടച്ച് സ്ക്രീനും സ്പ്ലിറ്റ് സ്ക്രീൻ മോഡും സ്ഥിരസ്ഥിതിയായി പ്രാപ്തമാക്കി, അവ ക്രമീകരണങ്ങളിൽ ക്രമീകരിക്കാൻ കഴിയും.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'വോളിയം ക്രമീകരിക്കുന്നതിന് ക്ലിക്ക് ചക്രത്തിന് ചുറ്റും നിങ്ങളുടെ തള്ളവിരൽ നീക്കുക';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ടിച്ച് ബാർ, സ്ക്രബ്ബർ ബാർ, ഷഫിൾ സ്ലൈഡർ എന്നിവയിലൂടെ സൈക്കിളിലേക്ക് സെന്റർ ബട്ടൺ അമർത്തുക. അധിക ഓപ്ഷനുകൾ ആക്സസ് ചെയ്യുന്നതിന് സെന്റർ ബട്ടൺ അമർത്തിപ്പിടിക്കുക.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'പാട്ട് വേഗത്തിൽ കൈമാറാൻ ഈ ബട്ടൺ അമർത്തിപ്പിടിക്കുക';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'പാട്ട് റിവൈൻഡ് ചെയ്യുന്നതിന് ഈ ബട്ടൺ അമർത്തിപ്പിടിക്കുക';

  @override
  String get deviceControlSearchTutorialText =>
      'ഒരു അക്ഷരമാല ഹൈലൈറ്റ് ചെയ്യുന്നതിന് നിങ്ങളുടെ തള്ളവിരൽ ലഘുവായി നീക്കുക';

  @override
  String get centerButtonSearchTutorialText =>
      'ഹൈലൈറ്റ് ചെയ്ത അക്ഷരമാല തിരഞ്ഞെടുക്കാൻ സെന്റർ ബട്ടൺ അമർത്തുക';

  @override
  String get nextButtonSearchTutorialText =>
      'ഒരു സ്ഥലം ചേർക്കാൻ ഈ ബട്ടൺ അമർത്തുക';

  @override
  String get previousButtonSearchTutorialText =>
      'അവസാന പ്രതീകം ഇല്ലാതാക്കാൻ ഈ ബട്ടൺ അമർത്തുക';

  @override
  String get menuButtonSearchTutorialText =>
      'കീബോർഡ് അടച്ച് തിരയൽ ഫലങ്ങളുമായി സംവദിക്കാൻ ഈ ബട്ടൺ അമർത്തുക';
}
