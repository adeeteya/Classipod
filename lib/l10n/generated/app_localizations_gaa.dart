// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ga (`gaa`).
class AppLocalizationsGaa extends AppLocalizations {
  AppLocalizationsGaa([String locale = 'gaa']) : super(locale);

  @override
  String get appTitle => 'klas';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio He Hegbɛ ni abiɔ';

  @override
  String get audioAccessPermissionContent =>
      'Ofainɛ, ha bo faili ni anuɔ lɛ hegbɛ ni eha wɔtswa olalai lɛ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio He Ni Aaaya';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ofainɛ, ha bo faili ni anuɔ lɛ hegbɛ kɛha app nɛɛ yɛ tsɔne lɛ he gbɛjianɔtoo lɛ mli koni eha wɔtswa olalai lɛ.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Lala';

  @override
  String get nowPlayingScreenTitle => 'Amrɔ nɛɛ otswaa';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle lalai';

  @override
  String get shuffleSettingTitle => 'shishibii';

  @override
  String get settingsScreenTitle => 'gbɛjianɔtoi';

  @override
  String get aboutScreenTitle => 'Ehe';

  @override
  String get coverFlowScreenTitle => 'Hetoo';

  @override
  String get artistsScreenTitle => 'Nitɛŋlɔi';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Lalai';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lalai',
      one: '1 Lala',
      zero: 'Lalai Bɛ',
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
      other: '$countString Albɔm',
      one: '1 Albɔm',
      zero: 'Album ko bɛ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'hii';

  @override
  String get genreSongsScreenTitle => 'Gbalɛi';

  @override
  String get deviceColorSettingTitle => 'Device su';

  @override
  String get touchScreenSettingTitle => 'Taa Skrin lɛ nɔ';

  @override
  String get repeatModeSettingTitle => 'Ekoŋŋ';

  @override
  String get repeatModeOne => 'Ekome';

  @override
  String get repeatModeAll => 'Fɛɛ';

  @override
  String get vibrateSettingTitle => 'saramɔ';

  @override
  String get clickWheelSettingTitle => 'Klikimɔ Wheel Gbɛɛmɔ';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Taaimɔi';

  @override
  String get touchSoundsDialogContent =>
      'Ofainɛ, gbee Touch gbɛɛmɔi ni jɛ System Settings lɛ mli koni onu tsɔne ni akɛklikiɔ lɛ gbɛɛmɔ lɛ gbɛɛmɔi';

  @override
  String get immersiveModeSettingTitle => 'Mode ni haa mɔ tsui nyɔɔ emli';

  @override
  String get showAppTutorialSettingTitle => 'Tsɔɔmɔ nitsɔɔmɔ';

  @override
  String get changeDirectorySettingTitle => 'Tsakemɔ wolo';

  @override
  String get donateSettingTitle => 'Onia';

  @override
  String get donateSettingDescription =>
      'Kɛji osumɔɔ app nɛɛ, ofainɛ susumɔ onia he.';

  @override
  String get versionAboutScreenTitle => 'Henɔ';

  @override
  String get madeWithLoveTitle => 'Akɛ ❤️ fee kɛtsɔ';

  @override
  String get noMusicFilesFound => 'Lala bɛ';

  @override
  String get noArtistsFound => 'Nitɛŋmɔhe ko bɛ';

  @override
  String get noAlbumsFound => 'Albums ko bɛ';

  @override
  String get unknownSong => 'Aleee Lala';

  @override
  String get unknownArtist => 'Mɔ ni aleee nitɛŋlɔ lɛ .';

  @override
  String get unknownAlbum => 'Album ni aleee';

  @override
  String get unknownGenre => 'Gbɔmɔtso ni aleee';

  @override
  String get buttonConfirmText => 'YÓO';

  @override
  String get tileValueOn => 'Nɔ';

  @override
  String get tileValueOff => 'Gbeenaa';

  @override
  String get commonOfText => 'yɛ';

  @override
  String get pageNotFoundText => 'Anaaa baafa ni aha lɛ .';

  @override
  String get commonErrorText => 'Tɔmɔ';

  @override
  String get retryButtonText => 'kaimɔ';

  @override
  String get filePickerDialogTitle => 'Halamɔmɔ wolo ko kɛha Lala';

  @override
  String get searchScreenTitle => 'Taomɔ';

  @override
  String get searchEmptyText => 'Nɔ ko bɛ ni baanyɛ ajɛ mli aba';

  @override
  String get searchResultsText => 'Taomɔ Nɔ ni jɛ mli ba:';

  @override
  String get resultsForText => 'Nɔ ni jɛ mli ba:';

