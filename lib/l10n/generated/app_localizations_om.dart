// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oromo (`om`).
class AppLocalizationsOm extends AppLocalizations {
  AppLocalizationsOm([String locale = 'om']) : super(locale);

  @override
  String get appTitle => 'ClassiPod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Hayyama qaqqabummaa sagalee barbaachisa .';

  @override
  String get audioAccessPermissionContent =>
      'Maaloo faayiloota muuziqaa keessan akka taphannu nuuf hayyamaa faayiloota sagalee argachuu dandeessu.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Hayyamni qaqqabummaa sagalee dhorkame .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Mee faayiloota muuziqaa keessan akka taphannuuf appii kanaaf appii kanaaf qaqqabummaa kennuu.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Muuziqaa';

  @override
  String get nowPlayingScreenTitle => 'Amma taphachaa jira .';

  @override
  String get shuffleSongsMenuTitle => 'Sirboota Shuffle .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Sajoo .';

  @override
  String get aboutScreenTitle => 'Waa\'ee';

  @override
  String get coverFlowScreenTitle => 'Dhangala’aa haguuggii .';

  @override
  String get artistsScreenTitle => 'Artistoonni .';

  @override
  String get albumsScreenTitle => 'Albamoota .';

  @override
  String get songsScreenTitle => 'Sirboota .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Faarfannaa Afaan Oromoo',
      one: '1 Faarfannaa',
      zero: 'Faarfannaa Hin Qabu',
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
      other: '$countString Albamoota',
      one: '1 Albamii',
      zero: 'Albamii Hin Qabu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres .';

  @override
  String get genreSongsScreenTitle => 'Faarfannaa Genre .';

  @override
  String get deviceColorSettingTitle => 'Halluu meeshaa .';

  @override
  String get touchScreenSettingTitle => 'Iskiriinii tuquun dandeessifame .';

  @override
  String get repeatModeSettingTitle => 'Irra-deebi\'uu';

  @override
  String get repeatModeOne => 'Tokko';

  @override
  String get repeatModeAll => 'Hunda';

  @override
  String get vibrateSettingTitle => 'Raafama .';

  @override
  String get clickWheelSettingTitle => 'Sagaleewwan Gingilchaa cuqaasaa .';

  @override
  String get splitScreenSettingTitle => 'Haalata iskiriinii addaan baafame .';

  @override
  String get touchSoundsDialogTitle => 'Sagaleewwan tuquu .';

  @override
  String get touchSoundsDialogContent =>
      'Maaloo sagalee tuquu qindaa\'inoota sirnaa irraa sagalee wiil cuqaasuu dhaga\'uu dandeessisi .';

  @override
  String get immersiveModeSettingTitle => 'Haala keessa nama liqimsu .';

  @override
  String get showAppTutorialSettingTitle => 'Barnoota Agarsiisi .';

  @override
  String get changeDirectorySettingTitle => 'Galmee jijjiiri .';

  @override
  String get donateSettingTitle => 'Gumaachuu';

  @override
  String get donateSettingDescription =>
      'Yoo appii kana jaallattan arjoomuuf yaadaa.';

  @override
  String get versionAboutScreenTitle => 'Gosa';

  @override
  String get madeWithLoveTitle => '❤️ waliin kan hojjetame .';

  @override
  String get noMusicFilesFound => 'Muuziqaa hin qabu .';

  @override
  String get noArtistsFound => 'Artistoonni hin jiran .';

  @override
  String get noAlbumsFound => 'Albamii hin qabu .';

  @override
  String get unknownSong => 'Sirba hin beekamne .';

  @override
  String get unknownArtist => 'Artistii hin beekamne .';

  @override
  String get unknownAlbum => 'Albamii hin beekamne .';

  @override
  String get unknownGenre => 'Gosa hin beekamne .';

  @override
  String get buttonConfirmText => 'TOLE';

  @override
  String get tileValueOn => 'Irra';

  @override
  String get tileValueOff => 'Dhaamsuu';

  @override
  String get commonOfText => 'kan';

  @override
  String get pageNotFoundText => 'Fuulli kenname hin argamne .';

  @override
  String get commonErrorText => 'Dogoggora';

  @override
  String get retryButtonText => 'Irra deebi\'ii yaali .';

  @override
  String get filePickerDialogTitle => 'Muuziqaa sakatta\'uuf galmee filadhu .';

