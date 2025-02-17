// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tajik (`tg`).
class AppLocalizationsTg extends AppLocalizations {
  AppLocalizationsTg([String locale = 'tg']) : super(locale);

  @override
  String get appTitle => 'Синфӣ';

  @override
  String get menuButtonText => 'Меню';

  @override
  String get audioAccessPermissionTitle => 'Иҷозатномаи аудио лозим аст';

  @override
  String get audioAccessPermissionContent =>
      'Лутфан ба файлҳои аудиоӣ ворид шавед, то ба мо иҷозат диҳем, ки файлҳои мусиқии худро бозӣ кунем.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Иҷозати дастрасии аудио рад карда шуд';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Лутфан ба мо дастрасии аудио барои ин барномаро дар танзимоти дастгоҳ иҷозат диҳед, то ба мо имкон диҳад, ки файлҳои мусиқии шуморо бозӣ кунем.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Мусиқӣ';

  @override
  String get nowPlayingScreenTitle => 'Акнун бозӣ';

  @override
  String get shuffleSongsMenuTitle => 'Сурудҳои шаффоф';

  @override
  String get shuffleSettingTitle => 'Шаффоф';

  @override
  String get settingsScreenTitle => 'Танзимот';

  @override
  String get aboutScreenTitle => 'Дар атрофи';

  @override
  String get coverFlowScreenTitle => 'Рухбати сарпӯш';

  @override
  String get artistsScreenTitle => 'Рассомон';

  @override
  String get albumsScreenTitle => 'Албомҳо';

  @override
  String get songsScreenTitle => 'Сурудҳо';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Сурудхо',
      one: '1 Суруд',
      zero: 'Бе суруд',
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
      other: '$countString Албомҳо',
      one: '1 Албом',
      zero: 'Албомҳо нест',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрҳо';

  @override
  String get genreSongsScreenTitle => 'Суханҳои жанр';

  @override
  String get deviceColorSettingTitle => 'Рангҳои дастгоҳ';

  @override
  String get touchScreenSettingTitle => 'Экрани ламс пайваст';

  @override
  String get repeatModeSettingTitle => 'Такрор кардан';

  @override
  String get repeatModeOne => 'Як';

  @override
  String get repeatModeAll => 'Ҳама';

  @override
  String get vibrateSettingTitle => 'Ларзондан';

  @override
  String get clickWheelSettingTitle => 'Садоҳои чархро пахш кунед';

  @override
  String get splitScreenSettingTitle => 'Ҳолати экрани экран';

  @override
  String get touchSoundsDialogTitle => 'Садо';

  @override
  String get touchSoundsDialogContent =>
      'Лутфан, бо танзимоти система ба садоҳои система кӯмак кунед';

  @override
  String get immersiveModeSettingTitle => 'Усули воқеӣ';

  @override
  String get showAppTutorialSettingTitle => 'Намоиши дарсҳо';

  @override
  String get changeDirectorySettingTitle => 'Феҳристи ивазкунанда';

  @override
  String get donateSettingTitle => 'Хайрия';

  @override
  String get donateSettingDescription =>
      'Агар шумо ин барномаро дӯст медоред, лутфан ба хайрия фикр кунед.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => 'Бо ❤️ бо ❤️';

  @override
  String get noMusicFilesFound => 'Мусиқӣ нест';

  @override
  String get noArtistsFound => 'Ҳеҷ рассом';

  @override
  String get noAlbumsFound => 'Албом нест';

  @override
  String get unknownSong => 'Суруди номаълум';

  @override
  String get unknownArtist => 'Рассоми номаълум';

  @override
  String get unknownAlbum => 'Албоми номаълум';

  @override
  String get unknownGenre => 'Ҳикояи номаълум';

  @override
  String get buttonConfirmText => 'ДУРУСТ';

  @override
  String get tileValueOn => 'Даргирондан';

  @override
  String get tileValueOff => 'Хомӯш';

  @override
  String get commonOfText => 'аз';

  @override
  String get pageNotFoundText => 'Саҳифаи мазкур ёфт нашуд';

  @override
  String get commonErrorText => 'Хатогӣ';

  @override
  String get retryButtonText => 'Такрор кардан';

  @override
  String get filePickerDialogTitle => 'Барои мусиқӣ директорияро интихоб кунед';

  @override
  String get searchScreenTitle => 'Кофтуков';

