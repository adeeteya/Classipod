// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bemba (`bem`).
class AppLocalizationsBem extends AppLocalizations {
  AppLocalizationsBem([String locale = 'bem']) : super(locale);

  @override
  String get appTitle => 'Iciputulwa ca nshita';

  @override
  String get menuButtonText => 'IMENU';

  @override
  String get audioAccessPermissionTitle =>
      'Ukusuminisha Ukusuminisha Kwakufwaikwa';

  @override
  String get audioAccessPermissionContent =>
      'Mukwai suminisheni amafailo ya mashiwi pakuti tucite ifyo mulefwaya ukubelenga amafailo ya nyimbo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ukusuminisha Ukusuminisha Ukwasuka';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Mukwai suminisheni amafailo ya mashiwi aya kuti iyi app mu fipe fya kubomfya pa kuti tuletambisha amafailo ya nyimbo.';

  @override
  String get menuScreenTitle => 'nyny';

  @override
  String get musicMenuScreenTitle => 'Inyimbo';

  @override
  String get nowPlayingScreenTitle => 'Nomba Ukuteya';

  @override
  String get shuffleSongsMenuTitle => 'Inyimbo sha Mupepo';

  @override
  String get shuffleSettingTitle => 'Shinsa';

  @override
  String get settingsScreenTitle => 'Ukubika';

  @override
  String get aboutScreenTitle => 'Pali';

  @override
  String get coverFlowScreenTitle => 'Ukukakatika';

  @override
  String get artistsScreenTitle => 'Abakupanga ifyakupangapanga';

  @override
  String get albumsScreenTitle => 'kuti';

  @override
  String get songsScreenTitle => 'Inyimbo';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString inyimbo',
      one: '1 inyimbo',
      zero: 'tapali inyimbo',
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
      other: '$countString ama albamu',
      one: '1 albamu',
      zero: 'tapali ama albamu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Intambi';

  @override
  String get genreSongsScreenTitle => 'Uumfweni Amashina';

  @override
  String get deviceColorSettingTitle => 'Colro wa Cipimo';

  @override
  String get touchScreenSettingTitle => 'Ukukuma ku Cifulo ca Kubalilapo';

  @override
  String get repeatModeSettingTitle => 'Ukubwekeshapo';

  @override
  String get repeatModeOne => 'Umo';

  @override
  String get repeatModeAll => 'Conse';

  @override
  String get vibrateSettingTitle => 'Vviasi';

  @override
  String get clickWheelSettingTitle => 'Tinikeni pa Fishinka';

  @override
  String get splitScreenSettingTitle => 'Umutande wa Cishinka';

  @override
  String get touchSoundsDialogTitle => 'Ukukumya';

  @override
  String get touchSoundsDialogContent =>
      'Mukwai Pekanishisheni Amalyashi ya Kukumya ukufuma ku Fishinka fya Nshila pa kumfwa amashiwi ya mapili aya kutinika';

  @override
  String get immersiveModeSettingTitle => 'Inshila iyakubomfya';

  @override
  String get showAppTutorialSettingTitle => 'Langisheni Ukukonkana';

  @override
  String get changeDirectorySettingTitle => 'Ukupilibula ukwa kwalula';

  @override
  String get donateSettingTitle => 'Ukusonka';

  @override
  String get donateSettingDescription =>
      'Nga mwatemwa iyi app, mukwai tontonkanyeni pa kupeela.';

  @override
  String get versionAboutScreenTitle => 'Umusango';

  @override
  String get madeWithLoveTitle => 'Icipangilwe na ❤️ ukupitila mu';

  @override
  String get noMusicFilesFound => 'Tapali Inyimbo';

  @override
  String get noArtistsFound => 'Takuli Abakupanga';

  @override
  String get noAlbumsFound => 'Takuli AAbras';

  @override
  String get unknownSong => 'Inyimbo ishishiishibikwe';

  @override
  String get unknownArtist => 'Kabumba uushaishibikwa';

  @override
  String get unknownAlbum => 'Albbu uushaishibikwa';

  @override
  String get unknownGenre => 'Icaishibikwa';

  @override
  String get buttonConfirmText => 'EE';

  @override
  String get tileValueOn => 'Pa';

  @override
  String get tileValueOff => 'Ukuleka';

  @override
  String get commonOfText => 'wa';

  @override
  String get pageNotFoundText => 'Ibuula lyapeelwe talyasangilwe';

  @override
  String get commonErrorText => 'Icilubo';

  @override
  String get retryButtonText => 'Icakulya';

