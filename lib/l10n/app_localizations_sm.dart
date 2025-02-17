// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Samoan (`sm`).
class AppLocalizationsSm extends AppLocalizations {
  AppLocalizationsSm([String locale = 'sm']) : super(locale);

  @override
  String get appTitle => 'Vasega vasega';

  @override
  String get menuButtonText => 'Lisi';

  @override
  String get audioAccessPermissionTitle => 'Avanoa Audio Avanoa Manaomia';

  @override
  String get audioAccessPermissionContent =>
      'Faʻamolemole faʻafesoʻotaʻi Audio faila avanoa e faʻatagaina ai matou e taʻalo au musika faila.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ua le toe mauaina le faʻatagaina o le faʻaaogaina';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Faʻamolemole faʻafesoʻotaʻi Audio faila avanoa mo lenei polokalama i le masini faʻatulaga e faʻatagaina ai matou e taʻalo au musika faila.';

  @override
  String get menuScreenTitle => 'Lisi';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Fai nei';

  @override
  String get shuffleSongsMenuTitle => 'Shufle pese';

  @override
  String get shuffleSettingTitle => 'Malolo';

  @override
  String get settingsScreenTitle => 'Tulaga';

  @override
  String get aboutScreenTitle => 'Uiga';

  @override
  String get coverFlowScreenTitle => 'Ufiufi tafe';

  @override
  String get artistsScreenTitle => 'Tusiata';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Pese';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Pese',
      one: '1 Pese',
      zero: 'Leai Pese',
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
      one: '1 Album',
      zero: 'Leai ni Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ituaiga';

  @override
  String get genreSongsScreenTitle => 'Pese mataga';

  @override
  String get deviceColorSettingTitle => 'Masini lanu';

  @override
  String get touchScreenSettingTitle => 'Tago le Screen scred';

  @override
  String get repeatModeSettingTitle => 'Toe fai';

  @override
  String get repeatModeOne => 'Tasi';

  @override
  String get repeatModeAll => 'Uma';

  @override
  String get vibrateSettingTitle => 'Galulu';

  @override
  String get clickWheelSettingTitle => 'Kiliki uili leo';

  @override
  String get splitScreenSettingTitle => 'Split screen mode';

  @override
  String get touchSoundsDialogTitle => 'Tago leo';

  @override
  String get touchSoundsDialogContent =>
      'Faʻamolemole mafai ona paʻi leo mai le system tulaga e faʻalogo ai i le kiliki uili leo';

  @override
  String get immersiveModeSettingTitle => 'Faatomeina faiga';

  @override
  String get showAppTutorialSettingTitle => 'Faaali i le tutorial';

  @override
  String get changeDirectorySettingTitle => 'Suia Mau';

  @override
  String get donateSettingTitle => 'Lafo mai';

  @override
  String get donateSettingDescription =>
      'A e fiafia i lenei app, faʻamolemole mafaufau foaʻi.';

  @override
  String get versionAboutScreenTitle => 'Lolomi';

  @override
  String get madeWithLoveTitle => 'Faia ma ❤️ e';

  @override
  String get noMusicFilesFound => 'Leai se musika';

  @override
  String get noArtistsFound => 'Leai ni tusiata';

  @override
  String get noAlbumsFound => 'Leai se album';

  @override
  String get unknownSong => 'Pese le iloa';

  @override
  String get unknownArtist => 'Le iloa tusiata';

  @override
  String get unknownAlbum => 'Le iloa album';

  @override
  String get unknownGenre => 'Le iloa le iloa';

  @override
  String get buttonConfirmText => 'Ua lelei';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Ese';

  @override
  String get commonOfText => 'o';

  @override
  String get pageNotFoundText => 'E le i maua le itulau';

  @override
  String get commonErrorText => 'Mea sese';

  @override
  String get retryButtonText => 'Toe taumafai';

