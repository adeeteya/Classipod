// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Crimean Tatar Crimean Turkish (`crh`).
class AppLocalizationsCrh extends AppLocalizations {
  AppLocalizationsCrh([String locale = 'crh']) : super(locale);

  @override
  String get appTitle => 'ClassiPod .';

  @override
  String get menuButtonText => 'МЕНУ';

  @override
  String get audioAccessPermissionTitle => 'Аудио кириш рухсети керек';

  @override
  String get audioAccessPermissionContent => 'Музыка файлларынъызны ойнамагъа имкян бермек ичюн, аудио файлларгъа киришни беринъиз.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Аудио кириш рухсети ред этильди';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Лютфен, бу къулланма ичюн аудиофайллар ичюн киришни, бизге музыка файлларынъызны ойнатмагъа имкян бермек ичюн, иляве этинъиз.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Музыка';

  @override
  String get nowPlayingScreenTitle => 'Шимди ойнап .';

  @override
  String get shuffleSongsMenuTitle => 'Шаффл йырлары .';

  @override
  String get shuffleSettingTitle => 'Чалынма';

  @override
  String get settingsScreenTitle => 'Параметр';

  @override
  String get aboutScreenTitle => 'Акъкъында';

  @override
  String get coverFlowScreenTitle => 'Къапакъ акъымы .';

  @override
  String get artistsScreenTitle => 'Рессамлар';

  @override
  String get albumsScreenTitle => 'Озюме асавлар';

  @override
  String get songsScreenTitle => 'Йырлар';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Йырлар',
      one: '1 Йыр',
      zero: 'Йырлар ёкъ',
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
      other: '$countString Альбомлар',
      one: '1 Альбом',
      zero: 'Альбомлар ёкъ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Генр';

  @override
  String get genreSongsScreenTitle => 'Генр йырлары .';

  @override
  String get deviceColorSettingTitle => 'Къурал Ренък .';

  @override
  String get touchScreenSettingTitle => 'Экранны чалыштырмакъ мумкюн';

  @override
  String get repeatModeSettingTitle => 'Текрарламакъ';

  @override
  String get repeatModeOne => 'Бир';

  @override
  String get repeatModeAll => 'Эписи';

  @override
  String get vibrateSettingTitle => 'Вибрат';

  @override
  String get clickWheelSettingTitle => 'Копчеклерни басынъыз .';

  @override
  String get splitScreenSettingTitle => 'Экран режими .';

  @override
  String get touchSoundsDialogTitle => 'Сеслер .';

  @override
  String get touchSoundsDialogContent => 'Лютфен, «Система параметрлери»ден «Точ» сеслерини чалыштырмакъ ичюн тыртырлав копчеги сеслерини эшитмек .';

  @override
  String get immersiveModeSettingTitle => 'Иммерсив режим .';

  @override
  String get showAppTutorialSettingTitle => 'Дерслик косьтермек .';

  @override
  String get changeDirectorySettingTitle => 'Каталогны денъиштирмек .';

  @override
  String get donateSettingTitle => 'Багъышламакъ';

  @override
  String get donateSettingDescription => 'Эгер сиз бу къулланманы бегенсенъиз, лутфен, багъышламакъны тюшюнип бакъынъыз.';

  @override
  String get versionAboutScreenTitle => 'Версия';

  @override
  String get madeWithLoveTitle => '❤️ иле япылгъан.';

  @override
  String get noMusicFilesFound => 'Музыка ёкъ';

  @override
  String get noArtistsFound => 'Рессамлар ёкъ';

  @override
  String get noAlbumsFound => 'Альбом ёкъ';

  @override
  String get unknownSong => 'Белли олмагъан йыр';

  @override
  String get unknownArtist => 'Белли олмагъан рессам .';

  @override
  String get unknownAlbum => 'Белли олмагъан Альбом';

  @override
  String get unknownGenre => 'Белли олмагъан Жанр .';

  @override
  String get buttonConfirmText => 'ЯХШЫ';

  @override
  String get tileValueOn => '1.';

  @override
  String get tileValueOff => 'Къапалы';

  @override
  String get commonOfText => 'NA';

  @override
  String get pageNotFoundText => 'Берильген саифе тапылмады .';

  @override
  String get commonErrorText => 'Хата';

  @override
  String get retryButtonText => 'Ресимни чекмек';

  @override
  String get filePickerDialogTitle => 'Музыка ичюн сканерлемек ичюн каталогны сечип алынъыз .';

  @override
  String get searchScreenTitle => 'Къыдырмакъ';