  @override
  String get filePickerDialogTitle =>
      'Saleni Ubutungulushi bwakukwata Inyimbo isha Nyimbo';

  @override
  String get searchScreenTitle => 'Fwaya fwaya';

  @override
  String get searchEmptyText => 'Tapali ifyasangwa Ifyakufwaya';

  @override
  String get searchResultsText => 'Ifyasangwa mu kufwaya:';

  @override
  String get resultsForText => 'Ifyasangwamo:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Ukufumyapo Amabatiri ayakupumfyanishiwa';

  @override
  String get disableBatteryOptimizationContent =>
      'Mukwai balemena ukubomfya amabatiri kuli iyi app mufibombelo pakuti muleke ukubelenga inyimbo.';

  @override
  String get languageScreenTitle => 'Ululimi';

  @override
  String get silverDeviceColor => 'Siluva';

  @override
  String get blackDeviceColor => 'Icafita';

  @override
  String get resetSettingsTitle => 'Ifyakupanga ifyabwekeshiwapo';

  @override
  String get browseArtist => 'Fwayeni Kapanga';

  @override
  String get browseAlbum => 'Foni ya Albbu';

  @override
  String get cancelText => 'Ukuleesha';

  @override
  String get playlistsScreenTitle => 'Abakuteya';

  @override
  String get addToOnTheGoPlaylist => 'Lundapo ku Ona-KaKashila';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Lundapo Albam ku O-Ka-Kabilo';

  @override
  String get removeSongFromThePlaylist => 'Fumyeni pa listi wa Kutamba';

  @override
  String get allAlbums => 'Ikumi yonse';

  @override
  String get scanningMusicFiles => 'Amafailo ya Nyimbo aya Kubutukisha';

  @override
  String get newPlaylist => 'Ulubali lwa Kutamba ifipya';

  @override
  String get savePlaylist => 'Sunga ulubali lwa Kubelenga';

  @override
  String get clearPlaylist => 'Icitabo cakutambishishapo';

  @override
  String get rescanMusicFilesSettingTitle => 'Amafailo ya Nyimbo aya Resk';

  @override
  String get deviceControlMenuTutorialText =>
      'Ukutwala icikumo cenu panono panono ukushinguluka Icikumo ca ku kulyo pa kuti muloleshe pa menyu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tinikeni pe batani lya pa kati pakuti musale ifya kulya ifyalangishiwa';

  @override
  String get playPauseMenuTutorialText =>
      'Tinikeni ili batani pakuti musele nangu ukuleka ulwimbo';

  @override
  String get nextButtonMenuTutorialText =>
      'Tinikeni ili batani pa kuti mufume ku lwimbo lwakonkapo .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tinikeni ili batani pakuti mubweseshepo nangu ukubwelela ku lwimbo lwapita';

  @override
  String get menuButtonTutorialText =>
      'Tinikeni ili batani pakuti mubwelele ku menyu yapitapo. Kuti watinika no kucikwata ukufuma pa cikope cimbi pakuti uye ku menyu iikalamba.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ici e cimonwa ca kulanga. Ukukuma ku Nshila ya Cifulo no Kulonganika Intanshi yasuminishiwa kabili kuti yatantikwa na fimbi mu fifulo.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Suminisheni icikumo cenu ukushinguluka icikumo icakutinika pa kuti mulungike ubukulu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tinikeni pe batani lya pa Cifulo pa kuti mupitishe ukupitila mu kufwaya, umuputule wa kusebelelamo no kukunkuma. Tinikeni no kusunga batani lya Cifulo pakuti mukwate ifyakusalapo ifyalundwapo.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tinikeni no kusunga ili batani pakuti mubutuke bwangu ku lwimbo .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tinikeni no kusunga ili batani pakuti mubweseshemo ulu lwimbo';

  @override
  String get deviceControlSearchTutorialText =>
      'Suminisheni umunwe wenu uwa cikumo ukushinguluka Umuti wa kutinika pa Cikumi pa kuti mulangishe alfabeti .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tinikeni pe batani lya pakati pakuti musale alfabeti iyasokolwelwe';

  @override
  String get nextButtonSearchTutorialText =>
      'Tinikeni ili batani pakuti mubikepo icifulo';

  @override
  String get previousButtonSearchTutorialText =>
      'Tinikeni ili batani pakuti mufumyepo umuntu uwakulekelesha';

  @override
  String get menuButtonSearchTutorialText =>
      'Tinikeni ili batani pakuti mwingile mu citabo no kulanshanya ne fyasangwa mu kufwaya';

  @override
  String get allSongs => 'Inyimbo shonse';
}
