// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Klasipodo';

  @override
  String get menuButtonText => 'Menuo';

  @override
  String get audioAccessPermissionTitle => 'Audio -alira permeso bezonata';

  @override
  String get audioAccessPermissionContent =>
      'Bonvolu koncedi sondosierojn aliron por permesi al ni ludi viajn muzikdosierojn.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio -alira permeso neita';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Bonvolu koncedi sondosierojn aliron por ĉi tiu app en la aparataj agordoj por permesi al ni ludi viajn muzikdosierojn.';

  @override
  String get menuScreenTitle => 'Menuo';

  @override
  String get musicMenuScreenTitle => 'Muziko';

  @override
  String get nowPlayingScreenTitle => 'Nun ludante';

  @override
  String get shuffleSongsMenuTitle => 'Ŝovu kantojn';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Agordoj';

  @override
  String get aboutScreenTitle => 'Pri';

  @override
  String get coverFlowScreenTitle => 'Kovrila fluo';

  @override
  String get artistsScreenTitle => 'Artistoj';

  @override
  String get albumsScreenTitle => 'Albumoj';

  @override
  String get songsScreenTitle => 'Kantoj';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Kantoj',
      one: '1 Kanto',
      zero: 'Neniuj Kantoj',
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
      other: '$countString Albumoj',
      one: '1 Albumo',
      zero: 'Neniuj Albumoj',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ĝenroj';

  @override
  String get genreSongsScreenTitle => 'Ĝenraj kantoj';

  @override
  String get deviceColorSettingTitle => 'Aparata koloro';

  @override
  String get touchScreenSettingTitle => 'Tuŝekrano ebligita';

  @override
  String get repeatModeSettingTitle => 'Ripetu';

  @override
  String get repeatModeOne => 'Unu';

  @override
  String get repeatModeAll => 'Ĉio';

  @override
  String get vibrateSettingTitle => 'Vibri';

  @override
  String get clickWheelSettingTitle => 'Alklaku rado -sonojn';

  @override
  String get splitScreenSettingTitle => 'Disparta Ekrana reĝimo';

  @override
  String get touchSoundsDialogTitle => 'Tuŝaj sonoj';

  @override
  String get touchSoundsDialogContent =>
      'Bonvolu ebligi tuŝajn sonojn de sistemaj agordoj por aŭdi la klakajn radojn';

  @override
  String get immersiveModeSettingTitle => 'Imersiva reĝimo';

  @override
  String get showAppTutorialSettingTitle => 'Montri lernilon';

  @override
  String get changeDirectorySettingTitle => 'Ŝanĝi dosierujon';

  @override
  String get donateSettingTitle => 'Donaci';

  @override
  String get donateSettingDescription =>
      'Se vi ŝatas ĉi tiun programon, bonvolu konsideri donaci.';

  @override
  String get versionAboutScreenTitle => 'Versio';

  @override
  String get madeWithLoveTitle => 'Farita kun ❤️ per';

  @override
  String get noMusicFilesFound => 'Neniu Muziko';

  @override
  String get noArtistsFound => 'Neniuj Artistoj';

  @override
  String get noAlbumsFound => 'Neniuj albumoj';

  @override
  String get unknownSong => 'Nekonata Kanto';

  @override
  String get unknownArtist => 'Nekonata Artisto';

  @override
  String get unknownAlbum => 'Nekonata Albumo';

  @override
  String get unknownGenre => 'Nekonata ĝenro';

  @override
  String get buttonConfirmText => 'Bone';

  @override
  String get tileValueOn => 'ON';

  @override
  String get tileValueOff => 'For';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'La donita paĝo ne estis trovita';

  @override
  String get commonErrorText => 'Eraro';

  @override
  String get retryButtonText => 'Retrovu';

  @override
  String get filePickerDialogTitle => 'Elektu dosierujon por skani muzikon';

  @override
  String get searchScreenTitle => 'Serĉo';

  @override
  String get searchEmptyText => 'Neniuj serĉrezultoj';

  @override
  String get searchResultsText => 'Serĉrezultoj:';

  @override
  String get resultsForText => 'Rezultoj por:';

  @override
  String get disableBatteryOptimizationTitle => 'Malŝalti baterian optimumigon';

  @override
  String get disableBatteryOptimizationContent =>
      'Bonvolu malebligi baterian optimumigon por ĉi tiu app en la aparataj agordoj por permesi fonan reproduktadon de muziko.';

  @override
  String get languageScreenTitle => 'Lingvo';

  @override
  String get silverDeviceColor => 'Arĝento';

  @override
  String get blackDeviceColor => 'Nigra';

  @override
  String get resetSettingsTitle => 'Restarigi Agordojn';

  @override
  String get browseArtist => 'Foliumi Artiston';

  @override
  String get browseAlbum => 'Foliumi Albumon';

  @override
  String get cancelText => 'Nuligi';

  @override
  String get playlistsScreenTitle => 'Ludlistoj';

  @override
  String get addToOnTheGoPlaylist => 'Aldonu al surloke';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aldonu albumon al surloke';

  @override
  String get removeSongFromThePlaylist => 'Forigu de la playlist';

  @override
  String get allAlbums => 'Ĉiuj albumoj';

  @override
  String get scanningMusicFiles => 'Skanante Muzikdosierojn';

  @override
  String get newPlaylist => 'Nova Ludlisto';

  @override
  String get savePlaylist => 'Konservu Ludliston';

  @override
  String get clearPlaylist => 'Klara Ludlisto';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskanaj muzikdosieroj';

  @override
  String get deviceControlMenuTutorialText =>
      'Movu vian dikfingron malpeze ĉirkaŭ la klaka rado por navigi la menuon';

  @override
  String get centerButtonMenuTutorialText =>
      'Premu la centran butonon por elekti la reliefigitan menuon';

  @override
  String get playPauseMenuTutorialText =>
      'Premu ĉi tiun butonon por ludi aŭ paŭzi kanton';

  @override
  String get nextButtonMenuTutorialText =>
      'Premu ĉi tiun butonon por salti al la sekva kanto';

  @override
  String get previousButtonMenuTutorialText =>
      'Premu ĉi tiun butonon por rebobini aŭ reiri al la antaŭa kanto';

  @override
  String get menuButtonTutorialText =>
      'Premu ĉi tiun butonon por reiri al la antaŭa menuo. Vi povus premi kaj teni ĝin de iu ajn alia ekrano por rekte iri al la ĉefa menuo.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Jen la ekrano. Tuŝekrano kaj Split -ekrana reĝimo estas ebligitaj defaŭlte kaj povas esti agorditaj plu en la agordoj.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Movu vian dikfingron ĉirkaŭ la klaka rado por ĝustigi la volumon';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Premu la centran butonon por bicikli tra Seek Bar, Scrubber Bar kaj Shuffle Slider. Premu kaj tenu la centran butonon por aliri pliajn eblojn.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Premu kaj tenu ĉi tiun butonon por antaŭenigi la kanton';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Premu kaj tenu ĉi tiun butonon por rebobini la kanton';

  @override
  String get deviceControlSearchTutorialText =>
      'Movu vian dikfingron malpeze ĉirkaŭ la klakan radon por reliefigi alfabeton';

  @override
  String get centerButtonSearchTutorialText =>
      'Premu la centran butonon por elekti la reliefigitan alfabeton';

  @override
  String get nextButtonSearchTutorialText =>
      'Premu ĉi tiun butonon por aldoni spacon';

  @override
  String get previousButtonSearchTutorialText =>
      'Premu ĉi tiun butonon por forigi la lastan karakteron';

  @override
  String get menuButtonSearchTutorialText =>
      'Premu ĉi tiun butonon por fermi la klavaron kaj interagi kun la serĉrezultoj';
}
