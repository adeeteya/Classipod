// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Central Kurdish (`ckb`).
class AppLocalizationsCkb extends AppLocalizations {
  AppLocalizationsCkb([String locale = 'ckb']) : super(locale);

  @override
  String get appTitle => 'classipod';

  @override
  String get menuButtonText => 'مینیو';

  @override
  String get audioAccessPermissionTitle => 'مۆڵەتی دەستگەیشتن بە دەنگ پێویستە';

  @override
  String get audioAccessPermissionContent =>
      'تکایە دەستڕاگەیشتن بە فایلە دەنگییەکان بە بۆ ئەوەی ڕێگەمان پێبدات فایلە مۆسیقەکانت لێبدەین.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'مۆڵەتی دەستگەیشتن بە دەنگ ڕەتکرایەوە';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'تکایە لە ڕێکخستنەکانی ئامێرەکەدا دەستگەیشتن بە فایلە دەنگییەکان بۆ ئەم ئەپە بدە بۆ ئەوەی ڕێگەمان پێبدات فایلە مۆسیقییەکانت لێبدەین.';

  @override
  String get menuScreenTitle => 'مینیو';

  @override
  String get musicMenuScreenTitle => 'مووزیک';

  @override
  String get nowPlayingScreenTitle => 'ئێستا یاریکردن';

  @override
  String get shuffleSongsMenuTitle => 'گۆرانییەکانی Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'ڕێکخستنەکان';

  @override
  String get aboutScreenTitle => 'دەربارەی';

  @override
  String get coverFlowScreenTitle => 'ڕەوتی داپۆشەر';

  @override
  String get artistsScreenTitle => 'هونەرمەندان';

  @override
  String get albumsScreenTitle => 'ئەلبوومەکان';

  @override
  String get songsScreenTitle => 'گۆرانی';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString گۆرانی',
      one: '1 گۆرانی',
      zero: 'بێ گۆرانی',
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
      other: '$countString ئەلبوومەکان',
      one: '1 ئەلبووم',
      zero: 'بێ ئەلبووم',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ژانرەکان';

  @override
  String get genreSongsScreenTitle => 'گۆرانییەکانی ژانر';

  @override
  String get deviceColorSettingTitle => 'ڕەنگی ئامێر';

  @override
  String get touchScreenSettingTitle => 'شاشەی تاچ چالاک کراوە';

  @override
  String get repeatModeSettingTitle => 'دووبارەکردنەوە';

  @override
  String get repeatModeOne => 'یەک';

  @override
  String get repeatModeAll => 'گشت';

  @override
  String get vibrateSettingTitle => 'لەرزین';

  @override
  String get clickWheelSettingTitle => 'کلیک لە دەنگەکانی ویل بکە';

  @override
  String get splitScreenSettingTitle => 'دۆخی شاشەی دابەشکراو';

  @override
  String get touchSoundsDialogTitle => 'دەنگەکانی تاچ';

  @override
  String get touchSoundsDialogContent =>
      'تکایە لە ڕێکخستنەکانی سیستەمەوە دەنگەکانی تاچ چالاک بکە بۆ بیستنی دەنگەکانی ویل کلیک.';

  @override
  String get immersiveModeSettingTitle => 'دۆخی نوقمبوون';

  @override
  String get showAppTutorialSettingTitle => 'فێرکاری پیشان بدە';

  @override
  String get changeDirectorySettingTitle => 'گۆڕینی بەڕێوەبەرایەتی';

  @override
  String get donateSettingTitle => 'بەخشین';

  @override
  String get donateSettingDescription =>
      'ئەگەر ئەم ئەپەتان بەدڵە، تکایە بیر لە بەخشین بکەنەوە.';

  @override
  String get versionAboutScreenTitle => 'وەشان';

  @override
  String get madeWithLoveTitle => 'بە ❤️ دروستکراوە لەلایەن';

  @override
  String get noMusicFilesFound => 'هیچ مۆسیقایەک نییە';

  @override
  String get noArtistsFound => 'هیچ هونەرمەندێک نییە';

  @override
  String get noAlbumsFound => 'هیچ ئەلبوومێک نییە';

  @override
  String get unknownSong => 'گۆرانییەکی نەناسراو';

  @override
  String get unknownArtist => 'هونەرمەندی نەناسراو';

  @override
  String get unknownAlbum => 'ئەلبوومی نادیار';

  @override
  String get unknownGenre => 'ژانری نەناسراو';

  @override
  String get buttonConfirmText => 'باشە';

  @override
  String get tileValueOn => 'لەسەر';

  @override
  String get tileValueOff => 'کوژاوە';

  @override
  String get commonOfText => 'لە';

  @override
  String get pageNotFoundText => 'ئەو لاپەڕەیەی کە پێت دراوە نەدۆزراوەتەوە';

  @override
  String get commonErrorText => 'هەڵە';

  @override
  String get retryButtonText => 'دووبارە هەوڵبدەرەوە';

  @override
  String get filePickerDialogTitle =>
      'بەڕێوەبەرایەتییەک هەڵبژێرە بۆ سکانکردنی مۆسیقا';

  @override
  String get searchScreenTitle => 'گەڕان';

  @override
  String get searchEmptyText => 'هیچ ئەنجامێکی گەڕان نییە';

  @override
  String get searchResultsText => 'ئەنجامەکانی گەڕان:';

