// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bambara (`bm`).
class AppLocalizationsBm extends AppLocalizations {
  AppLocalizationsBm([String locale = 'bm']) : super(locale);

  @override
  String get appTitle => 'Classipod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Audio Access ka yamaruya wajibiyalen don .';

  @override
  String get audioAccessPermissionContent =>
      'Aw ye aw jija ka a lamɛntaw sɔrɔ walasa an ka se k’aw ka dɔnkiliw da.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Access Permission Denie .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Aw ye aw jija ka odio filew sɔrɔ nin appli in na minɛnw sigicogo la walasa an ka se k’aw ka dɔnkiliw da.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Fɔli';

  @override
  String get nowPlayingScreenTitle => 'Sisan tulon kɛ .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle dɔnkiliw .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Settings .';

  @override
  String get aboutScreenTitle => 'Kan';

  @override
  String get coverFlowScreenTitle => 'Cover flow .';

  @override
  String get artistsScreenTitle => 'Artistes .';

  @override
  String get albumsScreenTitle => 'Albamuw .';

  @override
  String get songsScreenTitle => 'Dɔnkiliw .';

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
      zero: 'Dɔnkili tɛ yen',
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
      other: '$countString Albamuw',
      one: '1 Albamu',
      zero: 'Albamu tɛ yen',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres .';

  @override
  String get genreSongsScreenTitle => 'Dɔnkiliw ni ɲɔgɔn cɛ .';

  @override
  String get deviceColorSettingTitle => 'Minɛn kulɛri .';

  @override
  String get touchScreenSettingTitle => 'Screen touché enable .';

  @override
  String get repeatModeSettingTitle => 'Seginkan';

  @override
  String get repeatModeOne => 'Kelen';

  @override
  String get repeatModeAll => 'Bɛɛ';

  @override
  String get vibrateSettingTitle => 'Vibrate .';

  @override
  String get clickWheelSettingTitle => 'Click Wheel mankanw .';

  @override
  String get splitScreenSettingTitle => 'Écran split mode .';

  @override
  String get touchSoundsDialogTitle => 'Touch mankanw .';

  @override
  String get touchSoundsDialogContent =>
      'Aw ye Touch Sounds daminɛ ka bɔ sistɛmu sigicogo la walasa ka Click Wheel mankanw mɛn .';

  @override
  String get immersiveModeSettingTitle => 'Mode min bɛ mɔgɔ su ji la .';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial jira .';

  @override
  String get changeDirectorySettingTitle => 'Yɛlɛma don ɲɛbilasɛbɛn na .';

  @override
  String get donateSettingTitle => 'Ka saraka bɔ';

  @override
  String get donateSettingDescription =>
      'Ni nin appli ka di i ye, i ka jateminɛ kɛ ka bolomafara di.';

  @override
  String get versionAboutScreenTitle => 'Wɛrisiyɔn';

  @override
  String get madeWithLoveTitle => 'A dilannen don ni ❤️ ye .';

  @override
  String get noMusicFilesFound => 'No Musique .';

  @override
  String get noArtistsFound => 'No Artistes .';

  @override
  String get noAlbumsFound => 'Albamuw tɛ yen .';

  @override
  String get unknownSong => 'Dɔnkili dɔnbali .';

  @override
  String get unknownArtist => 'Dɔnkilidala dɔnbali .';

  @override
  String get unknownAlbum => 'Albamu dɔnbali .';

  @override
  String get unknownGenre => 'genre dɔnbali .';

  @override
  String get buttonConfirmText => 'N SƆNNA';

  @override
  String get tileValueOn => 'Kan';

  @override
  String get tileValueOff => 'K\'a bɔ a la';

  @override
  String get commonOfText => 'ka';

  @override
  String get pageNotFoundText => 'ɲɛ min dira , o ma sɔrɔ .';

  @override
  String get commonErrorText => 'Filijuru';

  @override
  String get retryButtonText => 'Retry .';

  @override
  String get filePickerDialogTitle =>
      'Aw ye gafe ɲɛ dɔ sugandi walasa ka dɔnkiliw lajɛ .';

  @override
  String get searchScreenTitle => 'Ɲini';

  @override
  String get searchEmptyText => 'no search results .';

  @override
  String get searchResultsText => 'Ɲiniw jaabiw:';

  @override
  String get resultsForText => 'Résultats de :';

