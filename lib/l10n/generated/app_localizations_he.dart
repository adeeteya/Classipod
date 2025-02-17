// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'תַפרִיט';

  @override
  String get audioAccessPermissionTitle => 'הרשאת גישה לאודיו נדרשת';

  @override
  String get audioAccessPermissionContent =>
      'אנא הענק גישה לקבצי שמע כדי לאפשר לנו לנגן את קבצי המוזיקה שלך.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'הרשאת גישה לאודיו נדחתה';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'אנא הענק גישה לקבצי שמע עבור אפליקציה זו בהגדרות המכשיר כדי לאפשר לנו לנגן את קבצי המוזיקה שלך.';

  @override
  String get menuScreenTitle => 'תַפרִיט';

  @override
  String get musicMenuScreenTitle => 'מוּסִיקָה';

  @override
  String get nowPlayingScreenTitle => 'עכשיו משחק';

  @override
  String get shuffleSongsMenuTitle => 'שירי דשדוש';

  @override
  String get shuffleSettingTitle => 'לְעַרְבֵּב';

  @override
  String get settingsScreenTitle => 'הגדרות';

  @override
  String get aboutScreenTitle => 'אוֹדוֹת';

  @override
  String get coverFlowScreenTitle => 'כיסוי זרימה';

  @override
  String get artistsScreenTitle => 'אמנים';

  @override
  String get albumsScreenTitle => 'אלבומים';

  @override
  String get songsScreenTitle => 'שירים';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString שירים',
      one: '1 שיר',
      zero: 'אין שירים',
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
      other: '$countString אלבומים',
      one: '1 אלבום',
      zero: 'אין אלבומים',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ז\'אנרים';

  @override
  String get genreSongsScreenTitle => 'שירי ז\'אנר';

  @override
  String get deviceColorSettingTitle => 'צבע מכשיר';

  @override
  String get touchScreenSettingTitle => 'מסך מגע מופעל';

  @override
  String get repeatModeSettingTitle => 'לַחֲזוֹר עַל';

  @override
  String get repeatModeOne => 'אֶחָד';

  @override
  String get repeatModeAll => 'כֹּל';

  @override
  String get vibrateSettingTitle => 'לְנַדְנֵד';

  @override
  String get clickWheelSettingTitle => 'לחץ על צלילי גלגל';

  @override
  String get splitScreenSettingTitle => 'מצב מסך מפוצל';

  @override
  String get touchSoundsDialogTitle => 'מגע צלילים';

  @override
  String get touchSoundsDialogContent =>
      'אנא הפעל צלילי מגע מהגדרות המערכת כדי לשמוע את צלילי גלגל הלחיצה';

  @override
  String get immersiveModeSettingTitle => 'מצב טוען';

  @override
  String get showAppTutorialSettingTitle => 'הצג הדרכה';

  @override
  String get changeDirectorySettingTitle => 'שינוי מדריך';

  @override
  String get donateSettingTitle => 'לִתְרוֹם';

  @override
  String get donateSettingDescription =>
      'אם אתה אוהב את האפליקציה הזו, אנא שקול לתרום.';

  @override
  String get versionAboutScreenTitle => 'גִרְסָה';

  @override
  String get madeWithLoveTitle => 'מיוצר עם ❤️ על ידי';

  @override
  String get noMusicFilesFound => 'אין מוזיקה';

  @override
  String get noArtistsFound => 'אין אמנים';

  @override
  String get noAlbumsFound => 'אין אלבומים';

  @override
  String get unknownSong => 'שיר לא ידוע';

  @override
  String get unknownArtist => 'אמן לא ידוע';

  @override
  String get unknownAlbum => 'אלבום לא ידוע';

  @override
  String get unknownGenre => 'ז\'אנר לא ידוע';

  @override
  String get buttonConfirmText => 'בְּסֵדֶר';

  @override
  String get tileValueOn => 'עַל';

  @override
  String get tileValueOff => 'כבוי';

  @override
  String get commonOfText => 'שֶׁל';

  @override
  String get pageNotFoundText => 'הדף הנתון לא נמצא';

  @override
  String get commonErrorText => 'שְׁגִיאָה';

  @override
  String get retryButtonText => 'לנסות שוב';

  @override
  String get filePickerDialogTitle => 'בחר מדריך לסריקה למוזיקה';

  @override
  String get searchScreenTitle => 'לְחַפֵּשׂ';

  @override
  String get searchEmptyText => 'אין תוצאות חיפוש';

  @override
  String get searchResultsText => 'תוצאות חיפוש:';

  @override
  String get resultsForText => 'תוצאות עבור:';

  @override
  String get disableBatteryOptimizationTitle => 'השבת אופטימיזציה של סוללות';

  @override
  String get disableBatteryOptimizationContent =>
      'אנא השבת את אופטימיזציה של סוללות עבור אפליקציה זו בהגדרות המכשיר כדי לאפשר הפעלת רקע של מוסיקה.';

  @override
  String get languageScreenTitle => 'שָׂפָה';

  @override
  String get silverDeviceColor => 'כֶּסֶף';

  @override
  String get blackDeviceColor => 'שָׁחוֹר';

  @override
  String get resetSettingsTitle => 'איפוס הגדרות';

  @override
  String get browseArtist => 'דפדף באמן';

  @override
  String get browseAlbum => 'עיין באלבום';

  @override
  String get cancelText => 'לְבַטֵל';

  @override
  String get playlistsScreenTitle => 'רשימות השמעה';

  @override
  String get addToOnTheGoPlaylist => 'הוסף לדרך';

  @override
  String get addAlbumToOnTheGoPlaylist => 'הוסף אלבום לדרך';

  @override
  String get removeSongFromThePlaylist => 'הסר מרשימת ההשמעה';

  @override
  String get allAlbums => 'כל האלבומים';

  @override
  String get scanningMusicFiles => 'סריקת קבצי מוזיקה';

  @override
  String get newPlaylist => 'רשימת השמעה חדשה';

  @override
  String get savePlaylist => 'שמור רשימת השמעה';

  @override
  String get clearPlaylist => 'רשימת השמעה ברורה';

  @override
  String get rescanMusicFilesSettingTitle => 'קבצי מוזיקה של Respan';

  @override
  String get deviceControlMenuTutorialText =>
      'הזז את האגודל קלות סביב גלגל הלחץ כדי לנווט בתפריט';

  @override
  String get centerButtonMenuTutorialText =>
      'לחץ על כפתור המרכז כדי לבחור את פריט התפריט המודגש';

  @override
  String get playPauseMenuTutorialText =>
      'לחץ על כפתור זה כדי לנגן או להשהות שיר';

  @override
  String get nextButtonMenuTutorialText => 'לחץ על כפתור זה כדי לדלג לשיר הבא';

  @override
  String get previousButtonMenuTutorialText =>
      'לחץ על כפתור זה כדי להריץ מחדש או חזור לשיר הקודם';

  @override
  String get menuButtonTutorialText =>
      'לחץ על כפתור זה כדי לחזור לתפריט הקודם. אתה יכול ללחוץ ולהחזיק אותו מכל מסך אחר כדי לעבור ישירות לתפריט הראשי.';

  @override
  String get deviceScreenMenuTutorialText =>
      'זהו מסך התצוגה. מסך מגע ומצב מסך מפוצל מופעלים כברירת מחדל וניתן להגדיר אותם עוד יותר בהגדרות.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'הזז את האגודל סביב גלגל הלחץ כדי להתאים את עוצמת הקול';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'לחץ על כפתור המרכז כדי למחזור דרך סרגל חיפוש, סרגל קרצוף ומחוון דשדוש. לחץ והחזק את לחצן המרכז כדי לגשת לאפשרויות נוספות.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'לחץ לחיצה ארוכה על כפתור זה כדי לקדם את השיר במהירות';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'לחץ והחזק לחצן זה כדי לרדת מחדש את השיר';

  @override
  String get deviceControlSearchTutorialText =>
      'הזז את האגודל שלך קלות סביב גלגל הלחיצה כדי להדגיש אלף -בית';

  @override
  String get centerButtonSearchTutorialText =>
      'לחץ על כפתור המרכז כדי לבחור את האלף -בית המודגש';

  @override
  String get nextButtonSearchTutorialText => 'לחץ על כפתור זה כדי להוסיף חלל';

  @override
  String get previousButtonSearchTutorialText =>
      'לחץ על כפתור זה כדי למחוק את התו האחרון';

  @override
  String get menuButtonSearchTutorialText =>
      'לחץ על כפתור זה כדי לסגור את המקלדת ולקיים אינטראקציה עם תוצאות החיפוש';
}
