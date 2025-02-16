// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Baluchi (`bal`).
class AppLocalizationsBal extends AppLocalizations {
  AppLocalizationsBal([String locale = 'bal']) : super(locale);

  @override
  String get appTitle => 'کلاس بندی';

  @override
  String get menuButtonText => 'مینو';

  @override
  String get audioAccessPermissionTitle => 'آڈیو ءِ رسائی ءَ لوٹ اِت';

  @override
  String get audioAccessPermissionContent => 'آڈیو فائلانی رسائی ءَ بہ دئے اِت کہ مارا وتی موسیقی ءِ فائلانی گوازینگ ءِ اجازت بہ دنت۔';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'رسائی ءِ رسائی';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'اے ایپ ءِ ھاتر ءَ آڈیو فائلانی رسائی ءِ ھاتر ءَ ڈیوائس ءِ ترتیبات ءِ تہ ءَ رسائی ءِ اجازت بہ دئے اِت کہ مارا شمئے میوزک فائلانی گوازینگ ءِ اجازت بہ دنت۔';

  @override
  String get menuScreenTitle => 'مینو';

  @override
  String get musicMenuScreenTitle => 'ساز';

  @override
  String get nowPlayingScreenTitle => 'نوں گوازی کنگ';

  @override
  String get shuffleSongsMenuTitle => 'شفل گانا';

  @override
  String get shuffleSettingTitle => 'شفل';

  @override
  String get settingsScreenTitle => 'گچین کنگ';

  @override
  String get aboutScreenTitle => 'بابت ءَ';

  @override
  String get coverFlowScreenTitle => 'فلو';

  @override
  String get artistsScreenTitle => 'ازمکاری';

  @override
  String get albumsScreenTitle => 'الّم';

  @override
  String get songsScreenTitle => 'دزکش';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString گانا',
      one: '1 سوت',
      zero: 'ہچ گانا نیستیں',
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
      other: '$countString البم',
      one: '1 البم',
      zero: 'ہچ البم نیستیں',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'جنازہ';

  @override
  String get genreSongsScreenTitle => 'جنر گانا';

  @override
  String get deviceColorSettingTitle => 'رنگ';

  @override
  String get touchScreenSettingTitle => 'اسکرین ءَ را ٹچ کنگ';

  @override
  String get repeatModeSettingTitle => 'پدا';

  @override
  String get repeatModeOne => 'یک';

  @override
  String get repeatModeAll => 'دُرست';

  @override
  String get vibrateSettingTitle => 'وائبرٹ';

  @override
  String get clickWheelSettingTitle => 'هوشی ءِ سَربندانی سر ءَ کلک بہ کن اِت';

  @override
  String get splitScreenSettingTitle => 'اسپلٹ اسکرین موڈ';

  @override
  String get touchSoundsDialogTitle => 'ٹچ شپ';

  @override
  String get touchSoundsDialogContent => 'کلک کن اِت کہ کلک وہ ءِ توار ءِ اشکنگ ءِ ھاترا سسٹم سیٹنگز ءَ چہ ٹچ سائنڈز ءَ فعال بہ کن اِت';

  @override
  String get immersiveModeSettingTitle => 'دلگوش دیگ';

  @override
  String get showAppTutorialSettingTitle => 'ٹیوٹوریل';

  @override
  String get changeDirectorySettingTitle => 'ڈائریکٹری';

  @override
  String get donateSettingTitle => 'دیگ';

  @override
  String get donateSettingDescription => 'اگاں شما اے ایپ ءَ دوست دار اِت گڑا عطیہ کنگ ءِ سرا ھیال ءُ لیکہ بہ کن اِت۔';

  @override
  String get versionAboutScreenTitle => 'تہر';

  @override
  String get madeWithLoveTitle => '⤤8.';

  @override
  String get noMusicFilesFound => 'ہچ موسیقی';

  @override
  String get noArtistsFound => 'ہچ آرٹسٹ';

  @override
  String get noAlbumsFound => 'ہچ وڑیں البم';

  @override
  String get unknownSong => 'سونگ';

  @override
  String get unknownArtist => 'ناشناسیں ازمکار';

  @override
  String get unknownAlbum => 'ناشناسیں البوم';

  @override
  String get unknownGenre => 'ناشناسیں جینری';

  @override
  String get buttonConfirmText => 'شریں';

  @override
  String get tileValueOn => 'سرا';

  @override
  String get tileValueOff => 'بند';

  @override
  String get commonOfText => 'ءِ';

  @override
  String get pageNotFoundText => 'داتگیں تاک ءَ دست نہ کپتگ';

  @override
  String get commonErrorText => 'رَدی';

  @override
  String get retryButtonText => 'پُشت';

  @override
  String get filePickerDialogTitle => 'پہ موسیقی ءِ واستہ ڈائریکٹری ءَ گچین کن اِت';

  @override
  String get searchScreenTitle => 'شوہاز کن';

  @override
  String get searchEmptyText => 'ہچ سرچ ءِ رِد ءُ بند دیگ نہ بوتگ';

  @override
  String get searchResultsText => 'سرچ ءِ پٹ ءُ پول:';

  @override
  String get resultsForText => 'آسر پہ:';

  @override
  String get disableBatteryOptimizationTitle => 'بیٹری ءِ سرا کار کنگ';

