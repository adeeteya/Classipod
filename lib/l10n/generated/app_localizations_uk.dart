// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Меню';

  @override
  String get audioAccessPermissionTitle =>
      'Необхідний дозвіл на доступ до аудіо';

  @override
  String get audioAccessPermissionContent =>
      'Будь ласка, надайте доступ до аудіофайлів, щоб ми могли відтворювати ваші музичні файли.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Дозвіл на аудіо доступу';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Будь ласка, надайте доступ до аудіофайлів для цього додатка в налаштуваннях пристрою, щоб ми могли відтворювати ваші музичні файли.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музика';

  @override
  String get nowPlayingScreenTitle => 'Тепер грає';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Перемикач';

  @override
  String get settingsScreenTitle => 'Налаштування';

  @override
  String get aboutScreenTitle => 'Про';

  @override
  String get coverFlowScreenTitle => 'Потік';

  @override
  String get artistsScreenTitle => 'Художники';

  @override
  String get albumsScreenTitle => 'Альбоми';

  @override
  String get songsScreenTitle => 'Пісні';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Пісні',
      one: '1 пісня',
      zero: '0 пісня',
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
      other: '$countString альбоми',
      one: '1 альбом',
      zero: '0 альбоми',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанри';

  @override
  String get genreSongsScreenTitle => 'Жанрові пісні';

  @override
  String get deviceColorSettingTitle => 'Колір пристрою';

  @override
  String get touchScreenSettingTitle => 'Увімкнено сенсорним екраном';

  @override
  String get repeatModeSettingTitle => 'Повторити';

  @override
  String get repeatModeOne => 'Один';

  @override
  String get repeatModeAll => 'Все';

  @override
  String get vibrateSettingTitle => 'Вібрувати';

  @override
  String get clickWheelSettingTitle => 'Клацання колеса звуки';

  @override
  String get splitScreenSettingTitle => 'Режим розділеного екрана';

  @override
  String get touchSoundsDialogTitle => 'Дотик звучить';

  @override
  String get touchSoundsDialogContent =>
      'Будь ласка, увімкніть сенсорні звуки з налаштувань системи, щоб почути звуки колеса клацання';

  @override
  String get immersiveModeSettingTitle => 'Імперсивний режим';

  @override
  String get showAppTutorialSettingTitle => 'Показати навчальний посібник';

  @override
  String get changeDirectorySettingTitle => 'Змінити каталог';

  @override
  String get donateSettingTitle => 'Пожертвувати';

  @override
  String get donateSettingDescription =>
      'Якщо вам подобається ця програма, будь ласка, подумайте про пожертвування.';

  @override
  String get versionAboutScreenTitle => 'Версія';

  @override
  String get madeWithLoveTitle => 'Зроблено з ❤';

  @override
  String get noMusicFilesFound => 'Немає музики';

  @override
  String get noArtistsFound => 'Немає художників';

  @override
  String get noAlbumsFound => 'Немає альбомів';

  @override
  String get unknownSong => 'Невідома пісня';

  @override
  String get unknownArtist => 'Невідомий художник';

  @override
  String get unknownAlbum => 'Невідомий альбом';

  @override
  String get unknownGenre => 'Невідомий жанр';

  @override
  String get buttonConfirmText => 'Добре';

  @override
  String get tileValueOn => 'На';

  @override
  String get tileValueOff => 'Не вистачати';

  @override
  String get commonOfText => 'на';

  @override
  String get pageNotFoundText => 'Даної сторінки не було знайдено';

  @override
  String get commonErrorText => 'Помилка';

  @override
  String get retryButtonText => 'Повторити';

  @override
  String get filePickerDialogTitle => 'Виберіть каталог для сканування музики';

  @override
  String get searchScreenTitle => 'Обшук';

  @override
  String get searchEmptyText => 'Немає результатів пошуку';

  @override
  String get searchResultsText => 'Результати пошуку:';

  @override
  String get resultsForText => 'Результати для:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Вимкнути оптимізацію акумулятора';

  @override
  String get disableBatteryOptimizationContent =>
      'Вимкніть оптимізацію акумулятора для цього додатка в налаштуваннях пристрою, щоб дозволити відтворення музики.';

  @override
  String get languageScreenTitle => 'Мова';

  @override
  String get silverDeviceColor => 'Срібний';

  @override
  String get blackDeviceColor => 'Чорний';

  @override
  String get resetSettingsTitle => 'Скидання налаштувань';

  @override
  String get browseArtist => 'Перегляд художника';

  @override
  String get browseAlbum => 'Переглянути альбом';

  @override
  String get cancelText => 'Скасувати';

  @override
  String get playlistsScreenTitle => 'Плейлисти';

  @override
  String get addToOnTheGoPlaylist => 'Додати в дорогу';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Додати альбом до руху';

  @override
  String get removeSongFromThePlaylist => 'Видаліть із списку відтворення';

  @override
  String get allAlbums => 'Всі альбоми';

  @override
  String get scanningMusicFiles => 'Сканування музичних файлів';

  @override
  String get newPlaylist => 'Новий список відтворення';

  @override
  String get savePlaylist => 'Зберегти список відтворення';

  @override
  String get clearPlaylist => 'Чіткий список відтворення';

  @override
  String get rescanMusicFilesSettingTitle => 'Музичні файли Crecon Music';

  @override
  String get deviceControlMenuTutorialText =>
      'Злегка перемістіть великий палець навколо колеса клацання, щоб орієнтуватися в меню';

  @override
  String get centerButtonMenuTutorialText =>
      'Натисніть кнопку Центру, щоб вибрати виділений пункт меню';

  @override
  String get playPauseMenuTutorialText =>
      'Натисніть цю кнопку, щоб відтворити або призупинити пісню';

  @override
  String get nextButtonMenuTutorialText =>
      'Натисніть цю кнопку, щоб перейти до наступної пісні';

  @override
  String get previousButtonMenuTutorialText =>
      'Натисніть цю кнопку, щоб перемотати або повернутися до попередньої пісні';

  @override
  String get menuButtonTutorialText =>
      'Натисніть цю кнопку, щоб повернутися до попереднього меню. Ви можете натиснути і утримувати його з будь -якого іншого екрану, щоб безпосередньо перейти до головного меню.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Це екран дисплея. Сенсорний екран і режим розділеного екрана увімкнено за замовчуванням і може бути налаштований далі в налаштуваннях.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Перемістіть великий палець навколо колеса клацання, щоб регулювати гучність';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Натисніть центральну кнопку, щоб провести кругообігу через смугу пошуку, скрубер -смужку та повзунок для перетасування. Натисніть і утримуйте центральну кнопку, щоб отримати доступ до додаткових параметрів.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Натисніть і утримуйте цю кнопку, щоб поститися вперед пісню';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Натисніть і утримуйте цю кнопку, щоб перемотати пісню';

  @override
  String get deviceControlSearchTutorialText =>
      'Злегка перемістіть великий палець навколо колеса, щоб виділити алфавіт';

  @override
  String get centerButtonSearchTutorialText =>
      'Натисніть кнопку Центру, щоб вибрати виділений алфавіт';

  @override
  String get nextButtonSearchTutorialText =>
      'Натисніть цю кнопку, щоб додати простір';

  @override
  String get previousButtonSearchTutorialText =>
      'Натисніть цю кнопку, щоб видалити останній символ';

  @override
  String get menuButtonSearchTutorialText =>
      'Натисніть цю кнопку, щоб закрити клавіатуру та взаємодіяти з результатами пошуку';
}
