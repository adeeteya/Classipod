// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maithili (`mai`).
class AppLocalizationsMai extends AppLocalizations {
  AppLocalizationsMai([String locale = 'mai']) : super(locale);

  @override
  String get appTitle => 'क्लासिपोड';

  @override
  String get menuButtonText => 'मेनू';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्सेस अनुमति आवश्यक अछि';

  @override
  String get audioAccessPermissionContent =>
      'कृपया ऑडियो फाइल के एक्सेस प्रदान करू जाहि स हमरा सब के अपन म्यूजिक फाइल के बजाबय के अनुमति भेटत।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो एक्सेस अनुमति खंडित';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया डिवाइस सेटिंग्स में एहि ऐप के लेल ऑडियो फाइल एक्सेस प्रदान करू जाहि सं हमरा सब के अहां के म्यूजिक फाइल के बजाबय के मौका मिलत.';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'आब खेलाइत';

  @override
  String get shuffleSongsMenuTitle => 'शफल गीत';

  @override
  String get shuffleSettingTitle => 'घुमावदार';

  @override
  String get settingsScreenTitle => 'सेटिंग्स 10।';

  @override
  String get aboutScreenTitle => 'विषय में';

  @override
  String get coverFlowScreenTitle => 'आवरण प्रवाह';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एल्बम';

  @override
  String get songsScreenTitle => 'गीत ८.';

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
      zero: 'कोनो गीत नहि',
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
      zero: 'कोनो एल्बम नहि',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'विधा 10।';

  @override
  String get genreSongsScreenTitle => 'विधा गीत';

  @override
  String get deviceColorSettingTitle => 'डिवाइस रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'दोहरानाइ';

  @override
  String get repeatModeOne => 'एकटा';

  @override
  String get repeatModeAll => 'सभटा';

  @override
  String get vibrateSettingTitle => 'स्पंदन ८.';

  @override
  String get clickWheelSettingTitle => 'क्लिक पहिया ध्वनि';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श ध्वनि';

  @override
  String get touchSoundsDialogContent =>
      'कृपया सिस्टम सेटिंग्स स टच साउंड सक्षम करू क्लिक व्हील साउंड सुनबा लेल';

  @override
  String get immersiveModeSettingTitle => 'विसर्जन मोड 1।';

  @override
  String get showAppTutorialSettingTitle => 'शो ट्यूटोरियल 10।';

  @override
  String get changeDirectorySettingTitle => 'परिवर्तन निर्देशिका';

  @override
  String get donateSettingTitle => 'दान करनाइ';

  @override
  String get donateSettingDescription =>
      'अगर अहां के ई ऐप नीक लगैत अछि त दान करय पर विचार करू.';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ द्वारा निर्मित';

  @override
  String get noMusicFilesFound => 'कोनो संगीत नहि .';

  @override
  String get noArtistsFound => 'कोनो कलाकार नहि';

  @override
  String get noAlbumsFound => 'कोनो एल्बम नहि';

  @override
  String get unknownSong => 'अज्ञात गीत २.';

  @override
  String get unknownArtist => 'अज्ञात कलाकार २.';

  @override
  String get unknownAlbum => 'अज्ञात एल्बम';

  @override
  String get unknownGenre => 'अज्ञात विधा २.';

  @override
  String get buttonConfirmText => 'ठीक छैै';

  @override
  String get tileValueOn => 'उपर';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'क';

  @override
  String get pageNotFoundText => 'देल गेल पृष्ठ नहि भेटल';

  @override
  String get commonErrorText => 'दोष';

  @override
  String get retryButtonText => 'पुनः प्रयास ८.';

  @override
  String get filePickerDialogTitle =>
      'संगीत के लेल स्कैन करय लेल एकटा डायरेक्टरी चुनू';

  @override
  String get searchScreenTitle => 'खोजनाइ';

  @override
  String get searchEmptyText => 'कोनो खोज परिणाम नहि';

  @override
  String get searchResultsText => 'खोज परिणाम:';

