// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yiddish (`yi`).
class AppLocalizationsYi extends AppLocalizations {
  AppLocalizationsYi([String locale = 'yi']) : super(locale);

  @override
  String get appTitle => 'קלאַסיפּאָד';

  @override
  String get menuButtonText => 'מעניו';

  @override
  String get audioAccessPermissionTitle =>
      'אַודיאָ אַקסעס דערלויבעניש פארלאנגט';

  @override
  String get audioAccessPermissionContent =>
      'ביטע געבן אַודיאָ טעקעס אַקסעס צו לאָזן אונדז צו שפּילן דיין מוזיק טעקעס.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'אַודיאָ אַקסעס דערלויבעניש אפגעזאגט';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ביטע געבן אַודיאָ טעקעס אַקסעס פֿאַר דעם אַפּ אין די מיטל סעטטינגס צו לאָזן אונדז צו שפּילן דיין מוזיק טעקעס.';

  @override
  String get menuScreenTitle => 'מעניו';

  @override
  String get musicMenuScreenTitle => 'מוזיק';

  @override
  String get nowPlayingScreenTitle => 'איצט פּלייינג';

  @override
  String get shuffleSongsMenuTitle => 'שאַרן לידער';

  @override
  String get shuffleSettingTitle => 'שאַרן';

  @override
  String get settingsScreenTitle => 'סעטטינגס';

  @override
  String get aboutScreenTitle => 'וועגן';

  @override
  String get coverFlowScreenTitle => 'קאָלאָו לויפן';

  @override
  String get artistsScreenTitle => 'אַרטיס';

  @override
  String get albumsScreenTitle => 'אַלבומס';

  @override
  String get songsScreenTitle => 'לידער';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString לידער',
      one: '1 ליד',
      zero: 'קיין לידער',
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
      other: '$countString אַלבומס',
      one: '1 אלבאם',
      zero: 'קיין אַלבומס',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'זשאַנראַז';

  @override
  String get genreSongsScreenTitle => 'זשאַנראַ לידער';

  @override
  String get deviceColorSettingTitle => 'מיטל קאָליר';

  @override
  String get touchScreenSettingTitle => 'פאַרבינדן פאַרשטעלן ענייבאַלד';

  @override
  String get repeatModeSettingTitle => 'יבערכאַזערן';

  @override
  String get repeatModeOne => 'יינציק';

  @override
  String get repeatModeAll => 'אַלע';

  @override
  String get vibrateSettingTitle => 'ציטערן';

  @override
  String get clickWheelSettingTitle => 'דריקט ראָד סאָונדס';

  @override
  String get splitScreenSettingTitle => 'שפּאַלטן פאַרשטעלן מאָדע';

  @override
  String get touchSoundsDialogTitle => 'פאַרבינדן סאָונדס';

  @override
  String get touchSoundsDialogContent =>
      'ביטע געבן פאַרבינדן סאָונדס פון סיסטעם סעטטינגס צו הערן די קליק ראָד סאָונדס';

  @override
  String get immersiveModeSettingTitle => 'יממערסיווע מאָדע';

  @override
  String get showAppTutorialSettingTitle => 'ווייַזן טוטאָריאַל';

  @override
  String get changeDirectorySettingTitle => 'טוישן וועגווייַזער';

  @override
  String get donateSettingTitle => 'מאַקרעוו זייַן';

  @override
  String get donateSettingDescription =>
      'אויב איר ווי די אַפּ, ביטע באַטראַכטן דאָונייטינג.';

  @override
  String get versionAboutScreenTitle => 'נוסעך';

  @override
  String get madeWithLoveTitle => 'געמאכט מיט ❤️ דורך';

  @override
  String get noMusicFilesFound => 'קיין מוזיק';

  @override
  String get noArtistsFound => 'קיין קינסטלער';

  @override
  String get noAlbumsFound => 'קיין אַלבומס';

  @override
  String get unknownSong => 'אומבאַקאַנט ליד';

  @override
  String get unknownArtist => 'אומבאַקאַנט קינסטלער';

  @override
  String get unknownAlbum => 'אומבאַקאַנט אַלבום';

  @override
  String get unknownGenre => 'אומבאַקאַנט זשאַנראַ';

  @override
  String get buttonConfirmText => 'קעשורע';

  @override
  String get tileValueOn => 'אַף';

  @override
  String get tileValueOff => 'אַוועק';

  @override
  String get commonOfText => 'פון';

  @override
  String get pageNotFoundText => 'דער געגעבן בלאַט איז נישט געפֿונען';

  @override
  String get commonErrorText => 'גרייַז';

  @override
  String get retryButtonText => 'פריין';

  @override
  String get filePickerDialogTitle =>
      'סעלעקטירן אַ וועגווייַזער צו יבערקוקן פֿאַר מוזיק';

  @override
  String get searchScreenTitle => 'זוכן';

  @override
  String get searchEmptyText => 'קיין זוך רעזולטאַטן';

