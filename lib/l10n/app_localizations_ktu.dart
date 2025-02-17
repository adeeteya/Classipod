// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kituba (`ktu`).
class AppLocalizationsKtu extends AppLocalizations {
  AppLocalizationsKtu([String locale = 'ktu']) : super(locale);

  @override
  String get appTitle => 'Kilasi';

  @override
  String get menuButtonText => 'MANU';

  @override
  String get audioAccessPermissionTitle => 'Nswa ya Audio Kelombaka';

  @override
  String get audioAccessPermissionContent =>
      'Beno pesa ba fichiers ya kuwidikila sambu na kupesa beto nzila ya kubula bafishe na beno ya miziki.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Nswa ya Audio Me Nswa';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Beno pesa bafishe ya kuwidikila sambu na appli yai na baparametre ya apareyi sambu na kupesa beto nzila ya kubula bafishe na beno ya miziki.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Miziki';

  @override
  String get nowPlayingScreenTitle => 'Ntangu yai Kusakana';

  @override
  String get shuffleSongsMenuTitle => 'Bankunga ya ke baluka-baluka';

  @override
  String get shuffleSettingTitle => 'Kubaluka';

  @override
  String get settingsScreenTitle => 'Baparametre';

  @override
  String get aboutScreenTitle => 'Kiteso ya';

  @override
  String get coverFlowScreenTitle => 'Kufika Flux';

  @override
  String get artistsScreenTitle => 'Ba artiste';

  @override
  String get albumsScreenTitle => 'Albes';

  @override
  String get songsScreenTitle => 'Bankunga';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bankunga',
      one: '1 Nkembo',
      zero: 'Bankunga ve',
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
      other: '$countString Ba alboum',
      one: '1 Album',
      zero: 'Alboum ve',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ba gènes';

  @override
  String get genreSongsScreenTitle => 'Nkunga ya Genre';

  @override
  String get deviceColorSettingTitle => 'Mukubu ya apareyi';

  @override
  String get touchScreenSettingTitle => 'Kusimba Ecran ya kusimba';

  @override
  String get repeatModeSettingTitle => 'Kuvutukila';

  @override
  String get repeatModeOne => 'Mosi';

  @override
  String get repeatModeAll => 'Yonso';

  @override
  String get vibrateSettingTitle => 'Kupasula';

  @override
  String get clickWheelSettingTitle => 'Fina Roue';

  @override
  String get splitScreenSettingTitle => 'Mode ya kukabula';

  @override
  String get touchSoundsDialogTitle => 'Kusimba Makelesa';

  @override
  String get touchSoundsDialogContent =>
      'Pardo, Kupesa Bamasini ya Kusimba Mambu ya Me katuka na Parametre ya Système sambu na kuwa makelele ya roue ya clique .';

  @override
  String get immersiveModeSettingTitle => 'Mode ya kukota na kati';

  @override
  String get showAppTutorialSettingTitle => 'Monisa Malongi';

  @override
  String get changeDirectorySettingTitle => 'Kusoba Disolo';

  @override
  String get donateSettingTitle => 'Kupesa makabu';

  @override
  String get donateSettingDescription =>
      'Kana nge ke zolaka appli yai, beno yindula kupesa makabu.';

  @override
  String get versionAboutScreenTitle => 'Versio';

  @override
  String get madeWithLoveTitle => 'Bo salaka yo ti ❤️ na .';

  @override
  String get noMusicFilesFound => 'Ata Miziki ve';

  @override
  String get noArtistsFound => 'Ata Arte ve';

  @override
  String get noAlbumsFound => 'Ata Albums ve';

  @override
  String get unknownSong => 'Nkunga ya Me Zabanaka Ve';

  @override
  String get unknownArtist => 'Artiste ya me zabana ve';

  @override
  String get unknownAlbum => 'Albumi ya Me Zabanaka Ve';

  @override
  String get unknownGenre => 'Genre ya me zabana ve';

  @override
  String get buttonConfirmText => 'MPIDINA';

  @override
  String get tileValueOn => 'Na zulu ya';

  @override
  String get tileValueOff => 'Na nganda';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Bo monaka ve lutiti yina .';

  @override
  String get commonErrorText => 'Kifu';

  @override
  String get retryButtonText => 'Kuyidika';