  @override
  String get resultsForText => 'के लिये परिणाम:';

  @override
  String get disableBatteryOptimizationTitle => 'बैटरी अनुकूलन अक्षम करू';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया संगीत के बैकग्राउंड प्लेबैक के अनुमति देबय लेल डिवाइस सेटिंग्स में एहि ऐप के लेल बैटरी ऑप्टिमाइजेशन के अक्षम करू.';

  @override
  String get languageScreenTitle => 'भाषा';

  @override
  String get silverDeviceColor => 'चांदी';

  @override
  String get blackDeviceColor => 'कारी';

  @override
  String get resetSettingsTitle => 'सेटिंग्स रीसेट करू';

  @override
  String get browseArtist => 'ब्राउज़ कलाकार';

  @override
  String get browseAlbum => 'ब्राउज़ एल्बम';

  @override
  String get cancelText => 'रद्द';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट';

  @override
  String get addToOnTheGoPlaylist => 'ऑन-द-गो मे जोड़ू';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गो में एल्बम जोड़ू';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट स हटाउ';

  @override
  String get allAlbums => 'सब एल्बम';

  @override
  String get scanningMusicFiles => 'स्कैनिंग संगीत फाइल';

  @override
  String get newPlaylist => 'नव प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट सहेजें';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'रिस्कन संगीत फाइल';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू में नेविगेट करय लेल क्लिक के पहिया के चारू कात अपन अंगूठा हल्का घुमाउ';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट कएल गेल मेनू आइटम क चयन करबाक लेल केंद्र बटन दबाउ';

  @override
  String get playPauseMenuTutorialText =>
      'कोनो गीत बजाबय वा विराम देबय लेल एहि बटन दबाउ';

  @override
  String get nextButtonMenuTutorialText => 'अगिला गीत पर छोड़य लेल ई बटन दबाउ';

  @override
  String get previousButtonMenuTutorialText =>
      'रिवाइंड करबाक लेल ई बटन दबाउ वा पिछला गीत पर वापस जाउ';

  @override
  String get menuButtonTutorialText =>
      'पिछला मेनू पर वापस जेबाक लेल एहि बटन दबाउ। अहां एकरा कोनो आन स्क्रीन सं दबा कए सीधा मुख्य मेनू मे जा सकैत छलहुं.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ई डिस्प्ले स्क्रीन अछि। टच स्क्रीन आ स्प्लिट स्क्रीन मोड डिफ़ॉल्ट रूप सं सक्षम छै आ सेटिंग्स मे आगू कॉन्फ़िगर कैल जा सकय छै.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'वॉल्यूम एडजस्ट करबाक लेल क्लिक व्हील के चारू कात अपन अंगूठा घुमाउ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'सीक बार, स्क्रबर बार आ शफल स्लाइडर के माध्यम सं साइकिल चलाबय लेल केंद्र बटन दबाउ. अतिरिक्त विकल्पक कें एक्सेस करय कें लेल केंद्र बटन दबाउ आ राखू.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गीत के फास्ट फॉरवर्ड करय लेल एहि बटन के दबाउ आ पकड़ू';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत के रिवाइंड करय लेल एहि बटन के दबाउ आ पकड़ू';

  @override
  String get deviceControlSearchTutorialText =>
      'एकटा वर्णमाला के हाइलाइट करय लेल क्लिक के पहिया के चारू कात अपन अंगूठा के हल्का स घुमाउ';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट कएल गेल वर्णमाला चुनबाक लेल केंद्र बटन दबाउ';

  @override
  String get nextButtonSearchTutorialText => 'कोनो जगह जोड़बाक लेल ई बटन दबाउ';

  @override
  String get previousButtonSearchTutorialText =>
      'अंतिम वर्ण के हटाबै के लेल ई बटन दबाउ';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड बंद करय लेल ई बटन दबाउ आ खोज परिणाम के संग बातचीत करू';

  @override
  String get allSongs => 'सब गीत';
}
