// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AppLocalizationsPs extends AppLocalizations {
  AppLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get appTitle => 'طبقه';

  @override
  String get menuButtonText => 'مینو';

  @override
  String get audioAccessPermissionTitle => 'د آډیو لاسرسي اجازه لازمي';

  @override
  String get audioAccessPermissionContent =>
      'مهرباني وکړئ موږ ته اجازه راکړئ چې موږ ته اجازه درکړو ترڅو ستاسو د میوزیک فایلونو غږول.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'د آډیو لاسرسي اجازه';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'مهرباني وکړئ د وسیلې ترتیباتو کې د دې ایپ لپاره د آډیو فایلونو لاسرسی واستوئ ترڅو موږ ته اجازه راکړئ ستاسو د میوزیک فایلونو غږول.';

  @override
  String get menuScreenTitle => 'مینو';

  @override
  String get musicMenuScreenTitle => 'میوزک';

  @override
  String get nowPlayingScreenTitle => 'اوس غږول';

  @override
  String get shuffleSongsMenuTitle => 'سندرې شیلې';

  @override
  String get shuffleSettingTitle => 'شفټ';

  @override
  String get settingsScreenTitle => 'امستنې';

  @override
  String get aboutScreenTitle => 'په اړه';

  @override
  String get coverFlowScreenTitle => 'د پوښ پوښ';

  @override
  String get artistsScreenTitle => 'هنرمندان';

  @override
  String get albumsScreenTitle => 'البومونه';

  @override
  String get songsScreenTitle => 'سندرې';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString سندرې',
      one: '1 سندره',
      zero: 'سندرې نشته',
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
      other: '$countString البومونه',
      one: '1 البوم',
      zero: 'البومونه نشته',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ژانرونه';

  @override
  String get genreSongsScreenTitle => 'سندرې ویلې';

  @override
  String get deviceColorSettingTitle => 'د وسایط رنګ';

  @override
  String get touchScreenSettingTitle => 'ټچ سکرین فعال شوی';

  @override
  String get repeatModeSettingTitle => 'تکرار یی کړه';

  @override
  String get repeatModeOne => 'یو';

  @override
  String get repeatModeAll => 'ټول';

  @override
  String get vibrateSettingTitle => 'خوځنده';

  @override
  String get clickWheelSettingTitle => 'د ویلونو غږونو کلیک وکړئ';

  @override
  String get splitScreenSettingTitle => 'د سکرینډ حالت';

  @override
  String get touchSoundsDialogTitle => 'ټچ غږونه';

  @override
  String get touchSoundsDialogContent =>
      'مهرباني وکړئ د سیسټم تنظیماتو غږولو لپاره د سیسټم تنظیماتو څخه د ټیپ آر ایسونه تنظیم کړئ';

  @override
  String get immersiveModeSettingTitle => 'ډوب حالت';

  @override
  String get showAppTutorialSettingTitle => 'ښوونه وښیه';

  @override
  String get changeDirectorySettingTitle => 'لارښود بدل کړئ';

  @override
  String get donateSettingTitle => 'مرسته وکړه';

  @override
  String get donateSettingDescription =>
      'که تاسو دا ایپ خوښ یاست، مهرباني وکړئ مرسته کول په پام کې ونیسئ.';

  @override
  String get versionAboutScreenTitle => 'نسخه';

  @override
  String get madeWithLoveTitle => 'لخوا جوړ شوی';

  @override
  String get noMusicFilesFound => 'هیڅ میوزیک نه';

  @override
  String get noArtistsFound => 'هیڅ هنرمندان نشته';

  @override
  String get noAlbumsFound => 'البومونه نه';

  @override
  String get unknownSong => 'نامعلومه سندره';

  @override
  String get unknownArtist => 'نامعلوم هنرمند';

  @override
  String get unknownAlbum => 'نامعلوم البم';

  @override
  String get unknownGenre => 'نامعلوم ژانر';

  @override
  String get buttonConfirmText => 'سمه ده';

  @override
  String get tileValueOn => 'پر';

  @override
  String get tileValueOff => 'بندول';

  @override
  String get commonOfText => 'د';

  @override
  String get pageNotFoundText => 'ورکړل شوې پا page ه ونه موندل شوه';

  @override
  String get commonErrorText => 'تېروتنه';

  @override
  String get retryButtonText => 'بیا هڅه';

  @override
  String get filePickerDialogTitle =>
      'د میوزیک لپاره سکین کولو لپاره لارښود غوره کړئ';

  @override
  String get searchScreenTitle => 'لټون';

  @override
  String get searchEmptyText => 'د لټون پایلې نشته';

  @override
  String get searchResultsText => 'د لټون پایلې:';

  @override
  String get resultsForText => 'د دې لپاره پایلې:';

  @override
  String get disableBatteryOptimizationTitle => 'د بیټرۍ مطلوب غیر فعال کړئ';

  @override
  String get disableBatteryOptimizationContent =>
      'مهرباني وکړئ د دې ایپ لپاره د بیټرۍ اصلاح کولو لپاره د بیټرۍ اصلاح کړئ ترڅو د میوزیک شالید غږولو ته اجازه ورکړئ.';

  @override
  String get languageScreenTitle => 'ژبه';

  @override
  String get silverDeviceColor => 'سلور';

  @override
  String get blackDeviceColor => 'تور';

  @override
  String get resetSettingsTitle => 'امستنې بیا تنظیم کړئ';

  @override
  String get browseArtist => 'غږونکی ورزشوی';

  @override
  String get browseAlbum => 'البوم لټول';

  @override
  String get cancelText => 'لغوه کول';

  @override
  String get playlistsScreenTitle => 'لوبیا';

  @override
  String get addToOnTheGoPlaylist => 'په';

  @override
  String get addAlbumToOnTheGoPlaylist => 'البوم په روانه کې اضافه کړئ';

  @override
  String get removeSongFromThePlaylist => 'له پلی لیست څخه لرې کړئ';

  @override
  String get allAlbums => 'ټول البومونه';

  @override
  String get scanningMusicFiles => 'د میوزیک فایلونه سکین کول';

  @override
  String get newPlaylist => 'نوې پلېواله';

  @override
  String get savePlaylist => 'د پلی لیست خوندي کړئ';

  @override
  String get clearPlaylist => 'روښانه پلی لیست';

  @override
  String get rescanMusicFilesSettingTitle => 'د ژغورنې میوزیک فایلونه';

  @override
  String get deviceControlMenuTutorialText =>
      'خپل ګوتو د مینو د چلولو لپاره د کلیک ویل په شاوخوا کلیک وکړئ';

  @override
  String get centerButtonMenuTutorialText =>
      'د روښانه شوي مینو توکي غوره کولو لپاره د مرکز ت button ۍ فشار ورکړئ';

  @override
  String get playPauseMenuTutorialText =>
      'دا ت button ۍ فشار ورکړئ ترڅو د سندرې غږول یا ځنډ کړئ';

  @override
  String get nextButtonMenuTutorialText =>
      'دې ت button ۍ په راتلونکي سندره کې د تاوولو لپاره فشار ورکړئ';

  @override
  String get previousButtonMenuTutorialText =>
      'دې ت button ۍ فشار ورکړئ ترڅو بیرته ستنیدل یا پخوانۍ سندرې ته لاړشئ';

  @override
  String get menuButtonTutorialText =>
      'پخوانۍ مینو ته د تللو لپاره دا ت button ۍ فشار ورکړئ. تاسو کولی شئ دا د نورو سکرین څخه په مستقیم ډول اصلي مینو ته لاړشئ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'دا د ښودنې سکرین دی. لماک سکرین او د ویشل سکرین حالت د ډیفالټ لخوا فعال شوی او په ترتیباتو کې یې نور تنظیم کیدی شي.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'خپل تومب د کښت د سمولو لپاره د کلیک ویل په شاوخوا کلیک وکړئ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'د بار وړلو لپاره د مرکز ت button ۍ فشار ورکړئ، د پرببار بار او شفل سلایډونو څخه. اضافي اختیارونو ته د لاسرسي لپاره د مرکز ت button ۍ فشار او ونیسئ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'د دې ت button ۍ فشار ورکړئ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'د سندرو بیا کلیک کولو لپاره دا ت button ۍ فشار ورکړئ او ونیسئ';

  @override
  String get deviceControlSearchTutorialText =>
      'خپل ګوتو ته د الفبا په اوږدو کې د کلیک ویل په شاوخوا کلیک وکړئ';

  @override
  String get centerButtonSearchTutorialText =>
      'د روښانه شوي الفبا د ټاکلو لپاره د مرکز ت button ۍ فشار ورکړئ';

  @override
  String get nextButtonSearchTutorialText =>
      'د ځای اضافه کولو لپاره دا ت button ۍ کېکاږئ';

  @override
  String get previousButtonSearchTutorialText =>
      'د وروستي کرکټر حذف کولو لپاره دا ت button ۍ فشار ورکړئ';

  @override
  String get menuButtonSearchTutorialText =>
      'د کیبورډ بندولو لپاره دا ت button ۍ فشار ورکړئ او د لټون پایلو سره متقابل عمل وکړئ';

  @override
  String get allSongs => 'ټولې سندرې';
}