  @override
  String get searchEmptyText => 'Къыдырув нетиджелери ёкъ';

  @override
  String get searchResultsText => 'Къыдырув нетиджелери:';

  @override
  String get resultsForText => 'Нетиджелер:';

  @override
  String get disableBatteryOptimizationTitle => 'Аккумуляторны оптимизация этмек .';

  @override
  String get disableBatteryOptimizationContent => 'Музыканы фон ойнатмагъа имкян бермек ичюн, бу къулланма ичюн бу къулланма ичюн батарея оптимизациясыны сёндюринъиз.';

  @override
  String get languageScreenTitle => 'Лисан';

  @override
  String get silverDeviceColor => 'Кумюш';

  @override
  String get blackDeviceColor => 'Къара';

  @override
  String get resetSettingsTitle => 'Сброс параметрлери .';

  @override
  String get browseArtist => 'Рессамны бакъынъыз .';

  @override
  String get browseAlbum => 'Альбомны бакъынъыз';

  @override
  String get cancelText => 'Лягъу';

  @override
  String get playlistsScreenTitle => 'Плейлистлер';

  @override
  String get addToOnTheGoPlaylist => 'Он-Гъалишке къош .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Он-ге-кетмек ичюн Album къош .';

  @override
  String get removeSongFromThePlaylist => 'Плейлисттен чыкъарынъыз .';

  @override
  String get allAlbums => 'Бутюн Албумлар .';

  @override
  String get scanningMusicFiles => 'Сканирование музыка файллары .';

  @override
  String get newPlaylist => 'Янъы плейлист';

  @override
  String get savePlaylist => 'Плейлистни къуртармакъ .';

  @override
  String get clearPlaylist => 'Ачыкъ плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Рескан музыка файллары';

  @override
  String get deviceControlMenuTutorialText => 'Менюде юрмек ичюн баш пармагъынъны енгильден «Сыгъырчыкъ» копчеги этрафында авуштырынъыз .';

  @override
  String get centerButtonMenuTutorialText => 'Менюнинъ айдынлатылгъан пунктыны сечип алмакъ ичюн орта дёгмесини басынъыз .';

  @override
  String get playPauseMenuTutorialText => 'Йырны чалмакъ я да токътатмакъ ичюн бу дёгмени басынъыз .';

  @override
  String get nextButtonMenuTutorialText => 'Невбеттеки йыргъа кечмек ичюн бу дёгмени басынъыз .';

  @override
  String get previousButtonMenuTutorialText => 'Бу дёгмени къайтарып, эвельки йыргъа къайтмакъ ичюн .';

  @override
  String get menuButtonTutorialText => 'Эвельки менюге къайтмакъ ичюн бу дёгмени басынъыз. Оны догърудан-догъру эсас менюге бармакъ ичюн эр бир экрандан басып, тутып олурсынъ.';

  @override
  String get deviceScreenMenuTutorialText => 'Бу дисплей экраныдыр. Экран ве джыллылыкъ экран режими стандарт оларакъ чалыштырыла ве параметрлерде даа да зияде конфигурацияланмакъ мумкюн.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Объектни ерлештирмек ичюн баш пармагъынъны «Клик» копчегининъ этрафында авуштырынъыз .';

  @override
  String get centerButtonNowPlayingTutorialText => '«Меркез» дёгмесини басынъыз, къыдырмакъ ичюн пансионат, скруббер бар ве къарыштырув слайдер ярдымынен чалышмакъ керек. Къошма вариантларгъа кирмек ичюн «Меркез» дёгмесини басып тутынъыз.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Бу дёгмени басып тутынъыз, йырны тез илерилемек .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Йырны къайтармакъ ичюн бу дёгмени басып тутынъыз .';

  @override
  String get deviceControlSearchTutorialText => 'Элифбени айдынлатмакъ ичюн баш пармагъынъны енгильден «Клик копчеги» этрафында авуштырынъыз .';

  @override
  String get centerButtonSearchTutorialText => 'Тасвирленген элифбени сечип алмакъ ичюн орта дёгмесини басынъыз .';

  @override
  String get nextButtonSearchTutorialText => 'Бу дёгмени басынъыз, бошлукъ къошмакъ ичюн .';

  @override
  String get previousButtonSearchTutorialText => 'Сонъки ишаретни ёкъ этмек ичюн бу дёгмени басынъыз .';

  @override
  String get menuButtonSearchTutorialText => 'Клавиатураны къапатмакъ ве къыдырув нетиджелеринен тесирлешмек ичюн бу дёгмени басынъыз .';
}
