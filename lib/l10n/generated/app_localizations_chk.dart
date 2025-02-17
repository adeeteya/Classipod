// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chuukese (`chk`).
class AppLocalizationsChk extends AppLocalizations {
  AppLocalizationsChk([String locale = 'chk']) : super(locale);

  @override
  String get appTitle => 'KlasP';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Ekkewe Chon Angei Ra Angei';

  @override
  String get audioAccessPermissionContent =>
      'Kopwe ngeni ekkewe chon fiti ewe mwich pwe repwe tongeni mut ngeni kich ach sipwe fiti om kewe mwich.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ewe Chon Apungupung A Angei';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Kopwe mut ngeni ekkewe chon fiti repwe fiti ei app non ewe nenien pisek pwe repwe mut ngeni kich ach sipwe fiti omw kewe file.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Niketikitik';

  @override
  String get nowPlayingScreenTitle => 'Iei a fis';

  @override
  String get shuffleSongsMenuTitle => 'Songun';

  @override
  String get shuffleSettingTitle => 'Tufich';

  @override
  String get settingsScreenTitle => 'Settin';

  @override
  String get aboutScreenTitle => 'Porousan';

  @override
  String get coverFlowScreenTitle => 'Kopwe Fiu .';

  @override
  String get artistsScreenTitle => 'ekkewe chon fori';

  @override
  String get albumsScreenTitle => 'Albom';

  @override
  String get songsScreenTitle => 'NA';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Köl',
      one: '1 Keen',
      zero: 'Ese wor Song',
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
      other: '$countString Ekkewe albom',
      one: '1 Albom',
      zero: 'Ese wor albom',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ekkewe anuon';

  @override
  String get genreSongsScreenTitle => 'Ekkewe Köl mi Fel';

  @override
  String get deviceColorSettingTitle => 'Kolor';

  @override
  String get touchScreenSettingTitle => 'To Angei A tongeni .';

  @override
  String get repeatModeSettingTitle => 'Enniwini';

  @override
  String get repeatModeOne => 'Eu';

  @override
  String get repeatModeAll => 'Meinisin';

  @override
  String get vibrateSettingTitle => 'Amwara';

  @override
  String get clickWheelSettingTitle => 'Klik won ekkewe Sopai';

  @override
  String get splitScreenSettingTitle => 'Ekkewe Skresen .';

  @override
  String get touchSoundsDialogTitle => 'Tounun Aramas .';

  @override
  String get touchSoundsDialogContent =>
      'Kopwe Angei Seni Aramas Seni System pwe kopwe rongorong ewe ngingin klack .';

  @override
  String get immersiveModeSettingTitle => 'Mokutukut mi weires';

  @override
  String get showAppTutorialSettingTitle => 'Pwarata';

  @override
  String get changeDirectorySettingTitle => 'Siwinin Ekkesiwin';

  @override
  String get donateSettingTitle => 'Niffang ngeni';

  @override
  String get donateSettingDescription =>
      'Ika ka sani ei app, kose mochen kopwe awora.';

  @override
  String get versionAboutScreenTitle => 'Eoch sokkun';

  @override
  String get madeWithLoveTitle => 'A fis ren ❤️ ren .';

  @override
  String get noMusicFilesFound => 'Ese wor Mus';

  @override
  String get noArtistsFound => 'Ese wor chon for pisek';

  @override
  String get noAlbumsFound => 'Ese wor Albom';

  @override
  String get unknownSong => 'Ewe Kol mi sinei';

  @override
  String get unknownArtist => 'Ewe Chon Forata mi itefouno';

  @override
  String get unknownAlbum => 'Ese fat ika Abum';

  @override
  String get unknownGenre => 'Ese sinei usun';

  @override
  String get buttonConfirmText => 'EWER';

  @override
  String get tileValueOn => 'Won';

  @override
  String get tileValueOff => 'Of';

  @override
  String get commonOfText => 'no translation';

  @override
  String get pageNotFoundText => 'Ewe pekin taropwe mi kawor ese kuna .';

  @override
  String get commonErrorText => 'Mwanino';

  @override
  String get retryButtonText => 'Repwe';

  @override
  String get filePickerDialogTitle =>
      'Fili eu Kinikinin Scrac fan iten Sikaik .';

  @override
  String get searchScreenTitle => 'Kutta';

  @override
  String get searchEmptyText => 'Ese wor Emon Rekor Re kutta .';

