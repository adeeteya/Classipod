// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dogri (`doi`).
class AppLocalizationsDoi extends AppLocalizations {
  AppLocalizationsDoi([String locale = 'doi']) : super(locale);

  @override
  String get appTitle => 'क्लासिपॉड दा';

  @override
  String get menuButtonText => 'मेनू ऐ';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्सेस दी अनुमति दी लोड़ ऐ';

  @override
  String get audioAccessPermissionContent =>
      'कृपा करियै अपनी संगीत फाइलें गी चलाने दी इजाजत देने आस्तै ऑडियो फाइलें गी एक्सेस देओ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो एक्सेस दी अनुमति गी नकार दित्ता गेआ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपा करियै डिवाइस सेटिंग्स च इस ऐप आस्तै ऑडियो फाइलें गी एक्सेस देओ तां जे असेंगी अपनी संगीत फाइलें गी चलाने दी इजाजत दित्ती जा।';

  @override
  String get menuScreenTitle => 'मेनू ऐ';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अब खेलने';

  @override
  String get shuffleSongsMenuTitle => 'घुमावदार गीत';

  @override
  String get shuffleSettingTitle => 'शफल ऐ';

  @override
  String get settingsScreenTitle => 'सेटिंग्स ऐ';

  @override
  String get aboutScreenTitle => 'तकरीबन';

  @override
  String get coverFlowScreenTitle => 'कवर प्रवाह';

  @override
  String get artistsScreenTitle => 'कलाकारें';

  @override
  String get albumsScreenTitle => 'एल्बम ऐ';

  @override
  String get songsScreenTitle => 'गीतें';

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
      zero: 'नो गीत',
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
      zero: 'नो एल्बम',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'विधाएं';

  @override
  String get genreSongsScreenTitle => 'विधा के गीत';

  @override
  String get deviceColorSettingTitle => 'डिवाइस दा रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'दरहाना';

  @override
  String get repeatModeOne => 'इक';

  @override
  String get repeatModeAll => 'सब्भै';

  @override
  String get vibrateSettingTitle => 'कंपन दा';

  @override
  String get clickWheelSettingTitle => 'क्लिक चक्का दी आवाज़';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'टच साउंड्स';

  @override
  String get touchSoundsDialogContent =>
      'कृपा करियै सिस्टम सेटिंग्स थमां टच साउंडें गी सक्षम करो तां जे क्लिक चक्का आह् ली आवाज़ें गी सुनेआ जाई सकै';

  @override
  String get immersiveModeSettingTitle => 'डुबकीदार मोड';

  @override
  String get showAppTutorialSettingTitle => 'दिखाओ ट्यूटोरियल';

  @override
  String get changeDirectorySettingTitle => 'डायरेक्टरी बदलो';

  @override
  String get donateSettingTitle => 'दान देना';

  @override
  String get donateSettingDescription =>
      'जेकर तुसें गी एह् ऐप पसंद ऐ तां कृपया दान करने पर विचार करो।';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ कन्नै बने दा ऐ';

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
  String get unknownGenre => 'अज्ञात विधा';

  @override
  String get buttonConfirmText => 'ठीक ऐ';

  @override
  String get tileValueOn => 'पर';

  @override
  String get tileValueOff => 'बंद';

  @override
  String get commonOfText => 'आहला';

  @override
  String get pageNotFoundText => 'दित्ते गेदे पेज गी नेईं लब्भा';

  @override
  String get commonErrorText => 'गलती';

  @override
  String get retryButtonText => 'पुनः कोशिश करो';

  @override
  String get filePickerDialogTitle =>
      'संगीत लेई स्कैन करने आस्तै इक डायरेक्टरी चुनो';

  @override
  String get searchScreenTitle => 'तपाश';

  @override
  String get searchEmptyText => 'कोई खोज परिणाम';

  @override
  String get searchResultsText => 'खोज परिणाम:';

  @override
  String get resultsForText => 'नतीजे:';

  @override
  String get disableBatteryOptimizationTitle => 'बैटरी अनुकूलन गी अक्षम करो';

