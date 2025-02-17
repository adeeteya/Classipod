// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'नाइसिप';

  @override
  String get menuButtonText => 'व्यंजन सुची';

  @override
  String get audioAccessPermissionTitle => 'अडियो पहुँच अनुमति आवश्यक छ';

  @override
  String get audioAccessPermissionContent =>
      'कृपया तपाईंको संगीत फाईलहरू खेल्न अनुमति दिन अडियो फाइलहरू पहुँच प्रदान गर्नुहोस्।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'अडियो पहुँच अनुमति अस्वीकृत';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया उपकरण सेटिंग्समा अडियो फाइलहरू पहुँच गर्नुहोस् उपकरण सेटिंग्समा यस अनुप्रयोगमा तपाईंको संगीत फाईलहरू खेल्न अनुमति दिनुहोस्।';

  @override
  String get menuScreenTitle => 'व्यंजन सुची';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अब खेल्दै';

  @override
  String get shuffleSongsMenuTitle => 'शफल गीतहरू';

  @override
  String get shuffleSettingTitle => 'आँन सक्ने';

  @override
  String get settingsScreenTitle => 'बतंग';

  @override
  String get aboutScreenTitle => 'प्राय';

  @override
  String get coverFlowScreenTitle => 'कभर प्रवाह';

  @override
  String get artistsScreenTitle => 'कलाकारहरू';

  @override
  String get albumsScreenTitle => 'एल्बम्स';

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
      other: '$countString गीत',
      one: '1 गीत',
      zero: 'कुनै गीत छैन',
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
      other: '$countString एल्बमहरू',
      one: '1 एल्बम',
      zero: 'कुनै एल्बमहरू छैनन्',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'रचनाकार';

  @override
  String get genreSongsScreenTitle => 'विधा गीतहरू';

  @override
  String get deviceColorSettingTitle => 'उपकरण र color';

  @override
  String get touchScreenSettingTitle => 'स्क्रीन सक्षम सक्षम';

  @override
  String get repeatModeSettingTitle => 'दोहोराउनु';

  @override
  String get repeatModeOne => 'एक';

  @override
  String get repeatModeAll => 'सबै';

  @override
  String get vibrateSettingTitle => 'थर्कनु';

  @override
  String get clickWheelSettingTitle => 'व्हील ध्वनिहरू क्लिक गर्नुहोस्';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रिन मोड';

  @override
  String get touchSoundsDialogTitle => 'टच ध्वनिहरू';

  @override
  String get touchSoundsDialogContent =>
      'कृपया प्रणाली सेटिंग्सबाट टच ध्वनिहरू क्लिक गर्नुहोस् क्लिक व्हील चल्दछ';

  @override
  String get immersiveModeSettingTitle => 'Begrowstical मोड';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल देखाउनुहोस्';

  @override
  String get changeDirectorySettingTitle => 'डाइरेक्टरी परिवर्तन गर्नुहोस्';

  @override
  String get donateSettingTitle => 'दान दिनु';

  @override
  String get donateSettingDescription =>
      'यदि तपाईंलाई यो अनुप्रयोग मनपर्यो भने, कृपया दानलाई विचार गर्नुहोस्।';

  @override
  String get versionAboutScreenTitle => 'रुपान्तर';

  @override
  String get madeWithLoveTitle => 'द्वारा बनेको ❤️';

  @override
  String get noMusicFilesFound => 'कुनै संगीत छैन';

  @override
  String get noArtistsFound => 'कुनै कलाकारहरू छैनन्';

  @override
  String get noAlbumsFound => 'कुनै एल्बमहरू छैनन्';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अज्ञात एल्बम';

  @override
  String get unknownGenre => 'अज्ञात विधा';

  @override
  String get buttonConfirmText => 'ठिक छ';

  @override
  String get tileValueOn => 'माथी';

  @override
  String get tileValueOff => 'बती निभाउनु';

  @override
  String get commonOfText => 'को';

  @override
  String get pageNotFoundText => 'दिइएको पृष्ठ फेला परेन';

  @override
  String get commonErrorText => 'त्रुटि';

  @override
  String get retryButtonText => 'ीक आचरण';

  @override
  String get filePickerDialogTitle =>
      'संगीतको लागि स्क्यान गर्न डाइरेक्टरी चयन गर्नुहोस्';

  @override
  String get searchScreenTitle => 'खोजी';

  @override
  String get searchEmptyText => 'कुनै खोजी परिणामहरू छैनन्';

  @override
  String get searchResultsText => 'खोज परिणामहरू:';

  @override
  String get resultsForText => 'परिणामहरूको लागि:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ब्याट्री अप्टिमाइजेसन असक्षम गर्नुहोस्';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया उपकरणको पृष्ठभूमिमा अनुमति दिन कृपया उपकरण सेटिंग्समा ब्याट्री अप्टिमाइमकरण असक्षम गर्नुहोस्।';

  @override
  String get languageScreenTitle => 'भाषा';

  @override
  String get silverDeviceColor => 'चांदी';

  @override
  String get blackDeviceColor => 'अध्यारो';

  @override
  String get resetSettingsTitle => 'रिसेट सेटिंग्स';

  @override
  String get browseArtist => 'ब्राउज कलाकार';

  @override
  String get browseAlbum => 'ब्राउज एल्बम';

  @override
  String get cancelText => 'रद्द गर्नु';

  @override
  String get playlistsScreenTitle => 'प्लेसूलिस्ट';

  @override
  String get addToOnTheGoPlaylist => '-On-good मा थप्नुहोस्';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Elbum Album अन-go-good गर्न';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्टबाट हटाउनुहोस्';

  @override
  String get allAlbums => 'सबै एल्बम';

  @override
  String get scanningMusicFiles => 'संगीत फाईलहरू स्क्यान गर्दै';

  @override
  String get newPlaylist => 'नयाँ प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट बचत गर्नुहोस्';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'पुन: गोल संगीत फाईलहरू';

  @override
  String get deviceControlMenuTutorialText =>
      'तपाईंको औंठालाई हल्का रूपमा सार्नुहोस् मेनू नेभिगेट गर्न क्लिक गर्नुहोस्';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट गरिएको मेनू वस्तु चयन गर्न केन्द्र बटन थिच्नुहोस्';

  @override
  String get playPauseMenuTutorialText =>
      'यो बटन थिच्नुहोस् र एक गीत रोक्नुहोस्';

  @override
  String get nextButtonMenuTutorialText => 'अर्को गीत छोड्न यो बटन थिच्नुहोस्';

  @override
  String get previousButtonMenuTutorialText =>
      'यस बटन थिच्नुहोस् रिवाइन्ड गर्न वा अघिल्लो गीतमा फर्कनुहोस्';

  @override
  String get menuButtonTutorialText =>
      'अघिल्लो मेनूमा फिर्ता जान यो बटन थिच्नुहोस्। तपाईं प्रेस गर्न सक्नुहुनेछ र यसलाई कुनै पनि अन्य स्क्रीनबाट सिधा जानको लागि सीधा गर्नलाई यसलाई समात्नुहोस्।';

  @override
  String get deviceScreenMenuTutorialText =>
      'यो प्रदर्शन स्क्रिन हो। टच स्क्रीन र विभाजित स्क्रिन मोड पूर्वनिर्धारित द्वारा सक्षम गरिएको छ र सेटिंग्स मा थप कन्फिगर गर्न सकिन्छ।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'तपाईंको थम्बले टेक व्हील वरिपरिको भोल्युम समायोजित गर्न सार्नुहोस्';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'खोज बार, स्क्रबबर बार र spulfle स्लाइड मार्फत साइकल गर्न केन्द्र बटन थिच्नुहोस्। थप विकल्पहरू पहुँच गर्न केन्द्र बटन थिच्नुहोस् र होल्ड गर्नुहोस्।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'प्रेस गर्नुहोस् र यो बटन थिच्नुहोस् गीत अगाडि बढ्न अगाडि बढ्न';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीत पुनर्जीवी बनाउन यो बटन थिच्नुहोस् र होल्ड गर्नुहोस्';

  @override
  String get deviceControlSearchTutorialText =>
      'तपाईंको औंलालाई हल्का रूपमा वर्णमाला जितेन वर्णमाला जितेलीमा सार्नुहोस्';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट गरिएको वर्णमाला चयन गर्न केन्द्र बटन थिच्नुहोस्';

  @override
  String get nextButtonSearchTutorialText => 'ठाउँ थप्न यो बटन थिच्नुहोस्';

  @override
  String get previousButtonSearchTutorialText =>
      'अन्तिम चरित्र मेट्न यो बटन थिच्नुहोस्';

  @override
  String get menuButtonSearchTutorialText =>
      'किबोर्ड बन्द गर्न यो बटन थिच्नुहोस् र खोज परिणामहरूको साथ अन्तर्क्रिया गर्नुहोस्';
}
