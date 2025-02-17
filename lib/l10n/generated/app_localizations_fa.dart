// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'کلاسیک';

  @override
  String get menuButtonText => 'منو';

  @override
  String get audioAccessPermissionTitle => 'اجازه دسترسی صوتی لازم است';

  @override
  String get audioAccessPermissionContent =>
      'لطفاً به پرونده های صوتی دسترسی پیدا کنید تا به ما اجازه دهید فایلهای موسیقی خود را پخش کنیم.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'مجوز دسترسی صوتی رد شد';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'لطفاً به فایلهای صوتی دسترسی به این برنامه در تنظیمات دستگاه اعطا کنید تا به ما اجازه دهد فایلهای موسیقی خود را پخش کنیم.';

  @override
  String get menuScreenTitle => 'منو';

  @override
  String get musicMenuScreenTitle => 'موسیقی';

  @override
  String get nowPlayingScreenTitle => 'اکنون بازی کردن';

  @override
  String get shuffleSongsMenuTitle => 'آهنگ ها';

  @override
  String get shuffleSettingTitle => 'تغییر دادن';

  @override
  String get settingsScreenTitle => 'تنظیمات';

  @override
  String get aboutScreenTitle => 'در مورد';

  @override
  String get coverFlowScreenTitle => 'جریان پوشش';

  @override
  String get artistsScreenTitle => 'هنرمند';

  @override
  String get albumsScreenTitle => 'آلبوم';

  @override
  String get songsScreenTitle => 'ترانه';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString آهنگ',
      one: '1 آهنگ',
      zero: 'بدون آهنگ',
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
      other: '$countString آلبوم ها',
      one: '1 آلبوم',
      zero: 'بدون آلبوم',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ژانرها';

  @override
  String get genreSongsScreenTitle => 'ترانه های ژانر';

  @override
  String get deviceColorSettingTitle => 'رنگ دستگاه';

  @override
  String get touchScreenSettingTitle => 'صفحه لمسی فعال شد';

  @override
  String get repeatModeSettingTitle => 'تکرار کردن';

  @override
  String get repeatModeOne => 'یکی';

  @override
  String get repeatModeAll => 'همه';

  @override
  String get vibrateSettingTitle => 'لرزیدن';

  @override
  String get clickWheelSettingTitle => 'روی چرخ های چرخ کلیک کنید';

  @override
  String get splitScreenSettingTitle => 'حالت صفحه تقسیم';

  @override
  String get touchSoundsDialogTitle => 'صداها را لمس کنید';

  @override
  String get touchSoundsDialogContent =>
      'لطفاً صداهای لمس را از تنظیمات سیستم فعال کنید تا صداهای چرخ کلیک را بشنوید';

  @override
  String get immersiveModeSettingTitle => 'حالت همهجانبه';

  @override
  String get showAppTutorialSettingTitle => 'آموزش نمایش';

  @override
  String get changeDirectorySettingTitle => 'دایرکتوری را تغییر دهید';

  @override
  String get donateSettingTitle => 'اهداء کردن';

  @override
  String get donateSettingDescription =>
      'اگر این برنامه را دوست دارید ، لطفاً اهداء را در نظر بگیرید.';

  @override
  String get versionAboutScreenTitle => 'نسخه';

  @override
  String get madeWithLoveTitle => 'ساخته شده با ❤ توسط';

  @override
  String get noMusicFilesFound => 'بدون موسیقی';

  @override
  String get noArtistsFound => 'بدون هنرمند';

  @override
  String get noAlbumsFound => 'بدون آلبوم';

  @override
  String get unknownSong => 'آهنگ ناشناخته';

  @override
  String get unknownArtist => 'هنرمند ناشناخته';

  @override
  String get unknownAlbum => 'آلبوم ناشناخته';

  @override
  String get unknownGenre => 'ژانر ناشناخته';

  @override
  String get buttonConfirmText => 'خوب';

  @override
  String get tileValueOn => 'در';

  @override
  String get tileValueOff => 'از روی';

  @override
  String get commonOfText => 'از';

  @override
  String get pageNotFoundText => 'صفحه داده شده یافت نشد';

  @override
  String get commonErrorText => 'خطا';

  @override
  String get retryButtonText => 'مجدداً';

  @override
  String get filePickerDialogTitle =>
      'دایرکتوری را برای اسکن موسیقی انتخاب کنید';

  @override
  String get searchScreenTitle => 'جستجو';

  @override
  String get searchEmptyText => 'بدون نتیجه جستجو';

  @override
  String get searchResultsText => 'نتایج جستجو:';

  @override
  String get resultsForText => 'نتایج برای:';

  @override
  String get disableBatteryOptimizationTitle =>
      'بهینه سازی باتری را غیرفعال کنید';

  @override
  String get disableBatteryOptimizationContent =>
      'لطفاً بهینه سازی باتری را برای این برنامه در تنظیمات دستگاه غیرفعال کنید تا پخش پس زمینه موسیقی امکان پذیر باشد.';

  @override
  String get languageScreenTitle => 'زبان';

  @override
  String get silverDeviceColor => 'نقره';

  @override
  String get blackDeviceColor => 'سیاه';

  @override
  String get resetSettingsTitle => 'تنظیم مجدد تنظیمات';

  @override
  String get browseArtist => 'مرور هنرمند';

  @override
  String get browseAlbum => 'مرور آلبوم';

  @override
  String get cancelText => 'لغو کردن';

  @override
  String get playlistsScreenTitle => 'لیست پخش';

  @override
  String get addToOnTheGoPlaylist => 'اضافه کردن';

  @override
  String get addAlbumToOnTheGoPlaylist => 'آلبوم را به صورت آنلاین اضافه کنید';

  @override
  String get removeSongFromThePlaylist => 'از لیست پخش حذف کنید';

  @override
  String get allAlbums => 'همه آلبوم ها';

  @override
  String get scanningMusicFiles => 'اسکن پرونده های موسیقی';

  @override
  String get newPlaylist => 'لیست پخش جدید';

  @override
  String get savePlaylist => 'لیست پخش را ذخیره کنید';

  @override
  String get clearPlaylist => 'لیست پخش روشن';

  @override
  String get rescanMusicFilesSettingTitle => 'پرونده های موسیقی Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'انگشت شست خود را به آرامی دور چرخ کلیک برای حرکت در منو حرکت دهید';

  @override
  String get centerButtonMenuTutorialText =>
      'برای انتخاب مورد منوی برجسته ، دکمه Center را فشار دهید';

  @override
  String get playPauseMenuTutorialText =>
      'برای پخش یا مکث یک آهنگ ، این دکمه را فشار دهید';

  @override
  String get nextButtonMenuTutorialText =>
      'این دکمه را فشار دهید تا به آهنگ بعدی پرش کنید';

  @override
  String get previousButtonMenuTutorialText =>
      'این دکمه را فشار دهید تا دوباره به آهنگ قبلی برگردید';

  @override
  String get menuButtonTutorialText =>
      'برای بازگشت به منوی قبلی ، این دکمه را فشار دهید. می توانید آن را از هر صفحه دیگر فشار داده و نگه دارید تا مستقیماً به منوی اصلی بروید.';

  @override
  String get deviceScreenMenuTutorialText =>
      'این صفحه نمایش است. صفحه لمسی و حالت صفحه تقسیم به طور پیش فرض فعال می شوند و می توانند در تنظیمات بیشتر پیکربندی شوند.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'انگشت شست خود را در اطراف چرخ کلیک حرکت دهید تا حجم تنظیم شود';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'دکمه مرکز را فشار دهید تا از طریق نوار جستجو ، نوار اسکراب و کشویی Shuffle چرخه بزنید. دکمه مرکز را فشار داده و نگه دارید تا به گزینه های اضافی دسترسی پیدا کنید.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'این دکمه را فشار داده و نگه دارید تا سریع آهنگ را به جلو بکشید';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'این دکمه را فشار داده و نگه دارید تا دوباره آهنگ شود';

  @override
  String get deviceControlSearchTutorialText =>
      'انگشت شست خود را به آرامی در اطراف چرخ کلیک حرکت دهید تا یک الفبای برجسته شود';

  @override
  String get centerButtonSearchTutorialText =>
      'برای انتخاب الفبای برجسته ، دکمه Center را فشار دهید';

  @override
  String get nextButtonSearchTutorialText =>
      'این دکمه را فشار دهید تا یک فضا اضافه شود';

  @override
  String get previousButtonSearchTutorialText =>
      'این دکمه را فشار دهید تا آخرین شخصیت حذف شود';

  @override
  String get menuButtonSearchTutorialText =>
      'برای بستن صفحه کلید و تعامل با نتایج جستجو ، این دکمه را فشار دهید';
}
