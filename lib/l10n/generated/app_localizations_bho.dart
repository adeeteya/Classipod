// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bhojpuri (`bho`).
class AppLocalizationsBho extends AppLocalizations {
  AppLocalizationsBho([String locale = 'bho']) : super(locale);

  @override
  String get appTitle => 'क्लासिपोड के बा .';

  @override
  String get menuButtonText => 'मेनू में बा .';

  @override
  String get audioAccessPermissionTitle =>
      'ऑडियो एक्सेस के अनुमति के जरूरत बा .';

  @override
  String get audioAccessPermissionContent =>
      'कृपया ऑडियो फाइल के एक्सेस दीं जेहसे कि हमनी के रउरा संगीत फाइल चलावे के अनुमति मिल सके.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो एक्सेस के अनुमति से इनकार कइल गइल';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया डिवाइस सेटिंग में एह ऐप खातिर ऑडियो फाइल के एक्सेस दीं ताकि हमनी के आपके संगीत फाइल चलावे के अनुमति मिल सके।';

  @override
  String get menuScreenTitle => 'मेनू में बा .';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अब खेलत बानी .';

  @override
  String get shuffleSongsMenuTitle => 'फेरबदल के गीतन के';

  @override
  String get shuffleSettingTitle => 'फेरबदल करे के बा .';

  @override
  String get settingsScreenTitle => 'सेटिंग्स के बा .';

  @override
  String get aboutScreenTitle => 'बारे में';

  @override
  String get coverFlowScreenTitle => 'ढक के बहाव के बा .';

  @override
  String get artistsScreenTitle => 'कलाकार लोग के बा .';

  @override
  String get albumsScreenTitle => 'एल्बम के बारे में बतावल गइल बा .';

  @override
  String get songsScreenTitle => 'गीत 2019 के बा।';

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
      one: '1 गीत',
      zero: 'कोई गीत ना',
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
      zero: 'कोई एल्बम ना',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'विधा के बा .';

  @override
  String get genreSongsScreenTitle => 'विधा के गीतन के';

  @override
  String get deviceColorSettingTitle => 'डिवाइस के रंग 100 बा।';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम कइल गइल बा .';

  @override
  String get repeatModeSettingTitle => 'दुहरावऽ';

  @override
  String get repeatModeOne => 'एगो';

  @override
  String get repeatModeAll => 'कुल्हि';

  @override
  String get vibrateSettingTitle => 'कंपन करे के बा .';

  @override
  String get clickWheelSettingTitle => 'पहिया के आवाज़ पर क्लिक करीं .';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड बा .';

  @override
  String get touchSoundsDialogTitle => 'टच के आवाज़';

  @override
  String get touchSoundsDialogContent =>
      'क्लिक व्हील के आवाज सुने खातिर सिस्टम सेटिंग्स से टच साउंड के सक्षम करीं';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिव मोड के बा .';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल शो के बा .';

  @override
  String get changeDirectorySettingTitle => 'डाइरेक्टरी बदलीं .';

  @override
  String get donateSettingTitle => 'दान कईल';

  @override
  String get donateSettingDescription =>
      'अगर रउरा ई ऐप पसंद बा त दान देबे पर विचार करीं.';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ के साथ बनावल गइल बा।';

  @override
  String get noMusicFilesFound => 'कवनो संगीत नइखे';

  @override
  String get noArtistsFound => 'ना कवनो कलाकार';

  @override
  String get noAlbumsFound => 'कवनो एलबम नइखे';

  @override
  String get unknownSong => 'अज्ञात गीत 1999 के बा।';

  @override
  String get unknownArtist => 'अज्ञात कलाकार के बा';

  @override
  String get unknownAlbum => 'अनजान एल्बम के बारे में बतावल गइल बा।';

  @override
  String get unknownGenre => 'अज्ञात विधा के बा .';

  @override
  String get buttonConfirmText => 'ठीक बा';

  @override
  String get tileValueOn => 'ऊपरे';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'का';

  @override
  String get pageNotFoundText => 'दिहल पन्ना ना मिलल .';

  @override
  String get commonErrorText => 'त्रुटि';

  @override
  String get retryButtonText => 'दोबारा कोशिश करे के बा .';

  @override
  String get filePickerDialogTitle =>
      'संगीत खातिर स्कैन करे खातिर कवनो डाइरेक्टरी चुनीं';

  @override
  String get searchScreenTitle => 'तलाशी';

  @override
  String get searchEmptyText => 'खोज के परिणाम नइखे';

