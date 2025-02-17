// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Goan Konkani (`gom`).
class AppLocalizationsGom extends AppLocalizations {
  AppLocalizationsGom([String locale = 'gom']) : super(locale);

  @override
  String get appTitle => 'क्लासीपोड';

  @override
  String get menuButtonText => 'मेनू 1';

  @override
  String get audioAccessPermissionTitle => 'ऑडिओ प्रवेशाची परवानगी जाय आशिल्ली';

  @override
  String get audioAccessPermissionContent =>
      'उपकार करून तुमचीं संगीत फायली वाजोवंक मेळचीं म्हूण ऑडियो फायलींचो प्रवेश दिवचो.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो प्रवेशाची परवानगी नाकारली';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'उपकार करून तुमचीं संगीत फायली वाजोवंक मेळचीं म्हूण डिव्हायस सेटिंग्जांत ह्या ऍप्लिकेशनाक ऑडियो फायलींचो प्रवेश दिवचो.';

  @override
  String get menuScreenTitle => 'मेनू 1';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'आतां खेळप';

  @override
  String get shuffleSongsMenuTitle => 'शफल गितां';

  @override
  String get shuffleSettingTitle => 'शफल 1';

  @override
  String get settingsScreenTitle => 'सेटिंग्ज 10';

  @override
  String get aboutScreenTitle => 'संबंदीं';

  @override
  String get coverFlowScreenTitle => 'आवरण प्रवाह 1';

  @override
  String get artistsScreenTitle => 'कलाकार 1';

  @override
  String get albumsScreenTitle => 'आल्बम 1000';

  @override
  String get songsScreenTitle => 'गितां ६';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString गितां',
      one: '1 गीत',
      zero: 'गीत ना',
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
      other: '$countString आल्बम',
      one: '1 आल्बम',
      zero: 'अल्बम ना',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'प्रकार 10000000000000000000.';

  @override
  String get genreSongsScreenTitle => 'प्रकाराचीं गितां';

  @override
  String get deviceColorSettingTitle => 'डिव्हाइस रंग 1';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम केलें';

  @override
  String get repeatModeSettingTitle => 'पुनरावृत्ती';

  @override
  String get repeatModeOne => 'एक';

  @override
  String get repeatModeAll => 'सगलें';

  @override
  String get vibrateSettingTitle => 'वाइब्रेट 1';

  @override
  String get clickWheelSettingTitle => 'व्हील साउंड्स क्लिक करात';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड 1.1.';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श आवाज 1000';

  @override
  String get touchSoundsDialogContent =>
      'उपकार करून क्लिक व्हील आवाज आयकुपाक प्रणाली मांडावळींतल्यान स्पर्श आवाज सक्षम करात';

  @override
  String get immersiveModeSettingTitle => 'विसर्जन मोड 1';

  @override
  String get showAppTutorialSettingTitle => 'शो ट्युटोरियल 1';

  @override
  String get changeDirectorySettingTitle => 'बदल निर्देशिका';

  @override
  String get donateSettingTitle => 'देणगी दिवप';

  @override
  String get donateSettingDescription =>
      'तुमकां हो अॅप आवडलो जाल्यार दान करपाचो विचार करात.';

  @override
  String get versionAboutScreenTitle => 'आवृत्ती';

  @override
  String get madeWithLoveTitle => '❤️ 1000 च्या आदारान तयार केल्लें.';

  @override
  String get noMusicFilesFound => 'संगीत ना';

  @override
  String get noArtistsFound => 'कलाकार ना';

  @override
  String get noAlbumsFound => 'आल्बम ना';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अज्ञात कलाकार 1999 वर्सा.';

  @override
  String get unknownAlbum => 'अज्ञात आल्बम 1999 वर्सा.';

  @override
  String get unknownGenre => 'अज्ञात प्रकार 1';

  @override
  String get buttonConfirmText => 'बरें';

  @override
  String get tileValueOn => 'हाचेर';

  @override
  String get tileValueOff => 'बंद करचें';

  @override
  String get commonOfText => 'चें';

  @override
  String get pageNotFoundText => 'दिल्लें पान मेळ्ळें ना';

  @override
  String get commonErrorText => 'चूक';

  @override
  String get retryButtonText => 'परतून यत्न 1000';

  @override
  String get filePickerDialogTitle =>
      'संगीता खातीर स्कॅन करपाक निर्देशिका निवडात';

  @override
  String get searchScreenTitle => 'सोद';

