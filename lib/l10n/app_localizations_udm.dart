// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Udmurt (`udm`).
class AppLocalizationsUdm extends AppLocalizations {
  AppLocalizationsUdm([String locale = 'udm']) : super(locale);

  @override
  String get appTitle => 'КлассынПод';

  @override
  String get menuButtonText => 'МОНУ';

  @override
  String get audioAccessPermissionTitle => 'Аудио доступ разрешение кулэ';

  @override
  String get audioAccessPermissionContent => 'Пожалуйста, грант аудиофайлъёсты сётыны лэзьыны, асьмелы тон крезьгур файлъёсты шудыны.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Аудио доступ разрешение отказать';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Пожалуйста, грант аудиофайлъёс понна та приложение устройство настройкаос лэзьыны, асьмелы шудыны тон крезьгур файлъёсты.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Крезьгур';

  @override
  String get nowPlayingScreenTitle => 'Табере Шудон';

  @override
  String get shuffleSongsMenuTitle => 'Шуффл кырӟанъёс';

  @override
  String get shuffleSettingTitle => 'Шуффл';

  @override
  String get settingsScreenTitle => 'Настройкаос';

  @override
  String get aboutScreenTitle => 'Котыр';

  @override
  String get coverFlowScreenTitle => 'ӵыпет';

  @override
  String get artistsScreenTitle => 'Суредасьёс';

  @override
  String get albumsScreenTitle => 'альбом';

  @override
  String get songsScreenTitle => 'кырӟанъёс';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Кырӟанъёс',
      one: '1 Кырӟан',
      zero: 'Кырӟанъёс ӧвӧл',
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
      other: '$countString Альбомъёс',
      one: '1 Альбом',
      zero: 'Альбомъёс ӧвӧл',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жаляная';

  @override
  String get genreSongsScreenTitle => 'Жанр кырӟанъёс';

  @override
  String get deviceColorSettingTitle => 'Устройстволэн буёлэз';

  @override
  String get touchScreenSettingTitle => 'Экран экранын сенсорный .';

  @override
  String get repeatModeSettingTitle => 'Тодэ ваён';

  @override
  String get repeatModeOne => 'Одӥг';

  @override
  String get repeatModeAll => 'Быдэс';

  @override
  String get vibrateSettingTitle => 'вибрациос';

  @override
  String get clickWheelSettingTitle => 'Клик колёса куараос';

  @override
  String get splitScreenSettingTitle => 'Экран Режим';

  @override
  String get touchSoundsDialogTitle => 'Сдвигаться Куараос';

  @override
  String get touchSoundsDialogContent => 'Пожалуйста, включать сенсорный куараос система настройкаос, мед кылзозы, клик колёса куараос .';

  @override
  String get immersiveModeSettingTitle => 'Иммерсивной Режим';

  @override
  String get showAppTutorialSettingTitle => 'Возьматэ Учебник';

  @override
  String get changeDirectorySettingTitle => 'Каталогез воштон';

  @override
  String get donateSettingTitle => 'Коньдонэн юрттӥськыны';

  @override
  String get donateSettingDescription => 'Та приложение тӥледлы кельше ке, пожалуйста, сётэ сётыны.';

  @override
  String get versionAboutScreenTitle => 'Пӧртэмлык';

  @override
  String get madeWithLoveTitle => 'Лэсьтэмын со ❤️ 2018-тӥ арозь.';

  @override
  String get noMusicFilesFound => 'Ӧвӧл крезьгур';

  @override
  String get noArtistsFound => 'Ӧвӧл артистъёс';

  @override
  String get noAlbumsFound => 'Ӧвӧл Альбомъёс';

  @override
  String get unknownSong => 'Тодмотэм кырӟан';

  @override
  String get unknownArtist => 'Тодмотэм артист';

  @override
  String get unknownAlbum => 'Тодмотэм Альбом';

  @override
  String get unknownGenre => 'Тодмотэм Жанр';

  @override
  String get buttonConfirmText => 'ОКЕЙ';

  @override
  String get tileValueOn => 'Вылтӥ';

  @override
  String get tileValueOff => 'Питыртӥз';

  @override
  String get commonOfText => 'со пӧлын';

  @override
  String get pageNotFoundText => 'Сётэм бамез ӧз шедьтэ';

