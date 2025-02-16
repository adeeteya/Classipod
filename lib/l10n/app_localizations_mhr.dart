// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Eastern Mari (`mhr`).
class AppLocalizationsMhr extends AppLocalizations {
  AppLocalizationsMhr([String locale = 'mhr']) : super(locale);

  @override
  String get appTitle => 'Классик';

  @override
  String get menuButtonText => 'МЕНУ';

  @override
  String get audioAccessPermissionTitle => 'Аудио доступен разрешенийым йодеш .';

  @override
  String get audioAccessPermissionContent => 'Пожалуйста, аудио файлым пуымо йӧн дене мемнан музык файлым шокташ йӧным пуа.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Аудио деке пураш лиймашым налын разрешенийым пуымо';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Пожалуйста, аудио файлым пуымо тиде приложенийыште ӱзгар настройкыште йӧным ыштен, мемнан музык файлым шокташ йӧным пуа.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Ынде модаш';

  @override
  String get shuffleSongsMenuTitle => 'Шуффл муро-влак';

  @override
  String get shuffleSettingTitle => 'Шуффл';

  @override
  String get settingsScreenTitle => 'Настройко';

  @override
  String get aboutScreenTitle => 'Жөнүндө';

  @override
  String get coverFlowScreenTitle => 'Обложка йогын';

  @override
  String get artistsScreenTitle => 'Художник-влак';

  @override
  String get albumsScreenTitle => 'Чылаже';

  @override
  String get songsScreenTitle => 'Мура';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Мура',
      one: '1 Мура',
      zero: '0 Мура',
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
      other: '$countString Альбом-влак',
      one: '1 альбом',
      zero: 'Уке гынат альбом',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Джинр';

  @override
  String get genreSongsScreenTitle => 'Жанр муро-влак';

  @override
  String get deviceColorSettingTitle => 'Ӱзгар-влак тӱс';

  @override
  String get touchScreenSettingTitle => 'Экраныште сенсорный йӧным ыштен';

  @override
  String get repeatModeSettingTitle => 'Ушештарымаш';

  @override
  String get repeatModeOne => 'Бир';

  @override
  String get repeatModeAll => 'Эре';

  @override
  String get vibrateSettingTitle => 'Вибраций';

  @override
  String get clickWheelSettingTitle => 'Колеса йӱк-йӱан темдал .';

  @override
  String get splitScreenSettingTitle => 'Экран режимым шеледыме';

  @override
  String get touchSoundsDialogTitle => 'Йӱк-влак йӱк';

  @override
  String get touchSoundsDialogContent => 'Пожалуйста, сенсорный йӱк-йӱан йӱк-йӱан йӱк-йӱан йӱк-йӱан йӱк-йӱан йӱк-енкот клика йӱк-йӱан йӱк-йӱан .';

  @override
  String get immersiveModeSettingTitle => 'Иммерсивный режим';

  @override
  String get showAppTutorialSettingTitle => 'Туныктышо';

  @override
  String get changeDirectorySettingTitle => 'Вашталтыш каталог';

  @override
  String get donateSettingTitle => 'Пӧлекленат';

  @override
  String get donateSettingDescription => 'Тиде приложений тыланда келша гын, пожалуйста, пӧлекым ыштен.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => '❤️ дене ыштыме';

  @override
  String get noMusicFilesFound => 'Музык уке';

  @override
  String get noArtistsFound => 'Артист-влак уке .';

  @override
  String get noAlbumsFound => 'Нимогай альбом уке';

  @override
  String get unknownSong => 'Палыдыме муро .';

  @override
  String get unknownArtist => 'Палыдыме артист';

  @override
  String get unknownAlbum => 'Палыдыме Альбом';

  @override
  String get unknownGenre => 'Палыдыме Жанр';

  @override
  String get buttonConfirmText => 'МАКУЛ';

  @override
  String get tileValueOn => 'Күйүк';

  @override
  String get tileValueOff => 'ВЫКЛА';

  @override
  String get commonOfText => 'нын';

  @override
  String get pageNotFoundText => 'Пуымо лаштыкым муын огытыл .';

  @override
  String get commonErrorText => 'Йоҥылыш';

  @override
  String get retryButtonText => 'Сосвожда';

