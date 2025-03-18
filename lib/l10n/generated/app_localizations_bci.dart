// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Baoulé (`bci`).
class AppLocalizationsBci extends AppLocalizations {
  AppLocalizationsBci([String locale = 'bci']) : super(locale);

  @override
  String get appTitle => 'Classe';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Audio Access Permissions n’ɔ fata kɛ be fa di junman’n .';

  @override
  String get audioAccessPermissionContent =>
      'Maan amun man amun atin naan amun kwla bo amun jue’m be nun ndɛ’m be bo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Access Permission .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Sɛ amun waan amún fá appli sɔ’n i nun ndɛ’m bé kɔ́’n, amun man amun atin naan amun bo amun miziki’m be nun ndɛ’m be bo.';

  @override
  String get menuScreenTitle => 'Mennu';

  @override
  String get musicMenuScreenTitle => 'Jue';

  @override
  String get nowPlayingScreenTitle => 'Siɛn’n, jasin fɛ’n';

  @override
  String get shuffleSongsMenuTitle => 'Shuffe Jue mun';

  @override
  String get shuffleSettingTitle => 'E ʃuan';

  @override
  String get settingsScreenTitle => 'Ndɛ';

  @override
  String get aboutScreenTitle => 'Like n\'ga su';

  @override
  String get coverFlowScreenTitle => 'Kaci';

  @override
  String get artistsScreenTitle => 'Be nga be yi desɛn’n';

  @override
  String get albumsScreenTitle => 'aliɛ n\'ga be yo';

  @override
  String get songsScreenTitle => 'Jue';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jue mun',
      one: '1 jue',
      zero: 'jue fi nunman lɛ',
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
      other: '$countString albɔmu',
      one: '1 albɔmu',
      zero: 'albɔmu fi nunman lɛ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Jue kpa';

  @override
  String get deviceColorSettingTitle => 'Manmandan sua';

  @override
  String get touchScreenSettingTitle => 'Ijɔlɛ’n i su ndɛ’n';

  @override
  String get repeatModeSettingTitle => 'Kin yekun';

  @override
  String get repeatModeOne => 'Ku\'n';

  @override
  String get repeatModeAll => 'I n\'gba';

  @override
  String get vibrateSettingTitle => 'video';

  @override
  String get clickWheelSettingTitle => 'Sɛ a tin nnɛn kpanngɔ’m be su’n';

  @override
  String get splitScreenSettingTitle => 'Mode d\'essence, Mode';

  @override
  String get touchSoundsDialogTitle => 'kan\'ni';

  @override
  String get touchSoundsDialogContent =>
      'Ɔ maan, ɔ fata kɛ e yo like kwlaa nga e kwla yo’n naan y’a kwla jran kekle. しかし,システム・セッティングのステージスティングのコンテンスを聴く」というタイトルの音を wɔbó .';

  @override
  String get immersiveModeSettingTitle => 'Mode mode importer';

  @override
  String get showAppTutorialSettingTitle => 'É klé like klelɛ';

  @override
  String get changeDirectorySettingTitle => 'nin\'gue kacilɛ';

  @override
  String get donateSettingTitle => 'Man';

  @override
  String get donateSettingDescription =>
      'Sɛ amun klo appli sɔ’n, amun bu i akunndan.';

  @override
  String get versionAboutScreenTitle => 'Iwafa';

  @override
  String get madeWithLoveTitle => 'Be fali ❤️ be yili .';

  @override
  String get noMusicFilesFound => 'Musiki';

  @override
  String get noArtistsFound => 'Artist fuɛ';

  @override
  String get noAlbumsFound => 'Nán Album .';

  @override
  String get unknownSong => 'Be siman jue .';

  @override
  String get unknownArtist => 'Artist .';

  @override
  String get unknownAlbum => 'Album .';

  @override
  String get unknownGenre => 'Gɛnre .';

  @override
  String get buttonConfirmText => 'ETIPKA';

  @override
  String get tileValueOn => 'Issu';

  @override
  String get tileValueOff => 'Nuan wa';

  @override
  String get commonOfText => 'i';

  @override
  String get pageNotFoundText => 'Be wunnin fluwa’n i bue .';

  @override
  String get commonErrorText => 'Fɔnlɛ';

  @override
  String get retryButtonText => 'Retron';

  @override
  String get filePickerDialogTitle => 'Fa Direktɛri kun naan w’a ɲan Scan .';

  @override
  String get searchScreenTitle => 'Kun\'dɛ';

