// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'قائمة طعام';

  @override
  String get audioAccessPermissionTitle => 'إذن الوصول إلى الصوت مطلوب';

  @override
  String get audioAccessPermissionContent =>
      'يرجى منح ملفات الصوت للوصول للسماح لنا بتشغيل ملفات الموسيقى الخاصة بك.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'تم رفض إذن الوصول إلى الصوت';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'يرجى منح وصول ملفات الصوت لهذا التطبيق في إعدادات الجهاز للسماح لنا بتشغيل ملفات الموسيقى الخاصة بك.';

  @override
  String get menuScreenTitle => 'قائمة طعام';

  @override
  String get musicMenuScreenTitle => 'موسيقى';

  @override
  String get nowPlayingScreenTitle => 'اللعب الآن';

  @override
  String get shuffleSongsMenuTitle => 'أغاني خلط';

  @override
  String get shuffleSettingTitle => 'خلط';

  @override
  String get settingsScreenTitle => 'إعدادات';

  @override
  String get aboutScreenTitle => 'عن';

  @override
  String get coverFlowScreenTitle => 'تدفق الغلاف';

  @override
  String get artistsScreenTitle => 'الفنانين';

  @override
  String get albumsScreenTitle => 'ألبومات';

  @override
  String get songsScreenTitle => 'الأغاني';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString الأغاني',
      one: '1 أغنية',
      zero: 'لا أغاني',
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
      other: '$countString الألبومات',
      one: '1 الألبوم',
      zero: 'لا ألبومات',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'الأنواع';

  @override
  String get genreSongsScreenTitle => 'أغاني النوع';

  @override
  String get deviceColorSettingTitle => 'لون الجهاز';

  @override
  String get touchScreenSettingTitle => 'تمكين شاشة اللمس';

  @override
  String get repeatModeSettingTitle => 'يكرر';

  @override
  String get repeatModeOne => 'واحد';

  @override
  String get repeatModeAll => 'الجميع';

  @override
  String get vibrateSettingTitle => 'تذبذب';

  @override
  String get clickWheelSettingTitle => 'انقر فوق أصوات العجلات';

  @override
  String get splitScreenSettingTitle => 'تقسيم وضع الشاشة';

  @override
  String get touchSoundsDialogTitle => 'اللمس الأصوات';

  @override
  String get touchSoundsDialogContent =>
      'يرجى تمكين اللمس الأصوات من إعدادات النظام لسماع أصوات عجلة النقر';

  @override
  String get immersiveModeSettingTitle => 'الوضع الغامرة';

  @override
  String get showAppTutorialSettingTitle => 'عرض البرنامج التعليمي';

  @override
  String get changeDirectorySettingTitle => 'تغيير الدليل';

  @override
  String get donateSettingTitle => 'يتبرع';

  @override
  String get donateSettingDescription =>
      'إذا كنت تحب هذا التطبيق ، فيرجى التفكير في التبرع.';

  @override
  String get versionAboutScreenTitle => 'إصدار';

  @override
  String get madeWithLoveTitle => 'مصنوع من ❤ بواسطة';

  @override
  String get noMusicFilesFound => 'لا موسيقى';

  @override
  String get noArtistsFound => 'لا فنانين';

  @override
  String get noAlbumsFound => 'لا ألبومات';

  @override
  String get unknownSong => 'أغنية غير معروفة';

  @override
  String get unknownArtist => 'فنان غير معروف';

  @override
  String get unknownAlbum => 'ألبوم غير معروف';

  @override
  String get unknownGenre => 'نوع غير معروف';

  @override
  String get buttonConfirmText => 'نعم';

  @override
  String get tileValueOn => 'على';

  @override
  String get tileValueOff => 'عن';

  @override
  String get commonOfText => 'ل';

  @override
  String get pageNotFoundText => 'لم يتم العثور على الصفحة المحددة';

  @override
  String get commonErrorText => 'خطأ';

  @override
  String get retryButtonText => 'إعادة المحاولة';

  @override
  String get filePickerDialogTitle => 'حدد دليلًا للمسح للموسيقى';

  @override
  String get searchScreenTitle => 'يبحث';

  @override
  String get searchEmptyText => 'لا توجد نتائج بحث';

  @override
  String get searchResultsText => 'نتائج البحث:';

  @override
  String get resultsForText => 'نتائج:';

  @override
  String get disableBatteryOptimizationTitle => 'تعطيل تحسين البطارية';

  @override
  String get disableBatteryOptimizationContent =>
      'يرجى تعطيل تحسين البطارية لهذا التطبيق في إعدادات الجهاز للسماح بتشغيل الخلفية للموسيقى.';

  @override
  String get languageScreenTitle => 'لغة';

  @override
  String get silverDeviceColor => 'فضي';

  @override
  String get blackDeviceColor => 'أسود';

  @override
  String get resetSettingsTitle => 'إعادة تعيين الإعدادات';

  @override
  String get browseArtist => 'فنان تصفح';

  @override
  String get browseAlbum => 'ألبوم تصفح';

  @override
  String get cancelText => 'يلغي';

  @override
  String get playlistsScreenTitle => 'قوائم التشغيل';

  @override
  String get addToOnTheGoPlaylist => 'أضف إلى التنقل';

  @override
  String get addAlbumToOnTheGoPlaylist => 'أضف الألبوم إلى التنقل';

  @override
  String get removeSongFromThePlaylist => 'ترفع من قائمة التشغيل';

  @override
  String get allAlbums => 'جميع الألبومات';

  @override
  String get scanningMusicFiles => 'مسح ملفات الموسيقى';

  @override
  String get newPlaylist => 'قائمة تشغيل جديدة';

  @override
  String get savePlaylist => 'حفظ قائمة التشغيل';

  @override
  String get clearPlaylist => 'قائمة تشغيل واضحة';

  @override
  String get rescanMusicFilesSettingTitle => 'ملفات موسيقى ROSCAN';

  @override
  String get deviceControlMenuTutorialText =>
      'حرك إبهامك برفق حول عجلة النقر للتنقل في القائمة';

  @override
  String get centerButtonMenuTutorialText =>
      'اضغط على زر الوسط لتحديد عنصر القائمة المميزة';

  @override
  String get playPauseMenuTutorialText =>
      'اضغط على هذا الزر للتشغيل أو إيقاف تشغيل أغنية';

  @override
  String get nextButtonMenuTutorialText =>
      'اضغط على هذا الزر لتخطي الأغنية التالية';

  @override
  String get previousButtonMenuTutorialText =>
      'اضغط على هذا الزر للعودة أو العودة إلى الأغنية السابقة';

  @override
  String get menuButtonTutorialText =>
      'اضغط على هذا الزر للعودة إلى القائمة السابقة. يمكنك الضغط عليها والاحتفاظ بها من أي شاشة أخرى للذهاب مباشرة إلى القائمة الرئيسية.';

  @override
  String get deviceScreenMenuTutorialText =>
      'هذه هي شاشة العرض. يتم تمكين شاشة اللمس ووضع الشاشة المقسمة بشكل افتراضي ويمكن تكوينه بشكل أكبر في الإعدادات.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'حرك إبهامك حول عجلة النقر لضبط مستوى الصوت';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'اضغط على زر المركز للتنقل من خلال شريط Seek و Scrubber Bar و Shuffle Randider. اضغط مع الاستمرار على زر الوسط للوصول إلى خيارات إضافية.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'اضغط مع الاستمرار على هذا الزر لإعادة توجيه الأغنية بسرعة';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'اضغط مع الاستمرار على هذا الزر لإرجاع الأغنية';

  @override
  String get deviceControlSearchTutorialText =>
      'حرك إبهامك بخفة حول عجلة النقر لتسليط الضوء على الأبجدية';

  @override
  String get centerButtonSearchTutorialText =>
      'اضغط على زر الوسط لتحديد الأبجدية المميزة';

  @override
  String get nextButtonSearchTutorialText => 'اضغط على هذا الزر لإضافة مساحة';

  @override
  String get previousButtonSearchTutorialText =>
      'اضغط على هذا الزر لحذف الحرف الأخير';

  @override
  String get menuButtonSearchTutorialText =>
      'اضغط على هذا الزر لإغلاق لوحة المفاتيح والتفاعل مع نتائج البحث';
}
