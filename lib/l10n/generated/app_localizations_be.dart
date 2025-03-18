// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'Класіфікаваны';

  @override
  String get menuButtonText => 'Меню';

  @override
  String get audioAccessPermissionTitle =>
      'Патрабуецца дазвол на доступ да гуку';

  @override
  String get audioAccessPermissionContent =>
      'Калі ласка, дайце доступ да аўдыяфайлаў, каб дазволіць нам прайграваць вашы музычныя файлы.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Дазвол на доступ да гуку адмоўлены';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Калі ласка, дайце доступ да аўдыяфайлаў для гэтага прыкладання ў наладах прылады, каб дазволіць нам прайграваць вашы музычныя файлы.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Зараз гульня';

  @override
  String get shuffleSongsMenuTitle => 'Ператасаванне песень';

  @override
  String get shuffleSettingTitle => 'Пералом';

  @override
  String get settingsScreenTitle => 'Налады';

  @override
  String get aboutScreenTitle => 'Пра';

  @override
  String get coverFlowScreenTitle => 'Паток вечка';

  @override
  String get artistsScreenTitle => 'Мастакі';

  @override
  String get albumsScreenTitle => 'Альбомы';

  @override
  String get songsScreenTitle => 'Песні';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Песні',
      one: '1 песня',
      zero: 'без песні',
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
      other: '$countString Альбомы',
      one: '1 альбом',
      zero: 'няма альбомаў',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанры';

  @override
  String get genreSongsScreenTitle => 'Жанравыя песні';

  @override
  String get deviceColorSettingTitle => 'Колер прылады';

  @override
  String get touchScreenSettingTitle => 'Уключэнне сэнсарнага экрана';

  @override
  String get repeatModeSettingTitle => 'Паўтараць';

  @override
  String get repeatModeOne => 'Адзін';

  @override
  String get repeatModeAll => 'Усе';

  @override
  String get vibrateSettingTitle => 'Дрыжаць';

  @override
  String get clickWheelSettingTitle => 'Націсніце гукі кола';

  @override
  String get splitScreenSettingTitle => 'Раздзялены рэжым экрана';

  @override
  String get touchSoundsDialogTitle => 'Навобмацак гукі';

  @override
  String get touchSoundsDialogContent =>
      'Калі ласка, уключыце сэнсарныя гукі з сістэмных налад, каб пачуць гукі кола націску';

  @override
  String get immersiveModeSettingTitle => 'Захапляльны рэжым';

  @override
  String get showAppTutorialSettingTitle => 'Паказаць падручнік';

  @override
  String get changeDirectorySettingTitle => 'Змяніце каталог';

  @override
  String get donateSettingTitle => 'Ахвяраваць';

  @override
  String get donateSettingDescription =>
      'Калі вам падабаецца гэта дадатак, калі ласка, падумайце пра ахвяраванне.';

  @override
  String get versionAboutScreenTitle => 'Версія';

  @override
  String get madeWithLoveTitle => 'Зроблены з ❤';

  @override
  String get noMusicFilesFound => 'Няма музыкі';

  @override
  String get noArtistsFound => 'Няма мастакоў';

  @override
  String get noAlbumsFound => 'Няма альбомаў';

  @override
  String get unknownSong => 'Невядомая песня';

  @override
  String get unknownArtist => 'Невядомы мастак';

  @override
  String get unknownAlbum => 'Невядомы альбом';

  @override
  String get unknownGenre => 'Невядомы жанр';

  @override
  String get buttonConfirmText => 'ОК';

  @override
  String get tileValueOn => 'На';

  @override
  String get tileValueOff => 'Выключаны';

  @override
  String get commonOfText => 'аб';

  @override
  String get pageNotFoundText => 'Дадзеная старонка не была знойдзена';

  @override
  String get commonErrorText => 'Памылка';

  @override
  String get retryButtonText => 'Выказаць';

  @override
  String get filePickerDialogTitle => 'Абярыце каталог для сканавання музыкі';

  @override
  String get searchScreenTitle => 'Пошукі';

  @override
  String get searchEmptyText => 'Няма вынікаў пошуку';

  @override
  String get searchResultsText => 'Вынікі пошуку:';

  @override
  String get resultsForText => 'Вынікі для:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Адключыць аптымізацыю акумулятара';

  @override
  String get disableBatteryOptimizationContent =>
      'Калі ласка, адключыце аптымізацыю акумулятара для гэтага прыкладання ў наладах прылады, каб дазволіць прайграванне фону музыкі.';

  @override
  String get languageScreenTitle => 'Мова';

  @override
  String get silverDeviceColor => 'Срэбра';

  @override
  String get blackDeviceColor => 'Чорны';

  @override
  String get resetSettingsTitle => 'Скінуць налады';

  @override
  String get browseArtist => 'Агляд мастака';

  @override
  String get browseAlbum => 'Агляд альбома';

  @override
  String get cancelText => 'Ануляваць';

  @override
  String get playlistsScreenTitle => 'Спісы прайгравання';

  @override
  String get addToOnTheGoPlaylist => 'Дадайце да руху';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Дадайце альбом у дарогу';

  @override
  String get removeSongFromThePlaylist => 'Выдаліце ​​з спісу прайгравання';

  @override
  String get allAlbums => 'Усе альбомы';

  @override
  String get scanningMusicFiles => 'Сканаванне музычных файлаў';

  @override
  String get newPlaylist => 'Новы спіс прайгравання';

  @override
  String get savePlaylist => 'Захаваць спіс прайгравання';

  @override
  String get clearPlaylist => 'Выразны спіс прайгравання';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Файлы рэканструкцыі музычных файлаў';

  @override
  String get deviceControlMenuTutorialText =>
      'Злёгку перамясціце вялікі палец вакол кола націску, каб перайсці ў меню';

  @override
  String get centerButtonMenuTutorialText =>
      'Націсніце кнопку цэнтральнай кнопкі, каб выбраць выдзелены пункт меню';

  @override
  String get playPauseMenuTutorialText =>
      'Націсніце гэтую кнопку, каб прайграць альбо прыпыніць песню';

  @override
  String get nextButtonMenuTutorialText =>
      'Націсніце гэтую кнопку, каб перайсці да наступнай песні';

  @override
  String get previousButtonMenuTutorialText =>
      'Націсніце гэтую кнопку, каб перарабіць або вярнуцца да папярэдняй песні';

  @override
  String get menuButtonTutorialText =>
      'Націсніце гэтую кнопку, каб вярнуцца да папярэдняга меню. Вы можаце націснуць і ўтрымліваць яго з любога іншага экрана, каб непасрэдна перайсці ў галоўнае меню.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Гэта экран дысплея. Сэнсарны экран і рэжым падзеленага экрана ўключаны па змаўчанні і могуць быць наладжаны далей у наладах.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Перамясціце вялікі палец вакол кола націску, каб наладзіць гучнасць';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Націсніце кнопку Цэнтральнага, каб перавесці панэль Seek, Scrubber Bar і Shuffle Slider. Націсніце і ўтрымлівайце цэнтральную кнопку, каб атрымаць доступ да дадатковых варыянтаў.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Націсніце і ўтрымлівайце гэтую кнопку, каб хутка накіраваць песню';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Націсніце і ўтрымлівайце гэтую кнопку, каб перамагчы песню';

  @override
  String get deviceControlSearchTutorialText =>
      'Злёгку перамясціце вялікі палец вакол кола націску, каб вылучыць алфавіт';

  @override
  String get centerButtonSearchTutorialText =>
      'Націсніце кнопку цэнтральнай кнопкі, каб выбраць выдзелены алфавіт';

  @override
  String get nextButtonSearchTutorialText =>
      'Націсніце гэтую кнопку, каб дадаць прастору';

  @override
  String get previousButtonSearchTutorialText =>
      'Націсніце гэтую кнопку, каб выдаліць апошні сімвал';

  @override
  String get menuButtonSearchTutorialText =>
      'Націсніце гэтую кнопку, каб закрыць клавіятуру і ўзаемадзейнічаць з вынікамі пошуку';

  @override
  String get allSongs => 'Усе песні';
}