  @override
  String get disableBatteryOptimizationTitle => 'Gbelemɔ he nitsumɔ';

  @override
  String get disableBatteryOptimizationContent =>
      'Ofainɛ, gbemɔ batiri ni hi jogbaŋŋ kɛha app nɛɛ yɛ tsɔne lɛ he gbɛjianɔtoo mli koni eha lalai ni yɔɔ sɛɛgbɛ lɛ atswa.';

  @override
  String get languageScreenTitle => 'Wiemɔ';

  @override
  String get silverDeviceColor => 'Jwiɛtɛi';

  @override
  String get blackDeviceColor => 'Ediŋ';

  @override
  String get resetSettingsTitle => 'Hetoo';

  @override
  String get browseArtist => 'Kwɛmɔ Nitɛŋmɔ he nilelɔ';

  @override
  String get browseAlbum => 'Kwɛmɔ Album';

  @override
  String get cancelText => 'foo mli';

  @override
  String get playlistsScreenTitle => 'Shwɛmɔi';

  @override
  String get addToOnTheGoPlaylist => 'Kɛyafata On-The-Goo .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Kɛ Album afata On-The-Goo .';

  @override
  String get removeSongFromThePlaylist => 'Ajie kɛjɛ Playlist lɛ mli';

  @override
  String get allAlbums => 'Albums fɛɛ';

  @override
  String get scanningMusicFiles => 'Scaning Lala faili';

  @override
  String get newPlaylist => 'Playlist hee';

  @override
  String get savePlaylist => 'Save playlist';

  @override
  String get clearPlaylist => 'Kɔɔmɔ shwɛmɔ wolo';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Lala faili';

  @override
  String get deviceControlMenuTutorialText =>
      'Tsimɔ onine lɛ he fioo yɛ Click Wheel lɛ he koni oyakwɛ nɔ ni yɔɔ mli lɛ';

  @override
  String get centerButtonMenuTutorialText =>
      'Nyɛɛ teŋgbɛ button lɛ nɔ koni ohala nɔ ni ajie lɛ kpo lɛ';

  @override
  String get playPauseMenuTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni otswa loo omɛ lala ko';

  @override
  String get nextButtonMenuTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni okɛya lala ni nyiɛ sɛɛ lɛ nɔ';

  @override
  String get previousButtonMenuTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni okɛku sɛɛ loo oku osɛɛ oya lala ni tsɔ hiɛ lɛ nɔ';

  @override
  String get menuButtonTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni oku osɛɛ oya nɔ ni tsɔ hiɛ lɛ nɔ. Obaanyɛ onyɛ nɔ kɛjɛ skrin kroko fɛɛ skrip nɔ koni oya nɔ ni yɔɔ mli lɛ tɛ̃ɛ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Enɛ ji nɔ ni ajieɔ lɛ kpo lɛ nɔ. Touch Screen kɛ Split Screen Mode lɛ tsuɔ nii kɛtsɔ shishijee nɔ ni abaanyɛ ato he gbɛjianɔ babaoo yɛ gbɛjianɔtoo lɛ mli.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tsi oshishifãi lɛ kɛbɔle Click Wheel lɛ he koni otsake volume lɛ .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Nyɛɛ Center button lɛ nɔ koni otsɔ taomɔ bar, scrubber bar kɛ shuffle slider nɔ. Nyɛɛ Center button lɛ nɔ ni omɔ mli koni ona nibii krokomɛi ni obaanyɛ ohala.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Nyɛɛ nɔ ni omɔ mli koni okɛ lala lɛ aya hiɛ oya';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Nyɛɛ nɔ ni omɔ mli koni okɛ lala lɛ aku sɛɛ aba';

  @override
  String get deviceControlSearchTutorialText =>
      'Tsi oshishifa lɛ he fioo yɛ Click Wheel lɛ he koni okɛtsɔɔ niŋmaa okadii lɛ .';

  @override
  String get centerButtonSearchTutorialText =>
      'Nyɛɛ teŋgbɛ button lɛ nɔ koni ohala alfabɛta ni ajie lɛ kpo lɛ';

  @override
  String get nextButtonSearchTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni okɛ he ko afata he';

  @override
  String get previousButtonSearchTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni ojie naagbee niŋmaa lɛ';

  @override
  String get menuButtonSearchTutorialText =>
      'Nyɛɛ button nɛɛ nɔ koni oŋa keyboard lɛ ni okɛ taomɔ hetooi lɛ atsu nii';

  @override
  String get allSongs => 'Lalai lɛ fɛɛ';
}