  @override
  String get commonErrorText => 'Янгыш';

  @override
  String get retryButtonText => 'пенсие потыны';

  @override
  String get filePickerDialogTitle => 'Быръе Каталоге сканировать понна музыка .';

  @override
  String get searchScreenTitle => 'Утчан';

  @override
  String get searchEmptyText => 'Утчан результатъёс ӧвӧл';

  @override
  String get searchResultsText => 'Утчан результатъёс:';

  @override
  String get resultsForText => 'Результатъёс понна:';

  @override
  String get disableBatteryOptimizationTitle => 'Отключать батарея оптимизация';

  @override
  String get disableBatteryOptimizationContent => 'Пожалуйста, отключать батарея оптимизация понна та приложение устройство настройкаос лэзьыны фон воспроизведение крезьгур.';

  @override
  String get languageScreenTitle => 'Кыл';

  @override
  String get silverDeviceColor => 'Азвесь';

  @override
  String get blackDeviceColor => 'Сьӧд';

  @override
  String get resetSettingsTitle => 'Сброс Настройкаос';

  @override
  String get browseArtist => 'Браузь артист';

  @override
  String get browseAlbum => 'Брауза Альбом';

  @override
  String get cancelText => 'берланьтыны';

  @override
  String get playlistsScreenTitle => 'плейлистъёс';

  @override
  String get addToOnTheGoPlaylist => 'Добавить карыны On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Альбом ватсаса, мед On-The-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Плейлистысь поттыны';

  @override
  String get allAlbums => 'Вань Алькульциос';

  @override
  String get scanningMusicFiles => 'Сканированиез крезьгур файлъёс';

  @override
  String get newPlaylist => 'Выль плейлист';

  @override
  String get savePlaylist => 'Экономить карыны плейлист';

  @override
  String get clearPlaylist => 'Чылкыт плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Резкан крезьгур файлъёс';

  @override
  String get deviceControlMenuTutorialText => 'Перемещать тон ымнырзэ лёгет котырын Клик колёса ориентировать меню .';

  @override
  String get centerButtonMenuTutorialText => 'Центр кнопкаез зӥбыса, бырйыны пусъемын меню пункт .';

  @override
  String get playPauseMenuTutorialText => 'Та кнопкаез зӥбыса, шудыны яке пауза кырӟан .';

  @override
  String get nextButtonMenuTutorialText => 'Та кнопкаез зӥбыса, вуоно кырӟанэ лэзьыны .';

  @override
  String get previousButtonMenuTutorialText => 'Та кнопкаез зӥбыса, перемотка яке берытскыны азьвыл кырӟан .';

  @override
  String get menuButtonTutorialText => 'Та кнопкаез зӥбыса, азьвыл менюе берытскыны. Тон быгатӥськод-а, сое мукет экранысь напрямую мыныны валтӥсь меню.';

  @override
  String get deviceScreenMenuTutorialText => 'Та дисплей экран. Сцена вылын но Split экран Режим умолчание лэземын но азьланяз настройкаос лэсьтыны луэ настройкаос.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Выжтэ тон котырын Клик колёса, мед тупатозы объем .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Центр кнопкаез зӥбыса, цикл пыр утчан бар, скраббер бар но перетасовывать ползунок. Центр кнопкаез зӥбыса, ватсаса вариантъёс доры кариськыны.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Та кнопкаез зӥбыса, кырӟанэз ӝог азьланьтыны .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Та кнопкаез зӥбыса, кырӟанэз выльысь ӝутыны .';

  @override
  String get deviceControlSearchTutorialText => 'Перемещать тон пальто котыр Клик колёса пусъён понна алфавит .';

  @override
  String get centerButtonSearchTutorialText => 'Центр кнопкаез зӥбыса, бырйыны пусъемын алфавит .';

  @override
  String get nextButtonSearchTutorialText => 'Та кнопкаез зӥбыса, ватсаса инты .';

  @override
  String get previousButtonSearchTutorialText => 'Та кнопкаез зӥбыса, берпуметӥ символэз утялтыны .';

  @override
  String get menuButtonSearchTutorialText => 'Та кнопкаез зӥбыса, клавиатураез пытсаны но взаимодействовать утчан результатъёс .';
}
