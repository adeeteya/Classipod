// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Мени';

  @override
  String get audioAccessPermissionTitle =>
      'Потребна е дозвола за аудио пристап';

  @override
  String get audioAccessPermissionContent =>
      'Ве молиме, дајте пристап до аудио -датотеките за да ни овозможите да ги репродуцираме вашите музички датотеки.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Одредена дозвола за аудио пристап';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ве молиме, дајте пристап за аудио датотеки за оваа апликација во поставките на уредот за да ни овозможи да ги репродуцираме вашите музички датотеки.';

  @override
  String get menuScreenTitle => 'Мени';

  @override
  String get musicMenuScreenTitle => 'Музика';

  @override
  String get nowPlayingScreenTitle => 'Сега игра';

  @override
  String get shuffleSongsMenuTitle => 'Песни за мешање';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Поставки';

  @override
  String get aboutScreenTitle => 'За';

  @override
  String get coverFlowScreenTitle => 'Проток на покривка';

  @override
  String get artistsScreenTitle => 'Уметници';

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
      other: '$countString Песни',
      one: '1 песна',
      zero: 'без песни',
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
      zero: 'нема албуми',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрови';

  @override
  String get genreSongsScreenTitle => 'Песни за жанрови';

  @override
  String get deviceColorSettingTitle => 'Боја на уредот';

  @override
  String get touchScreenSettingTitle => 'Овозможено екранот на допир';

  @override
  String get repeatModeSettingTitle => 'Повторете';

  @override
  String get repeatModeOne => 'Еден';

  @override
  String get repeatModeAll => 'Сите';

  @override
  String get vibrateSettingTitle => 'Вибрира';

  @override
  String get clickWheelSettingTitle => 'Кликнете на звуците на тркалото';

  @override
  String get splitScreenSettingTitle => 'Режим на сплит екран';

  @override
  String get touchSoundsDialogTitle => 'Звуци на допир';

  @override
  String get touchSoundsDialogContent =>
      'Ве молиме, овозможете звуци на допир од поставките на системот за да ги слушнете звуците на тркалото за кликнување';

  @override
  String get immersiveModeSettingTitle => 'Потопен режим';

  @override
  String get showAppTutorialSettingTitle => 'Покажете упатство';

  @override
  String get changeDirectorySettingTitle => 'Променете го директориумот';

  @override
  String get donateSettingTitle => 'Донирај';

  @override
  String get donateSettingDescription =>
      'Ако ви се допаѓа оваа апликација, размислете да донирате.';

  @override
  String get versionAboutScreenTitle => 'Верзија';

  @override
  String get madeWithLoveTitle => 'Направено со ❤ од';

  @override
  String get noMusicFilesFound => 'Нема музика';

  @override
  String get noArtistsFound => 'Нема уметници';

  @override
  String get noAlbumsFound => 'Без албуми';

  @override
  String get unknownSong => 'Непозната песна';

  @override
  String get unknownArtist => 'Непознат уметник';

  @override
  String get unknownAlbum => 'Непознат албум';

  @override
  String get unknownGenre => 'Непознат жанр';

  @override
  String get buttonConfirmText => 'Добро';

  @override
  String get tileValueOn => 'На';

  @override
  String get tileValueOff => 'Исклучено';

  @override
  String get commonOfText => 'од';

  @override
  String get pageNotFoundText => 'Дадената страница не беше пронајдена';

  @override
  String get commonErrorText => 'Грешка';

  @override
  String get retryButtonText => 'Повторно обидете се';

  @override
  String get filePickerDialogTitle =>
      'Изберете директориум за скенирање за музика';

  @override
  String get searchScreenTitle => 'Пребарување';

  @override
  String get searchEmptyText => 'Нема резултати од пребарувањето';

  @override
  String get searchResultsText => 'Резултати од пребарувањето:';

  @override
  String get resultsForText => 'Резултати за:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Оневозможете ја оптимизацијата на батеријата';

  @override
  String get disableBatteryOptimizationContent =>
      'Ве молиме, оневозможете ја оптимизацијата на батеријата за оваа апликација во поставките на уредот за да овозможите репродукција на музика во позадина.';

  @override
  String get languageScreenTitle => 'Јазик';

  @override
  String get silverDeviceColor => 'Сребро';

  @override
  String get blackDeviceColor => 'Црна';

  @override
  String get resetSettingsTitle => 'Ресетирајте ги поставките';

  @override
  String get browseArtist => 'Прелистајте уметник';

  @override
  String get browseAlbum => 'Прелистајте албум';

  @override
  String get cancelText => 'Откажи';

  @override
  String get playlistsScreenTitle => 'Плејлисти';

  @override
  String get addToOnTheGoPlaylist => 'Додадете на одење';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Додадете албум на одење';

  @override
  String get removeSongFromThePlaylist => 'Отстрани од плејлистата';

  @override
  String get allAlbums => 'Сите албуми';

  @override
  String get scanningMusicFiles => 'Скенирање на музички датотеки';

  @override
  String get newPlaylist => 'Нова плејлиста';

  @override
  String get savePlaylist => 'Зачувајте плејлиста';

  @override
  String get clearPlaylist => 'Јасна плејлиста';

  @override
  String get rescanMusicFilesSettingTitle => 'Music датотеки со Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Поместете го палецот лесно околу тркалото за кликнување за да се движите во менито';

  @override
  String get centerButtonMenuTutorialText =>
      'Притиснете го копчето Центар за да ја изберете означената ставка од менито';

  @override
  String get playPauseMenuTutorialText =>
      'Притиснете го ова копче за да свирите или паузирате песна';

  @override
  String get nextButtonMenuTutorialText =>
      'Притиснете го ова копче за да го прескокнете на следната песна';

  @override
  String get previousButtonMenuTutorialText =>
      'Притиснете го ова копче за да се премотате или да се вратите на претходната песна';

  @override
  String get menuButtonTutorialText =>
      'Притиснете го ова копче за да се вратите на претходното мени. Можете да го притиснете и да го држите од кој било друг екран за директно да одите во главното мени.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ова е екранот на екранот. Екранот на допир и режимот на сплит екранот се овозможуваат стандардно и може да се конфигурираат понатаму во поставките.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Поместете го палецот околу тркалото за кликнување за да ја прилагодите јачината на звукот';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Притиснете го копчето Централно за да циклус преку Seek Bar, Scrubber Bar и Shuffle Slider. Притиснете и задржете го копчето Центар за да пристапите до дополнителни опции.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Притиснете и држете го ова копче за побрзо да ја препраќате песната';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Притиснете и држете го ова копче за да ја премотате песната';

  @override
  String get deviceControlSearchTutorialText =>
      'Поместете го палецот лесно околу тркалото за кликнување за да истакнете азбука';

  @override
  String get centerButtonSearchTutorialText =>
      'Притиснете го копчето Центар за да ја изберете истакната азбука';

  @override
  String get nextButtonSearchTutorialText =>
      'Притиснете го ова копче за да додадете простор';

  @override
  String get previousButtonSearchTutorialText =>
      'Притиснете го ова копче за да го избришете последниот знак';

  @override
  String get menuButtonSearchTutorialText =>
      'Притиснете го ова копче за да ја затворите тастатурата и да комуницирате со резултатите од пребарувањето';
}
