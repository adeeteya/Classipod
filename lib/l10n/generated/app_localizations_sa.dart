// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sanskrit (`sa`).
class AppLocalizationsSa extends AppLocalizations {
  AppLocalizationsSa([String locale = 'sa']) : super(locale);

  @override
  String get appTitle => 'वर्गपोड';

  @override
  String get menuButtonText => 'मेनू';

  @override
  String get audioAccessPermissionTitle => 'श्रव्यप्रवेश अनुमति आवश्यकी';

  @override
  String get audioAccessPermissionContent =>
      'कृपया अस्मान् भवतः सङ्गीतसञ्चिकाः वादयितुं शक्नुवन्ति इति श्रव्यसञ्चिकाः प्रवेशं ददातु।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑडियो एक्सेस अनुमति अस्वीकृत';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'कृपया उपकरणसेटिंग्स् मध्ये अस्य एप् कृते Audio Files अभिगमं ददातु येन अस्मान् भवतः संगीतसञ्चिकाः वादयितुं शक्नोति।';

  @override
  String get menuScreenTitle => 'मेनू';

  @override
  String get musicMenuScreenTitle => 'संगीतं';

  @override
  String get nowPlayingScreenTitle => 'अधुना वादयति';

  @override
  String get shuffleSongsMenuTitle => 'shuffle गीत';

  @override
  String get shuffleSettingTitle => 'शुफल्';

  @override
  String get settingsScreenTitle => 'सेटिंग्स्';

  @override
  String get aboutScreenTitle => 'विषये';

  @override
  String get coverFlowScreenTitle => 'कवर प्रवाह';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एल्बम';

  @override
  String get songsScreenTitle => 'गीतम् २';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString गीतानि',
      one: '1 गीतं',
      zero: 'न गीतानि',
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
      zero: 'कोऽपि एल्बमः नास्ति',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'विधाः २';

  @override
  String get genreSongsScreenTitle => 'विधा गीत';

  @override
  String get deviceColorSettingTitle => 'उपकरण रंग';

  @override
  String get touchScreenSettingTitle => 'स्पर्श स्क्रीन सक्षम';

  @override
  String get repeatModeSettingTitle => 'परिहरन';

  @override
  String get repeatModeOne => 'एकम्‌';

  @override
  String get repeatModeAll => 'सर्वे';

  @override
  String get vibrateSettingTitle => 'स्पन्दनम् २';

  @override
  String get clickWheelSettingTitle => 'चक्रध्वनयः क्लिक् कुर्वन्तु';

  @override
  String get splitScreenSettingTitle => 'विभक्त स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'स्पर्श ध्वनि स्पर्श';

  @override
  String get touchSoundsDialogContent =>
      'कृपया System Settings तः स्पर्शध्वनिं सक्षमं कुर्वन्तु क्लिक् चक्रध्वनिं श्रुतुं';

  @override
  String get immersiveModeSettingTitle => 'विमर्शा मोड';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल दिखाएँ';

  @override
  String get changeDirectorySettingTitle => 'निर्देशिका परिवर्तयन्तु';

  @override
  String get donateSettingTitle => 'वितरणं';

  @override
  String get donateSettingDescription =>
      'यदि भवान् एतत् एप् रोचते तर्हि कृपया दानं कर्तुं विचारयन्तु।';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ के साथ बनाया गया';

  @override
  String get noMusicFilesFound => 'न सङ्गीतम्';

  @override
  String get noArtistsFound => 'न कलाकाराः';

  @override
  String get noAlbumsFound => 'न कोऽपि एल्बमः';

  @override
  String get unknownSong => 'अज्ञात गीत';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अज्ञात एल्बम';

  @override
  String get unknownGenre => 'अज्ञात विधा';

  @override
  String get buttonConfirmText => 'अस्तु';

  @override
  String get tileValueOn => 'इत्युपरि';

  @override
  String get tileValueOff => 'दूरे';

  @override
  String get commonOfText => 'इत्यस्य';

  @override
  String get pageNotFoundText => 'दत्तं पृष्ठं न प्राप्तम् ।';

  @override
  String get commonErrorText => 'त्रुटि';

  @override
  String get retryButtonText => 'पुनः प्रयास करें';

  @override
  String get filePickerDialogTitle =>
      'संगीतस्य कृते स्कैन कर्तुं निर्देशिकां चिनोतु ।';

  @override
  String get searchScreenTitle => 'अन्वेषण';

  @override
  String get searchEmptyText => 'न अन्वेषणपरिणामाः';

  @override
  String get searchResultsText => 'खोज परिणाम:';

  @override
  String get resultsForText => 'परिणामों के लिए:';

  @override
  String get disableBatteryOptimizationTitle => 'बैटरी अनुकूलन अक्षम करें';

