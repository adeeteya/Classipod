// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Меню';

  @override
  String get audioAccessPermissionTitle => 'Необходимо е разрешение за достъп до аудио';

  @override
  String get audioAccessPermissionContent => 'Моля, предоставете достъп до аудио файлове, за да ни позволи да възпроизвеждаме вашите музикални файлове.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Отказано разрешение за достъп до аудио';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Моля, предоставете достъп до аудио файлове за това приложение в настройките на устройството, за да ни позволи да възпроизвеждаме вашите музикални файлове.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музика';

  @override
  String get nowPlayingScreenTitle => 'Сега играе';

  @override
  String get shuffleSongsMenuTitle => 'Разбъркани песни';

  @override
  String get shuffleSettingTitle => 'Разбъркване';

  @override
  String get settingsScreenTitle => 'Настройки';

  @override
  String get aboutScreenTitle => 'Около';

  @override
  String get coverFlowScreenTitle => 'Поток на капака';

  @override
  String get artistsScreenTitle => 'Художници';

  @override
  String get albumsScreenTitle => 'Албуми';

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
      other: '$countString песни',
      one: '1 песен',
      zero: 'няма песни',
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
      other: '$countString Албуми',
      one: '1 албум',
      zero: 'няма албуми',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрове';

  @override
  String get genreSongsScreenTitle => 'Жанрови песни';

  @override
  String get deviceColorSettingTitle => 'Цвят на устройството';

  @override
  String get touchScreenSettingTitle => 'Сензорен екран е активиран';

  @override
  String get repeatModeSettingTitle => 'Повторете';

  @override
  String get repeatModeOne => 'Един';

  @override
  String get repeatModeAll => 'Всички';

  @override
  String get vibrateSettingTitle => 'Вибрира';

  @override
  String get clickWheelSettingTitle => 'Щракнете върху звуци на колелото';

  @override
  String get splitScreenSettingTitle => 'Режим на разделен екран';

  @override
  String get touchSoundsDialogTitle => 'Докоснете звуци';

  @override
  String get touchSoundsDialogContent => 'Моля, активирайте се допирни звуци от настройките на системата, за да чуете звуците на колелото за щракване';

  @override
  String get immersiveModeSettingTitle => 'Потапящ режим';

  @override
  String get showAppTutorialSettingTitle => 'Покажи урок';

  @override
  String get changeDirectorySettingTitle => 'Променете директорията';

  @override
  String get donateSettingTitle => 'Дарете';

  @override
  String get donateSettingDescription => 'Ако ви харесва това приложение, моля, помислете за даряване.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => 'Направен с ❤ от';

  @override
  String get noMusicFilesFound => 'Без музика';

  @override
  String get noArtistsFound => 'Няма художници';

  @override
  String get noAlbumsFound => 'Няма албуми';

  @override
  String get unknownSong => 'Неизвестна песен';

  @override
  String get unknownArtist => 'Неизвестен художник';

  @override
  String get unknownAlbum => 'Неизвестен албум';

  @override
  String get unknownGenre => 'Неизвестен жанр';

  @override
  String get buttonConfirmText => 'Добре';

  @override
  String get tileValueOn => 'На';

  @override
  String get tileValueOff => 'Изключване';

  @override
  String get commonOfText => 'на';

  @override
  String get pageNotFoundText => 'Дадената страница не е намерена';

  @override
  String get commonErrorText => 'Грешка';

  @override
  String get retryButtonText => 'Повторение';

  @override
  String get filePickerDialogTitle => 'Изберете директория за сканиране за музика';

  @override
  String get searchScreenTitle => 'Търсене';

  @override
  String get searchEmptyText => 'Няма резултати от търсенето';

  @override
  String get searchResultsText => 'Резултати от търсенето:';

  @override
  String get resultsForText => 'Резултати за:';

  @override
  String get disableBatteryOptimizationTitle => 'Деактивирайте оптимизацията на батерията';

  @override
  String get disableBatteryOptimizationContent => 'Моля, деактивирайте оптимизацията на батерията за това приложение в настройките на устройството, за да позволите възпроизвеждане на музика на фона.';

  @override
  String get languageScreenTitle => 'Език';

  @override
  String get silverDeviceColor => 'Сребро';

  @override
  String get blackDeviceColor => 'Черно';

  @override
  String get resetSettingsTitle => 'Нулиране на настройките';

  @override
  String get browseArtist => 'Прегледайте художник';

  @override
  String get browseAlbum => 'Разгледайте албум';

  @override
  String get cancelText => 'Отказ';

  @override
  String get playlistsScreenTitle => 'Плейлисти';

  @override
  String get addToOnTheGoPlaylist => 'Добавете към движението';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Добавете албум в движението';

  @override
  String get removeSongFromThePlaylist => 'Извадете от плейлиста';

  @override
  String get allAlbums => 'Всички албуми';

  @override
  String get scanningMusicFiles => 'Сканиране на музикални файлове';

  @override
  String get newPlaylist => 'Нов плейлист';

  @override
  String get savePlaylist => 'Запазете плейлиста';

  @override
  String get clearPlaylist => 'Ясен плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan музикални файлове';

  @override
  String get deviceControlMenuTutorialText => 'Преместете палеца леко около колелото за щракване, за да се ориентирате в менюто';

  @override
  String get centerButtonMenuTutorialText => 'Натиснете бутона Център, за да изберете маркирания елемент от менюто';

  @override
  String get playPauseMenuTutorialText => 'Натиснете този бутон, за да възпроизведете или пауза на песен';

  @override
  String get nextButtonMenuTutorialText => 'Натиснете този бутон, за да прескочите към следващата песен';

  @override
  String get previousButtonMenuTutorialText => 'Натиснете този бутон, за да пренавиете или се върнете към предишната песен';

  @override
  String get menuButtonTutorialText => 'Натиснете този бутон, за да се върнете в предишното меню. Можете да го натиснете и задържите от всеки друг екран, за да отидете директно в главното меню.';

  @override
  String get deviceScreenMenuTutorialText => 'Това е екранът на дисплея. Режимът на сензорен екран и разделен екран са активирани по подразбиране и могат да бъдат конфигурирани допълнително в настройките.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Преместете палеца си около колелото за щракване, за да регулирате силата на звука';

  @override
  String get centerButtonNowPlayingTutorialText => 'Натиснете централния бутон, за да преминете през Bar, Bar, Barber Bar и Shuffle Slider. Натиснете и задръжте центъра на бутона, за да получите достъп до допълнителни опции.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Натиснете и задръжте този бутон, за да бързо напредвате песента';

  @override
  String get previousButtonNowPlayingTutorialText => 'Натиснете и задръжте този бутон, за да пренастроите песента';

  @override
  String get deviceControlSearchTutorialText => 'Преместете палеца леко около колелото за щракване, за да подчертаете азбука';

  @override
  String get centerButtonSearchTutorialText => 'Натиснете бутона Център, за да изберете маркираната азбука';

  @override
  String get nextButtonSearchTutorialText => 'Натиснете този бутон, за да добавите място';

  @override
  String get previousButtonSearchTutorialText => 'Натиснете този бутон, за да изтриете последния символ';

  @override
  String get menuButtonSearchTutorialText => 'Натиснете този бутон, за да затворите клавиатурата и да взаимодействате с резултатите от търсенето';
}
