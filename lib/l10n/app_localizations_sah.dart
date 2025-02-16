// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yakut (`sah`).
class AppLocalizationsSah extends AppLocalizations {
  AppLocalizationsSah([String locale = 'sah']) : super(locale);

  @override
  String get appTitle => 'КлассиПод';

  @override
  String get menuButtonText => 'МЕНУ';

  @override
  String get audioAccessPermissionTitle => 'Аудио доступа Требуется';

  @override
  String get audioAccessPermissionContent => 'Баһаалыста, аудио-файллары биэриҥ, музыкальнай файлларыҥ оонньуурга көҥүл биэрэргэ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Access Permission Denied';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Бу приложениеҕа аудифайллар доступтарын биэриҥ, эн музыкальнай файлларыҥ оонньуурга көҥүл биэрэргэ.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Билигин Оонньуу';

  @override
  String get shuffleSongsMenuTitle => 'Шоффл ырыалара';

  @override
  String get shuffleSettingTitle => 'Намещение';

  @override
  String get settingsScreenTitle => 'Настройки';

  @override
  String get aboutScreenTitle => 'Туһунан';

  @override
  String get coverFlowScreenTitle => 'Хаптаһыҥ Поток';

  @override
  String get artistsScreenTitle => 'Художниктар';

  @override
  String get albumsScreenTitle => 'Альбумнар';

  @override
  String get songsScreenTitle => 'Ырыалар';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Ырыалар',
      one: '1 Ырыа',
      zero: 'Ырыа суох',
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
      other: '$countString Альбомнар',
      one: '1 Альбом',
      zero: 'Альбом суох',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрдар';

  @override
  String get genreSongsScreenTitle => 'Жанр ырыалара';

  @override
  String get deviceColorSettingTitle => 'Устройство өҥө';

  @override
  String get touchScreenSettingTitle => 'Сенсорнай экран Включен';

  @override
  String get repeatModeSettingTitle => 'Хатылаа';

  @override
  String get repeatModeOne => 'Биир';

  @override
  String get repeatModeAll => 'Бары';

  @override
  String get vibrateSettingTitle => 'Вибра';

  @override
  String get clickWheelSettingTitle => 'Колесо дорҕооннорун баттаан кэбиһиҥ';

  @override
  String get splitScreenSettingTitle => 'Экран режимэ расклады';

  @override
  String get touchSoundsDialogTitle => 'Тач дорҕооннор';

  @override
  String get touchSoundsDialogContent => 'Пожалуйста, включить нажмите звуки из системных Настройках, чтобы слышать звуки клик колесо';

  @override
  String get immersiveModeSettingTitle => 'Кэмсинэр режимэ';

  @override
  String get showAppTutorialSettingTitle => 'Учебник .';

  @override
  String get changeDirectorySettingTitle => 'Уларыйыы каталог';

  @override
  String get donateSettingTitle => 'Сиэртибэлээ';

  @override
  String get donateSettingDescription => 'Бу приложениены сөбүлүүр буоллаххына, бэлэхтээһини толкуйдаан көрүҥ.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => 'Сделано с ❤️ 2019 г.';

  @override
  String get noMusicFilesFound => 'Музыка суох';

  @override
  String get noArtistsFound => 'Художниктар суох';

  @override
  String get noAlbumsFound => 'Альбумс суох';

  @override
  String get unknownSong => 'Биллибэт ырыа';

  @override
  String get unknownArtist => 'Биллибэт артист';

  @override
  String get unknownAlbum => 'Биллибэт Албум';

  @override
  String get unknownGenre => 'Биллибэт жанр';

  @override
  String get buttonConfirmText => 'СӨП';

  @override
  String get tileValueOn => 'Үрдүгэр';

  @override
  String get tileValueOff => 'Арахсыбыт';

  @override
  String get commonOfText => 'оф';

  @override
  String get pageNotFoundText => 'Бэриллибит страница булуллубатаҕа';

  @override
  String get commonErrorText => 'Сыыһа';

  @override
  String get retryButtonText => 'Хатанансыйа';

  @override
  String get filePickerDialogTitle => 'Выберите каталог к ​​Сканю для музыки';

  @override
  String get searchScreenTitle => 'Көрдөө';

  @override
  String get searchEmptyText => 'Поиска түмүктэрэ суох';