  @override
  String get searchResultsText => 'זוך רעזולטאַטן:';

  @override
  String get resultsForText => 'רעזולטאַטן פֿאַר:';

  @override
  String get disableBatteryOptimizationTitle =>
      'דיסאַבלע באַטאַרייע אַפּטאַמאַזיישאַן';

  @override
  String get disableBatteryOptimizationContent =>
      'ביטע דיסייבאַל באַטאַרייע אַפּטאַמאַזיישאַן פֿאַר דעם אַפּ אין די מיטל סעטטינגס צו לאָזן הינטערגרונט פּלייַבאַקק פון מוזיק.';

  @override
  String get languageScreenTitle => 'שפּראַך';

  @override
  String get silverDeviceColor => 'זילבער';

  @override
  String get blackDeviceColor => 'שוואַרץ';

  @override
  String get resetSettingsTitle => 'באַשטעטיק סעטטינגס';

  @override
  String get browseArtist => 'אָפּפליקן קינסטלער';

  @override
  String get browseAlbum => 'בלעטער אלבאם';

  @override
  String get cancelText => 'באָטל מאַכן';

  @override
  String get playlistsScreenTitle => 'פּלייַליסץ';

  @override
  String get addToOnTheGoPlaylist => 'לייג צו די-גיין';

  @override
  String get addAlbumToOnTheGoPlaylist => 'לייג אלבאם צו די-גיין';

  @override
  String get removeSongFromThePlaylist => 'אַראָפּנעמען פון די פּלייַליסט';

  @override
  String get allAlbums => 'כל אַלבומס';

  @override
  String get scanningMusicFiles => 'סקאַנינג מוזיק טעקעס';

  @override
  String get newPlaylist => 'נייַ פּלייַליסט';

  @override
  String get savePlaylist => 'היט פּלייַליסט';

  @override
  String get clearPlaylist => 'קלאָר פּלייַליסט';

  @override
  String get rescanMusicFilesSettingTitle => 'רעסקאַן מוזיק טעקעס';

  @override
  String get deviceControlMenuTutorialText =>
      'מאַך דיין גראָבער פינגער לייטלי אַרום די קליק ראָד צו נאַוויגירן די מעניו';

  @override
  String get centerButtonMenuTutorialText =>
      'דרוק דעם צענטער קנעפּל צו סעלעקטירן דעם כיילייטיד מעניו נומער';

  @override
  String get playPauseMenuTutorialText =>
      'דרוק דעם קנעפּל צו שפּילן אָדער פּויזע אַ ליד';

  @override
  String get nextButtonMenuTutorialText =>
      'דרוק דעם קנעפּל צו האָפּקען צו דער ווייַטער ליד';

  @override
  String get previousButtonMenuTutorialText =>
      'דרוק דעם קנעפּל צו ריוויינד אָדער גיין צוריק צו די פריערדיקע ליד';

  @override
  String get menuButtonTutorialText =>
      'דרוק דעם קנעפּל צו צוריקקומען צו די פריערדיקע מעניו. איר קען דריקן און האַלטן עס פון קיין אנדערע פאַרשטעלן צו דערגרייכן די הויפּט מעניו.';

  @override
  String get deviceScreenMenuTutorialText =>
      'דאָס איז די אַרויסווייַזן פאַרשטעלן. פאַרבינדן פאַרשטעלן און שפּאַלטן פאַרשטעלן מאָדע זענען ענייבאַלד דורך פעליקייַט און קענען זיין קאַנפיגיערד ווייַטער אין די סעטטינגס.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'מאַך דיין גראָבער פינגער אַרום די גיט ראָד צו סטרויערן די באַנד';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'דרוק דעם צענטער קנעפּל צו ציקל דורך זוכן באַר, סקרובבער באַר און שאַרן סליידער. דריקן און האַלטן די צענטער קנעפּל צו אַקסעס נאָך אָפּציעס.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'דריקן און האַלטן דעם קנעפּל צו געשווינד פאָרלייגן די ליד';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'דריקן און האַלטן דעם קנעפּל צו ריוויינד די ליד';

  @override
  String get deviceControlSearchTutorialText =>
      'מאַך דיין גראָבער פינגער לייטלי אַרום די קליק ראָד צו הויכפּונקט אַ אלפאבעט';

  @override
  String get centerButtonSearchTutorialText =>
      'דרוק דעם צענטער קנעפּל צו סעלעקטירן דעם כיילייטיד אלפאבעט';

  @override
  String get nextButtonSearchTutorialText =>
      'דרוק דעם קנעפּל צו לייגן אַ פּלאַץ';

  @override
  String get previousButtonSearchTutorialText =>
      'דרוק דעם קנעפּל צו ויסמעקן די לעצטע כאַראַקטער';

  @override
  String get menuButtonSearchTutorialText =>
      'דרוק דעם קנעפּל צו פאַרמאַכן די קלאַוויאַטור און ינטעראַקט מיט די זוך רעזולטאַטן';
}
