// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ክላሲድ';

  @override
  String get menuButtonText => 'ምናሌ';

  @override
  String get audioAccessPermissionTitle => 'የድምፅ መዳረሻ ፈቃድ ያስፈልጋል';

  @override
  String get audioAccessPermissionContent =>
      'እባክዎን የሙዚቃ ፋይሎችዎን ለመጫወት የሚያስችለን የድምፅ ፋይሎች ይስጡ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'የድምፅ መዳረሻ ፈቃድ ተከልክሏል';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'የሙዚቃ ፋይሎችዎን እንድንጫወት የሚያስችለንን ለዚህ መተግበሪያ ኦዲዮ ፋይሎችን ለኦዲዮ ፋይሎች ይድረሱ.';

  @override
  String get menuScreenTitle => 'ምናሌ';

  @override
  String get musicMenuScreenTitle => 'ሙዚቃ';

  @override
  String get nowPlayingScreenTitle => 'አሁን መጫወት';

  @override
  String get shuffleSongsMenuTitle => 'ዘፈኖች ዘፈኖች';

  @override
  String get shuffleSettingTitle => 'ሽፍታ';

  @override
  String get settingsScreenTitle => 'ቅንብሮች';

  @override
  String get aboutScreenTitle => 'ስለ';

  @override
  String get coverFlowScreenTitle => 'የሽፋን ፍሰት';

  @override
  String get artistsScreenTitle => 'አርቲስቶች';

  @override
  String get albumsScreenTitle => 'አልበሞች';

  @override
  String get songsScreenTitle => 'ዘፈኖች';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ዘፈኖች',
      one: '1 ዘፈን',
      zero: 'ዘፈኖች የሉም',
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
      other: '$countString አልበሞች',
      one: '1 አልበም',
      zero: 'አልበሞች የሉም',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ዘውጎች';

  @override
  String get genreSongsScreenTitle => 'ዘውግ ዘፈኖች';

  @override
  String get deviceColorSettingTitle => 'የመሣሪያ ቀለም';

  @override
  String get touchScreenSettingTitle => 'የንክኪ ማያ ገጹ ነቅቷል';

  @override
  String get repeatModeSettingTitle => 'ይድገሙ';

  @override
  String get repeatModeOne => 'አንድ';

  @override
  String get repeatModeAll => 'ሁሉም';

  @override
  String get vibrateSettingTitle => 'ይንቀጠቀጣል';

  @override
  String get clickWheelSettingTitle => 'የተሽከርካሪ ድም sounds ችን ጠቅ ያድርጉ';

  @override
  String get splitScreenSettingTitle => 'የማያ ገጽ ሞድ';

  @override
  String get touchSoundsDialogTitle => 'የሚነካ ድም sounds ች';

  @override
  String get touchSoundsDialogContent =>
      'ጠቅታ ተሽከርካሪ ድምጾችን ለመስማት ከስርዓት ቅንብሮች ከስርዓት ቅንብሮች ያንቁ';

  @override
  String get immersiveModeSettingTitle => 'ጠማማ ሁኔታ';

  @override
  String get showAppTutorialSettingTitle => 'ማጠናከሪያ አሳይ';

  @override
  String get changeDirectorySettingTitle => 'ማውጫ';

  @override
  String get donateSettingTitle => 'ልገሳ';

  @override
  String get donateSettingDescription => 'ይህንን መተግበሪያ ከወደዱ እባክዎን ስጋትን ያስቡበት.';

  @override
  String get versionAboutScreenTitle => 'ስሪት';

  @override
  String get madeWithLoveTitle => 'ከ ❤️ ጋር የተሰራ';

  @override
  String get noMusicFilesFound => 'ሙዚቃ የለም';

  @override
  String get noArtistsFound => 'ምንም አርቲስቶች የሉም';

  @override
  String get noAlbumsFound => 'አልበም የለም';

  @override
  String get unknownSong => 'ያልታወቀ ዘፈን';

  @override
  String get unknownArtist => 'ያልታወቀ አርቲስት';

  @override
  String get unknownAlbum => 'ያልታወቀ አልበም';

  @override
  String get unknownGenre => 'ያልታወቀ ዘውግ';

  @override
  String get buttonConfirmText => 'እሺ';

  @override
  String get tileValueOn => 'በርቷል';

  @override
  String get tileValueOff => 'ጠፍቷል';

  @override
  String get commonOfText => 'የ';

  @override
  String get pageNotFoundText => 'የተሰጠው ገጽ አልተገኘም';

  @override
  String get commonErrorText => 'ስህተት';

  @override
  String get retryButtonText => 'እንደገና መሞከር';

  @override
  String get filePickerDialogTitle => 'ሙዚቃን ለመፈተሽ ማውጫ ይምረጡ';

  @override
  String get searchScreenTitle => 'ፍለጋ';

  @override
  String get searchEmptyText => 'ምንም የፍለጋ ውጤቶች የሉም';

  @override
  String get searchResultsText => 'የፍለጋ ውጤቶች:';

  @override
  String get resultsForText => 'ውጤቶች';

  @override
  String get disableBatteryOptimizationTitle => 'የባትሪ ማመቻቸትን ያሰናክሉ';

  @override
  String get disableBatteryOptimizationContent =>
      'የጀርባ ደንብ መልሶ ማጫወትን ለመፍቀድ እባክዎ በመሣሪያ ቅንብሮች ውስጥ የባትሪ ማመቻቸትን ያሰናክሉ.';

  @override
  String get languageScreenTitle => 'ቋንቋ';

  @override
  String get silverDeviceColor => 'ብር';

  @override
  String get blackDeviceColor => 'ጥቁር';

  @override
  String get resetSettingsTitle => 'ቅንብሮች ዳግም ያስጀምሩ';

  @override
  String get browseArtist => 'አርቲስት ያስሱ';

  @override
  String get browseAlbum => 'አልበም ያስሱ';

  @override
  String get cancelText => 'ይቅር';

  @override
  String get playlistsScreenTitle => 'አጫዋች ዝርዝሮች';

  @override
  String get addToOnTheGoPlaylist => 'ወደ-ሂድ ላይ ያክሉ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Album ን ወደ-ሂድ ያክሉ';

  @override
  String get removeSongFromThePlaylist => 'ከአጫዋች ዝርዝር ውስጥ ያስወግዱ';

  @override
  String get allAlbums => 'ሁሉም አልበሞች';

  @override
  String get scanningMusicFiles => 'የሙዚቃ ፋይሎችን መቃኘት';

  @override
  String get newPlaylist => 'አዲስ የጨዋታ ዝርዝር';

  @override
  String get savePlaylist => 'አጫዋች ዝርዝር አስቀምጥ';

  @override
  String get clearPlaylist => 'የጨዋታ ዝርዝርን ያጽዱ';

  @override
  String get rescanMusicFilesSettingTitle => 'የ REACAN የሙዚቃ ፋይሎች';

  @override
  String get deviceControlMenuTutorialText =>
      'ምናሌውን ለማሰስ ጠቅ በማድረግ ጠቅታ ጎድጓዳው ዙሪያ አሽሮዎን ያንቀሳቅሱ';

  @override
  String get centerButtonMenuTutorialText =>
      'የደመቀ ምናሌውን ንጥል ለመምረጥ የመሃል ቁልፍን ይጫኑ';

  @override
  String get playPauseMenuTutorialText =>
      'አንድ ዘፈን ለማጫወት ወይም ለአፍታ ለማቆም ይህንን ቁልፍ ይጫኑ';

  @override
  String get nextButtonMenuTutorialText => 'ወደ ቀጣዩ ዘፈን ለመዝለል ይህንን ቁልፍ ይጫኑ';

  @override
  String get previousButtonMenuTutorialText =>
      'ወደ ቀደመው ዘፈን ለመመለስ ወይም ለመመለስ ይህንን ቁልፍ ይጫኑ';

  @override
  String get menuButtonTutorialText =>
      'ወደ ቀዳሚው ምናሌ ለመመለስ ይህን ቁልፍ ተጫን. ወደ ዋናው ምናሌ በቀጥታ ለመሄድ ከማንኛውም ሌላ ገጽ ውስጥ መጫን እና መያዝ ይችላሉ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ይህ የማሳያ ማያ ገጽ ነው. የመነሻ ማያ ገጽ እና የተደራጁ ማያ ገጽ ሞድ በነባሪነት ነቅቷል እናም በቅንብሮች ውስጥ የበለጠ ሊዋቀር ይችላል.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ድምጹን ለማስተካከል ጠቅ በማድረግ ጠቅታ ጎድጓዳይ ላይ ይውሰዱት';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'አሞሌ, Scrubber አሞሌ እና ተንሸራታች ወደ ጩኸት ወደ ፈልግ ማእከል ቁልፍን ይጫኑ. ተጨማሪ አማራጮችን ለመድረስ የመሃል ቁልፍን ተጭነው ይቆዩ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ዘፈኑን በፍጥነት ለማስተካከል ይህንን ቁልፍ ተጭነው ይቆዩ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ዘፈኑን ለመመልከት ይህንን ቁልፍ ተጭነው ይቆዩ እና ይያዙ';

  @override
  String get deviceControlSearchTutorialText =>
      'ጣትዎን አንድ ፊደል ለማጉላት በመዝህሩ ዙሪያ አሽጉን ያዛውሩ';

  @override
  String get centerButtonSearchTutorialText => 'የደመቀውን ፊደል ለመምረጥ የመሃል ቁልፍን ተጫን';

  @override
  String get nextButtonSearchTutorialText => 'ቦታ ለማከል ይህንን ቁልፍ ተጫን';

  @override
  String get previousButtonSearchTutorialText =>
      'የመጨረሻውን ገጸ-ባህሪ ለመሰረዝ ይህንን ቁልፍ ተጫን';

  @override
  String get menuButtonSearchTutorialText =>
      'የቁልፍ ሰሌዳውን ለመዝጋት እና ከድቶች ውጤቶች ጋር ለመግባባት ይህንን ቁልፍ ተጫን';

  @override
  String get allSongs => 'ሁሉም ዘፈኖች';
}
