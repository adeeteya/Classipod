// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Awadhi (`awa`).
class AppLocalizationsAwa extends AppLocalizations {
  AppLocalizationsAwa([String locale = 'awa']) : super(locale);

  @override
  String get appTitle => 'क्लासिकपद';

  @override
  String get menuButtonText => 'मेनू';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्सेस अनुमति अनुमति आवश्यक है';

  @override
  String get audioAccessPermissionContent => 'कृपया ऑडियो फाइलन का एक्सेस जरूर दीन जाय जेहिसे हमका आपन संगीत फाइल खेलै कै अनुमति दीन जाय।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ऑडियो एक्सेस अनुमति निधन';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'कृपया डिवाइस सेटिंग्स मा ई ऐप के लिए ऑडियो फाइल एक्सेस प्रदान करौ ताकि हमका आपन संगीत फाइल खेल सकै।';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'गाना-बजाना';

  @override
  String get nowPlayingScreenTitle => 'अब बजाब';

  @override
  String get shuffleSongsMenuTitle => 'शफल गीत';

  @override
  String get shuffleSettingTitle => 'शफल';

  @override
  String get settingsScreenTitle => 'सेटिंग';

  @override
  String get aboutScreenTitle => 'बारेम';

  @override
  String get coverFlowScreenTitle => 'कवर बहाव';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एल्बम';

  @override
  String get songsScreenTitle => 'गाना';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString गीत',
      one: '1 गाना',
      zero: 'कउनो गाना नाहीं',
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
      zero: 'कउनो एल्बम नाहीं',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'विधायी';

  @override
  String get genreSongsScreenTitle => 'विधायक गीत';

  @override
  String get deviceColorSettingTitle => 'डिवाइस रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'दोहरावब';

  @override
  String get repeatModeOne => 'एकु';

  @override
  String get repeatModeAll => 'सब';

  @override
  String get vibrateSettingTitle => 'कंपन';

  @override
  String get clickWheelSettingTitle => 'पहिया ध्वनि पर क्लिक करे';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड म';

  @override
  String get touchSoundsDialogTitle => 'धमाकेदार साउंड';

  @override
  String get touchSoundsDialogContent => 'कृपया सिस्टम सेटिंग्स से छूने का समापन करे के लिए क्लिक व्हील आवाज़ सुनने के लिए';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिव मोड';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल देखा जाय';

  @override
  String get changeDirectorySettingTitle => 'बदलाव डायरेक्टरी का बदलाव';

  @override
  String get donateSettingTitle => 'दान करब';

  @override
  String get donateSettingDescription => 'अगर आपका ई ऐप पसंद है, तो कृपया दान करै पर विचार करौ।';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => 'के साथ बना ❤️ द्वारा';

  @override
  String get noMusicFilesFound => 'संगीत ना';

  @override
  String get noArtistsFound => 'कलाकार';

  @override
  String get noAlbumsFound => 'एल्बम नाय';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अनजान कलाकार';

  @override
  String get unknownAlbum => 'अनजान एल्बम';

  @override
  String get unknownGenre => 'अनजान विधा';

  @override
  String get buttonConfirmText => 'ठीक';

  @override
  String get tileValueOn => 'प';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'क';

  @override
  String get pageNotFoundText => 'दिये पन्ना मा नाहीं मिला';

  @override
  String get commonErrorText => 'गलती';

  @override
  String get retryButtonText => 'जवाबपूजन';

  @override
  String get filePickerDialogTitle => 'संगीत के लिए एक डायरेक्टरी का चयन करें';

  @override
  String get searchScreenTitle => 'ख्वाजव';

  @override
  String get searchEmptyText => 'कउनौ खोज परिणाम नाहीं';

  @override
  String get searchResultsText => 'खोज परिणाम:';

  @override
  String get resultsForText => 'के लिए परिणाम:';

  @override
  String get disableBatteryOptimizationTitle => 'बैटरी अनुकूलन को अक्षम कर रहा है';