  @override
  String get resultsForText => 'ئەنجامەکان بۆ:';

  @override
  String get disableBatteryOptimizationTitle => 'لەکارخستنی باشکردنی پاتری';

  @override
  String get disableBatteryOptimizationContent =>
      'تکایە باشکردنی پاتری بۆ ئەم ئەپە لە ڕێکخستنەکانی ئامێرەکەدا لەکاربخە بۆ ئەوەی ڕێگە بە پەخشکردنی پاشبنەما بدات لە مۆسیقا.';

  @override
  String get languageScreenTitle => 'زمان';

  @override
  String get silverDeviceColor => 'زیو';

  @override
  String get blackDeviceColor => 'ڕەش';

  @override
  String get resetSettingsTitle => 'ڕێکخستنەکانی ڕێستکردنەوە';

  @override
  String get browseArtist => 'گەڕان بەدوای هونەرمەنددا';

  @override
  String get browseAlbum => 'گەڕان بەدوای ئەلبوومدا';

  @override
  String get cancelText => 'ڕەتکردنەوە';

  @override
  String get playlistsScreenTitle => 'پلەی لیستەکان';

  @override
  String get addToOnTheGoPlaylist => 'زیاد بکە بۆ کاتی ڕۆشتن';

  @override
  String get addAlbumToOnTheGoPlaylist => 'زیادکردنی ئەلبووم بۆ On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'لە پلەی لیستەکە دەربهێنە';

  @override
  String get allAlbums => 'هەموو ئەلبوومەکان';

  @override
  String get scanningMusicFiles => 'سکانکردنی فایلەکانی مۆسیقا';

  @override
  String get newPlaylist => 'پلەی لیستێکی نوێ';

  @override
  String get savePlaylist => 'پاشەکەوتکردنی پلەی لیست';

  @override
  String get clearPlaylist => 'کلیر پلەی لیست';

  @override
  String get rescanMusicFilesSettingTitle => 'فایلەکانی مۆسیقای Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'پەنجەی گەورەت بە سووکیی بجوڵێنە بە دەوری ویلەکەی کلیکەکەدا بۆ گەشتکردن بە مینیوەکەدا';

  @override
  String get centerButtonMenuTutorialText =>
      'بۆ هەڵبژاردنی بڕگەی Menu ی Highlighted دوگمەی Center داگرە';

  @override
  String get playPauseMenuTutorialText =>
      'ئەم دوگمەیە داگرە بۆ لێدان یان وەستاندنی گۆرانییەک';

  @override
  String get nextButtonMenuTutorialText =>
      'ئەم دوگمەیە بکە بۆ ئەوەی بپەڕیتەوە بۆ گۆرانی داهاتوو';

  @override
  String get previousButtonMenuTutorialText =>
      'ئەم دوگمەیە داگرە بۆ گەڕانەوە یان گەڕانەوە بۆ گۆرانی پێشوو';

  @override
  String get menuButtonTutorialText =>
      'ئەم دوگمەیە بکە بۆ گەڕانەوە بۆ مینیوی پێشوو. دەتوانیت لە هەر شاشەیەکی ترەوە دایبگریت و ڕایبگریت بۆ ئەوەی ڕاستەوخۆ بچیتە ناو مینیوی سەرەکی.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ئەمە شاشەی نمایشە. دۆخی شاشەی تاچ و شاشەی دابەشکراو بە شێوازی پێشوەختە چالاک کراوە و دەتوانرێت زیاتر لە ڕێکخستنەکاندا ڕێکبخرێت.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'پەنجەی گەورەت بە دەوری ویلەکەی کلیکەکەدا بجوڵێنە بۆ ڕێکخستنی دەنگەکە';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'دوگمەی ناوەڕاست داگرە بۆ ئەوەی لە ڕێگەی Seek Bar و Scrubber Bar و Shuffle Slider ەوە بڕۆن. دوگمەی ناوەڕاست داگرە و ڕایبگرە بۆ دەستگەیشتن بە بژاردەی زیادە.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ئەم دوگمەیە داگرە و ڕایبگرە بۆ ئەوەی گۆرانییەکە بەخێرایی بکەیتە پێشەوە';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ئەم دوگمەیە داگرە و ڕایبگرە بۆ ئەوەی گۆرانییەکە بگەڕێنێتەوە';

  @override
  String get deviceControlSearchTutorialText =>
      'پەنجەی گەورەت بە سووکیی بە دەوری ویلەکەی کلیکەکەدا بجوڵێنە بۆ ئەوەی ئەلفوبێیەک تیشک بخەیتە سەر';

  @override
  String get centerButtonSearchTutorialText =>
      'دوگمەی ناوەڕاست داگرە بۆ هەڵبژاردنی ئەلفوبێی دیاریکراو';

  @override
  String get nextButtonSearchTutorialText =>
      'بۆ زیادکردنی بۆشایی ئەم دوگمەیە داگرە';

  @override
  String get previousButtonSearchTutorialText =>
      'بۆ سڕینەوەی دوا پیت ئەم دوگمەیە بکە';

  @override
  String get menuButtonSearchTutorialText =>
      'ئەم دوگمەیە بکە بۆ داخستنی کیبۆردەکە و کارلێککردن لەگەڵ ئەنجامەکانی گەڕان';
}
