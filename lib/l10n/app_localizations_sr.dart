// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Цлассипод';

  @override
  String get menuButtonText => 'Мени';

  @override
  String get audioAccessPermissionTitle =>
      'Потребна је дозвола за аудио приступа';

  @override
  String get audioAccessPermissionContent =>
      'Молимо да дате приступ аудио датотекама како бисте нам дозволили да репродукујемо ваше музичке датотеке.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Дозвола за аудио приступа је одбијена';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Молимо да додате приступ аудио датотеци за ову апликацију у подешавањима уређаја како бисте нам омогућили да репродукујемо ваше музичке датотеке.';

  @override
  String get menuScreenTitle => 'Мени';

  @override
  String get musicMenuScreenTitle => 'Музика';

  @override
  String get nowPlayingScreenTitle => 'Сада се игра';

  @override
  String get shuffleSongsMenuTitle => 'Схуффле Песме';

  @override
  String get shuffleSettingTitle => 'Мешати';

  @override
  String get settingsScreenTitle => 'Подешавања';

  @override
  String get aboutScreenTitle => 'О томе';

  @override
  String get coverFlowScreenTitle => 'Проток покривача';

  @override
  String get artistsScreenTitle => 'Уметници';

  @override
  String get albumsScreenTitle => 'Албуми';

  @override
  String get songsScreenTitle => 'Песме';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Песме',
      one: '1 Сонг',
      zero: 'нема песама',
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
      other: '$countString албуми',
      one: '1 албум',
      zero: 'без албума',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Жанрови';

  @override
  String get genreSongsScreenTitle => 'Жанре песме';

  @override
  String get deviceColorSettingTitle => 'Боја уређаја';

  @override
  String get touchScreenSettingTitle => 'Омогућено додирни екран';

  @override
  String get repeatModeSettingTitle => 'Поновити';

  @override
  String get repeatModeOne => 'Један';

  @override
  String get repeatModeAll => 'Све';

  @override
  String get vibrateSettingTitle => 'Вибрирати';

  @override
  String get clickWheelSettingTitle => 'Кликните на звукове точка';

  @override
  String get splitScreenSettingTitle => 'Режим подељеног екрана';

  @override
  String get touchSoundsDialogTitle => 'Додирните звукове';

  @override
  String get touchSoundsDialogContent =>
      'Молимо омогућите звукове додира из системских поставки да бисте чули звук точка на клику';

  @override
  String get immersiveModeSettingTitle => 'Умерни мод';

  @override
  String get showAppTutorialSettingTitle => 'Уџбеник';

  @override
  String get changeDirectorySettingTitle => 'Промените директориј';

  @override
  String get donateSettingTitle => 'Донирати';

  @override
  String get donateSettingDescription =>
      'Ако вам се свиђа ова апликација, молимо вас да размислите о донацији.';

  @override
  String get versionAboutScreenTitle => 'Верзија';

  @override
  String get madeWithLoveTitle => 'Направљен са ❤ од';

  @override
  String get noMusicFilesFound => 'Без музике';

  @override
  String get noArtistsFound => 'Нема уметника';

  @override
  String get noAlbumsFound => 'Нема албума';

  @override
  String get unknownSong => 'Непозната песма';

  @override
  String get unknownArtist => 'Непознати уметник';

  @override
  String get unknownAlbum => 'Непознати албум';

  @override
  String get unknownGenre => 'Непознати жанр';

  @override
  String get buttonConfirmText => 'У реду';

  @override
  String get tileValueOn => 'У';

  @override
  String get tileValueOff => 'Искључен';

  @override
  String get commonOfText => 'од';

  @override
  String get pageNotFoundText => 'Дата страница није пронађена';

  @override
  String get commonErrorText => 'Грешка';

  @override
  String get retryButtonText => 'Поново покушати';

  @override
  String get filePickerDialogTitle =>
      'Изаберите директориј да бисте скенирали музику';

  @override
  String get searchScreenTitle => 'Тражити';

  @override
  String get searchEmptyText => 'Нема резултата претраге';

  @override
  String get searchResultsText => 'Резултати претраге:';

  @override
  String get resultsForText => 'Резултати за:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Онемогућити оптимизацију батерије';

  @override
  String get disableBatteryOptimizationContent =>
      'Онемогућите оптимизацију батерије за ову апликацију у подешавањима уређаја да бисте омогућили позадинску репродукцију музике.';

  @override
  String get languageScreenTitle => 'Језик';

  @override
  String get silverDeviceColor => 'Сребрна';

  @override
  String get blackDeviceColor => 'Црн';

  @override
  String get resetSettingsTitle => 'Ресетујте подешавања';

  @override
  String get browseArtist => 'Претражите уметник';

  @override
  String get browseAlbum => 'Претражите албум';

  @override
  String get cancelText => 'Отказати';

  @override
  String get playlistsScreenTitle => 'Листа за репродукцију';

  @override
  String get addToOnTheGoPlaylist => 'Додај у то';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Додајте албум на то';

  @override
  String get removeSongFromThePlaylist => 'Уклони са листе за репродукцију';

  @override
  String get allAlbums => 'Сви албуми';

  @override
  String get scanningMusicFiles => 'Скенирање музичких датотека';

  @override
  String get newPlaylist => 'Нова листа за репродукцију';

  @override
  String get savePlaylist => 'Сачувај листу репродукције';

  @override
  String get clearPlaylist => 'Јасна листа за репродукцију';

  @override
  String get rescanMusicFilesSettingTitle => 'Ресцан Мусиц Филес';

  @override
  String get deviceControlMenuTutorialText =>
      'Лагано померите палац око точка на клику да бисте се кретали у менију';

  @override
  String get centerButtonMenuTutorialText =>
      'Притисните средишњи тастер да бисте изабрали означену ставку менија';

  @override
  String get playPauseMenuTutorialText =>
      'Притисните ово дугме да бисте репродуковали или паузирали песму';

  @override
  String get nextButtonMenuTutorialText =>
      'Притисните ово дугме да бисте прешли на следећу песму';

  @override
  String get previousButtonMenuTutorialText =>
      'Притисните ово дугме да бисте премотали уназад или се вратили на претходну песму';

  @override
  String get menuButtonTutorialText =>
      'Притисните ово дугме да бисте се вратили на претходни мени. Можете да притиснете и држите га са било којег другог екрана да бисте директно прешли у главни мени.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ово је екран екран. Режим додирног екрана и подељеног режим екрана омогућени су подразумевано и могу се даље конфигурирати у подешавањима.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Померите палац око точка клик да бисте подесили јачину звука';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Притисните средишњи тастер да бисте се возили кроз тражење траке, траке за прочишћавање и клизач за померање. Притисните и држите дугме Центра за приступ додатним опцијама.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Притисните и држите ово дугме да бисте брзо проследили песму';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Притисните и држите ово дугме да бисте премотали песму';

  @override
  String get deviceControlSearchTutorialText =>
      'Лагано померите палцу око точка на клику да бисте истакли абецеду';

  @override
  String get centerButtonSearchTutorialText =>
      'Притисните дугме Центра за одабир означене абецеде';

  @override
  String get nextButtonSearchTutorialText =>
      'Притисните ово дугме да бисте додали простор';

  @override
  String get previousButtonSearchTutorialText =>
      'Притисните ово дугме да бисте избрисали последњи знак';

  @override
  String get menuButtonSearchTutorialText =>
      'Притисните ово дугме да бисте затворили тастатуру и комуницирали са резултатима претраге';
}