  @override
  String get searchResultsText => 'Поисковые результаты:';

  @override
  String get resultsForText => 'Результаты для:';

  @override
  String get disableBatteryOptimizationTitle => 'Отключение Оптимизация аккумулятора';

  @override
  String get disableBatteryOptimizationContent => 'Пожалуйста, отключите оптимизацию аккумулятора для этого приложения в настройках устройства, чтобы позволить воспроизведение фона музыка.';

  @override
  String get languageScreenTitle => 'Тыл';

  @override
  String get silverDeviceColor => 'Үрүҥ көмүс';

  @override
  String get blackDeviceColor => 'Хара';

  @override
  String get resetSettingsTitle => 'Настройки сброс';

  @override
  String get browseArtist => 'Броуз артист .';

  @override
  String get browseAlbum => 'Броусе Албум';

  @override
  String get cancelText => 'Соттор';

  @override
  String get playlistsScreenTitle => 'Плейлисттар';

  @override
  String get addToOnTheGoPlaylist => 'Добавьте к Он-Т-Го';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Альбум эбэн биэр, Он-Т-Гоҕа';

  @override
  String get removeSongFromThePlaylist => 'Плейлисттан таһаарыҥ';

  @override
  String get allAlbums => 'Бары альбомнар';

  @override
  String get scanningMusicFiles => 'Сканирование музыкальных файлов';

  @override
  String get newPlaylist => 'Саҥа плейлист';

  @override
  String get savePlaylist => 'Сохранить плейлист';

  @override
  String get clearPlaylist => 'Ыраастыыр ​​плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Рескан музыкальнай файллара';

  @override
  String get deviceControlMenuTutorialText => 'Пулевой эн улахан тарбаххын чэпчэкитик баттаан, менюну навигациялыыр туһугар.';

  @override
  String get centerButtonMenuTutorialText => 'Нажмите на кнопку центра, чтобы выбрать элемент выделенного меню';

  @override
  String get playPauseMenuTutorialText => 'Бу кнопканы баттаан, ырыаны оонньотуу эбэтэр тохтоторго';

  @override
  String get nextButtonMenuTutorialText => 'Бу кнопканы баттаан, салгыы ырыаҕа тиий';

  @override
  String get previousButtonMenuTutorialText => 'Бу кнопканы баттаан, аныгыскыга эбэтэр урукку ырыаҕа төннөргө';

  @override
  String get menuButtonTutorialText => 'Бу кнопканы баттаан, урукку менюҕа төннүн. Атын ханнык баҕарар экрантан баттаан, тутан олоруоххун сөп, сүрүн менюҕа быһаччы киириэххин сөп.';

  @override
  String get deviceScreenMenuTutorialText => 'Это экран дисплей. Сенсорный Экран и разрывные Режим включены по умолчанию и может быть настроен дальше в настройках.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Пользовите свой пальцу вокруг Нажмите Колесо, чтобы настроить объем';

  @override
  String get centerButtonNowPlayingTutorialText => 'Нажмите кнопку Центр, чтобы велосипедить через поиск бар, скраббер-бар и слайдер перемешивания. Эбии варианнарга киирэргэ Киин кнопканы баттаан, тут.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Бу кнопканы баттаан баран, ырыаны түргэнник инники диэки тардан кэбиһиҥ';

  @override
  String get previousButtonNowPlayingTutorialText => 'Бу кнопканы баттаан баран, ырыаны хат көтөҕүллүүгэ тутуһуҥ';

  @override
  String get deviceControlSearchTutorialText => 'Улахан тарбаххын баттаан, алфавиты бэлиэтээн, баттааҥ.';

  @override
  String get centerButtonSearchTutorialText => 'Нажмите на кнопку центра, чтобы выбрать выделенную алфавит';

  @override
  String get nextButtonSearchTutorialText => 'Бу кнопканы баттаан, миэстэни эбэбит';

  @override
  String get previousButtonSearchTutorialText => 'Бу кнопканы баттаан, бүтэһик персонажы суох оҥоруҥ';

  @override
  String get menuButtonSearchTutorialText => 'Бу кнопканы баттаан, клавиатураны сабан баран, көрдөөһүн түмүгүн кытта дьүөрэлэһиннэр';
}
