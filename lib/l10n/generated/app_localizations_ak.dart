// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Akan (`ak`).
class AppLocalizationsAk extends AppLocalizations {
  AppLocalizationsAk([String locale = 'ak']) : super(locale);

  @override
  String get appTitle => 'Classipod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Odio a wɔde kɔ hɔ ho kwan a wɔhwehwɛ .';

  @override
  String get audioAccessPermissionContent =>
      'Yɛsrɛ sɛ ma yɛn kwan ma yɛmfa audio fael mma na ama yɛatumi abɔ wo nnwom fael no.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ɔdio kwan ho kwan a wɔapow .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Yɛsrɛ sɛ ma ɔdio fael kwan mma saa app yi wɔ device settings no mu na ama yɛatumi abɔ wo nnwom fael no.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Nnwom';

  @override
  String get nowPlayingScreenTitle => 'Afei deɛ woredi agorɔ .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle nnwom .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Nsiesiei .';

  @override
  String get aboutScreenTitle => 'Fa ho';

  @override
  String get coverFlowScreenTitle => 'Nkataso a ɛsen .';

  @override
  String get artistsScreenTitle => 'Mfoniniyɛfo .';

  @override
  String get albumsScreenTitle => 'Albums .';

  @override
  String get songsScreenTitle => 'Nnwom .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nnwom',
      one: '1 dwom',
      zero: 'Nnwom biara nni hɔ',
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
      other: '$countString Albums',
      one: '1 album',
      zero: 'Dilds biara nni hɔ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Nsɛm a wɔahyehyɛ .';

  @override
  String get genreSongsScreenTitle => 'genre nnwom .';

  @override
  String get deviceColorSettingTitle => 'Mfiri kɔla .';

  @override
  String get touchScreenSettingTitle => 'Touch Screen no yɛ adwuma .';

  @override
  String get repeatModeSettingTitle => 'Ti mu';

  @override
  String get repeatModeOne => 'Baako';

  @override
  String get repeatModeAll => 'Nyinaa';

  @override
  String get vibrateSettingTitle => 'Ɛwosow .';

  @override
  String get clickWheelSettingTitle => 'Klik Wheel Sounds so .';

  @override
  String get splitScreenSettingTitle => 'Split screen mode .';

  @override
  String get touchSoundsDialogTitle => 'Ka nnyigyei ahorow ho asɛm .';

  @override
  String get touchSoundsDialogContent =>
      'Yɛsrɛ sɛ ma wo nsa nka nnyigyei a efi System Settings mu no na woate sɛ woabɔ wo ho so .';

  @override
  String get immersiveModeSettingTitle => 'Immersive mode .';

  @override
  String get showAppTutorialSettingTitle => 'Kyerɛ nkyerɛkyerɛ .';

  @override
  String get changeDirectorySettingTitle => 'Sesa daerekta .';

  @override
  String get donateSettingTitle => 'Yi boa';

  @override
  String get donateSettingDescription =>
      'Sɛ w’ani gye saa app yi ho a, yɛsrɛ wo susuw ntoboa ho.';

  @override
  String get versionAboutScreenTitle => 'Ɔfa';

  @override
  String get madeWithLoveTitle => 'Wɔde ❤️ yɛɛ no ​​.';

  @override
  String get noMusicFilesFound => 'Nnwom biara nni hɔ .';

  @override
  String get noArtistsFound => 'Mfoniniyɛfo biara nni hɔ .';

  @override
  String get noAlbumsFound => 'Album biara nni hɔ .';

  @override
  String get unknownSong => 'Dwom a Wonnim .';

  @override
  String get unknownArtist => 'Mfoniniyɛfo a wonnim no .';

  @override
  String get unknownAlbum => 'Album a wonnim .';

  @override
  String get unknownGenre => 'Nsɛm a wonnim .';

  @override
  String get buttonConfirmText => 'YOO';

  @override
  String get tileValueOn => 'So';

  @override
  String get tileValueOff => 'Adum';

  @override
  String get commonOfText => 'firi';

  @override
  String get pageNotFoundText => 'Wɔanhu kratafa a wɔde ama no .';

  @override
  String get commonErrorText => 'Mfomsoɔ';

  @override
  String get retryButtonText => 'San sɔ hwɛ .';

  @override
  String get filePickerDialogTitle => 'Paw directory bi a wobɛ scan ma nnwom .';