  @override
  String get filePickerDialogTitle =>
      'Pona Diskure mosi na Scan sambu na Miziki .';

  @override
  String get searchScreenTitle => 'Kusosa';

  @override
  String get searchEmptyText => 'Ata Kusosa Ve Bamvutu';

  @override
  String get searchResultsText => 'Bamvutu ya Kusosa:';

  @override
  String get resultsForText => 'Bamvutu sambu na:';

  @override
  String get disableBatteryOptimizationTitle => 'Kukanga Bateri ya mbote';

  @override
  String get disableBatteryOptimizationContent =>
      'Pardon, kanga batterie ya batterie sambu na appli yai na baparametre ya apareyi sambu na kupesa nzila na kubula na nima ya miziki.';

  @override
  String get languageScreenTitle => 'Ndinga';

  @override
  String get silverDeviceColor => 'Arza';

  @override
  String get blackDeviceColor => 'Ndombe';

  @override
  String get resetSettingsTitle => 'Baparametre';

  @override
  String get browseArtist => 'Muntu ya ke salaka bifwanisu';

  @override
  String get browseAlbum => 'Tala Album';

  @override
  String get cancelText => 'Kuyambula';

  @override
  String get playlistsScreenTitle => 'Bantu ya ke salaka bansaka';

  @override
  String get addToOnTheGoPlaylist => 'Yika na-Go-k';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Yika Album na-Go .';

  @override
  String get removeSongFromThePlaylist =>
      'Katula na Muntu yina ke bulaka bansaka .';

  @override
  String get allAlbums => 'Ba Album yonso';

  @override
  String get scanningMusicFiles => 'Bafishe ya Miziki ya Kusala';

  @override
  String get newPlaylist => 'Mu Lien ya Mpa';

  @override
  String get savePlaylist => 'Bumba Muselio';

  @override
  String get clearPlaylist => 'Liste ya pwelele';

  @override
  String get rescanMusicFilesSettingTitle => 'Bafishe ya Miziki';

  @override
  String get deviceControlMenuTutorialText =>
      'Tula musapi na nge na pete na nziunga ya Roue ya Climent sambu na kutambula na menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Fina bouton ya kati-kati sambu na kupona kima ya menu ya bo me tula dikebi .';

  @override
  String get playPauseMenuTutorialText =>
      'Fina bouton yai sambu na kubula to kupema nkunga .';

  @override
  String get nextButtonMenuTutorialText =>
      'Fina bouton yai sambu na kukwenda na nkunga yina ke landa .';

  @override
  String get previousButtonMenuTutorialText =>
      'Fina bouton yai sambu na kuvutukila to kuvutuka na nkunga ya ntete .';

  @override
  String get menuButtonTutorialText =>
      'Fina bouton yayi samu na kuvutuka na menu ya ntete. Nge lenda niema mpi kusimba yo na konso écran sambu na kukwenda mbala mosi na menu ya nene.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Yai kele ecran ya kumonisa. Mode ya kusimba mpi ya Kukabula ke pesa nzila na mutindu ya kukonda kukana mpi bo lenda tula yo na zulu ya baparametre.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tula musapi na nge na nziunga ya Roue ya Climent sambu na kusoba volime .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Fina bouton ya Centre sambu na kutambula na nzila ya bar, bar ya kuyobisa mpi curseur ya kuvukisa. Fina mpi simba buto ya Centre sambu na kubaka mitindu ya nkaka.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Fina mpi simba bouton yai sambu na kunata nswalu nkunga .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Fina mpi simba bouton yai sambu na kuvutula nkunga .';

  @override
  String get deviceControlSearchTutorialText =>
      'Tula musapi na nge na pete na nziunga ya Roue ya Kufimpa sambu na kutula dikebi na alfabe .';

  @override
  String get centerButtonSearchTutorialText =>
      'Fina bouton ya kati-kati sambu na kupona alfabe yina bo me tula dikebi .';

  @override
  String get nextButtonSearchTutorialText =>
      'Fina bouton yai sambu na kuyika kisika .';

  @override
  String get previousButtonSearchTutorialText =>
      'Fina bouton yai sambu na kufwa muntu ya nsuka .';

  @override
  String get menuButtonSearchTutorialText =>
      'Fina bouton yayi samu na kukanga clavier mpe kusala mambu na ba mvutu ya kusosa .';
}