  @override
  String get searchResultsText => 'खोज के परिणाम बा:';

  @override
  String get resultsForText => 'के खातिर परिणाम:';

  @override
  String get disableBatteryOptimizationTitle =>
      'बैटरी के अनुकूलन के अक्षम कर दिहल जाव';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया डिवाइस सेटिंग में एह ऐप खातिर बैटरी ऑप्टिमाइजेशन के अक्षम करीं ताकि संगीत के बैकग्राउंड प्लेबैक के अनुमति मिल सके।';

  @override
  String get languageScreenTitle => 'भाखा';

  @override
  String get silverDeviceColor => 'चांदी';

  @override
  String get blackDeviceColor => 'करिया';

  @override
  String get resetSettingsTitle => 'सेटिंग्स के रीसेट करीं .';

  @override
  String get browseArtist => 'कलाकार के ब्राउज़ करीं';

  @override
  String get browseAlbum => 'एल्बम ब्राउज़ करीं';

  @override
  String get cancelText => 'मना कइ दीं';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट के बा .';

  @override
  String get addToOnTheGoPlaylist => 'ऑन-द-गो में जोड़ल जाव';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गो में एल्बम जोड़ल जाव';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट से निकाल लीं';

  @override
  String get allAlbums => 'सब एल्बम के बारे में बतावल गइल बा .';

  @override
  String get scanningMusicFiles => 'संगीत फाइल के स्कैन कइल जा रहल बा .';

  @override
  String get newPlaylist => 'नया प्लेलिस्ट बा .';

  @override
  String get savePlaylist => 'प्लेलिस्ट के सहेजीं';

  @override
  String get clearPlaylist => 'प्लेलिस्ट में साफ बा .';

  @override
  String get rescanMusicFilesSettingTitle => 'संगीत फाइल के रिस्कैन कइल जाला .';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू के नेविगेट करे खातिर क्लिक व्हील के चारों ओर हल्का से आपन अंगूठा ले जाईं';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट कइल मेनू आइटम चुने खातिर सेंटर बटन दबाईं';

  @override
  String get playPauseMenuTutorialText =>
      'एह बटन के बजावे खातिर भा कवनो गाना के रोकल जाव';

  @override
  String get nextButtonMenuTutorialText =>
      'अगिला गाना पर जाए खातिर एह बटन के दबाईं';

  @override
  String get previousButtonMenuTutorialText =>
      'रिवाइंड करे खातिर एह बटन के दबाईं भा पिछला गाना पर वापस जाईं';

  @override
  String get menuButtonTutorialText =>
      'पिछला मेनू में वापस जाए खातिर एह बटन के दबाईं। रउआ एकरा के कवनो दोसरा स्क्रीन से दबा के रख सकेनी ताकि सीधे मुख्य मेनू में जा सके।';

  @override
  String get deviceScreenMenuTutorialText =>
      'इहे डिस्प्ले स्क्रीन बा। टच स्क्रीन अवुरी स्प्लिट स्क्रीन मोड डिफ़ॉल्ट रूप से सक्षम बा अवुरी एकरा के सेटिंग में अवुरी कॉन्फ़िगर कईल जा सकता।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'वॉल्यूम एडजस्ट करे खातिर क्लिक व्हील के चारों ओर आपन अंगूठा ले जाईं';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'सीक बार, स्क्रबर बार आ शफल स्लाइडर के माध्यम से साइकिल चलावे खातिर सेंटर बटन दबाईं। अतिरिक्त विकल्प तक पहुंचे खातिर सेंटर बटन के दबा के रखीं।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गाना के फास्ट फॉरवर्ड करे खातिर एह बटन के दबा के रखीं';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत के रिवाइंड करे खातिर एह बटन के दबा के रखीं';

  @override
  String get deviceControlSearchTutorialText =>
      'एगो वर्णमाला के हाइलाइट करे खातिर क्लिक व्हील के चारों ओर हल्का से आपन अंगूठा ले जाईं';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट कइल वर्णमाला चुने खातिर सेंटर बटन दबाईं';

  @override
  String get nextButtonSearchTutorialText =>
      'एह बटन के दबा के एगो स्पेस जोड़ल जाला .';

  @override
  String get previousButtonSearchTutorialText =>
      'अंतिम वर्ण के हटावे खातिर एह बटन के दबाईं';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड बंद करे खातिर एह बटन के दबाईं आ खोज परिणाम के साथे बातचीत करीं';
}