  @override
  String get searchScreenTitle => 'Hwehwɛ';

  @override
  String get searchEmptyText => 'Nhwehwɛmu biara nni hɔ a wɔhwehwɛ .';

  @override
  String get searchResultsText => 'Nhwehwɛmu a wɔyɛe:';

  @override
  String get resultsForText => 'Nea efi mu ba ne sɛ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Ma battery a ɛyɛ papa no nyɛ adwuma yiye .';

  @override
  String get disableBatteryOptimizationContent =>
      'Yɛsrɛ sɛ gyae battery optimization ma saa app yi wɔ device settings no mu na ama woatumi abɔ nnwom akyi nnwom.';

  @override
  String get languageScreenTitle => 'Kasa';

  @override
  String get silverDeviceColor => 'Sereba';

  @override
  String get blackDeviceColor => 'Tuntum';

  @override
  String get resetSettingsTitle => 'Reset nhyehyɛe ahorow no .';

  @override
  String get browseArtist => 'Browse artist .';

  @override
  String get browseAlbum => 'Browse Album .';

  @override
  String get cancelText => 'Twam';

  @override
  String get playlistsScreenTitle => 'Playlists .';

  @override
  String get addToOnTheGoPlaylist => 'Fa ka on-the-go ho .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Fa album ka on-the-go ho .';

  @override
  String get removeSongFromThePlaylist => 'Yi fi playlist no mu .';

  @override
  String get allAlbums => 'Albums nyinaa .';

  @override
  String get scanningMusicFiles => 'Scanning nnwom fael ahorow .';

  @override
  String get newPlaylist => 'Playlist foforo .';

  @override
  String get savePlaylist => 'Sie playlist .';

  @override
  String get clearPlaylist => 'Playlist a emu da hɔ .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan nnwom fael ahorow .';

  @override
  String get deviceControlMenuTutorialText =>
      'Fa wo nsateaa no twa klike no ho kakra na fa kɔ menu no mu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Mia Centre button no so na paw menu asɛm a wɔasi so dua no .';

  @override
  String get playPauseMenuTutorialText =>
      'Mia saa bɔtn yi so na bɔ dwom bi anaasɛ gyina kakra .';

  @override
  String get nextButtonMenuTutorialText =>
      'Mia saa bɔtn yi so na skip kɔ dwom a edi hɔ no so .';

  @override
  String get previousButtonMenuTutorialText =>
      'Mia saa bɔtn yi so na san kɔ anaasɛ san kɔ dwom a atwam no so .';

  @override
  String get menuButtonTutorialText =>
      'Mia saa bɔtn yi so na san kɔ menu a atwam no so. Wubetumi amia na woakura mu afi screen foforo biara so na woakɔ menu titiriw no so tẽẽ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Eyi ne display screen no. Touch Screen ne Split Screen mode no yɛ default na wobetumi asiesie no akɔ akyiri wɔ nhyehyɛe no mu.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Fa wo nsateaa no twa click wheel no ho hyia na sesa volume no .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Mia mfinimfini bɔtn no so na fa cycle fa hwehwɛ bar, scrubber bar ne shuffle slider so. Mia na kura mfinimfini bɔtn no so na woanya akwan foforo a wobɛfa so.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Mia na kura saa bɔtn yi mu na ama dwom no akɔ w’anim ntɛmntɛm .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Mia na kura saa bɔtn yi mu na ama dwom no asan akɔ akyi .';

  @override
  String get deviceControlSearchTutorialText =>
      'Fa wo nsateaa no twa click wheel no ho kakra na ama woatumi asi nkyerɛwde bi so dua .';

  @override
  String get centerButtonSearchTutorialText =>
      'Mia mfinimfini bɔtn no so na paw nkyerɛwde a wɔasi so dua no .';

  @override
  String get nextButtonSearchTutorialText =>
      'Mia saa bɔtn yi so na fa baabi bi ka ho .';

  @override
  String get previousButtonSearchTutorialText =>
      'Mia saa bɔtn yi so na popa nkyerɛwde a etwa to no .';

  @override
  String get menuButtonSearchTutorialText =>
      'Mia saa bɔtn yi so na to keyboard no mu na wo ne search results no nni nkitaho .';

  @override
  String get allSongs => 'Nnwom nyinaa .';
}