  @override
  String get searchEmptyText => 'Like kunndɛlɛ like fi nunman lɛ .';

  @override
  String get searchResultsText => 'Kunndɛ i bo’n:';

  @override
  String get resultsForText => 'I bo’n yɛle kɛ:';

  @override
  String get disableBatteryOptimizationTitle => 'Batɛmun yolɛ’n i su ndɛ’n .';

  @override
  String get disableBatteryOptimizationContent =>
      'Ɔ maan, ɔ fata kɛ be fa batɛmun’n be di junman appli sɔ’n nun naan b’a kwla bo miziki’n i bo.';

  @override
  String get languageScreenTitle => 'Anien';

  @override
  String get silverDeviceColor => 'Sika';

  @override
  String get blackDeviceColor => 'Ble';

  @override
  String get resetSettingsTitle => 'Paramètres n\'ga be fa sie like uflɛ';

  @override
  String get browseArtist => 'Flimu .';

  @override
  String get browseAlbum => 'Nannin album';

  @override
  String get cancelText => 'yilɛ';

  @override
  String get playlistsScreenTitle => 'be su bo jue';

  @override
  String get addToOnTheGoPlaylist => 'Ɔ fa On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ɔ fa Album gua On-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Yɛ be yi i Playlist .';

  @override
  String get allAlbums => 'Albums kwlaa';

  @override
  String get scanningMusicFiles => 'Scanning Music Files';

  @override
  String get newPlaylist => 'Be nga be bo ngowa’n';

  @override
  String get savePlaylist => 'Demi numlɛn';

  @override
  String get clearPlaylist => 'yili jue tofuɛ';

  @override
  String get rescanMusicFilesSettingTitle => 'Files de musique réscan';

  @override
  String get deviceControlMenuTutorialText =>
      'Amun fa amun sa dan’n be sin sin Click Wheel nun kan naan amun a kwla fa mɛn’n i nun ninnge mun .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tin buton ng’ɔ o afiɛn’n su naan w’a fa like nga be flɛ i kɛ menu’n i nun like’n .';

  @override
  String get playPauseMenuTutorialText =>
      'Tin buton nga su naan w’a bo annzɛ w’a jran .';

  @override
  String get nextButtonMenuTutorialText =>
      'Tin buton sɔ’n su naan w’a sin jue ng’ɔ́ bá lɛ’n su .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tin buton sɔ’n su naan w’a kaci i wun ekun annzɛ w’a sa ɔ sin jue nga be dun mmua yili’n be su .';

  @override
  String get menuButtonTutorialText =>
      'Sɛ a tin buton sɔ’n su’n, á sá ɔ sin mɛn’n i nun lɔ. A kwla tin su naan a fa jran écran uflɛ su naan w’a ɔ mɛn’n i lika dan’n nun trele.';

  @override
  String get deviceScreenMenuTutorialText =>
      'I sɔ’n yɛle écran ng’ɔ yi i nglo’n. Screen nin Split Screen Mode be ti like kun mɔ be fa yo like’n, kpɛkun be kwla siesie be kpa lika sɔ’m be nun.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Fa ɔ sa dan’n sin sin Click Wheel su naan w’a kaci i nuan’n .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Sɛ a tin Center su’n, á fá kɔ́ lika nga be kunndɛ ba’n, nin scrubber bar’n, ɔ nin shuffle slider’n. Tin buton’n su naan w’a wun ninnge uflɛ wie mun ekun.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Sɛ a tin buton sɔ’n su naan w’a fa jue’n w’a ɔ i ɲrun’n .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tin buton sɔ’n su naan w’a yi jue’n i uflɛ .';

  @override
  String get deviceControlSearchTutorialText =>
      'Fa ɔ sa dan’n kɔ lika kan naan w’a yi alfabɛti kun w’a kle .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tin buton ng’ɔ o afiɛn’n su naan w’a fa alfabɛti nga be yili i nglo’n .';

  @override
  String get nextButtonSearchTutorialText =>
      'Tin buton sɔ’n su naan w’a fa lika kun w’a wlɛ i nun .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tin buton sɔ’n su naan w’a nunnun ndɛ mma kasiɛn’n .';

  @override
  String get menuButtonSearchTutorialText =>
      'Sɛ a tin buton sɔ’n su’n, á káci klaviɛti’n, kpɛkun á fá kɔ́ lika nga be kunndɛ’n .';

  @override
  String get allSongs => 'I n\'gba';
}
