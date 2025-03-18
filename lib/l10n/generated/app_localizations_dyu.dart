// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dyula (`dyu`).
class AppLocalizationsDyu extends AppLocalizations {
  AppLocalizationsDyu([String locale = 'dyu']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Saali ka kan ka kɛ .';

  @override
  String get audioAccessPermissionContent =>
      'Aw k’a to an ka se ka ordinatɛri ka sɛbɛw sɔrɔ walisa k’a to an ka se k’aw ka dɔnkiliw fɔ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio sɔrɔli ka kan ka kɛ .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Aw k’a to aw ka se ka o porogramu ka porogramuw sɔrɔ o porogramu kɔnɔ walisa k’a to an ka se k’aw ka miziki sɛbɛw fɔ.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Fɔli';

  @override
  String get nowPlayingScreenTitle => 'Sisan, i be tulon kɛra';

  @override
  String get shuffleSongsMenuTitle => 'Dɔnkiliw';

  @override
  String get shuffleSettingTitle => 'kɛlɛ';

  @override
  String get settingsScreenTitle => 'Paramɛtiri';

  @override
  String get aboutScreenTitle => 'Kan';

  @override
  String get coverFlowScreenTitle => 'ka yɔrɔ datugu';

  @override
  String get artistsScreenTitle => 'Sekoyira';

  @override
  String get albumsScreenTitle => 'Albimu';

  @override
  String get songsScreenTitle => 'fɔsikan';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Dɔnkiliw',
      one: '1 Dɔnkili',
      zero: 'Dɔnkiliw tɛ yen',
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
      other: '$countString Albɔmuw',
      one: '1 Albɔmu',
      zero: 'Alibɔmu tɛ yen',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Zɛnɛzi';

  @override
  String get genreSongsScreenTitle => 'Zɛnɛzi dɔnkiliw';

  @override
  String get deviceColorSettingTitle => 'Sugandili';

  @override
  String get touchScreenSettingTitle => 'Ɲagali Screen Eabled .';

  @override
  String get repeatModeSettingTitle => 'Segi a kan';

  @override
  String get repeatModeOne => 'Kelen';

  @override
  String get repeatModeAll => 'Bɛɛ';

  @override
  String get vibrateSettingTitle => 'ka ye';

  @override
  String get clickWheelSettingTitle => 'I ka Wheel sounds digi .';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Aw ye maga Sounds';

  @override
  String get touchSoundsDialogContent =>
      'Aw ka Enable Touch Sounds ka bɔ System Paramɛtiriw la walisa ka digi click hot mankanw mɛn .';

  @override
  String get immersiveModeSettingTitle => 'Mode min be mɔgɔ kabakoya';

  @override
  String get showAppTutorialSettingTitle => 'A’ ye kalansen';

  @override
  String get changeDirectorySettingTitle => 'A’ ye Direktɛri yɛlɛma';

  @override
  String get donateSettingTitle => 'Di';

  @override
  String get donateSettingDescription =>
      'N’o porogramu ka di i ye, i ka miiri k’a filɛ.';

  @override
  String get versionAboutScreenTitle => 'Wɛrisiyɔn';

  @override
  String get madeWithLoveTitle => 'A dilanna ni ❤️ ye .';

  @override
  String get noMusicFilesFound => 'Musiki tɛ';

  @override
  String get noArtistsFound => 'Sekoyira tɛ';

  @override
  String get noAlbumsFound => 'Alibukaw tɛ';

  @override
  String get unknownSong => 'Dɔnkili t\'a la.';

  @override
  String get unknownArtist => 'Sekoyirabali min t’a lɔn';

  @override
  String get unknownAlbum => 'Alibum lɔnnin tɛ .';

  @override
  String get unknownGenre => 'Zɛnɛzi tɛ lɔn';

  @override
  String get buttonConfirmText => 'N\'SONA';

  @override
  String get tileValueOn => 'Kan';

  @override
  String get tileValueOff => 'Te yen';

  @override
  String get commonOfText => 'ka';

  @override
  String get pageNotFoundText => 'O ɲɛɛ min dira, o ma sɔrɔ .';

  @override
  String get commonErrorText => 'Fili';

  @override
  String get retryButtonText => 'segi';

  @override
  String get filePickerDialogTitle =>
      'Aw ye Direktɛri dɔ sugandi min be se ka kɛ miziki ye .';

  @override
  String get searchScreenTitle => 'Ɲini';

  @override
  String get searchEmptyText => 'Sɛgɛsɛgɛri tɛ yen .';

  @override
  String get searchResultsText => 'Sɛgɛsɛgɛli jaabiw:';

  @override
  String get resultsForText => 'Jaabiw:';

  @override
  String get disableBatteryOptimizationTitle => 'Batiri min be se ka bana.';

  @override
  String get disableBatteryOptimizationContent =>
      'Aw k’aw ka batiriw labɛn ka ɲɛ o porogramu kama minw be sɔrɔ o minanw kɔnɔ walisa ka se ka dɔnkiliw lamɛn.';

  @override
  String get languageScreenTitle => 'Kan';

  @override
  String get silverDeviceColor => 'Warijɛ';

  @override
  String get blackDeviceColor => 'Fin';

  @override
  String get resetSettingsTitle => 'Reset Paramɛtiriw';

  @override
  String get browseArtist => 'ka Artikɛ mara la';

  @override
  String get browseAlbum => 'Aw ye Album filɛ';

  @override
  String get cancelText => 'weleku';

  @override
  String get playlistsScreenTitle => 'Tulonkɛlaw';

  @override
  String get addToOnTheGoPlaylist => 'Aw ye dɔ fara a kan-Taga .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'A’ ye Album fara a kan.';

  @override
  String get removeSongFromThePlaylist => 'A bɔ Playlist kɔnɔ .';

  @override
  String get allAlbums => 'Alibukaw bɛɛ';

  @override
  String get scanningMusicFiles => 'Miziki filɛriw .';

  @override
  String get newPlaylist => 'kura';

  @override
  String get savePlaylist => 'I ka tulonw mara';

  @override
  String get clearPlaylist => 'Tulonkɛla gwɛnin';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan miziki filɛri';

  @override
  String get deviceControlMenuTutorialText =>
      'I bolokunnaden ta dɔɔni dɔɔni i ka Click Wheel lamini walisa ka se ka taga yɔrɔ nin na .';

  @override
  String get centerButtonMenuTutorialText =>
      'I ka yɔrɔ cɛmancɛ butɔn digi walisa ka yɔrɔ min yira, o sugandi .';

  @override
  String get playPauseMenuTutorialText =>
      'Aw ye nin butɔn digi ka dɔnkili dɔ fɔ wala k’a lalɔ .';

  @override
  String get nextButtonMenuTutorialText =>
      'Aw ye nin butɔn digi ka tɛmɛ dɔnkili nata kan .';

  @override
  String get previousButtonMenuTutorialText =>
      'Aw ye nin butɔn digi walisa ka segi ka bɔ wala ka kɔsegi dɔnkili tɛmɛnin na .';

  @override
  String get menuButtonTutorialText =>
      'I ka butɔn nin digi walisa ka kɔsegi yɔrɔ tɛmɛninw na. I tun be se k’a digi ani k’a minɛ ekran wɛrɛ kan walisa ka taga yɔrɔ min na, o ye ka taga yɔrɔ min na, o ye yɔrɔ jɔnjɔn ye.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Nin ye yiracogo yɔrɔ ye. Ɲɔgɔn Screen ani Split Screen Mode be se ka baara kɛ ka ɲɛ ani u be se ka labɛn ka ɲɛ paramɛtiriw kɔnɔ.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'I k’i bolokunnanden yɛlɛma ka taga yɔrɔ min na i be se ka yɔrɔ nin yɛlɛma .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'I ka Centre butɔn digi walisa ka se ka nɛgɛso ɲini, ka scrubber bar ani shuffle slider ɲini. I ka Centre butɔn digi ani k’a minɛ walisa ka se ka fɛɛn wɛrɛw sɔrɔ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Aw ye nin butɔn digi ani k’a minɛ walisa ka dɔnkili nin ɲɛfɛ .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Aw ye nin butɔn digi ani k’a minɛ walisa ka dɔnkili nin bɔ tugun .';

  @override
  String get deviceControlSearchTutorialText =>
      'Aw k’aw bolokunnaden yɛlɛma dɔɔni dɔɔni ka se ka yɔrɔ dɔ lamini walisa ka alfabɛti dɔ yira .';

  @override
  String get centerButtonSearchTutorialText =>
      'I ka yɔrɔ cɛmancɛ butɔn digi walisa ka alfabɛti yiranin sugandi .';

  @override
  String get nextButtonSearchTutorialText =>
      'I ka butɔn nin digi walisa ka yɔrɔ dɔ fara a kan .';

  @override
  String get previousButtonSearchTutorialText =>
      'I ka nin butɔn digi walisa ka mɔgɔ laban jɔsi .';

  @override
  String get menuButtonSearchTutorialText =>
      'I ka o butɔn digi walisa ka klaviye datugu ani ka jɛnɲɔgɔnya kɛ ni ɲinini jaabiw ye .';

  @override
  String get allSongs => 'Dɔnkiliw bɛɛ';
}