  @override
  String get searchResultsText => 'Kutta ekkewe Pisek:';

  @override
  String get resultsForText => 'Mwirimwirin:';

  @override
  String get disableBatteryOptimizationTitle => 'Achocho';

  @override
  String get disableBatteryOptimizationContent =>
      'Kopwe fokkun pwapwa ren ei app non ewe nenien pisek pwe epwe mut ngeni ewe angangen fiti urumot.';

  @override
  String get languageScreenTitle => 'Fosun ekis';

  @override
  String get silverDeviceColor => 'Sinfer';

  @override
  String get blackDeviceColor => 'Chchon';

  @override
  String get resetSettingsTitle => 'Ekkewe Pisekin Angang .';

  @override
  String get browseArtist => 'Ewe Chon Pwarata';

  @override
  String get browseAlbum => 'Angei Albom';

  @override
  String get cancelText => 'Eukano';

  @override
  String get playlistsScreenTitle => 'Ekkewe chon kaeo';

  @override
  String get addToOnTheGoPlaylist => 'Apacha ngeni On-Ewe-Fel .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Apacha Album ngeni On-Ewe-Fel .';

  @override
  String get removeSongFromThePlaylist => 'Kopwe angei seni ewe Chon Aiti .';

  @override
  String get allAlbums => 'Meinisin Albom';

  @override
  String get scanningMusicFiles => 'Ekkewe Faminien Aramas .';

  @override
  String get newPlaylist => 'Ekkewe minefoon Chon Pwarata';

  @override
  String get savePlaylist => 'Ewe Chon Pwarata';

  @override
  String get clearPlaylist => 'Ewe chon ffat';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Ekkewe pisekin maun mi tongeni fis';

  @override
  String get deviceControlMenuTutorialText =>
      'Kopwe suki om we asam ngeni ewe Klik won Wick pwe kopwe fetan won ewe menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Kopwe fiti ewe biton seni ewe nefinen pwe kopwe finata ewe pisekin menu mi auchea .';

  @override
  String get playPauseMenuTutorialText =>
      'Kopwe suki ei button pwe kopwe fiti are asoso eu kol .';

  @override
  String get nextButtonMenuTutorialText =>
      'Kopwe suki ei bloton pwe kopwe fiti ewe köl mwirin .';

  @override
  String get previousButtonMenuTutorialText =>
      'Kopwe suki ei bloton pwe kopwe niwinsefan ika niwin ngeni ewe kon me mwan .';

  @override
  String get menuButtonTutorialText =>
      'Kopwe suki ei button pwe kopwe niwin ngeni ewe menu me mwan. Ka tongeni suki me amwochu seni meinisin ekkewe ekkoch scare pwe kopwe pwisin feilo ngeni ewe menukon.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Iei ewe kapasen pwarata. Toropween Screen me ekkewe pisekin angang mi fis fan iten ekkewe pisek ra tongeni fis me ra tongeni kon fitikoko non ekkewe neni.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Kopwe äeä pöük le äeä ewe föün äsefich pwe epwe siwili ewe puk .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Kopwe pwarata ewe puun Center pwe kopwe fiti ewe angangen kutta bar, brabber me ekkewe sling mi fitikoko. Kopwe suki me amwochu ewe puun Cent pwe kopwe tongeni angei pwan ekkoch tufich.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Kopwe fiti me amwochu ei but pwe kopwe mwitir ngeni ewe kon .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Kopwe fiti me amwochu ei button pwe kopwe niwinsefaniti ewe kon .';

  @override
  String get deviceControlSearchTutorialText =>
      'Kopwe suki om we asam ngeni ewe Wiik Wick pwe epwe menlapei eu alfabet .';

  @override
  String get centerButtonSearchTutorialText =>
      'Kopwe fiti ewe biton seni ewe puun pwe kopwe filatá ewe alfabet mi menlapei .';

  @override
  String get nextButtonSearchTutorialText =>
      'Kopwe äeä ei föün äsefich pwe kopwe apacha ngeni eü leeni .';

  @override
  String get previousButtonSearchTutorialText =>
      'Kopwe suki ei ngonuk pwe kopwe amoielo ewe amuchunon mak .';

  @override
  String get menuButtonSearchTutorialText =>
      'Kopwe pwarata ei button pwe kopwe suki ewe asam me chiechi ngeni ekkewe pisekin kutta .';
}