  @override
  String get disableBatteryOptimizationTitle =>
      'Battery optimisation disable .';

  @override
  String get disableBatteryOptimizationContent =>
      'Aw ye Battery Optimisation bali nin appli in na minɛnw sigicogo la walasa ka se ka dɔnkilidacogo kɔkan.';

  @override
  String get languageScreenTitle => 'Kan';

  @override
  String get silverDeviceColor => 'Warijɛ';

  @override
  String get blackDeviceColor => 'Finman';

  @override
  String get resetSettingsTitle => 'Settings reset .';

  @override
  String get browseArtist => 'Browse Artiste .';

  @override
  String get browseAlbum => 'Browse album .';

  @override
  String get cancelText => 'ka dankari';

  @override
  String get playlistsScreenTitle => 'Playlists .';

  @override
  String get addToOnTheGoPlaylist => 'Aw bɛ fara o kan .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'A fara album kan ka on-the-go .';

  @override
  String get removeSongFromThePlaylist => 'Aw bɛ bɔ fɔlisenw na .';

  @override
  String get allAlbums => 'Albamu bɛɛ .';

  @override
  String get scanningMusicFiles => 'Scanning Music Files .';

  @override
  String get newPlaylist => 'playlist kura .';

  @override
  String get savePlaylist => 'Save playlist .';

  @override
  String get clearPlaylist => 'ƝƐFƆLI MIN BƐ KƐ .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan music files .';

  @override
  String get deviceControlMenuTutorialText =>
      'Aw bɛ aw bolokɔni bolokɔni lamaga nɔgɔya la klikɛli wotoro lamini na walasa ka menu (yɔrɔ) lajɛ .';

  @override
  String get centerButtonMenuTutorialText =>
      'Butɔn cɛmancɛ digi walasa ka menu yɔrɔ jira min jiralen bɛ .';

  @override
  String get playPauseMenuTutorialText =>
      'Aw bɛ nin butɔni digi walasa ka dɔnkili dɔ da walima ka a jɔ .';

  @override
  String get nextButtonMenuTutorialText =>
      'O butɔni digi walasa ka tɛmɛ dɔnkili nata kan .';

  @override
  String get previousButtonMenuTutorialText =>
      'Aw bɛ nin butɔni digi walasa ka segin kɔ walima ka segin dɔnkili tɛmɛnen kan .';

  @override
  String get menuButtonTutorialText =>
      'O butɔni digi walasa ka segin menu tɛmɛnen kan. I bɛ se k’a digi ani k’a minɛ ka bɔ ekran wɛrɛ la walasa ka taa yɔrɔba la.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Nin ye jiralan ye. Touch screen ani split screen mode bɛ baara kɛ ka ɲɛ ani u bɛ se ka labɛn ka taa a fɛ settings kɔnɔ.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Aw bɛ aw bolokɔnincinin lamaga klikɛli wotoro lamini na walasa ka a bonya ladilan .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Aw bɛ cɛmancɛ butɔni digi walasa ka cycle through sek bar, scrubber bar ani shuffle slider. Butɔn digi cɛmancɛ la ani k’a minɛ walasa ka se ka sugandi wɛrɛw sɔrɔ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Aw bɛ nin butɔni digi ka a minɛ walasa ka dɔnkili in teliya .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Aw bɛ nin butɔni digi ka a minɛ walasa ka dɔnkili in lasegin .';

  @override
  String get deviceControlSearchTutorialText =>
      'Aw bɛ aw bolokɔni bolokɔni lamaga nɔgɔya la klikɛli wotoro lamini na walasa ka alfabɛti dɔ jira .';

  @override
  String get centerButtonSearchTutorialText =>
      'Butɔn cɛmancɛ digi walasa ka alfabɛti min jiralen don, o sugandi .';

  @override
  String get nextButtonSearchTutorialText =>
      'O butɔni digi walasa ka yɔrɔ dɔ fara a kan .';

  @override
  String get previousButtonSearchTutorialText =>
      'O butɔni digi walasa ka sɛbɛnni laban bɔ .';

  @override
  String get menuButtonSearchTutorialText =>
      'O butɔni digi walasa ka klaviyeti datugu ani ka baara kɛ ni ɲinini jaabiw ye .';

  @override
  String get allSongs => 'Dɔnkiliw bɛɛ .';
}