  @override
  String get searchEmptyText => 'Натиҷаҳои ҷустуҷӯ';

  @override
  String get searchResultsText => 'Натиҷаҳои ҷустуҷӯ:';

  @override
  String get resultsForText => 'Натиҷаҳо барои:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Оптимизатсияи батареяро ғайрифаъол кунед';

  @override
  String get disableBatteryOptimizationContent =>
      'Лутфан оптимизатсияи батареяро барои ин барнома дар танзимоти дастгоҳ хомӯш кунед, то ба бозии пасзамаи мусиқӣ иҷозат диҳед.';

  @override
  String get languageScreenTitle => 'Забон';

  @override
  String get silverDeviceColor => 'Нущра';

  @override
  String get blackDeviceColor => 'Сиёҳ';

  @override
  String get resetSettingsTitle => 'Танзимотҳо';

  @override
  String get browseArtist => 'Рассомони Мурстон';

  @override
  String get browseAlbum => 'Аббомони Мурстон';

  @override
  String get cancelText => 'Манъ кардан';

  @override
  String get playlistsScreenTitle => 'Пинохтагон';

  @override
  String get addToOnTheGoPlaylist => 'Илова ба-рафтан';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Album илова кунед';

  @override
  String get removeSongFromThePlaylist => 'Аз рӯйхати мусиқӣ хориҷ кунед';

  @override
  String get allAlbums => 'Ҳама албомҳо';

  @override
  String get scanningMusicFiles => 'Файлҳои мусиқӣ';

  @override
  String get newPlaylist => 'Навозиши нав';

  @override
  String get savePlaylist => 'Нигоҳдории навозиш';

  @override
  String get clearPlaylist => 'Рӯйхати мусиқии тоза';

  @override
  String get rescanMusicFilesSettingTitle => 'Наҷотдиҳандагонро наҷот додан';

  @override
  String get deviceControlMenuTutorialText =>
      'Ангушт занед ба чархи клик барои пайгирии меню';

  @override
  String get centerButtonMenuTutorialText =>
      'Тугмаи марказиро пахш кунед, то ҷузъи менюи рӯшноиро интихоб кунед';

  @override
  String get playPauseMenuTutorialText =>
      'Барои бозӣ кардан ё таваққуф кардани суруд ин кнопкаро пахш кунед';

  @override
  String get nextButtonMenuTutorialText =>
      'Барои гузаштан ба суруди навбатӣ, ин тугмаро пахш кунед';

  @override
  String get previousButtonMenuTutorialText =>
      'Барои дубора ба даст овардани суруди қаблӣ ин тугмаро пахш кунед';

  @override
  String get menuButtonTutorialText =>
      'Барои баргаштан ба менюи қаблӣ ин тугмаро пахш кунед. Шумо метавонед онро аз ҳама экрани дигар пахш кунед, то бевосита ба менюи асосӣ равед.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ин экрани намоиш аст. Бо нобаёнӣ Strection ва экрани экран фаъол карда шудааст ва метавонад дар танзимот минбаъда танзим карда шавад.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ангушти худро дар атрофи чархи клик барои танзими ҳаҷм';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Барои давидан тавассути сикл кардани сатр, пардаи скраббонро пахш кунед. Барои дастрасӣ ба имконоти иловагӣ тугмаи марказиро пахш карда нигоҳ доред.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Ин кнопкаро пахш карда нигоҳ доред, то ки сурудро зуд пеш гирад';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Барои гирифтани суруд ин тугмаро пахш карда нигоҳ доред';

  @override
  String get deviceControlSearchTutorialText =>
      'Ангушти худро каме каме дар атрофи чархи клик барои таъкид кардани алифбо';

  @override
  String get centerButtonSearchTutorialText =>
      'Тугмаи марказиро пахш кунед, то алифбои равшанро интихоб кунед';

  @override
  String get nextButtonSearchTutorialText =>
      'Барои илова кардани фазо ин тугмаро пахш кунед';

  @override
  String get previousButtonSearchTutorialText =>
      'Барои тоза кардани аломати охирин ин тугмаро пахш кунед';

  @override
  String get menuButtonSearchTutorialText =>
      'Барои пӯшидани клавиатура ва ҳамкорӣ бо натиҷаҳои ҷустуҷӯ ин тугмаро пахш кунед';
}
