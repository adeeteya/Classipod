// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'क्लासिपोड';

  @override
  String get menuButtonText => 'मेनू';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्सेस की अनुमति आवश्यक है';

  @override
  String get audioAccessPermissionContent =>
      'कृपया हमें अपनी संगीत फ़ाइलों को चलाने की अनुमति देने के लिए ऑडियो फ़ाइलों का उपयोग करें।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो एक्सेस अनुमति से वंचित';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया डिवाइस सेटिंग्स में इस ऐप के लिए ऑडियो फ़ाइलों का उपयोग करें ताकि हमें अपनी संगीत फ़ाइलें चला सकें।';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अब खेल रहे हैं';

  @override
  String get shuffleSongsMenuTitle => 'गानों की अदला बदली करें';

  @override
  String get shuffleSettingTitle => 'मिश्रण';

  @override
  String get settingsScreenTitle => 'सेटिंग';

  @override
  String get aboutScreenTitle => 'के बारे में';

  @override
  String get coverFlowScreenTitle => 'कवर फ्लो';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एलबम';

  @override
  String get songsScreenTitle => 'गीत';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString गाने',
      one: '1 गीत',
      zero: 'कोई गाने नहीं',
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
      other: '$countString एल्बम',
      one: '1 एल्बम',
      zero: 'कोई एल्बम नहीं',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'शैलियां';

  @override
  String get genreSongsScreenTitle => 'शैली के गीत';

  @override
  String get deviceColorSettingTitle => 'युक्ति रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'दोहराना';

  @override
  String get repeatModeOne => 'एक';

  @override
  String get repeatModeAll => 'सभी';

  @override
  String get vibrateSettingTitle => 'कंपन';

  @override
  String get clickWheelSettingTitle => 'व्हील साउंड पर क्लिक करें';

  @override
  String get splitScreenSettingTitle => 'विभाजित स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श ध्वनि';

  @override
  String get touchSoundsDialogContent =>
      'क्लिक व्हील ध्वनियों को सुनने के लिए कृपया सिस्टम सेटिंग्स से टच ध्वनियों को सक्षम करें';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिव मोड';

  @override
  String get showAppTutorialSettingTitle => 'टूटोरियल्स दिखाना';

  @override
  String get changeDirectorySettingTitle => 'बदलें निर्देशिका';

  @override
  String get donateSettingTitle => 'दान करें';

  @override
  String get donateSettingDescription =>
      'यदि आपको यह ऐप पसंद है, तो कृपया दान करने पर विचार करें।';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => 'के साथ बनाया गया';

  @override
  String get noMusicFilesFound => 'कोई संगीत नहीं';

  @override
  String get noArtistsFound => 'कोई कलाकार नहीं';

  @override
  String get noAlbumsFound => 'कोई एल्बम नहीं';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अज्ञात एल्बम';

  @override
  String get unknownGenre => 'अज्ञात शैली';

  @override
  String get buttonConfirmText => 'ठीक है';

  @override
  String get tileValueOn => 'पर';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'का';

  @override
  String get pageNotFoundText => 'दिया गया पृष्ठ नहीं मिला';

  @override
  String get commonErrorText => 'गलती';

  @override
  String get retryButtonText => 'पुन: प्रयास करें';

  @override
  String get filePickerDialogTitle =>
      'संगीत के लिए स्कैन करने के लिए एक निर्देशिका का चयन करें';

  @override
  String get searchScreenTitle => 'खोज';

  @override
  String get searchEmptyText => 'कोई खोज परिणाम नहीं';

  @override
  String get searchResultsText => 'खोज के परिणाम:';

  @override
  String get resultsForText => 'के परिणाम:';

  @override
  String get disableBatteryOptimizationTitle => 'बैटरी अनुकूलन अक्षम करें';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया संगीत की पृष्ठभूमि प्लेबैक की अनुमति देने के लिए डिवाइस सेटिंग्स में इस ऐप के लिए बैटरी अनुकूलन को अक्षम करें।';

  @override
  String get languageScreenTitle => 'भाषा';

  @override
  String get silverDeviceColor => 'चाँदी';

  @override
  String get blackDeviceColor => 'काला';

  @override
  String get resetSettingsTitle => 'सेटिंग्स फिर से करिए';

  @override
  String get browseArtist => 'ब्राउज़ कलाकार';

  @override
  String get browseAlbum => 'ब्राउज़ एल्बम';

  @override
  String get cancelText => 'रद्द करना';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट';

  @override
  String get addToOnTheGoPlaylist => 'ऑन-द-गो में जोड़ें';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गो में एल्बम जोड़ें';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट से निकालें';

  @override
  String get allAlbums => 'सभी एल्बम';

  @override
  String get scanningMusicFiles => 'संगीत फ़ाइलों को स्कैन करना';

  @override
  String get newPlaylist => 'नई प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट बचाओ';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan संगीत फ़ाइलें';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू को नेविगेट करने के लिए क्लिक व्हील के चारों ओर अपने अंगूठे को हल्के से ले जाएं';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट किए गए मेनू आइटम का चयन करने के लिए केंद्र बटन दबाएं';

  @override
  String get playPauseMenuTutorialText =>
      'किसी गीत को खेलने या विराम देने के लिए इस बटन को दबाएं';

  @override
  String get nextButtonMenuTutorialText =>
      'अगले गीत को छोड़ने के लिए इस बटन को दबाएं';

  @override
  String get previousButtonMenuTutorialText =>
      'इस बटन को रिवाइंड करने या पिछले गीत पर वापस जाने के लिए दबाएं';

  @override
  String get menuButtonTutorialText =>
      'पिछले मेनू पर वापस जाने के लिए इस बटन को दबाएं। आप सीधे मुख्य मेनू पर जाने के लिए इसे किसी अन्य स्क्रीन से दबा सकते हैं और दबा सकते हैं।';

  @override
  String get deviceScreenMenuTutorialText =>
      'यह डिस्प्ले स्क्रीन है। टच स्क्रीन और स्प्लिट स्क्रीन मोड डिफ़ॉल्ट रूप से सक्षम हैं और इसे सेटिंग्स में आगे कॉन्फ़िगर किया जा सकता है।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'वॉल्यूम को समायोजित करने के लिए क्लिक व्हील के चारों ओर अपना अंगूठा ले जाएं';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'खोज बार, स्क्रबर बार और शफल स्लाइडर के माध्यम से साइकिल चलाने के लिए केंद्र बटन दबाएं। अतिरिक्त विकल्पों तक पहुंचने के लिए सेंटर बटन दबाएं और दबाए रखें।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गाने को तेजी से आगे बढ़ाने के लिए इस बटन को दबाए रखें और दबाए रखें';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत को रिवाइंड करने के लिए इस बटन को दबाए रखें और दबाए रखें';

  @override
  String get deviceControlSearchTutorialText =>
      'एक वर्णमाला को उजागर करने के लिए क्लिक व्हील के चारों ओर अपने अंगूठे को हल्के से ले जाएं';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट किए गए वर्णमाला का चयन करने के लिए केंद्र बटन दबाएं';

  @override
  String get nextButtonSearchTutorialText =>
      'एक स्थान जोड़ने के लिए इस बटन को दबाएं';

  @override
  String get previousButtonSearchTutorialText =>
      'अंतिम चरित्र को हटाने के लिए इस बटन को दबाएं';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड को बंद करने और खोज परिणामों के साथ बातचीत करने के लिए इस बटन को दबाएं';
}
