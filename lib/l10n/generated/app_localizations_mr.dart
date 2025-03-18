// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'वर्गपॉड';

  @override
  String get menuButtonText => 'मेनू';

  @override
  String get audioAccessPermissionTitle => 'ऑडिओ प्रवेश परवानगी आवश्यक आहे';

  @override
  String get audioAccessPermissionContent =>
      'कृपया आम्हाला आपल्या संगीत फायली प्ले करण्याची परवानगी देण्यासाठी ऑडिओ फायलींमध्ये प्रवेश मंजूर करा.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडिओ प्रवेश परवानगी नाकारली';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया आम्हाला आपल्या संगीत फायली प्ले करण्याची परवानगी देण्यासाठी डिव्हाइस सेटिंग्जमध्ये या अ‍ॅपसाठी ऑडिओ फायली प्रवेश मंजूर करा.';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'आता खेळत आहे';

  @override
  String get shuffleSongsMenuTitle => 'शफल गाणी';

  @override
  String get shuffleSettingTitle => 'शफल';

  @override
  String get settingsScreenTitle => 'सेटिंग्ज';

  @override
  String get aboutScreenTitle => 'बद्दल';

  @override
  String get coverFlowScreenTitle => 'कव्हर प्रवाह';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'अल्बम';

  @override
  String get songsScreenTitle => 'गाणी';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString गाणी',
      one: '1 गाणे',
      zero: 'कोणतीही गाणी',
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
      other: '$countString अल्बम',
      one: '1 अल्बम',
      zero: 'कोणतेही अल्बम नाही',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'शैली';

  @override
  String get genreSongsScreenTitle => 'शैलीची गाणी';

  @override
  String get deviceColorSettingTitle => 'डिव्हाइस रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'पुन्हा करा';

  @override
  String get repeatModeOne => 'एक';

  @override
  String get repeatModeAll => 'सर्व';

  @override
  String get vibrateSettingTitle => 'कंप';

  @override
  String get clickWheelSettingTitle => 'चाक ध्वनी क्लिक करा';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श ध्वनी';

  @override
  String get touchSoundsDialogContent =>
      'क्लिक व्हील ध्वनी ऐकण्यासाठी कृपया सिस्टम सेटिंग्जमधून टच ध्वनी सक्षम करा';

  @override
  String get immersiveModeSettingTitle => 'विसर्जन मोड';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल दर्शवा';

  @override
  String get changeDirectorySettingTitle => 'निर्देशिका बदला';

  @override
  String get donateSettingTitle => 'देणगी';

  @override
  String get donateSettingDescription =>
      'आपल्याला हा अॅप आवडत असल्यास, कृपया देणगीचा विचार करा.';

  @override
  String get versionAboutScreenTitle => 'आवृत्ती';

  @override
  String get madeWithLoveTitle => '❤ सह बनविलेले';

  @override
  String get noMusicFilesFound => 'संगीत नाही';

  @override
  String get noArtistsFound => 'कलाकार नाहीत';

  @override
  String get noAlbumsFound => 'कोणतेही अल्बम नाहीत';

  @override
  String get unknownSong => 'अज्ञात गाणे';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अज्ञात अल्बम';

  @override
  String get unknownGenre => 'अज्ञात शैली';

  @override
  String get buttonConfirmText => 'ठीक आहे';

  @override
  String get tileValueOn => 'चालू';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'च्या';

  @override
  String get pageNotFoundText => 'दिलेले पृष्ठ सापडले नाही';

  @override
  String get commonErrorText => 'त्रुटी';

  @override
  String get retryButtonText => 'पुन्हा प्रयत्न करा';

  @override
  String get filePickerDialogTitle =>
      'संगीतासाठी स्कॅन करण्यासाठी एक निर्देशिका निवडा';

  @override
  String get searchScreenTitle => 'शोध';

  @override
  String get searchEmptyText => 'शोध परिणाम नाही';

  @override
  String get searchResultsText => 'शोध परिणाम:';

  @override
  String get resultsForText => 'यासाठी परिणामः';

  @override
  String get disableBatteryOptimizationTitle => 'बॅटरी ऑप्टिमायझेशन अक्षम करा';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया संगीताच्या पार्श्वभूमी प्लेबॅकला परवानगी देण्यासाठी डिव्हाइस सेटिंग्जमध्ये या अ‍ॅपसाठी बॅटरी ऑप्टिमायझेशन अक्षम करा.';

  @override
  String get languageScreenTitle => 'भाषा';

  @override
  String get silverDeviceColor => 'चांदी';

  @override
  String get blackDeviceColor => 'काळा';

  @override
  String get resetSettingsTitle => 'सेटिंग्ज रीसेट करा';

  @override
  String get browseArtist => 'कलाकार ब्राउझ करा';

  @override
  String get browseAlbum => 'अल्बम ब्राउझ करा';

  @override
  String get cancelText => 'रद्द करा';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट';

  @override
  String get addToOnTheGoPlaylist => 'जाता जाता जोडा';

  @override
  String get addAlbumToOnTheGoPlaylist => 'जाता जाता अल्बम जोडा';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्टमधून काढा';

  @override
  String get allAlbums => 'सर्व अल्बम';

  @override
  String get scanningMusicFiles => 'संगीत फायली स्कॅन करीत आहे';

  @override
  String get newPlaylist => 'नवीन प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट जतन करा';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'रेस्कॅन म्युझिक फायली';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू नेव्हिगेट करण्यासाठी क्लिक व्हीलच्या भोवती आपला अंगठा हलका हलवा';

  @override
  String get centerButtonMenuTutorialText =>
      'हायलाइट केलेले मेनू आयटम निवडण्यासाठी केंद्र बटण दाबा';

  @override
  String get playPauseMenuTutorialText =>
      'हे बटण प्ले करण्यासाठी किंवा गाणे विराम द्या';

  @override
  String get nextButtonMenuTutorialText =>
      'पुढील गाण्याकडे जाण्यासाठी हे बटण दाबा';

  @override
  String get previousButtonMenuTutorialText =>
      'रिवाइंड करण्यासाठी किंवा मागील गाण्यावर परत जाण्यासाठी हे बटण दाबा';

  @override
  String get menuButtonTutorialText =>
      'मागील मेनूवर परत जाण्यासाठी हे बटण दाबा. मुख्य मेनूवर थेट जाण्यासाठी आपण इतर कोणत्याही स्क्रीनवरून दाबून दाबून ठेवू शकता.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ही प्रदर्शन स्क्रीन आहे. टच स्क्रीन आणि स्प्लिट स्क्रीन मोड डीफॉल्टनुसार सक्षम केले आहेत आणि सेटिंग्जमध्ये पुढे कॉन्फिगर केले जाऊ शकतात.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'व्हॉल्यूम समायोजित करण्यासाठी आपला अंगठा क्लिक व्हीलभोवती हलवा';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'सीक बार, स्क्रबर बार आणि शफल स्लाइडरद्वारे सायकल करण्यासाठी मध्यभागी बटण दाबा. अतिरिक्त पर्यायांमध्ये प्रवेश करण्यासाठी केंद्र बटण दाबा आणि धरून ठेवा.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गाणे वेगवान करण्यासाठी हे बटण दाबा आणि धरून ठेवा';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गाणे पुन्हा भरण्यासाठी हे बटण दाबा आणि धरून ठेवा';

  @override
  String get deviceControlSearchTutorialText =>
      'वर्णमाला हायलाइट करण्यासाठी आपला अंगठा क्लिक व्हीलच्या भोवती हलका हलवा';

  @override
  String get centerButtonSearchTutorialText =>
      'हायलाइट केलेले वर्णमाला निवडण्यासाठी मध्यभागी बटण दाबा';

  @override
  String get nextButtonSearchTutorialText => 'जागा जोडण्यासाठी हे बटण दाबा';

  @override
  String get previousButtonSearchTutorialText =>
      'शेवटचे वर्ण हटविण्यासाठी हे बटण दाबा';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड बंद करण्यासाठी आणि शोध परिणामांसह संवाद साधण्यासाठी हे बटण दाबा';

  @override
  String get allSongs => 'सर्व गाणी';
}
