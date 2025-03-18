// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tiv (`tiv`).
class AppLocalizationsTiv extends AppLocalizations {
  AppLocalizationsTiv([String locale = 'tiv']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Audio Audio Audio Audio Audio yange na';

  @override
  String get audioAccessPermissionContent =>
      'We a rumun yô, na se ian i eren tom a ufaya mba u soo u eren tom a mi la.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Audio Audio yange na';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'We a rumun yô, na se ian i eren tom a app ne ken akaa a i eren tom a mi la sha er se wa ufaya ou mba kuhwan ityogholough la yô.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Kwaghkuhwan';

  @override
  String get nowPlayingScreenTitle => 'Hegen u eren anumbe';

  @override
  String get shuffleSongsMenuTitle => 'Icam i wan';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Akaawan';

  @override
  String get aboutScreenTitle => 'Sha kwagh u';

  @override
  String get coverFlowScreenTitle => 'U eren tom a Flow';

  @override
  String get artistsScreenTitle => 'Mba eren ityogholough';

  @override
  String get albumsScreenTitle => 'Ahwa';

  @override
  String get songsScreenTitle => 'Icam i wan';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Atsam',
      one: '1 Icam',
      zero: 'Atsam nga ga',
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
      other: '$countString Albam',
      one: '1 Albam',
      zero: 'Albam ngu ga',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Atôatyev';

  @override
  String get genreSongsScreenTitle => 'Icam i wan';

  @override
  String get deviceColorSettingTitle =>
      'Or u nan lu a tahav mbu eren kwagh la.';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Enabled .';

  @override
  String get repeatModeSettingTitle => 'Kimbir';

  @override
  String get repeatModeOne => 'Môm';

  @override
  String get repeatModeAll => 'Cii';

  @override
  String get vibrateSettingTitle => 'Vihi';

  @override
  String get clickWheelSettingTitle => 'Kighir U Sounds';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Touch Ukaan';

  @override
  String get touchSoundsDialogContent =>
      'Wea soo u ungwan ityogholough mbi i yer ér System Settings la sha u ungwan ityogholough mbi i yer ér click wheel la .';

  @override
  String get immersiveModeSettingTitle => 'Imangersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'Tese Tese buter';

  @override
  String get changeDirectorySettingTitle => 'Mgem';

  @override
  String get donateSettingTitle => 'Nagh';

  @override
  String get donateSettingDescription =>
      'Aluer u soo app ne yô, hen sha kwagh u nan iyua.';

  @override
  String get versionAboutScreenTitle => 'Kwaghuhe';

  @override
  String get madeWithLoveTitle => 'I er ❤️ sha .';

  @override
  String get noMusicFilesFound => 'No Icam';

  @override
  String get noArtistsFound => 'Mba eren ityogholough ga';

  @override
  String get noAlbumsFound => 'No Album';

  @override
  String get unknownSong => 'Icam i i fe i ga';

  @override
  String get unknownArtist => 'Or u fan kwagh u ityogholough ga';

  @override
  String get unknownAlbum => 'Album';

  @override
  String get unknownGenre => 'Genese';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Sha';

  @override
  String get tileValueOff => 'Pir';

  @override
  String get commonOfText => 'u';

  @override
  String get pageNotFoundText => 'I zua a peeji u i ne la ga .';

  @override
  String get commonErrorText => 'Isholio';

  @override
  String get retryButtonText => 'kimbir ôron';

  @override
  String get filePickerDialogTitle =>
      'Tsua kwagh u u soo u eren sha u zuan a Music .';

  @override
  String get searchScreenTitle => 'Keren';

  @override
  String get searchEmptyText => 'Kwagh u a dugh ker ga';

  @override
  String get searchResultsText => 'Ker kwagh u a dugh ker yô:';

  @override
  String get resultsForText => 'Kwagh u a dugh ker yô:';

  @override
  String get disableBatteryOptimizationTitle => 'Kwagh u vihin tsung';

  @override
  String get disableBatteryOptimizationContent =>
      'We a rumun yô, batiri u a lu a inja ga la ngu ken akaa a i eren tom a mi la sha er u na or nana ungwa ityogholough mbi ken ijime yô.';

  @override
  String get languageScreenTitle => 'Zwa';

  @override
  String get silverDeviceColor => 'Azurufa';

  @override
  String get blackDeviceColor => 'Il';

  @override
  String get resetSettingsTitle => 'Akaa a memen';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'bunde';

  @override
  String get playlistsScreenTitle => 'Mbayevkasev mba eren anumbe';

  @override
  String get addToOnTheGoPlaylist => 'Seer sha On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Seer Album sha On-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Dugh ken Playlist .';

  @override
  String get allAlbums => 'Akaa a Album cii';

  @override
  String get scanningMusicFiles => 'Uifi mba Iyuan';

  @override
  String get newPlaylist => 'U Playlist u he';

  @override
  String get savePlaylist => 'Save Playlist';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Mbaaie mba Inyamtoho';

  @override
  String get deviceControlMenuTutorialText =>
      'Mough sha ikyav you la sha Click Wheel sha u eren kwagh u u soo la .';

  @override
  String get centerButtonMenuTutorialText =>
      'Kighir hen ijiir i u soo u eren kwaghyan u i yer ér menu la .';

  @override
  String get playPauseMenuTutorialText =>
      'Kighir button ne sha er u ungwa shin u mem yô .';

  @override
  String get nextButtonMenuTutorialText =>
      'Kighir button ne sha er u skip sha icam i i dondo la .';

  @override
  String get previousButtonMenuTutorialText =>
      'Kighir button ne sha er u hide u ôô iyol shin u hide u za wa icam i i kar la yô .';

  @override
  String get menuButtonTutorialText =>
      'Kighir button ne sha er u hide u za hen kwaghyan u a kar la yô. U ngu a kôr shi u kôr un sha hanma ikyav igen cii sha er u za hen ijiir i vesen la jighilii yô.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ka ikyav i tesen kwagh ne je ne. Ior mba ve lu a mnenge u vough sha kwagh u mlu u ken hemen la, ka ve nenge ér mlu u ken hemen la una lu sha inja ga. トウuチシスクリンとスプリティスクリーン・モードは,データを使うことができます。';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mough sha ikyav you i Click Wheel la sha er u gema mlu u volume la yô .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Ka u eren tom a button u Center la sha u keren bar, u eren ikyav mbi eren tom a mi la man shuffle slider. Ka u eren tom a button la sha er u zua a akaa agen a u er yô.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Ka u eren tom a button ne sha er u za hemen a icam la fese yô .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Ka u eren tom a button ne sha er u hide u wa icam la yô .';

  @override
  String get deviceControlSearchTutorialText =>
      'Mough sha ityough ki Click Wheel la sha u tesen alphabet .';

  @override
  String get centerButtonSearchTutorialText =>
      'Kighir ikyondo i i yer ér center la sha er u tsua alphabet u i tese la yô .';

  @override
  String get nextButtonSearchTutorialText =>
      'Kighir button ne sha er u seer ijiir yô .';

  @override
  String get previousButtonSearchTutorialText =>
      'Kighir button ne sha er u delete or u masetyô la .';

  @override
  String get menuButtonSearchTutorialText =>
      'Kighir button ne sha er u cir keyboard la shi u er kwagh a kwagh u u soo u keren la yô .';

  @override
  String get allSongs => 'Icam i wan cii';
}
