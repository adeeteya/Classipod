// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kirghiz Kyrgyz (`ky`).
class AppLocalizationsKy extends AppLocalizations {
  AppLocalizationsKy([String locale = 'ky']) : super(locale);

  @override
  String get appTitle => 'Классипод';

  @override
  String get menuButtonText => 'Меню';

  @override
  String get audioAccessPermissionTitle => 'Аудио кирүү уруксаты талап кылынат';

  @override
  String get audioAccessPermissionContent => 'Музыка файлдарыңызды ойноого мүмкүнчүлүк берүү үчүн аудио файлдарын алууга мүмкүнчүлүк бериңиз.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Аудио кирүү уруксаты четке кагылды';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Музыка файлдарыңызды ойноого мүмкүнчүлүк берүү үчүн, бул колдонмо үчүн бул колдонмо үчүн аудио файлдарын түзмөк.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Азыр ойноп жатат';

  @override
  String get shuffleSongsMenuTitle => 'Шаффлдин ырлары';

  @override
  String get shuffleSettingTitle => 'Аралаштыруу';

  @override
  String get settingsScreenTitle => 'Жөндөөлөр';

  @override
  String get aboutScreenTitle => 'Жөнүндө';

  @override
  String get coverFlowScreenTitle => 'Капкактын агымы';

  @override
  String get artistsScreenTitle => 'Сүрөтчүлөр';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Ырлар';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Ырлар',
      one: '1 Ыр',
      zero: 'Ырлар жок',
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
      other: '$countString Альбомдор',
      one: '1 Альбом',
      zero: 'Альбомдор жок',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрлар';

  @override
  String get genreSongsScreenTitle => 'Жанрдагы ырлар';

  @override
  String get deviceColorSettingTitle => 'Түзмөк түсү';

  @override
  String get touchScreenSettingTitle => 'Сенсордук экран иштетилген';

  @override
  String get repeatModeSettingTitle => 'Кайталоо';

  @override
  String get repeatModeOne => 'Бир';

  @override
  String get repeatModeAll => 'Баары';

  @override
  String get vibrateSettingTitle => 'Термелет';

  @override
  String get clickWheelSettingTitle => 'Дөңгөлөктүн үндөрүн чыкылдатыңыз';

  @override
  String get splitScreenSettingTitle => 'Бөлүүчү экрандагы режим';

  @override
  String get touchSoundsDialogTitle => 'Туура үндөр';

  @override
  String get touchSoundsDialogContent => 'Сураныч, Велоддогу үндөрдү угуу үчүн тутумдун орнотуулары тутумунун орнотуулары';

  @override
  String get immersiveModeSettingTitle => 'Чуркоо режими';

  @override
  String get showAppTutorialSettingTitle => 'Шоу үйрөтүү';

  @override
  String get changeDirectorySettingTitle => 'Directory өзгөртүү';

  @override
  String get donateSettingTitle => 'Кайрымдуулук';

  @override
  String get donateSettingDescription => 'Эгер сизге бул колдонмо жакса, сураныч, белекке кайрылыңыз.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => '❤️ менен жасалган';

  @override
  String get noMusicFilesFound => 'Музыка жок';

  @override
  String get noArtistsFound => 'Эч кандай сүрөтчүлөр';

  @override
  String get noAlbumsFound => 'Альбомдор';

  @override
  String get unknownSong => 'Белгисиз ыр';

  @override
  String get unknownArtist => 'Белгисиз сүрөтчү';

  @override
  String get unknownAlbum => 'Белгисиз альбом';

  @override
  String get unknownGenre => 'Белгисиз Жанр';

  @override
  String get buttonConfirmText => 'Макул';

  @override
  String get tileValueOn => 'Боюнча';

  @override
  String get tileValueOff => 'Өчүрүү';

  @override
  String get commonOfText => 'of';

  @override
  String get pageNotFoundText => 'Берилген барак табылган жок';

  @override
  String get commonErrorText => 'Ката';

  @override
  String get retryButtonText => 'Кайра аракет кылуу';

  @override
  String get filePickerDialogTitle => 'Музыканы сканерлөө үчүн каталогду тандаңыз';

  @override
  String get searchScreenTitle => 'Издөө';

  @override
  String get searchEmptyText => 'Издөө натыйжалары жок';

