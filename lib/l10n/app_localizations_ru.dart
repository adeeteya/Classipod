// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Классический';

  @override
  String get menuButtonText => 'МЕНЮ';

  @override
  String get audioAccessPermissionTitle =>
      'Требуется разрешение на доступ к аудио';

  @override
  String get audioAccessPermissionContent =>
      'Пожалуйста, предоставьте аудиофайлы, чтобы позволить нам воспроизводить ваши музыкальные файлы.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Разрешение на доступ к аудио';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Пожалуйста, предоставьте доступ аудиофайлов для этого приложения в настройках устройства, чтобы мы могли воспроизводить ваши музыкальные файлы.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Теперь играю';

  @override
  String get shuffleSongsMenuTitle => 'Перетасовать песни';

  @override
  String get shuffleSettingTitle => 'Перетасовать';

  @override
  String get settingsScreenTitle => 'Настройки';

  @override
  String get aboutScreenTitle => 'О';

  @override
  String get coverFlowScreenTitle => 'Поток покрытия';

  @override
  String get artistsScreenTitle => 'Художники';

  @override
  String get albumsScreenTitle => 'Альбомы';

  @override
  String get songsScreenTitle => 'Песни';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Песни',
      one: '1 Song',
      zero: 'без песен',
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
      other: '$countString Альбом',
      one: '1 Альбом',
      zero: 'no Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанры';

  @override
  String get genreSongsScreenTitle => 'Жанровые песни';

  @override
  String get deviceColorSettingTitle => 'Цвет устройства';

  @override
  String get touchScreenSettingTitle => 'Сенсорный экран включен';

  @override
  String get repeatModeSettingTitle => 'Повторить';

  @override
  String get repeatModeOne => 'Один';

  @override
  String get repeatModeAll => 'Все';

  @override
  String get vibrateSettingTitle => 'Вибрировать';

  @override
  String get clickWheelSettingTitle => 'Щелкните звуки колеса';

  @override
  String get splitScreenSettingTitle => 'Раздельный экран режим';

  @override
  String get touchSoundsDialogTitle => 'Касаясь звуков';

  @override
  String get touchSoundsDialogContent =>
      'Пожалуйста, включите сенсорные звуки из настройки системы, чтобы услышать звуки колеса щелчка';

  @override
  String get immersiveModeSettingTitle => 'Иммерсивный режим';

  @override
  String get showAppTutorialSettingTitle => 'Показать учебник';

  @override
  String get changeDirectorySettingTitle => 'Изменить каталог';

  @override
  String get donateSettingTitle => 'Пожертвовать';

  @override
  String get donateSettingDescription =>
      'Если вам нравится это приложение, пожалуйста, рассмотрите возможность пожертвования.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => 'Сделано с';

  @override
  String get noMusicFilesFound => 'Нет музыки';

  @override
  String get noArtistsFound => 'Нет художников';

  @override
  String get noAlbumsFound => 'Нет альбомов';

  @override
  String get unknownSong => 'Неизвестная песня';

  @override
  String get unknownArtist => 'Неизвестный художник';

  @override
  String get unknownAlbum => 'Неизвестный альбом';

  @override
  String get unknownGenre => 'Неизвестный жанр';

  @override
  String get buttonConfirmText => 'ХОРОШО';

  @override
  String get tileValueOn => 'На';

  @override
  String get tileValueOff => 'Выключенный';

  @override
  String get commonOfText => 'из';

  @override
  String get pageNotFoundText => 'Данная страница не была найдена';

  @override
  String get commonErrorText => 'Ошибка';

  @override
  String get retryButtonText => 'Повторно';

  @override
  String get filePickerDialogTitle =>
      'Выберите каталог для сканирования музыки';

  @override
  String get searchScreenTitle => 'Поиск';

  @override
  String get searchEmptyText => 'Нет результатов поиска';

  @override
  String get searchResultsText => 'Результаты поиска:';

  @override
  String get resultsForText => 'Результаты для:';

  @override
  String get disableBatteryOptimizationTitle => 'Отключить оптимизацию батареи';

  @override
  String get disableBatteryOptimizationContent =>
      'Пожалуйста, отключите оптимизацию батареи для этого приложения в настройках устройства, чтобы обеспечить воспроизведение фонового воспроизведения музыки.';

  @override
  String get languageScreenTitle => 'Язык';

  @override
  String get silverDeviceColor => 'Серебро';

  @override
  String get blackDeviceColor => 'Черный';

  @override
  String get resetSettingsTitle => 'Сбросить настройки';

  @override
  String get browseArtist => 'Просмотр художника';

  @override
  String get browseAlbum => 'Обзор альбома';

  @override
  String get cancelText => 'Отмена';

  @override
  String get playlistsScreenTitle => 'Плейлисты';

  @override
  String get addToOnTheGoPlaylist => 'Добавить в ходу';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Добавить альбом в ходу';

  @override
  String get removeSongFromThePlaylist => 'Удалить из плейлиста';

  @override
  String get allAlbums => 'Все альбомы';

  @override
  String get scanningMusicFiles => 'Сканирование музыкальных файлов';

  @override
  String get newPlaylist => 'Новый плейлист';

  @override
  String get savePlaylist => 'Сохранить плейлист';

  @override
  String get clearPlaylist => 'Четкий плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music файлы';

  @override
  String get deviceControlMenuTutorialText =>
      'Слегка переместите большой палец вокруг щелчка, чтобы ориентироваться в меню';

  @override
  String get centerButtonMenuTutorialText =>
      'Нажмите кнопку центра, чтобы выбрать выделенный пункт меню';

  @override
  String get playPauseMenuTutorialText =>
      'Нажмите эту кнопку, чтобы воспроизвести или приостановить песню';

  @override
  String get nextButtonMenuTutorialText =>
      'Нажмите эту кнопку, чтобы перейти к следующей песне';

  @override
  String get previousButtonMenuTutorialText =>
      'Нажмите эту кнопку, чтобы перемотать или вернуться к предыдущей песне';

  @override
  String get menuButtonTutorialText =>
      'Нажмите эту кнопку, чтобы вернуться в предыдущее меню. Вы можете нажать и удержать его на любом другом экране, чтобы напрямую перейти в главное меню.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Это экран дисплея. Сенсорный экран и режим экрана разделения включены по умолчанию и могут быть настроены далее в настройках.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Переместите большой палец вокруг колеса щелчка, чтобы отрегулировать громкость';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Нажмите кнопку центра, чтобы пройти велосипед через бар, скруббер и ползунок. Нажмите и удерживайте центральную кнопку, чтобы получить доступ к дополнительным параметрам.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Нажмите и удерживайте эту кнопку, чтобы перенести песню';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Нажмите и удерживайте эту кнопку, чтобы перемотать песню';

  @override
  String get deviceControlSearchTutorialText =>
      'Слегка переместите большой палец вокруг щелчка, чтобы выделить алфавит';

  @override
  String get centerButtonSearchTutorialText =>
      'Нажмите кнопку центра, чтобы выбрать выделенный алфавит';

  @override
  String get nextButtonSearchTutorialText =>
      'Нажмите эту кнопку, чтобы добавить пространство';

  @override
  String get previousButtonSearchTutorialText =>
      'Нажмите эту кнопку, чтобы удалить последний персонаж';

  @override
  String get menuButtonSearchTutorialText =>
      'Нажмите эту кнопку, чтобы закрыть клавиатуру и взаимодействовать с результатами поиска';
}
