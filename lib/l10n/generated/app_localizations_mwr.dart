// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marwari (`mwr`).
class AppLocalizationsMwr extends AppLocalizations {
  AppLocalizationsMwr([String locale = 'mwr']) : super(locale);

  @override
  String get appTitle => 'क्लास';

  @override
  String get menuButtonText => 'मई';

  @override
  String get audioAccessPermissionTitle => 'ऑडियो एक्स्ट उत्सर्जन रेड्डी';

  @override
  String get audioAccessPermissionContent =>
      'कृपया ऑडियो फ़ाइलां री सुविधा प्रदान करो ताकि आपां नै आपरी संगीत फाइलां खेलण री अनुमति मिलै।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ऑटो एक्स्ट पर्सन उत्सर्जन दीनद';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'इण ऐप री सेटिंग्स री सेटिंग्स में पहुंच री व्यवस्था कर’र आपरी संगीत फाइलां नै खेलण री अनुमति देवण री अनुमति देवो।';

  @override
  String get menuScreenTitle => 'ठीक करणो';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अबै';

  @override
  String get shuffleSongsMenuTitle => 'धाफल';

  @override
  String get shuffleSettingTitle => 'धाफ';

  @override
  String get settingsScreenTitle => 'सेटिंग';

  @override
  String get aboutScreenTitle => 'कै बारा मं';

  @override
  String get coverFlowScreenTitle => 'धीरजवां';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'अलब';

  @override
  String get songsScreenTitle => 'सांगो';

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
      zero: 'कोई गीत कोनी',
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
      zero: 'कोई एल्बम कोनी',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ग्यारह';

  @override
  String get genreSongsScreenTitle => 'ग्यारस';

  @override
  String get deviceColorSettingTitle => 'भोत रंग';

  @override
  String get touchScreenSettingTitle => 'टच स्किन री ।';

  @override
  String get repeatModeSettingTitle => 'दुबारा करणो';

  @override
  String get repeatModeOne => 'एक';

  @override
  String get repeatModeAll => 'सगळा';

  @override
  String get vibrateSettingTitle => 'घणो';

  @override
  String get clickWheelSettingTitle => 'व्हिल री साउंड्स क्लिक करो';

  @override
  String get splitScreenSettingTitle => 'चौराहे री मोड';

  @override
  String get touchSoundsDialogTitle => 'टच';

  @override
  String get touchSoundsDialogContent =>
      'क्लिक व्हील आवाजां नै सुणबा रै वास्तै सिस्टम सेटिंग्स सूं एकजुट टच साउंड';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिव मोड';

  @override
  String get showAppTutorialSettingTitle => 'तुलार';

  @override
  String get changeDirectorySettingTitle => 'छै निर्देशी';

  @override
  String get donateSettingTitle => 'दान देणो';

  @override
  String get donateSettingDescription =>
      'अगर आप यो ऐप पसंद करो हो तो दान कर सको हो।';

  @override
  String get versionAboutScreenTitle => 'भांत';

  @override
  String get madeWithLoveTitle => '❤️ रै साथै बणाओ';

  @override
  String get noMusicFilesFound => 'अबै संगीत';

  @override
  String get noArtistsFound => 'कोई आर्टिस्ट';

  @override
  String get noAlbumsFound => 'फेर भी';

  @override
  String get unknownSong => 'सोंग';

  @override
  String get unknownArtist => 'ब्याव री बात है';

  @override
  String get unknownAlbum => 'अहंकार';

  @override
  String get unknownGenre => 'चाहणो';

  @override
  String get buttonConfirmText => 'ठीक';

  @override
  String get tileValueOn => 'ऊपर';

  @override
  String get tileValueOff => 'बंद करणा';

  @override
  String get commonOfText => 'को';

  @override
  String get pageNotFoundText => 'दियो गयो पेज कोनी मिल्यो।';

  @override
  String get commonErrorText => 'गळती';

  @override
  String get retryButtonText => 'परिणाम';

  @override
  String get filePickerDialogTitle => 'म्यूजिक रै वास्तै एक निदेशक नै चुणो';

  @override
  String get searchScreenTitle => 'खोज़णो';

  @override
  String get searchEmptyText => 'नीं छाया री बात कोनी';

  @override
  String get searchResultsText => 'साइकिल रीस री बात करां तो:';

  @override
  String get resultsForText => 'नतीजा री बात:';

  @override
  String get disableBatteryOptimizationTitle => 'विकलांग बैटरी विवशीकरण';

