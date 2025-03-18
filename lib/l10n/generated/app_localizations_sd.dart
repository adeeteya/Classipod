// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get appTitle => 'ڪلاسپوڊ';

  @override
  String get menuButtonText => 'مينيو';

  @override
  String get audioAccessPermissionTitle => 'آڊيو رسائي جي اجازت گهربل آهي';

  @override
  String get audioAccessPermissionContent =>
      'مهرباني ڪري آڊيو فائلن کي رسائي ڏيو اسان کي توهان جي ميوزڪ فائلن کي کيڏڻ جي اجازت ڏيو.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'آڊيو رسائي جي اجازت رد ڪئي وئي';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'مهرباني ڪري توهان جي ميوزڪ فائلن کي کيڏڻ جي اجازت ڏيو ته آڊيو فائلن جي لاء آڊيو فائلون رسائي ڏيو.';

  @override
  String get menuScreenTitle => 'مينيو';

  @override
  String get musicMenuScreenTitle => 'موسيقي';

  @override
  String get nowPlayingScreenTitle => 'هاڻي کيڏان پيو';

  @override
  String get shuffleSongsMenuTitle => 'شفل گانا';

  @override
  String get shuffleSettingTitle => 'شڪن';

  @override
  String get settingsScreenTitle => 'سيٽنگ';

  @override
  String get aboutScreenTitle => 'جي باري';

  @override
  String get coverFlowScreenTitle => 'وهندڙ';

  @override
  String get artistsScreenTitle => 'طصن';

  @override
  String get albumsScreenTitle => 'البمز';

  @override
  String get songsScreenTitle => 'گانو';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString گيت',
      one: '1 گيت',
      zero: 'نه گيت',
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
      other: '$countString البم',
      one: '1 البم',
      zero: 'ڪوبه البم',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'صنفون';

  @override
  String get genreSongsScreenTitle => 'صنف گانا';

  @override
  String get deviceColorSettingTitle => 'ڊيوپ آو نئون';

  @override
  String get touchScreenSettingTitle => 'ٽچ اسڪرين کي فعال ڪيو ويو';

  @override
  String get repeatModeSettingTitle => 'ورھيو';

  @override
  String get repeatModeOne => 'هڪ';

  @override
  String get repeatModeAll => 'سڀئي';

  @override
  String get vibrateSettingTitle => 'متحرڪ';

  @override
  String get clickWheelSettingTitle => 'ويل آوازن تي ڪلڪ ڪريو';

  @override
  String get splitScreenSettingTitle => 'اسپلٽ اسڪرين موڊ';

  @override
  String get touchSoundsDialogTitle => 'آوازن جو آواز';

  @override
  String get touchSoundsDialogContent =>
      'مهرباني ڪري ٽچ جي سيٽنگن مان ٽچ جي سيٽنگن مان ڪلڪ ڪريو';

  @override
  String get immersiveModeSettingTitle => 'امرائيندڙ موڊ';

  @override
  String get showAppTutorialSettingTitle => 'سبق ڏيکاريو';

  @override
  String get changeDirectorySettingTitle => 'ڊائريڪٽري تبديل ڪريو';

  @override
  String get donateSettingTitle => 'عطيو ڏيو';

  @override
  String get donateSettingDescription =>
      'جيڪڏهن توهان هن ايپ کي پسند ڪيو، مهرباني ڪري عطيو ڏيڻ تي غور ڪريو.';

  @override
  String get versionAboutScreenTitle => 'جو وارو';

  @override
  String get madeWithLoveTitle => 'پاران پاران ٺهيل';

  @override
  String get noMusicFilesFound => 'موسيقي ناهي';

  @override
  String get noArtistsFound => 'نه ته آرٽسٽس';

  @override
  String get noAlbumsFound => 'نه البم';

  @override
  String get unknownSong => 'اڻڄاتسي جو اوفو';

  @override
  String get unknownArtist => 'اڻڄاتل آرٽع';

  @override
  String get unknownAlbum => 'نامعلوم البم';

  @override
  String get unknownGenre => 'اڻڄاتسٽ جو ڪنٽ';

  @override
  String get buttonConfirmText => 'ٺيڪ آ ٺيڪ ن';

  @override
  String get tileValueOn => 'ان تي';

  @override
  String get tileValueOff => 'پري';

  @override
  String get commonOfText => 'جو';

  @override
  String get pageNotFoundText => 'ڏنل صفحو نه مليو';

  @override
  String get commonErrorText => 'غلط';

  @override
  String get retryButtonText => 'ٻيهر ڪوشش ڪريو';

  @override
  String get filePickerDialogTitle =>
      'موسيقي لاء اسڪين ڪرڻ لاء ڊاريڪٽري چونڊيو';

  @override
  String get searchScreenTitle => 'ڳولا';

  @override
  String get searchEmptyText => 'ڳولا جا نتيجا';

  @override
  String get searchResultsText => 'ڳولا جا نتيجا:';

  @override
  String get resultsForText => 'نتيجا:';

  @override
  String get disableBatteryOptimizationTitle => 'بيٽري اصلاح کي غير فعال ڪريو';

  @override
  String get disableBatteryOptimizationContent =>
      'مهرباني ڪري موسيقي جي پلے بیک جي پسمنظر جي اجازت ڏيڻ جي اجازت ڏيڻ لاء هن ايپ لاء مهرباني ڪري بيٽري جي اصلاح کي غير فعال ڪريو.';

  @override
  String get languageScreenTitle => 'ٻولي';

  @override
  String get silverDeviceColor => 'چاندي';

  @override
  String get blackDeviceColor => 'ڪارو';

  @override
  String get resetSettingsTitle => 'سيٽنگون سيٽ ڪريو';

  @override
  String get browseArtist => 'آرٽسٽ براؤز ڪريو';

  @override
  String get browseAlbum => 'البم ڏسو';

  @override
  String get cancelText => 'رد ڪري';

  @override
  String get playlistsScreenTitle => 'پليئرسٽس';

  @override
  String get addToOnTheGoPlaylist => 'اڳتي وڌڻ تي شامل ڪريو';

  @override
  String get addAlbumToOnTheGoPlaylist => 'البم شامل ڪريو';

  @override
  String get removeSongFromThePlaylist => 'پلي لسٽ مان هٽايو';

  @override
  String get allAlbums => 'سڀ البم';

  @override
  String get scanningMusicFiles => 'موسيقي جي فائلن کي اسڪين ڪرڻ';

  @override
  String get newPlaylist => 'نئين راند جي فهرست';

  @override
  String get savePlaylist => 'پلي لسٽ کي محفوظ ڪريو';

  @override
  String get clearPlaylist => 'صاف ڪندڙ کي صاف ڪريو';

  @override
  String get rescanMusicFilesSettingTitle => 'ميوزڪ فائلن کي ريزنيٽ فائلون';

  @override
  String get deviceControlMenuTutorialText =>
      'مينيو کي نيويگيٽ ڪرڻ لاء پنهنجي انگوزي کي هلڪو هلايو';

  @override
  String get centerButtonMenuTutorialText =>
      'نمايان ٿيل مينيو آئٽم کي چونڊڻ لاء سينٽر جو بٽڻ دٻايو';

  @override
  String get playPauseMenuTutorialText =>
      'هڪ گيت کيڏڻ يا ڇڪڻ لاء هن بٽڻ کي دٻايو';

  @override
  String get nextButtonMenuTutorialText =>
      'پريس ڪريو ھي بٽڻ دٻايو ايندڙ گيت ڏانھن وڃو';

  @override
  String get previousButtonMenuTutorialText =>
      'هن بٽڻ کي ٻيهر کولڻ يا واپس وڃڻ لاء دٻايو';

  @override
  String get menuButtonTutorialText =>
      'پوئين مينيو ڏانهن واپس وڃڻ لاء هن بٽڻ کي دٻايو. توهان سڌي رستي تي سڌو سنئون ڪنهن ٻئي اسڪرين تي ڪلڪ ڪري سگهو ٿا.';

  @override
  String get deviceScreenMenuTutorialText =>
      'هي ڊسپلي اسڪرين آهي. ٽچ اسڪرين ۽ اسپلٽ اسڪرين موڊ ڊفالٽ ذريعي فعال ڪيو ويو آهي ۽ سيٽنگن ۾ وڌيڪ ترتيب ڏئي سگهجي ٿو.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'حجم کي ترتيب ڏيڻ لاء ڪلڪ ڪريو تي ڪلڪ ڪريو ڪلڪ ڪريو';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'بار بار بار، اسڪربر بار ۽ شفل سلائيڊر ذريعي سائيڪل جو بٽڻ دٻايو. پريس ڪريو ۽ وچ واري بٽڻ کي اضافي اختيارن تائين رسائي لاء دٻايو.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'پريس کي دٻايو ۽ هن بٽڻ کي تيز ڪرڻ لاء';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'پريس ڪريو ۽ هن بٽڻ کي گانو کي ٻيهر کولڻ لاء دٻايو';

  @override
  String get deviceControlSearchTutorialText =>
      'ڪلڪ ڪريو پنھنجي آ thumb يء ريت ڪلڪ ڪريو ڪلڪ ڪريو ھڪڙي الفابيٽ کي اجاگر ڪرڻ لاء';

  @override
  String get centerButtonSearchTutorialText =>
      'نمايان ٿيل الفابيٽ کي چونڊڻ لاء سينٽر جو بٽڻ دٻايو';

  @override
  String get nextButtonSearchTutorialText =>
      'اسپيس شامل ڪرڻ لاء هن بٽڻ کي دٻايو';

  @override
  String get previousButtonSearchTutorialText =>
      'آخري ڪردار کي ختم ڪرڻ لاء هن بٽڻ کي دٻايو';

  @override
  String get menuButtonSearchTutorialText =>
      'ڪيبورڊ بند ڪرڻ لاء هن بٽڻ کي دٻايو ۽ ڳولا جي نتيجن سان رابطو ڪريو';

  @override
  String get allSongs => 'سڀ گانا';
}