  @override
  String get searchResultsText => 'Издөө натыйжалары:';

  @override
  String get resultsForText => 'Натыйжалар:';

  @override
  String get disableBatteryOptimizationTitle => 'Батареяны оптималдаштыруу';

  @override
  String get disableBatteryOptimizationContent => 'Түзмөктүн жөндөөлөрүндө бул колдонмо үчүн батареяны оптимизациясын өчүрүп коюңуз.';

  @override
  String get languageScreenTitle => 'Тил';

  @override
  String get silverDeviceColor => 'Күмүш';

  @override
  String get blackDeviceColor => 'Кара';

  @override
  String get resetSettingsTitle => 'Жөндөөлөрдү калыбына келтирүү';

  @override
  String get browseArtist => 'Сүрөтчүнү карап';

  @override
  String get browseAlbum => 'Альбомду карап чыгуу';

  @override
  String get cancelText => 'Жокко чыгаруу';

  @override
  String get playlistsScreenTitle => 'Ойнотмо тизмелер';

  @override
  String get addToOnTheGoPlaylist => 'To-Goга кошуу';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Альбом кошуңуз';

  @override
  String get removeSongFromThePlaylist => 'Ойнотмо тизмесинен алып салуу';

  @override
  String get allAlbums => 'Бардык альбомдор';

  @override
  String get scanningMusicFiles => 'Музыкалык файлдарды сканерлөө';

  @override
  String get newPlaylist => 'Жаңы ойнотмо тизмеси';

  @override
  String get savePlaylist => 'Ойнотмо тизмесин сактоо';

  @override
  String get clearPlaylist => 'Ойнотмо тизмесин тазалоо';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Бармагыңызды бир аз басуу дөңгөлөгүн чыкылдатып, менюга чабыттоо';

  @override
  String get centerButtonMenuTutorialText => 'Белгиленген меню пунктун тандоо үчүн Борбор баскычын басыңыз';

  @override
  String get playPauseMenuTutorialText => 'Ырды ойнотуу же тыным жасоо үчүн бул баскычты басыңыз';

  @override
  String get nextButtonMenuTutorialText => 'Кийинки ырга өтүү үчүн бул баскычты басыңыз';

  @override
  String get previousButtonMenuTutorialText => 'Мурунку ырга кайтуу үчүн бул баскычты басыңыз';

  @override
  String get menuButtonTutorialText => 'Мурунку менюга кайтып баруу үчүн бул баскычты басыңыз. Сиз башкы менюга түздөн-түз баруу үчүн сиз аны башка экранда басып, кармап турсаңыз болот.';

  @override
  String get deviceScreenMenuTutorialText => 'Бул дисплей экраны. Сенсордук экран жана бөлүнүү экран режими демейки режимде иштетилет жана жөндөөлөрдө андан ары конфигурацияланат.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Үн көлөмүн жөндөө үчүн, бармагыңызды басуу дөңгөлөгүңүздү жылдырыңыз';

  @override
  String get centerButtonNowPlayingTutorialText => 'Бар, скраббер-бар, сыдырма сыдырманы издеңиз, скраббер-бар жана сыдырма издеңиз. Кошумча тандоолорго жетүү үчүн Борбор баскычын басып, кармап туруңуз.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Ырды алдыга жылуу үчүн бул баскычты басып, кармап туруңуз';

  @override
  String get previousButtonNowPlayingTutorialText => 'Ырды артка тартуу үчүн бул баскычты басып, кармап туруңуз';

  @override
  String get deviceControlSearchTutorialText => 'Алфавитти баса белгилөө үчүн, бармагыңызды бир аз баскан дөңгөлөктүн айланасында жылдырыңыз';

  @override
  String get centerButtonSearchTutorialText => 'Белгиленген алфавитти тандоо үчүн Борбор баскычын басыңыз';

  @override
  String get nextButtonSearchTutorialText => 'Мейкиндик кошуу үчүн бул баскычты басыңыз';

  @override
  String get previousButtonSearchTutorialText => 'Акыркы белгинин жок кылуу үчүн бул баскычты басыңыз';

  @override
  String get menuButtonSearchTutorialText => 'Баскычтопту жабуу үчүн бул баскычты басыңыз жана издөө натыйжалары менен өз ара аракеттенүү';
}