  @override
  String get disableBatteryOptimizationContent =>
      'संगीत दे बैकग्राउंड प्लेबैक दी अनुमति देने आस्तै डिवाइस सेटिंग्स च इस ऐप आस्तै बैटरी अनुकूलन गी अक्षम करो।';

  @override
  String get languageScreenTitle => 'भाशा';

  @override
  String get silverDeviceColor => 'चांदी';

  @override
  String get blackDeviceColor => 'काला';

  @override
  String get resetSettingsTitle => 'सेटिंग्स रीसेट करो';

  @override
  String get browseArtist => 'ब्राउज़ करें कलाकार';

  @override
  String get browseAlbum => 'एल्बम ब्राउज़ करो';

  @override
  String get cancelText => 'रद्द';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट ऐ';

  @override
  String get addToOnTheGoPlaylist => 'ऑन-द-गो में जोड़ें';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-द-गो में एल्बम जोड़ें';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट थमां हटाओ';

  @override
  String get allAlbums => 'सारे एल्बम';

  @override
  String get scanningMusicFiles => 'संगीत फाइलें गी स्कैन करना';

  @override
  String get newPlaylist => 'नई प्लेलिस्ट ऐ';

  @override
  String get savePlaylist => 'प्लेलिस्ट बचाओ';

  @override
  String get clearPlaylist => 'प्लेलिस्ट साफ करो';

  @override
  String get rescanMusicFilesSettingTitle => 'rescan संगीत फाइलें';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू गी नेविगेट करने लेई अपने अंगूठे गी हल्के ढंगै कन्नै लेई जाओ';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट कीते गेदे मेनू आइटम गी चुनने लेई केंद्र बटन दबाओ';

  @override
  String get playPauseMenuTutorialText =>
      'इस बटन गी दबाने जां रुकने आस्तै इस बटन गी दबाओ';

  @override
  String get nextButtonMenuTutorialText =>
      'अगले गीत गी छोड़ने लेई इस बटन गी दबाओ';

  @override
  String get previousButtonMenuTutorialText =>
      'रिवाइंड करने लेई इस बटन गी दबाओ जां पिछले गीत पर वापस जाओ';

  @override
  String get menuButtonTutorialText =>
      'पिछले मेनू च वापस जाने लेई इस बटन गी दबाओ। तुस इसगी कुसै बी होर स्क्रीन थमां दबाइयै रक्खी सकदे ओ तां जे सीधे मेन मेनू च जाई सकै।';

  @override
  String get deviceScreenMenuTutorialText =>
      'एह् डिस्प्ले स्क्रीन ऐ। टच स्क्रीन ते स्प्लिट स्क्रीन मोड डिफ़ॉल्ट रूप कन्नै सक्षम कीते जंदे न ते सेटिंग्स च होर कॉन्फ़िगर कीते जाई सकदे न।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'वॉल्यूम समायोजित करने लेई अपने अंगूठे गी क्लिक व्हील दे चारों ओर लेई जाओ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'सीक बार, स्क्रबर बार ते स्लाइडर दे माध्यम कन्नै साइकिल चलाने लेई केंद्र बटन दबाओ। अतिरिक्त विकल्पें गी एक्सेस करने लेई सेंटर बटन गी दबाओ ते पकड़ो।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गीत गी तेजी कन्नै अग्गें बधाने लेई इस बटन गी दबाओ ते पकड़ो';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत रिवाइंड करने लेई इस बटन गी दबाओ ते पकड़ो';

  @override
  String get deviceControlSearchTutorialText =>
      'इक वर्णमाला हाइलाइट करने आस्तै क्लिक चक्के दे चारों-पार अपने अंगूठे गी हल्के ढंगै कन्नै लेई जाओ';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट कीती गेदी वर्णमाला गी चुनने लेई केंद्र बटन दबाओ';

  @override
  String get nextButtonSearchTutorialText =>
      'इक स्पेस जोड़ने लेई इस बटन गी दबाओ';

  @override
  String get previousButtonSearchTutorialText =>
      'पिछले वर्ण गी हटाने लेई इस बटन गी दबाओ';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड गी बंद करने ते खोज परिणामें कन्नै गल्लबात करने लेई इस बटन गी दबाओ';
}
