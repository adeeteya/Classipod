// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'মেনু';

  @override
  String get audioAccessPermissionTitle => 'অডিঅ\' অভিগম অনুমতিৰ প্ৰয়োজন';

  @override
  String get audioAccessPermissionContent => 'অনুগ্ৰহ কৰি আপোনাৰ সংগীত ফাইলসমূহ বজাবলৈ অনুমতি দিবলৈ অডিঅ\' ফাইলসমূহ অভিগম প্ৰদান কৰক।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'অডিঅ\' অভিগম অনুমতি অস্বীকাৰ কৰা হৈছে';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'আপোনাৰ সংগীত ফাইলসমূহ বজাবলৈ অনুমতি দিবলৈ অনুগ্ৰহ কৰি ডিভাইচ ছেটিংছত এই এপটোৰ বাবে অডিঅ\' ফাইলসমূহ প্ৰৱেশ প্ৰদান কৰক।';

  @override
  String get menuScreenTitle => 'মেনু';

  @override
  String get musicMenuScreenTitle => 'সংগীত';

  @override
  String get nowPlayingScreenTitle => 'এতিয়া খেলি আছে';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'শ্বাফেল';

  @override
  String get settingsScreenTitle => 'সংহতিসমূহ';

  @override
  String get aboutScreenTitle => 'বিষয়ে';

  @override
  String get coverFlowScreenTitle => 'কভাৰ ফ্ল\'';

  @override
  String get artistsScreenTitle => 'শিল্পী';

  @override
  String get albumsScreenTitle => 'এলবাম';

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
      other: '$countString গীত',
      one: '1 গান',
      zero: 'কোনো গীত নাই',
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
      other: '$countString এলবাম',
      one: '1 এলবাম',
      zero: 'কোনো এলবাম নাই',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ধাৰা';

  @override
  String get genreSongsScreenTitle => 'ধাৰা গান';

  @override
  String get deviceColorSettingTitle => 'ডিভাইচৰ ৰং';

  @override
  String get touchScreenSettingTitle => 'টাচ স্ক্ৰীণ সামৰ্থবান কৰা হৈছে';

  @override
  String get repeatModeSettingTitle => 'পুনৰাবৃত্তি';

  @override
  String get repeatModeOne => 'এক';

  @override
  String get repeatModeAll => 'আটাইবোৰ';

  @override
  String get vibrateSettingTitle => 'কম্পন';

  @override
  String get clickWheelSettingTitle => 'ক্লিক কৰক চকা শব্দ';

  @override
  String get splitScreenSettingTitle => 'পৰ্দাৰ ধৰণ বিভাজিত কৰক';

  @override
  String get touchSoundsDialogTitle => 'টাচ শব্দসমূহ';

  @override
  String get touchSoundsDialogContent => 'ক্লিক চকা শব্দ শুনিবলৈ চিস্টেম ছেটিংছৰ পৰা স্পৰ্শ শব্দসমূহ সামৰ্থবান কৰক';

  @override
  String get immersiveModeSettingTitle => 'ইমাৰ্চিভ মোড';

  @override
  String get showAppTutorialSettingTitle => 'টিউটোৰিয়েল দেখুৱাওক';

  @override
  String get changeDirectorySettingTitle => 'ডাইৰেকটৰি সলনি কৰক';

  @override
  String get donateSettingTitle => 'দান কৰা';

  @override
  String get donateSettingDescription => 'যদি আপুনি এই এপটো ভাল পায়, অনুগ্ৰহ কৰি দান কৰাৰ কথা চিন্তা কৰক।';

  @override
  String get versionAboutScreenTitle => 'সংস্কৰণ';

  @override
  String get madeWithLoveTitle => '❤️ ৰ সৈতে তৈয়াৰ কৰা হৈছে';

  @override
  String get noMusicFilesFound => 'কোনো সংগীত নাই';

  @override
  String get noArtistsFound => 'শিল্পী No Artists';

  @override
  String get noAlbumsFound => 'কোনো এলবাম নাই';

  @override
  String get unknownSong => 'অজ্ঞাত গান';

  @override
  String get unknownArtist => 'অজ্ঞাত শিল্পী';

  @override
  String get unknownAlbum => 'অজ্ঞাত এলবাম';

  @override
  String get unknownGenre => 'অজ্ঞাত ধাৰা';

  @override
  String get buttonConfirmText => 'ঠিক আছে';

  @override
  String get tileValueOn => 'ওপৰত';

  @override
  String get tileValueOff => 'বন্ধ কৰা';

  @override
  String get commonOfText => 'OF';

  @override
  String get pageNotFoundText => 'প্ৰদত্ত পৃষ্ঠাটো পোৱা নগ\'ল';

  @override
  String get commonErrorText => 'আঁসোৱাহ';

  @override
  String get retryButtonText => 'পুনৰ চেষ্টা কৰক';

  @override
  String get filePickerDialogTitle => 'সংগীতৰ বাবে স্কেন কৰিবলৈ এটা ডাইৰেকটৰি নিৰ্ব্বাচন কৰক';

  @override
  String get searchScreenTitle => 'সন্ধান';

  @override
  String get searchEmptyText => 'কোনো সন্ধান ফলাফল নাই';

  @override
  String get searchResultsText => 'অনুসন্ধান ফলাফল:';

  @override
  String get resultsForText => 'জন্য ফলাফল:';

  @override
  String get disableBatteryOptimizationTitle => 'বেটাৰি অনুকূলন নিষ্ক্ৰিয় কৰক';

  @override
  String get disableBatteryOptimizationContent => 'অনুগ্ৰহ কৰি ডিভাইচ ছেটিংছত এই এপৰ বাবে বেটাৰী অনুকূলন নিষ্ক্ৰিয় কৰক সংগীতৰ পটভূমি প্লেবেকৰ অনুমতি দিবলৈ।';

  @override
  String get languageScreenTitle => 'ভাষা';

  @override
  String get silverDeviceColor => 'ৰূপ';

  @override
  String get blackDeviceColor => 'ক’লা';

  @override
  String get resetSettingsTitle => 'সংহতিসমূহ পুনৰায় সেট কৰক';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'বাতিল কৰক';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'অন-দ্য-গোত যোগ কৰক';

  @override
  String get addAlbumToOnTheGoPlaylist => 'অন-দ্য-গোত এলবাম যোগ কৰক';

  @override
  String get removeSongFromThePlaylist => 'প্লেলিষ্টৰ পৰা আঁতৰাওক';

  @override
  String get allAlbums => 'সকলো এলবাম';

  @override
  String get scanningMusicFiles => 'সংগীত ফাইলসমূহ স্কেন কৰা';

  @override
  String get newPlaylist => 'নতুন প্লেলিষ্ট';

  @override
  String get savePlaylist => 'প্লেলিষ্ট সংৰক্ষণ কৰক';

  @override
  String get clearPlaylist => 'PlayList Clear PlayList';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'মেনু নেভিগেট কৰিবলৈ ক্লিক চকাটোৰ চাৰিওফালে আপোনাৰ বুঢ়া আঙুলিটো লাহেকৈ লৰচৰ কৰক';

  @override
  String get centerButtonMenuTutorialText => 'হাইলাইট কৰা মেনু বস্তু নিৰ্ব্বাচন কৰিবলে কেন্দ্ৰ বুটাম টিপক';

  @override
  String get playPauseMenuTutorialText => 'এটা গীত বজাবলৈ বা বিৰাম দিবলৈ এই বুটাম টিপক';

  @override
  String get nextButtonMenuTutorialText => 'পৰৱৰ্তী গীতলৈ এৰি যাবলৈ এই বুটাম টিপক';

  @override
  String get previousButtonMenuTutorialText => 'এই বুটামটো টিপক বা পূৰ্বৱৰ্তী গীতলৈ উভতি যাওক';

  @override
  String get menuButtonTutorialText => 'পূৰ্বৰ মেনুলৈ উভতি যাবলৈ এই বুটাম টিপক। আপুনি ইয়াক অন্য যিকোনো পৰ্দাৰ পৰা টিপি ধৰি ৰাখিব পাৰিব যাতে প্ৰত্যক্ষভাৱে মূল মেনুলৈ যাব পাৰে।';

  @override
  String get deviceScreenMenuTutorialText => 'এইটো হৈছে ডিছপ্লে স্ক্ৰীণ। টাচ স্ক্ৰীণ আৰু বিভক্ত পৰ্দা ধৰণ অবিকল্পিতভাৱে সামৰ্থবান কৰা হয় আৰু সংহতিসমূহত অধিক বিন্যাস কৰিব পাৰি।';

  @override
  String get deviceControlNowPlayingTutorialText => 'আয়তন সামঞ্জস্য কৰিবলৈ ক্লিক চকাৰ চাৰিওফালে আপোনাৰ বুঢ়া আঙুলি লৰচৰ কৰক';

  @override
  String get centerButtonNowPlayingTutorialText => 'ছিক বাৰ, স্ক্ৰাবাৰ বাৰ আৰু শ্বাফেল স্লাইডাৰৰ মাজেৰে চাইকেল চলাবলৈ কেন্দ্ৰ বুটাম টিপক। অতিৰিক্ত বিকল্পসমূহ অভিগম কৰিবলে কেন্দ্ৰ বুটাম টিপক আৰু ধৰি ৰাখক।';

  @override
  String get nextButtonNowPlayingTutorialText => 'গীতটো দ্ৰুতভাৱে আগুৱাই নিবলৈ এই বুটামটো টিপি ধৰি ৰাখক';

  @override
  String get previousButtonNowPlayingTutorialText => 'গীতটো পুনৰ ঘূৰাই দিবলৈ এই বুটামটো টিপি ধৰি ৰাখক';

  @override
  String get deviceControlSearchTutorialText => 'এটা বৰ্ণমালা হাইলাইট কৰিবলৈ ক্লিক চকাটোৰ চাৰিওফালে আপোনাৰ বুঢ়া আঙুলিটো লাহেকৈ লৰচৰ কৰক';

  @override
  String get centerButtonSearchTutorialText => 'হাইলাইট কৰা বৰ্ণমালা নিৰ্ব্বাচন কৰিবলে কেন্দ্ৰ বুটাম টিপক';

  @override
  String get nextButtonSearchTutorialText => 'এটা স্থান যোগ কৰিবলৈ এই বুটাম টিপক';

  @override
  String get previousButtonSearchTutorialText => 'শেষ আখৰ মচি পেলাবলৈ এই বুটাম টিপক';

  @override
  String get menuButtonSearchTutorialText => 'এই বুটামটো টিপক কিবৰ্ড বন্ধ কৰিবলৈ আৰু সন্ধান ফলাফলৰ সৈতে যোগাযোগ কৰক';
}