  @override
  String get filePickerDialogTitle => 'Filifili se faʻatonuga e suʻe ai musika';

  @override
  String get searchScreenTitle => 'Sailiga';

  @override
  String get searchEmptyText => 'Leai se sailiga iuga';

  @override
  String get searchResultsText => 'Saili tali:';

  @override
  String get resultsForText => 'Faaiuga mo:';

  @override
  String get disableBatteryOptimizationTitle => 'Faʻamuta le faʻamau';

  @override
  String get disableBatteryOptimizationContent =>
      'Faʻamolemole tape le paʻu o loʻo i ai mo lenei app i le masini faʻatulaga e faʻatagaina ai le faʻamatalaga o le musika.';

  @override
  String get languageScreenTitle => 'Gagana';

  @override
  String get silverDeviceColor => 'Siliva';

  @override
  String get blackDeviceColor => 'Lanu uliuli';

  @override
  String get resetSettingsTitle => 'Toe setiina tulaga';

  @override
  String get browseArtist => 'Browse tusiata';

  @override
  String get browseAlbum => 'Browse album';

  @override
  String get cancelText => 'Faaleaogaina';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Faaopopo i le-le-alu';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Faaopopo Album i le-le-alu';

  @override
  String get removeSongFromThePlaylist => 'Aveese mai le playlist';

  @override
  String get allAlbums => 'Uma album';

  @override
  String get scanningMusicFiles => 'Scanling Togafitiga Musika faila';

  @override
  String get newPlaylist => 'Taaloga Fou';

  @override
  String get savePlaylist => 'Sefe Playlist';

  @override
  String get clearPlaylist => 'Manino playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Faleoloa o le tagata resitara';

  @override
  String get deviceControlMenuTutorialText =>
      'Agai i luga o lou limamatua e latalata i le kiliki uili e folau ai le menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Fetaomi le ogatotonu faamau e filifili ai le maualuga auala menu';

  @override
  String get playPauseMenuTutorialText =>
      'Fetaomi lenei ki e taalo pe taofi se pese';

  @override
  String get nextButtonMenuTutorialText =>
      'Fetaomi lenei ki e oso ai i le isi pese';

  @override
  String get previousButtonMenuTutorialText =>
      'Fetaomi lenei ki e toe foi pe toe foi i le pese muamua';

  @override
  String get menuButtonTutorialText =>
      'Fetaomi lenei ki e toe foi ai i le lisi muamua. Oe mafai ona fetaomi ma taofi mai i se isi mata e alu tonu i le lisi autu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'O le faʻaaliga lea o le mata. O le paʻi atu i le Screen ma Split Screen Mode e mafai ai e le masani ai ma mafai ona faʻatulagaina atili i le tulaga.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Faʻasolo lou limamatua i le kiliki o le uili e faʻapipiʻi ai le voluma';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Fetaomi le Center button e taamilosaga e ala i le saili pa, scrubber bar ma shuffle slider. Fetaomi ma taofi le ogatotonu faamau e ulufale ai i isi filifiliga.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Fetaomi ma taofi lenei ki e vave agai i luma le pese';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Fetaomi ma taofi lenei ki e toe tusi ai le pese';

  @override
  String get deviceControlSearchTutorialText =>
      'Agai i luga o lou limamatua i luga o le kiliki uili e faamamafa ai se mataitusi';

  @override
  String get centerButtonSearchTutorialText =>
      'Fetaomi le ogatotonu faamau e filifili ai le maualuga o le alafapeta';

  @override
  String get nextButtonSearchTutorialText =>
      'Fetaomi lenei ki e faaopoopo ai se avanoa';

  @override
  String get previousButtonSearchTutorialText =>
      'Fetaomi lenei ki e tape le uiga mulimuli';

  @override
  String get menuButtonSearchTutorialText =>
      'Fetaomi lenei ki e tapunia le keyboard ma fegalegaleai ma le sailiga iuga';
}
