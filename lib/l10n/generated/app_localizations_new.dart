// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Newari Nepal Bhasa (`new`).
class AppLocalizationsNew extends AppLocalizations {
  AppLocalizationsNew([String locale = 'new']) : super(locale);

  @override
  String get appTitle => 'क्लासिक';

  @override
  String get menuButtonText => 'मेल';

  @override
  String get audioAccessPermissionTitle => 'अडियो पहुँचया अनुमति माःगु';

  @override
  String get audioAccessPermissionContent =>
      'छिगु म्यूजिक फाइल म्हितेत अडियो फाइलया पहुँच बियादिसँ ।';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'अडियो सुलभिङ्ग पर्सिमिशन डिनाइड';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'जिमित छिगु संगीत फाइल म्हितेत डिभाइस सेटिङ्गय् थुगु एपया निंतिं अडियो फाइलया पहुँच बियादिसँ ।';

  @override
  String get menuScreenTitle => 'मेनु';

  @override
  String get musicMenuScreenTitle => 'संगीत';

  @override
  String get nowPlayingScreenTitle => 'अरी थाये';

  @override
  String get shuffleSongsMenuTitle => 'शुफल म्ये';

  @override
  String get shuffleSettingTitle => 'वाक् यासे';

  @override
  String get settingsScreenTitle => 'सेटिङ';

  @override
  String get aboutScreenTitle => 'पेखेलं';

  @override
  String get coverFlowScreenTitle => 'कभर';

  @override
  String get artistsScreenTitle => 'कलाकार';

  @override
  String get albumsScreenTitle => 'एल्बम';

  @override
  String get songsScreenTitle => 'म्ये';

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
  String get genresScreenTitle => 'विधा';

  @override
  String get genreSongsScreenTitle => 'जनरल म्ये';

  @override
  String get deviceColorSettingTitle => 'डिभाइस कलर';

  @override
  String get touchScreenSettingTitle => 'ब्वांय् प्वंकल ।';

  @override
  String get repeatModeSettingTitle => 'हान्न या';

  @override
  String get repeatModeOne => 'छ';

  @override
  String get repeatModeAll => 'दक्व';

  @override
  String get vibrateSettingTitle => 'भाँय्';

  @override
  String get clickWheelSettingTitle => 'ह्वील साउण्डय् क्लिक यानादिसँ';

  @override
  String get splitScreenSettingTitle => 'स्प्लिट स्क्रीन मोड';

  @override
  String get touchSoundsDialogTitle => 'जाँच यायेगु';

  @override
  String get touchSoundsDialogContent =>
      'क्लिक व्हील सः न्यनेत सिस्टम सेटिङ्गपाखें सहगु सःतुइकादिसँ ।';

  @override
  String get immersiveModeSettingTitle => 'इमर्सिभ मोड';

  @override
  String get showAppTutorialSettingTitle => 'ट्यूटोरियल';

  @override
  String get changeDirectorySettingTitle => 'चेन्ज डाइरेक्टरी';

  @override
  String get donateSettingTitle => 'दान य';

  @override
  String get donateSettingDescription =>
      'छन्त थ्व एप यःसा, दान यायेगु बिचाः या ।';

  @override
  String get versionAboutScreenTitle => 'संस्करण';

  @override
  String get madeWithLoveTitle => '❤️ पाखें दयेकूगु';

  @override
  String get noMusicFilesFound => 'मखु';

  @override
  String get noArtistsFound => 'मदु';

  @override
  String get noAlbumsFound => 'एल्बम मदु';

  @override
  String get unknownSong => 'अज्ञात';

  @override
  String get unknownArtist => 'अज्ञात कलाकार';

  @override
  String get unknownAlbum => 'अब्ल्बम अज्ञात';

  @override
  String get unknownGenre => 'जनसमुदाय';

  @override
  String get buttonConfirmText => 'ज्यू';

  @override
  String get tileValueOn => 'अंके';

  @override
  String get tileValueOff => 'तापा';

  @override
  String get commonOfText => 'या';

  @override
  String get pageNotFoundText => 'बियातःगु पेज लुइके मफुत';

  @override
  String get commonErrorText => 'त्रुटि';

  @override
  String get retryButtonText => 'पनाखं';

  @override
  String get filePickerDialogTitle =>
      'संगीतया निंतिं स्क्यानय् निर्देशिका ल्ययादिसँ ।';

  @override
  String get searchScreenTitle => 'मालेउ';

  @override
  String get searchEmptyText => 'मालेगु लिच्वः मदु ।';

  @override
  String get searchResultsText => 'लिच्वःत मालेगु :';

  @override
  String get resultsForText => 'लिच्वः :';

