// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ক্লাসিপড';

  @override
  String get menuButtonText => 'মেনু';

  @override
  String get audioAccessPermissionTitle => 'অডিও অ্যাক্সেস অনুমতি প্রয়োজন';

  @override
  String get audioAccessPermissionContent =>
      'আমাদের আপনার সঙ্গীত ফাইলগুলি খেলতে অনুমতি দেওয়ার জন্য দয়া করে অডিও ফাইলগুলি অ্যাক্সেস মঞ্জুর করুন।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'অডিও অ্যাক্সেস অনুমতি অস্বীকার';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'আমাদের আপনার সঙ্গীত ফাইলগুলি খেলতে দেওয়ার জন্য দয়া করে ডিভাইস সেটিংসে এই অ্যাপ্লিকেশনটির জন্য অডিও ফাইলগুলি অ্যাক্সেস মঞ্জুর করুন।';

  @override
  String get menuScreenTitle => 'মেনু';

  @override
  String get musicMenuScreenTitle => 'সংগীত';

  @override
  String get nowPlayingScreenTitle => 'এখন খেলছি';

  @override
  String get shuffleSongsMenuTitle => 'শ্যাফল গান';

  @override
  String get shuffleSettingTitle => 'বদল';

  @override
  String get settingsScreenTitle => 'সেটিংস';

  @override
  String get aboutScreenTitle => 'সম্পর্কে';

  @override
  String get coverFlowScreenTitle => 'কভার প্রবাহ';

  @override
  String get artistsScreenTitle => 'শিল্পী';

  @override
  String get albumsScreenTitle => 'অ্যালবাম';

  @override
  String get songsScreenTitle => 'গান';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString গান',
      one: '1 গান',
      zero: 'গান নেই',
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
      other: '$countString অ্যালবাম',
      one: '1 অ্যালবাম',
      zero: 'কোনো অ্যালবাম নেই',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'জেনারস';

  @override
  String get genreSongsScreenTitle => 'জেনার গান';

  @override
  String get deviceColorSettingTitle => 'ডিভাইসের রঙ';

  @override
  String get touchScreenSettingTitle => 'টাচ স্ক্রিন সক্ষম';

  @override
  String get repeatModeSettingTitle => 'পুনরাবৃত্তি';

  @override
  String get repeatModeOne => 'এক';

  @override
  String get repeatModeAll => 'সব';

  @override
  String get vibrateSettingTitle => 'কম্পন';

  @override
  String get clickWheelSettingTitle => 'চাকা শব্দ ক্লিক করুন';

  @override
  String get splitScreenSettingTitle => 'বিভক্ত স্ক্রিন মোড';

  @override
  String get touchSoundsDialogTitle => 'স্পর্শ শব্দ';

  @override
  String get touchSoundsDialogContent =>
      'ক্লিক হুইল সাউন্ড শুনতে দয়া করে সিস্টেম সেটিংস থেকে স্পর্শ শব্দগুলি সক্ষম করুন';

  @override
  String get immersiveModeSettingTitle => 'নিমজ্জন মোড';

  @override
  String get showAppTutorialSettingTitle => 'টিউটোরিয়াল দেখান';

  @override
  String get changeDirectorySettingTitle => 'ডিরেক্টরি পরিবর্তন করুন';

  @override
  String get donateSettingTitle => 'দান করুন';

  @override
  String get donateSettingDescription =>
      'আপনি যদি এই অ্যাপ্লিকেশনটি পছন্দ করেন তবে অনুদান দেওয়ার বিষয়টি বিবেচনা করুন।';

  @override
  String get versionAboutScreenTitle => 'সংস্করণ';

  @override
  String get madeWithLoveTitle => 'দ্বারা তৈরি ❤ দ্বারা';

  @override
  String get noMusicFilesFound => 'কোন সংগীত নেই';

  @override
  String get noArtistsFound => 'কোন শিল্পী নেই';

  @override
  String get noAlbumsFound => 'কোন অ্যালবাম';

  @override
  String get unknownSong => 'অজানা গান';

  @override
  String get unknownArtist => 'অজানা শিল্পী';

  @override
  String get unknownAlbum => 'অজানা অ্যালবাম';

  @override
  String get unknownGenre => 'অজানা জেনার';

  @override
  String get buttonConfirmText => 'ঠিক আছে';

  @override
  String get tileValueOn => 'চালু';

  @override
  String get tileValueOff => 'বন্ধ';

  @override
  String get commonOfText => 'এর';

  @override
  String get pageNotFoundText => 'প্রদত্ত পৃষ্ঠাটি পাওয়া যায় নি';

  @override
  String get commonErrorText => 'ত্রুটি';

  @override
  String get retryButtonText => 'পুনরায় চেষ্টা করুন';

  @override
  String get filePickerDialogTitle =>
      'সংগীতের জন্য স্ক্যান করতে একটি ডিরেক্টরি নির্বাচন করুন';

  @override
  String get searchScreenTitle => 'অনুসন্ধান';

  @override
  String get searchEmptyText => 'কোনও অনুসন্ধানের ফলাফল নেই';

  @override
  String get searchResultsText => 'অনুসন্ধানের ফলাফল:';

  @override
  String get resultsForText => 'ফলাফল:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ব্যাটারি অপ্টিমাইজেশন অক্ষম করুন';

  @override
  String get disableBatteryOptimizationContent =>
      'সঙ্গীতটির ব্যাকগ্রাউন্ড প্লেব্যাকের অনুমতি দেওয়ার জন্য দয়া করে ডিভাইস সেটিংসে এই অ্যাপ্লিকেশনটির জন্য ব্যাটারি অপ্টিমাইজেশন অক্ষম করুন।';

  @override
  String get languageScreenTitle => 'ভাষা';

  @override
  String get silverDeviceColor => 'রৌপ্য';

  @override
  String get blackDeviceColor => 'কালো';

  @override
  String get resetSettingsTitle => 'সেটিংস পুনরায় সেট করুন';

  @override
  String get browseArtist => 'শিল্পী ব্রাউজ করুন';

  @override
  String get browseAlbum => 'অ্যালবাম ব্রাউজ করুন';

  @override
  String get cancelText => 'বাতিল';

  @override
  String get playlistsScreenTitle => 'প্লেলিস্ট';

  @override
  String get addToOnTheGoPlaylist => 'যেতে যেতে যোগ করুন';

  @override
  String get addAlbumToOnTheGoPlaylist => 'যেতে যেতে অ্যালবাম যুক্ত করুন';

  @override
  String get removeSongFromThePlaylist => 'প্লেলিস্ট থেকে সরান';

  @override
  String get allAlbums => 'সমস্ত অ্যালবাম';

  @override
  String get scanningMusicFiles => 'সঙ্গীত ফাইলগুলি স্ক্যান করা';

  @override
  String get newPlaylist => 'নতুন প্লেলিস্ট';

  @override
  String get savePlaylist => 'প্লেলিস্ট সংরক্ষণ করুন';

  @override
  String get clearPlaylist => 'প্লেলিস্ট সাফ করুন';

  @override
  String get rescanMusicFilesSettingTitle => 'মিউজিক ফাইলগুলি পুনরুদ্ধার করুন';

  @override
  String get deviceControlMenuTutorialText =>
      'মেনুটি নেভিগেট করতে আপনার থাম্বটি ক্লিক হুইলের চারপাশে হালকাভাবে সরান';

  @override
  String get centerButtonMenuTutorialText =>
      'হাইলাইটেড মেনু আইটেমটি নির্বাচন করতে সেন্টার বোতাম টিপুন';

  @override
  String get playPauseMenuTutorialText =>
      'একটি গান খেলতে বা বিরতি দিতে এই বোতামটি টিপুন';

  @override
  String get nextButtonMenuTutorialText =>
      'পরবর্তী গানে এড়াতে এই বোতামটি টিপুন';

  @override
  String get previousButtonMenuTutorialText =>
      'রিওয়াইন্ড করতে বা আগের গানে ফিরে যেতে এই বোতামটি টিপুন';

  @override
  String get menuButtonTutorialText =>
      'পূর্ববর্তী মেনুতে ফিরে যেতে এই বোতামটি টিপুন। আপনি সরাসরি মেনুতে যেতে অন্য কোনও স্ক্রিন থেকে এটি টিপতে এবং ধরে রাখতে পারেন।';

  @override
  String get deviceScreenMenuTutorialText =>
      'এটি ডিসপ্লে স্ক্রিন। টাচ স্ক্রিন এবং স্প্লিট স্ক্রিন মোড ডিফল্টরূপে সক্ষম করা হয় এবং সেটিংসে আরও কনফিগার করা যায়।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ভলিউম সামঞ্জস্য করতে আপনার থাম্বটি ক্লিক হুইলের চারপাশে সরান';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'সিক বার, স্ক্রাবার বার এবং শ্যাফল স্লাইডারের মাধ্যমে চক্রের জন্য সেন্টার বোতামটি টিপুন। অতিরিক্ত বিকল্পগুলি অ্যাক্সেস করতে সেন্টার বোতাম টিপুন এবং ধরে রাখুন।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'গানটি দ্রুত ফরোয়ার্ড করতে এই বোতামটি টিপুন এবং ধরে রাখুন';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'গানটি রিওয়াইন্ড করতে এই বোতামটি টিপুন এবং ধরে রাখুন';

  @override
  String get deviceControlSearchTutorialText =>
      'একটি বর্ণমালা হাইলাইট করতে আপনার থাম্বটি ক্লিক হুইলের চারপাশে হালকাভাবে সরান';

  @override
  String get centerButtonSearchTutorialText =>
      'হাইলাইট বর্ণমালা নির্বাচন করতে সেন্টার বোতাম টিপুন';

  @override
  String get nextButtonSearchTutorialText =>
      'একটি স্থান যুক্ত করতে এই বোতামটি টিপুন';

  @override
  String get previousButtonSearchTutorialText =>
      'শেষ চরিত্রটি মুছতে এই বোতামটি টিপুন';

  @override
  String get menuButtonSearchTutorialText =>
      'কীবোর্ডটি বন্ধ করতে এই বোতামটি টিপুন এবং অনুসন্ধান ফলাফলের সাথে ইন্টারঅ্যাক্ট করুন';
}