  @override
  String get disableBatteryOptimizationContent => 'कृपया डिवाइस सेटिंग्स म इस ऐप के लिए बैटरी अनुकूलन को अक्षम कर सकत हैं ताकि संगीत के पृष्ठभूमि प्लेबैक के अनुमति मिल सके।';

  @override
  String get languageScreenTitle => 'भासा';

  @override
  String get silverDeviceColor => 'चाँदी';

  @override
  String get blackDeviceColor => 'करिया';

  @override
  String get resetSettingsTitle => 'रीसेट सेटिंग्स';

  @override
  String get browseArtist => 'कलाकार';

  @override
  String get browseAlbum => 'एल्बम बाढ़ब';

  @override
  String get cancelText => 'रद्द';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट';

  @override
  String get addToOnTheGoPlaylist => 'ऑन-द-गो म जोड़ें';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गो म एल्बम जोड़ें';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट से हटावा जाय';

  @override
  String get allAlbums => 'सब एल्बम';

  @override
  String get scanningMusicFiles => 'संगीत फाइल का स्कैनिंग';

  @override
  String get newPlaylist => 'नया प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट बचाओ';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'रेस्कन म्यूजिक फाइल';

  @override
  String get deviceControlMenuTutorialText => 'क्लिक व्हील के चारों ओर हल्के से अपने अंगूठा हल्के से ले जाओ मेनू नेविगेट करे';

  @override
  String get centerButtonMenuTutorialText => 'हाइलाइटेड मेनू आइटम का चयन करै के लिए सेंटर बटन दबावा जाय';

  @override
  String get playPauseMenuTutorialText => 'इस बटन को दबाय ते गाना बजाए या रोकै';

  @override
  String get nextButtonMenuTutorialText => 'इस बटन को दबाय के अगले गाना को छोड़ दे';

  @override
  String get previousButtonMenuTutorialText => 'ई बटन दबा के फिरि से विनिमय या पिछले गीत मा फिर से जा';

  @override
  String get menuButtonTutorialText => 'पिछले मेनू मा वापस जाय खातिर ई बटन दबावा जाय। आप कउनौ दूसर स्क्रीन से दबावा सकत हैं अउर सीधे मुख्य मेनू मा जा सकत हैं।';

  @override
  String get deviceScreenMenuTutorialText => 'ई डिस्प्ले स्क्रीन है। टच स्क्रीन और स्प्लिट स्क्रीन मोड डिफ़ॉल्ट रूप से सक्षम है और सेटिंग म आगे कॉन्फ़िगर किया जा सकत है।';

  @override
  String get deviceControlNowPlayingTutorialText => 'क्लिक व्हील के चारों ओर अपने अंगूठा को वॉल्यूम समायोजित करे';

  @override
  String get centerButtonNowPlayingTutorialText => 'बार, स्क्रबर बार और शफल स्लाइडर के माध्यम से साइकिल चलावै के लिए सेंटर बटन दबावा जाय। अतिरिक्त विकल्पन तक पहुंचै के लिए सेंटर बटन दबावा अउर पकड़ा जाय।';

  @override
  String get nextButtonNowPlayingTutorialText => 'प्रेस कइके आगे बढाये ई बटन दौये';

  @override
  String get previousButtonNowPlayingTutorialText => 'गीत दुबारा विस्तान करै के लिए ई बटन दबावैं अउर धरौ';

  @override
  String get deviceControlSearchTutorialText => 'क्लिक व्हील के आसपास हल्के से अपने अंगूठा हल्के से एक वर्णमाला को उजागर करे';

  @override
  String get centerButtonSearchTutorialText => 'हाइलाइट किए गए वर्णमाला का चयन करे खातिर सेंटर बटन दबावा जाय';

  @override
  String get nextButtonSearchTutorialText => 'इस बटन को दबाने के लए एक जगह जोड़ने के लए';

  @override
  String get previousButtonSearchTutorialText => 'ई बटन दबा के अंतिम चरित्र का हटावा जाय';

  @override
  String get menuButtonSearchTutorialText => 'कीबोर्ड बंद करै अऊर खोज परिणामन के साथ बातचीत करै के लिए ई बटन दबावा जाय';
}