  @override
  String get searchEmptyText => 'सोद परिणाम ना';

  @override
  String get searchResultsText => 'सोद परिणाम: १.';

  @override
  String get resultsForText => 'परिणाम: १.';

  @override
  String get disableBatteryOptimizationTitle => 'बॅटरी ऑप्टिमायझेशन अक्षम करप';

  @override
  String get disableBatteryOptimizationContent =>
      'उपकार करून संगीताच्या पार्श्वभूंय प्लेबॅकाक परवानगी दिवपाक डिव्हायस सेटिंग्जांत ह्या ऍप्लिकेशनाक बॅटरी ऑप्टिमायझेशन अक्षम करात.';

  @override
  String get languageScreenTitle => 'भास';

  @override
  String get silverDeviceColor => 'रुपें';

  @override
  String get blackDeviceColor => 'काळें';

  @override
  String get resetSettingsTitle => 'सेटिंग्ज रीसेट करात';

  @override
  String get browseArtist => 'कलाकार ब्राउझ करात';

  @override
  String get browseAlbum => 'आल्बम ब्राउझ करात';

  @override
  String get cancelText => 'रद्द';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट 10.';

  @override
  String get addToOnTheGoPlaylist => 'ऑन द ऑन-द-गो';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गोंत आल्बम जोडचो';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्टांतल्यान काडून उडोवचें';

  @override
  String get allAlbums => 'सगळे आल्बम 1';

  @override
  String get scanningMusicFiles => 'संगीत फायलींचें स्कॅनींग करप';

  @override
  String get newPlaylist => 'नवी प्लेलिस्ट 1';

  @override
  String get savePlaylist => 'प्लेलिस्ट जतनाय घेयात';

  @override
  String get clearPlaylist => 'प्लेलिस्ट साफ करप';

  @override
  String get rescanMusicFilesSettingTitle => 'rescan संगीत फायली';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू नेव्हिगेट करपाक क्लिक चाका भोंवतणी तुमचो आंगठो हळदुवो हालोवचो';

  @override
  String get centerButtonMenuTutorialText =>
      'हायलाइट केल्ली मेनू आयटम निवडपाक केंद्र बटण दामचें';

  @override
  String get playPauseMenuTutorialText =>
      'गीत वाजोवपाक वा थांबवपाक हें बटण दामचें';

  @override
  String get nextButtonMenuTutorialText =>
      'फुडल्या गीताचेर वगडावपाक हें बटण दामचें';

  @override
  String get previousButtonMenuTutorialText =>
      'रिवाइंड करपाक वा फाटल्या गीताचेर परत वचपाक हें बटण दामचें';

  @override
  String get menuButtonTutorialText =>
      'फाटल्या मेनूचेर परत वचपाक हें बटण दामचें. तुमी थेट मुखेल मेनूंत वचपाक हेर खंयच्याय स्क्रीनांतल्यान दामूं येताले.';

  @override
  String get deviceScreenMenuTutorialText =>
      'हो डिस्प्ले स्क्रीन आसा. टच स्क्रीन आनी स्प्लिट स्क्रीन मोड पूर्वनिर्धारीतपणान सक्षम केला आनी मांडावळींनी फुडें संरचीत करूंक शकता.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'आवाज समायोजीत करपाक क्लिक चाका भोंवतणी तुमचो आंगठो हालयात';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'सीक बार, स्क्रबर बार आनी शफल स्लायडरांतल्यान सायकल करपाक सेंटर बटण दामचें. अतिरिक्त पर्याय ऍक्सॅस करपाक केंद्र बटण दामून दवरात.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गीत फास्ट फॉरवर्ड करपाक हें बटण दामून दवरचें गीत';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत रिवाइंड करपाक हें बटण दामून दवरात';

  @override
  String get deviceControlSearchTutorialText =>
      'वर्णमाळेचेर हायलाइट करपाक क्लिक चाका भोंवतणी हळूच आंगठो हालोवचो';

  @override
  String get centerButtonSearchTutorialText =>
      'हायलाइट केल्लें वर्णमाला निवडपाक केंद्र बटण दामचें';

  @override
  String get nextButtonSearchTutorialText => 'जागो जोडपाक हें बटण दामचें';

  @override
  String get previousButtonSearchTutorialText =>
      'निमाणें वर्ण काडून उडोवपाक हें बटण दामचें';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड बंद करपाक हें बटण दामचें आनी सोद परिणामांकडेन संवाद सादचो';
}