  @override
  String get disableBatteryOptimizationContent =>
      'कृपया उपकरणसेटिंग्स् मध्ये अस्य एप् कृते बैटरी-अनुकूलनं निष्क्रियं कुर्वन्तु येन सङ्गीतस्य पृष्ठभूमि-प्लेबैक-अनुमतिः भवति ।';

  @override
  String get languageScreenTitle => 'भाषा';

  @override
  String get silverDeviceColor => 'रजत';

  @override
  String get blackDeviceColor => 'कृष्णः';

  @override
  String get resetSettingsTitle => 'सेटिंग्स् पुनः सेट् कुर्वन्तु';

  @override
  String get browseArtist => 'ब्राउज़ कलाकार';

  @override
  String get browseAlbum => 'ब्राउज़ एल्बम';

  @override
  String get cancelText => 'निरसयतु';

  @override
  String get playlistsScreenTitle => 'प्लेलिस्ट';

  @override
  String get addToOnTheGoPlaylist => 'Add to-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ऑन-गो-गोल पर एल्बम जोड़ें';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट् तः निष्कासयन्तु';

  @override
  String get allAlbums => 'सर्वे एल्बमाः';

  @override
  String get scanningMusicFiles => 'संगीतसञ्चिकाः स्कैनिङ्गं करणम्';

  @override
  String get newPlaylist => 'नवीन प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट् रक्षतु';

  @override
  String get clearPlaylist => 'स्पष्ट प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan संगीत सञ्चिकाः';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू-मार्गे गन्तुं क्लिक्-चक्रस्य परितः स्वस्य अङ्गुष्ठं लघुतया चालयन्तु ।';

  @override
  String get centerButtonMenuTutorialText =>
      'Highlighted Menu item इत्यस्य चयनार्थं Center इति बटनं नुदन्तु ।';

  @override
  String get playPauseMenuTutorialText =>
      'गीतं वादयितुं वा विरामं कर्तुं वा एतत् बटनं नुदन्तु ।';

  @override
  String get nextButtonMenuTutorialText =>
      'अग्रिमगीतं स्किप् कर्तुं एतत् बटनं नुदन्तु ।';

  @override
  String get previousButtonMenuTutorialText =>
      'पुनः वायुम् कर्तुं वा पूर्वगीतं पुनः गन्तुं वा एतत् बटनं नुदन्तु ।';

  @override
  String get menuButtonTutorialText =>
      'पूर्वमेनू प्रति पुनः गन्तुं एतत् बटनं नुदन्तु । भवान् अन्यस्मात् कस्मात् अपि पटलात् तत् दबावितुं धारयितुं च शक्नोति यत् ते प्रत्यक्षतया मुख्यमेन्यू-पर्यन्तं गन्तुं शक्नुवन्ति ।';

  @override
  String get deviceScreenMenuTutorialText =>
      'एषा प्रदर्शनपर्दे अस्ति । Touch Screen तथा Split स्क्रीन मोड् पूर्वनिर्धारितरूपेण सक्षमम् अस्ति तथा च सेटिङ्ग्स् मध्ये अधिकं विन्यस्तुं शक्यते ।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'आयतनं समायोजयितुं क्लिक् चक्रस्य परितः अङ्गुष्ठं चालयन्तु ।';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Seek bar, Scubber bar तथा Shuffle स्लाइडर इत्येतयोः माध्यमेन चक्रं कर्तुं Center इति बटनं नुदन्तु । अतिरिक्तविकल्पान् प्राप्तुं Center बटनं नुदन्तु, धारयन्तु च।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गीतं द्रुतं कर्तुं एतत् बटनं दबावन्तु, धारयन्तु च ।';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीतं पुनः वारयितुं एतत् बटनं दबावन्तु, धारयन्तु च';

  @override
  String get deviceControlSearchTutorialText =>
      'वर्णमालां प्रकाशयितुं क्लिक् चक्रस्य परितः लघुतया अङ्गुष्ठं चालयन्तु ।';

  @override
  String get centerButtonSearchTutorialText =>
      'Highlighted Alphabet इत्यस्य चयनार्थं Center इति बटनं नुदन्तु ।';

  @override
  String get nextButtonSearchTutorialText =>
      'एकं स्थानं योजयितुं एतत् बटनं नुदन्तु ।';

  @override
  String get previousButtonSearchTutorialText =>
      'अन्तिमवर्णं विलोपयितुं एतत् बटनं नुदन्तु ।';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्डं बन्दं कृत्वा अन्वेषणपरिणामेन सह अन्तरक्रियां कर्तुं एतत् बटनं नुदन्तु ।';

  @override
  String get allSongs => 'सर्वाणि गीतानि .';
}