  @override
  String get searchScreenTitle => 'Barbaaduu';

  @override
  String get searchEmptyText => 'Bu\'aa barbaacha hin qabu .';

  @override
  String get searchResultsText => 'Bu\'aa barbaacha:';

  @override
  String get resultsForText => 'Bu\'aa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Battery Optimization Disable .';

  @override
  String get disableBatteryOptimizationContent =>
      'Maaloo appii kanaaf optimization meeshaa keessatti hojii duubaa muuziqaa akka taphachiisu gochuu.';

  @override
  String get languageScreenTitle => 'Afaan';

  @override
  String get silverDeviceColor => 'Nahaasii';

  @override
  String get blackDeviceColor => 'Gurraacha';

  @override
  String get resetSettingsTitle => 'Sajoolee irra deebi\'ii kaa\'i .';

  @override
  String get browseArtist => 'Artistii Browse .';

  @override
  String get browseAlbum => 'Albamii Daawwadhaa .';

  @override
  String get cancelText => 'Haquu';

  @override
  String get playlistsScreenTitle => 'Tarreewwan taphaa .';

  @override
  String get addToOnTheGoPlaylist => 'On-the-Go irratti dabaluu .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'On-the-Go irratti albama dabaluu .';

  @override
  String get removeSongFromThePlaylist => 'Tarree taphaa keessaa baasuu .';

  @override
  String get allAlbums => 'Albamoota hunda .';

  @override
  String get scanningMusicFiles => 'Faayilota Muuziqaa Scanning .';

  @override
  String get newPlaylist => 'Tarree Tapha Haaraa .';

  @override
  String get savePlaylist => 'Tarree taphaa qusadhaa .';

  @override
  String get clearPlaylist => 'Tarree taphaa ifa ta\'e .';

  @override
  String get rescanMusicFilesSettingTitle => 'Faayilota Muuziqaa Rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'Quba kee salphaatti naannoo wiil cuqaasi menu keessa naanna\'i .';

  @override
  String get centerButtonMenuTutorialText =>
      'Wanti menu calaqqise filachuuf qaree Giddugaleessaa dhiibi .';

  @override
  String get playPauseMenuTutorialText =>
      'Sirba tokko taphachuuf ykn dhaabuuf button kana dhiibi .';

  @override
  String get nextButtonMenuTutorialText =>
      'Gara sirba itti aanutti darbuuf button kana dhiibaa .';

  @override
  String get previousButtonMenuTutorialText =>
      'Duubatti deebi\'uuf button kana dhiibi ykn gara sirba duraatti deebi\'i .';

  @override
  String get menuButtonTutorialText =>
      'Gara menu duraatti deebi\'uuf button kana dhiibi. Kallattiin gara menu guddaatti akka deemtu iskiriinii biraa kamirraayyuu dhiibuu fi qabachuu dandeessa.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Kun iskiriinii agarsiisaati. Haalata iskiriinii tuquu fi qoqqoodamuun durtiidhan dandeessifamu fi qindaa\'inoota keessatti caalaatti qindaa\'uu danda\'a.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Quba kee sagalee sirreessuuf naannoo wheel cuqaasi .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Bar barbaa, barruu scrubber fi shuffle slider keessa marsaa gochuuf button giddu galeessaa dhiibi. Filannoo dabalataa argachuuf qaree Giddugaleessaa dhiibaa qabadhaa.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Faarfannaa saffisaan fuulduratti tarkaanfachiisuuf button kana dhiibaa qabadhaa .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Sirba sana duubatti deebisuuf button kana dhiibaa qabadhaa .';

  @override
  String get deviceControlSearchTutorialText =>
      'Quba kee salphaatti naannoo wiil cuqaasuutti sochoosi .';

  @override
  String get centerButtonSearchTutorialText =>
      'Qubee calaqqise filachuuf button giddu galeessaa dhiibi .';

  @override
  String get nextButtonSearchTutorialText =>
      'Bakka itti dabaluuf button kana dhiibaa .';

  @override
  String get previousButtonSearchTutorialText =>
      'Arfii dhumaa haquuf qaree kana dhiibi .';

  @override
  String get menuButtonSearchTutorialText =>
      'Kiiboodii cufuuf button kana dhiibiitii bu\'aa barbaacha waliin wal qunnami .';

  @override
  String get allSongs => 'Sirboota hunda .';
}