  @override
  String get disableBatteryOptimizationContent =>
      'इण ऐप रै लिए डिवाइस सेटिंग्स में संगीत री पृष्ठभूमि नै वापस करण री अनुमति देवा रै लिए उपकरण सेटिंग्स में बैटरी अनुकूलन कृपया कर सको।';

  @override
  String get languageScreenTitle => 'भासा';

  @override
  String get silverDeviceColor => 'चाँदी';

  @override
  String get blackDeviceColor => 'काळो';

  @override
  String get resetSettingsTitle => 'रीसेट';

  @override
  String get browseArtist => 'आर्टिस्ट';

  @override
  String get browseAlbum => 'ब्राउज मनायो';

  @override
  String get cancelText => 'रद्द';

  @override
  String get playlistsScreenTitle => 'नाटकवादी';

  @override
  String get addToOnTheGoPlaylist => 'ओ-ई-ओगो';

  @override
  String get addAlbumToOnTheGoPlaylist => 'अलाबम नै ऑन-गो तक';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्ट सूं हटाओ';

  @override
  String get allAlbums => 'लगभग सगळा';

  @override
  String get scanningMusicFiles => 'स्क्रंकिंग म्यूजल्स';

  @override
  String get newPlaylist => 'न्यू प्लेलिस्टी';

  @override
  String get savePlaylist => 'प्लेलिस्ट री पढ़ाई पूरी कराई';

  @override
  String get clearPlaylist => 'क्लेयर प्लेलिस्ट';

  @override
  String get rescanMusicFilesSettingTitle => 'रेसकूक म्यूजल्स';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनू ने निकालवा वास्ते क्लिक कर’र क्लिक कर’र आपरो अंगूठो हल्को हराओ';

  @override
  String get centerButtonMenuTutorialText =>
      'प्रतिबिंबित मेनू आइटम नै चुणबा खातर सेंटर बटन दबाओ';

  @override
  String get playPauseMenuTutorialText =>
      'गीत खेलबा या पंखों का पीछो करण खातर इस बटन दबाओ।';

  @override
  String get nextButtonMenuTutorialText =>
      'अगला गीत 100 री ओर 1000 सूं 2019 तक जावा वास्ते इण बटन दबाओ।';

  @override
  String get previousButtonMenuTutorialText =>
      'इण बटण दबाबा वास्ते या पिछला गीत माथे पाछा जावो';

  @override
  String get menuButtonTutorialText =>
      'इण बटण नैं पैली री मेनू मांय पाछी जावण सारू दबाओ। आप किणी दूजा स्क्रीन सूं सीधा मुख्य मेनू मांय जावण सारू दबाओ अर पकड़ सको।';

  @override
  String get deviceScreenMenuTutorialText =>
      'यो डिस्प्ले स्क्रीन छै। टच स्कैन अर स्पार्ट स्किन मोड डिफॉल्ट रूप सूं सक्षम है अर सेटिंग्स में आगे कॉन्फ़िगर करियो जा सकै है।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'मात्रा नै एडजस्ट करण खातर क्लिक कर’र क्लिक करहां रै आसपास आपरो अंगूठी भेजो';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'केंद्र बटन दबाओ, वरीयता, स्प्रिंगर बार अर फ़ाइल स्लाइडर रै माध्यम सूं साइकिल माथै दबाओ। अतिरिक्त विकल्पां तक ​​पहुंचण अर केन्द्र बटन दबाओ अर राखो।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'गीत नै तेज करण खातर यो बटन दबाओ अर पकड़ो';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'गीतां नै याद करण सारू इण बटण माथै दबाओ अर पकड़ो';

  @override
  String get deviceControlSearchTutorialText =>
      'एक विलिबिट नै उजागर करण खातर क्लिक कर’र आपरै अंगूठा नै हल्का-फुल्का हराओ';

  @override
  String get centerButtonSearchTutorialText =>
      '2019 नै उजागर करण खातर केन्द्र बटन दबाओ';

  @override
  String get nextButtonSearchTutorialText => 'स्थान जोड़ण खातर इस बटन दबाओ';

  @override
  String get previousButtonSearchTutorialText =>
      'आखरी किरदार नै हटाबा रै वास्तै इण बटण माथै दबाओ';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड नै बंद करण खातर अर खोज परिणामां तै बातचीत करण खातर इस बटन दबाओ';

  @override
  String get allSongs => 'सगळा';
}
