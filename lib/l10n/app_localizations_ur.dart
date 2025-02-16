// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'کلاس پوڈ';

  @override
  String get menuButtonText => 'مینو';

  @override
  String get audioAccessPermissionTitle => 'آڈیو رسائی کی اجازت درکار ہے';

  @override
  String get audioAccessPermissionContent => 'براہ کرم آڈیو فائلوں تک رسائی حاصل کریں تاکہ ہمیں آپ کی میوزک فائلیں چلانے کی اجازت دی جاسکے۔';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'آڈیو رسائی کی اجازت سے انکار کیا گیا';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'براہ کرم آڈیو فائلوں کو اس ایپ کے لئے آلہ کی ترتیبات میں رسائی دیں تاکہ ہمیں آپ کی میوزک فائلیں چلانے کی اجازت دی جاسکے۔';

  @override
  String get menuScreenTitle => 'مینو';

  @override
  String get musicMenuScreenTitle => 'موسیقی';

  @override
  String get nowPlayingScreenTitle => 'اب کھیل رہا ہے';

  @override
  String get shuffleSongsMenuTitle => 'شفل گانے';

  @override
  String get shuffleSettingTitle => 'شفل';

  @override
  String get settingsScreenTitle => 'ترتیبات';

  @override
  String get aboutScreenTitle => 'کے بارے میں';

  @override
  String get coverFlowScreenTitle => 'سرورق بہاؤ';

  @override
  String get artistsScreenTitle => 'فنکار';

  @override
  String get albumsScreenTitle => 'البمز';

  @override
  String get songsScreenTitle => 'گانے';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString گانے',
      one: '1 گانا',
      zero: 'کوئی گانا',
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
      other: '$countString البمز',
      one: '1 البم',
      zero: 'کوئی البم نہیں',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'انواع';

  @override
  String get genreSongsScreenTitle => 'صنف کے گانے';

  @override
  String get deviceColorSettingTitle => 'ڈیوائس کا رنگ';

  @override
  String get touchScreenSettingTitle => 'ٹچ اسکرین فعال';

  @override
  String get repeatModeSettingTitle => 'دہرائیں';

  @override
  String get repeatModeOne => 'ایک';

  @override
  String get repeatModeAll => 'سب';

  @override
  String get vibrateSettingTitle => 'کمپن';

  @override
  String get clickWheelSettingTitle => 'پہیے کی آواز پر کلک کریں';

  @override
  String get splitScreenSettingTitle => 'اسپلٹ اسکرین وضع';

  @override
  String get touchSoundsDialogTitle => 'ٹچ آوازیں';

  @override
  String get touchSoundsDialogContent => 'براہ کرم پہیے کی آوازوں کو سننے کے لئے سسٹم کی ترتیبات سے ٹچ آوازوں کو فعال کریں';

  @override
  String get immersiveModeSettingTitle => 'عمیق موڈ';

  @override
  String get showAppTutorialSettingTitle => 'سبق دکھائیں';

  @override
  String get changeDirectorySettingTitle => 'ڈائریکٹری کو تبدیل کریں';

  @override
  String get donateSettingTitle => 'عطیہ کریں';

  @override
  String get donateSettingDescription => 'اگر آپ کو یہ ایپ پسند ہے تو ، براہ کرم عطیہ کرنے پر غور کریں۔';

  @override
  String get versionAboutScreenTitle => 'ورژن';

  @override
  String get madeWithLoveTitle => 'by by کے ساتھ بنایا گیا';

  @override
  String get noMusicFilesFound => 'کوئی موسیقی نہیں';

  @override
  String get noArtistsFound => 'کوئی فنکار نہیں';

  @override
  String get noAlbumsFound => 'کوئی البم نہیں';

  @override
  String get unknownSong => 'نامعلوم گانا';

  @override
  String get unknownArtist => 'نامعلوم آرٹسٹ';

  @override
  String get unknownAlbum => 'نامعلوم البم';

  @override
  String get unknownGenre => 'نامعلوم صنف';

  @override
  String get buttonConfirmText => 'ٹھیک ہے';

  @override
  String get tileValueOn => 'پر';

  @override
  String get tileValueOff => 'آف';

  @override
  String get commonOfText => 'کے';

  @override
  String get pageNotFoundText => 'دیئے گئے صفحے کو نہیں ملا';

  @override
  String get commonErrorText => 'غلطی';

  @override
  String get retryButtonText => 'دوبارہ کوشش کریں';

  @override
  String get filePickerDialogTitle => 'موسیقی کے لئے اسکین کرنے کے لئے ایک ڈائریکٹری منتخب کریں';

  @override
  String get searchScreenTitle => 'تلاش';

  @override
  String get searchEmptyText => 'تلاش کے نتائج نہیں ہیں';

  @override
  String get searchResultsText => 'تلاش کے نتائج:';

  @override
  String get resultsForText => 'نتائج کے نتائج:';

  @override
  String get disableBatteryOptimizationTitle => 'بیٹری کی اصلاح کو غیر فعال کریں';

  @override
  String get disableBatteryOptimizationContent => 'براہ کرم موسیقی کے پس منظر پلے بیک کی اجازت دینے کے لئے ڈیوائس کی ترتیبات میں اس ایپ کے لئے بیٹری کی اصلاح کو غیر فعال کریں۔';

  @override
  String get languageScreenTitle => 'زبان';

  @override
  String get silverDeviceColor => 'چاندی';

  @override
  String get blackDeviceColor => 'سیاہ';

  @override
  String get resetSettingsTitle => 'ترتیبات کو دوبارہ ترتیب دیں';

  @override
  String get browseArtist => 'فنکار کو براؤز کریں';

  @override
  String get browseAlbum => 'البم کو براؤز کریں';

  @override
  String get cancelText => 'منسوخ کریں';

  @override
  String get playlistsScreenTitle => 'پلے لسٹس';

  @override
  String get addToOnTheGoPlaylist => 'چلتے پھرتے میں شامل کریں';

  @override
  String get addAlbumToOnTheGoPlaylist => 'چلتے پھرتے البم شامل کریں';

  @override
  String get removeSongFromThePlaylist => 'پلے لسٹ سے ہٹا دیں';

  @override
  String get allAlbums => 'تمام البمز';

  @override
  String get scanningMusicFiles => 'میوزک فائلوں کو اسکین کرنا';

  @override
  String get newPlaylist => 'نئی پلے لسٹ';

  @override
  String get savePlaylist => 'پلے لسٹ کو بچائیں';

  @override
  String get clearPlaylist => 'صاف پلے لسٹ';

  @override
  String get rescanMusicFilesSettingTitle => 'میوزک فائلوں کو بازیافت کریں';

  @override
  String get deviceControlMenuTutorialText => 'مینو کو نیویگیٹ کرنے کے لئے اپنے انگوٹھے کو ہلکے سے کلک وہیل کے گرد منتقل کریں';

  @override
  String get centerButtonMenuTutorialText => 'نمایاں کردہ مینو آئٹم کو منتخب کرنے کے لئے سنٹر بٹن دبائیں';

  @override
  String get playPauseMenuTutorialText => 'کسی گانے کو کھیلنے یا روکنے کے لئے اس بٹن کو دبائیں';

  @override
  String get nextButtonMenuTutorialText => 'اگلے گانے پر جانے کے لئے اس بٹن کو دبائیں';

  @override
  String get previousButtonMenuTutorialText => 'اس بٹن کو ریوائنڈ کرنے یا پچھلے گانے پر واپس جانے کے لئے دبائیں';

  @override
  String get menuButtonTutorialText => 'پچھلے مینو میں واپس جانے کے لئے اس بٹن کو دبائیں۔ براہ راست مین مینو میں جانے کے لئے آپ اسے کسی بھی دوسری اسکرین سے دبائیں اور تھام سکتے ہیں۔';

  @override
  String get deviceScreenMenuTutorialText => 'یہ ڈسپلے اسکرین ہے۔ ٹچ اسکرین اور اسپلٹ اسکرین وضع کو بطور ڈیفالٹ فعال کیا جاتا ہے اور ترتیبات میں مزید ترتیب دی جاسکتی ہے۔';

  @override
  String get deviceControlNowPlayingTutorialText => 'حجم کو ایڈجسٹ کرنے کے لئے اپنے انگوٹھے کو کلک وہیل کے ارد گرد منتقل کریں';

  @override
  String get centerButtonNowPlayingTutorialText => 'سیچ بار ، اسکربر بار اور شفل سلائیڈر کے ذریعے سائیکل کے لئے سینٹر کے بٹن کو دبائیں۔ اضافی اختیارات تک رسائی کے ل the سینٹر کے بٹن کو دبائیں اور تھامیں۔';

  @override
  String get nextButtonNowPlayingTutorialText => 'گانے کو تیزی سے آگے بڑھانے کے لئے اس بٹن کو دبائیں اور تھامیں';

  @override
  String get previousButtonNowPlayingTutorialText => 'گانے کو دوبارہ بنانے کے لئے اس بٹن کو دبائیں اور تھامیں';

  @override
  String get deviceControlSearchTutorialText => 'حرف تہجی کو اجاگر کرنے کے لئے اپنے انگوٹھے کو ہلکے سے کلک پہیے کے گرد منتقل کریں';

  @override
  String get centerButtonSearchTutorialText => 'نمایاں حروف تہجی کو منتخب کرنے کے لئے سینٹر کے بٹن کو دبائیں';

  @override
  String get nextButtonSearchTutorialText => 'جگہ شامل کرنے کے لئے اس بٹن کو دبائیں';

  @override
  String get previousButtonSearchTutorialText => 'آخری کردار کو حذف کرنے کے لئے اس بٹن کو دبائیں';

  @override
  String get menuButtonSearchTutorialText => 'کی بورڈ کو بند کرنے اور تلاش کے نتائج کے ساتھ بات چیت کرنے کے لئے اس بٹن کو دبائیں';
}