  @override
  String get disableBatteryOptimizationContent => 'موسیقی ءِ پس منظر ءِ پلے بیک ءِ اجازت دیگ ءِ ھاتر ءَ ڈیوائس ءِ ترتیبات ءَ اے ایپ ءِ واستہ بیٹری ءِ اصلاح ءَ را نافذ بہ کن اِت۔';

  @override
  String get languageScreenTitle => 'زبان';

  @override
  String get silverDeviceColor => 'نُگرہ';

  @override
  String get blackDeviceColor => 'سیاہ';

  @override
  String get resetSettingsTitle => 'وانگ';

  @override
  String get browseArtist => 'برپ آرٹسٹ';

  @override
  String get browseAlbum => 'براؤز البم';

  @override
  String get cancelText => 'کوتاه کنگ';

  @override
  String get playlistsScreenTitle => 'پلے لسٹ';

  @override
  String get addToOnTheGoPlaylist => 'آن ءِ سرا ھوار بہ بئے۔';

  @override
  String get addAlbumToOnTheGoPlaylist => 'البوم ءَ اون-گوگ ءَ ھوار کن اِت۔';

  @override
  String get removeSongFromThePlaylist => 'درج کنگ';

  @override
  String get allAlbums => 'کلیں البم';

  @override
  String get scanningMusicFiles => 'موسیقی ءِ عکس';

  @override
  String get newPlaylist => 'نوکیں پلے لسٹ';

  @override
  String get savePlaylist => 'نِزونل لسٹ';

  @override
  String get clearPlaylist => 'کلیئر پلے لسٹ';

  @override
  String get rescanMusicFilesSettingTitle => 'مکران';

  @override
  String get deviceControlMenuTutorialText => 'مینو ءِ نیویگیشن کنگ ءِ ھاترا وتی انگوٹھے ءَ ہلکی ہلکی ءَ دیم ءَ بیار اِت';

  @override
  String get centerButtonMenuTutorialText => 'مریضہ مینی آئٹم ءِ گچین کنگ ءِ ھاترا مرکز ءِ بٹن ءَ دپ ءَ بہ کن اِت';

  @override
  String get playPauseMenuTutorialText => 'اے بٹن ءَ دپ ءَ بہ جن اِت کہ یک گانا یے بہ جن اِت';

  @override
  String get nextButtonMenuTutorialText => 'دیمتر ءِ گانا ءِ سرا اسکی کنگ ءِ ھاترا اے بٹن ءَ دپ ءَ بہ کن اِت';

  @override
  String get previousButtonMenuTutorialText => 'اے بٹن ءَ دپ ءَ بہ جن یا پدا پیسر ءَ پدا رواں';

  @override
  String get menuButtonTutorialText => 'اے بٹن ءَ دپ ءَ بہ جن اِت کہ پیسر ءَ چہ پیسریگیں مینو ءَ بہ رو اِت۔ تو چہ دگہ اسکرین ءَ دیم پہ دیم بوت کن ئے کہ دیم پہ دیم مین مینو ءَ بہ رو ئے۔';

  @override
  String get deviceScreenMenuTutorialText => 'اے ڈسپلے اسکرین انت۔ ٹچ اسکرین ءُ اسپلٹ اسکرین موڈ ءَ ڈیفالٹ ءِ وسیلہ ءَ فعال کنگ بیت ءُ ترتیبات ءِ تہا گیشتر ترتیب دیگ بوت کنت۔';

  @override
  String get deviceControlNowPlayingTutorialText => 'وتی انگوٹھے ءَ کلک کن اِت کہ حجم ءَ ایڈجسٹ بہ کن اِت';

  @override
  String get centerButtonNowPlayingTutorialText => 'مرکز ءِ بٹن ءَ چہ شوھاز ءَ بہ کن اِت کہ چہ آئی ءِ شوھاز ءَ بہ کن اِت، سکڑیں بار ءُ شفل سلائیڈر۔ مرکز ءِ بٹن ءَ دپ ءَ بہ دار اِت ءُ گیشیں آپشنانی رسائی ءَ بہ دار اِت۔';

  @override
  String get nextButtonNowPlayingTutorialText => 'اے بٹن ءَ دپ ءَ بہ دار اِت ءُ گانا ءِ دیم ءَ بہ دار اِت';

  @override
  String get previousButtonNowPlayingTutorialText => 'گانا ءِ پدا گرگ ءِ ھاترا اے بٹن ءَ بہ دار اِت';

  @override
  String get deviceControlSearchTutorialText => 'وتی انگوٹھے ءَ چہ کلک ءِ کش ءُ گور ءَ دیم ءَ بیار';

  @override
  String get centerButtonSearchTutorialText => 'مرخص الففی ءِ گچین کنگ ءِ ھاترا مرکز ءِ بٹن ءَ دپ ءَ بہ کن اِت';

  @override
  String get nextButtonSearchTutorialText => 'اے بٹن ءَ دپ ءَ بہ جن اِت';

  @override
  String get previousButtonSearchTutorialText => 'اے بٹن ئا دپ جن';

  @override
  String get menuButtonSearchTutorialText => 'کی بورڈ بند کنگ ءِ ھاترا اے بٹن ءَ دپ ءَ بہ کن ءُ پٹ ءُ پول ءِ آسر ءَ گوں رابطہ بہ کن';
}