  @override
  String get filePickerDialogTitle => 'Музыклан сканироватлаш каталогым ойырен налза';

  @override
  String get searchScreenTitle => 'Кычалаш';

  @override
  String get searchEmptyText => 'Кычалмаш лектыш уке';

  @override
  String get searchResultsText => 'Кычалаш лектыш:';

  @override
  String get resultsForText => 'Лектыш:';

  @override
  String get disableBatteryOptimizationTitle => 'Аккумулятор оптимизацийым ыштен';

  @override
  String get disableBatteryOptimizationContent => 'Пожалуйста, батарейышке оптимизацийым ыштен, тиде приложенийыште ӱзгар настройкыште фон воспроизведение музык йӧным пуаш манын.';

  @override
  String get languageScreenTitle => 'Йылме';

  @override
  String get silverDeviceColor => 'Ший';

  @override
  String get blackDeviceColor => 'Шем';

  @override
  String get resetSettingsTitle => 'Настройко-влакым сброс';

  @override
  String get browseArtist => 'Артистым ончалза';

  @override
  String get browseAlbum => 'Брауз Альбом';

  @override
  String get cancelText => 'Шӧраш';

  @override
  String get playlistsScreenTitle => 'Плейлист-влак';

  @override
  String get addToOnTheGoPlaylist => 'Он-The-Go 2019 ийыште ешарен.';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Альбомым ешарен On-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Плейлист гыч луктын .';

  @override
  String get allAlbums => 'Чыла Альбом';

  @override
  String get scanningMusicFiles => 'Сканирование музык файлым';

  @override
  String get newPlaylist => 'У плейлист';

  @override
  String get savePlaylist => 'Плейлистым аралаш';

  @override
  String get clearPlaylist => 'Раш плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Резканальный музык файлым';

  @override
  String get deviceControlMenuTutorialText => 'Тендан ӱпым йӱштӧ йыр куснаш Click Wheel навигация меню .';

  @override
  String get centerButtonMenuTutorialText => 'Рӱдӧ кнопкым темдал, ойырен налме меню пункт ойырен налаш манын .';

  @override
  String get playPauseMenuTutorialText => 'Тиде кнопкым темдал, модаш але мурым паузым ышташ .';

  @override
  String get nextButtonMenuTutorialText => 'Тиде кнопкым темдал, вес муро деке луктын колташ манын .';

  @override
  String get previousButtonMenuTutorialText => 'Тиде кнопкым темдал, перемотка але ончычсо муро деке пӧртылаш .';

  @override
  String get menuButtonTutorialText => 'Тиде кнопкым темдал, ончычсо меню деке пӧртылаш манын. Те тудым кеч-могай вес экран гыч пресс да кучен кертеш ыле, тура тӱҥ меню каяш.';

  @override
  String get deviceScreenMenuTutorialText => 'Тиде дисплей экран. Экраныште сенсорный да шеледыме экран режим умолчание дене йӧным ыштен да умбакыже настройкым ыштен кертеш.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Тендан йыр куснаш клика колесо том дене келыштараш .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Центр кнопкым темдал, цикл гоч цикл кычалаш барыште, скраббер барыште да шуффл ползунок. Рӱдер кнопкым темдал да ешартыш вариант-влак деке пураш лиймашым налын.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Муром писын ончыко каяш манын, тиде кнопкым темдал да кучен .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Муром угыч вӱдаш да тиде кнопкым темдал .';

  @override
  String get deviceControlSearchTutorialText => 'Тендан оҥдам йӱштӧ йыр куснаш Кликовный алфавитым ойырен налаш манын';

  @override
  String get centerButtonSearchTutorialText => 'Рӱдӧ кнопкым темдал, ойырен налме алфавит ойырен налме .';

  @override
  String get nextButtonSearchTutorialText => 'Тиде кнопкым темдал, верым ешарен .';

  @override
  String get previousButtonSearchTutorialText => 'Тиде кнопкым темдал, пытартыш персонажым кораҥдаш манын .';

  @override
  String get menuButtonSearchTutorialText => 'Тиде кнопкым темдал, клавиатурым петыраш да кычалмаш лектыш дене кылым кучаш .';
}