  @override
  String get disableBatteryOptimizationTitle => 'असक्षम ब्याट्री अनुकूलन';

  @override
  String get disableBatteryOptimizationContent =>
      'संगीतया पृष्ठभूमि प्लेब्याक यायेत अनुमति बीत डिभाइस सेटिङय् थुगु एपया निंतिं ब्याट्री अपटिमाइजेशनयात असक्षम यानादिसँ ।';

  @override
  String get languageScreenTitle => 'भ्या';

  @override
  String get silverDeviceColor => 'चाँदी';

  @override
  String get blackDeviceColor => 'हाकु';

  @override
  String get resetSettingsTitle => 'सेटिङ रिसेट';

  @override
  String get browseArtist => 'ब्राउज कलाकार २.';

  @override
  String get browseAlbum => 'अल्बम ब्राउज';

  @override
  String get cancelText => 'रोक्का';

  @override
  String get playlistsScreenTitle => 'नाटक चिकित्सक';

  @override
  String get addToOnTheGoPlaylist => 'अन-द-गोय् ति ।';

  @override
  String get addAlbumToOnTheGoPlaylist => 'अन-द-गोय् अल्बम तनादिसँ ।';

  @override
  String get removeSongFromThePlaylist => 'प्लेलिस्टं लिका ।';

  @override
  String get allAlbums => 'दक्वं एल्बम';

  @override
  String get scanningMusicFiles => 'स्क्यानिङ्ग संगीत फाइल';

  @override
  String get newPlaylist => 'न्हूगु प्लेलिस्ट';

  @override
  String get savePlaylist => 'प्लेलिस्ट सेभ';

  @override
  String get clearPlaylist => 'प्लेलिस्ट क्लियर';

  @override
  String get rescanMusicFilesSettingTitle => 'रेस्कन संगीत फाइल';

  @override
  String get deviceControlMenuTutorialText =>
      'मेनु नेभिगेट यायेत क्लिक व्हीलया चाकःलिं थःगु थम्बयात हल्का यानादिसँ ।';

  @override
  String get centerButtonMenuTutorialText =>
      'हाइलाइट यानातःगु मेनु आइटम ल्ययेत सेन्टर बटन त्यु ।';

  @override
  String get playPauseMenuTutorialText =>
      'म्ये हालेत बाय् दिकेत थुगु बटन त्यु ।';

  @override
  String get nextButtonMenuTutorialText =>
      'मेगु म्येयात त्वःतेत थुगु बटन त्यु ।';

  @override
  String get previousButtonMenuTutorialText =>
      'न्हापाया म्येय् लिहां वनेत थुगु बटन त्यु ।';

  @override
  String get menuButtonTutorialText =>
      'न्हापाया मेनुइ लिहां वनेत थुगु बटन त्यु । छिं थुकियात मेगु छुं नं स्क्रिनं तप्यंक मू मेनुइ वनेत तियादिसँ ।';

  @override
  String get deviceScreenMenuTutorialText =>
      'थ्व डिस्प्ले स्क्रिन खः । टच स्क्रीन व स्प्लिट स्क्रीन मोडयात डिफल्ट कथं सक्षम याइ व सेटिङय् अझ अप्वः कन्फिगर यायेफइ ।';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'आयतन समायोजन यायेत क्लिक व्हीलयात थःगु थुम्बः यंकि ।';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'बार, स्क्रबर बार व शफल स्लाइडर मालेगु माध्यमं साइकल चले यायेत सेन्टर बटन त्यु । तँसा विकल्प कायेत सेन्टर बटन त्यु अले तयादिसँ ।';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'म्येयात फास्ट फर्वार्ड यायेत थुगु बटन त्यु अले ज्वनादिसँ ।';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'म्येयात हाकनं चलन यायेत थुगु बटन त्यु अले ज्वनादिसँ ।';

  @override
  String get deviceControlSearchTutorialText =>
      'अल्फाबेटयात हाइलाइट यायेत क्लिक व्हीलया चाकःलिं छंगु थुम्बः हल्का चाःहिकि ।';

  @override
  String get centerButtonSearchTutorialText =>
      'हाइलाइट यानातःगु अल्फाबेट ल्ययेत सेन्टर बटन त्यु ।';

  @override
  String get nextButtonSearchTutorialText => 'थाय् तनेत थुगु बटन त्यु ।';

  @override
  String get previousButtonSearchTutorialText =>
      'लिपांगु पात्र हुइकेत थुगु बटन त्यु ।';

  @override
  String get menuButtonSearchTutorialText =>
      'कीबोर्ड बन्द यायेत व मालेगु लिच्वःलिसे अन्तरक्रिया यायेत थुगु बटन त्यु ।';

  @override
  String get allSongs => 'दक्वं म्ये';
}
