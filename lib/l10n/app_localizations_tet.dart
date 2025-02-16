// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tetum (`tet`).
class AppLocalizationsTet extends AppLocalizations {
  AppLocalizationsTet([String locale = 'tet']) : super(locale);

  @override
  String get appTitle => 'Klase';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Permisaun Asesu ba Audio ne’ebé presiza .';

  @override
  String get audioAccessPermissionContent => 'Favor ida fo asesu file audio atu permite ami atu toka ita nia file muzika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Lisensa Asesu ba Audio nega';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Favor ida fo asesu file audio ba app ida ne’e iha setting device hodi permite ami atu toka ita nia file muzika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Músika';

  @override
  String get nowPlayingScreenTitle => 'Agora Joga';

  @override
  String get shuffleSongsMenuTitle => 'Knananuk sira ne’ebé iha Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Konfigurasaun';

  @override
  String get aboutScreenTitle => 'Kona-ba';

  @override
  String get coverFlowScreenTitle => 'Fluxu Tapa';

  @override
  String get artistsScreenTitle => 'Artista';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Knananuk';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Knananuk sira',
      one: '1 Muzika',
      zero: 'Laiha knananuk sira',
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
      other: '$countString Álbum sira',
      one: '1 Álbun',
      zero: 'Laiha Álbun',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jeneru';

  @override
  String get genreSongsScreenTitle => 'Knananuk Jéneru';

  @override
  String get deviceColorSettingTitle => 'Dispozitivu Kór';

  @override
  String get touchScreenSettingTitle => 'Tela Toka Ativadu';

  @override
  String get repeatModeSettingTitle => 'Repete';

  @override
  String get repeatModeOne => 'Ida';

  @override
  String get repeatModeAll => 'Hotu-hotu';

  @override
  String get vibrateSettingTitle => 'Vibra';

  @override
  String get clickWheelSettingTitle => 'Klik Son Roda';

  @override
  String get splitScreenSettingTitle => 'Modu screen Screen';

  @override
  String get touchSoundsDialogTitle => 'Sona Toque';

  @override
  String get touchSoundsDialogContent => 'Favor Ativa Touch Sounds husi Settings atu rona lian klik roda .';

  @override
  String get immersiveModeSettingTitle => 'Modu Immerzivu';

  @override
  String get showAppTutorialSettingTitle => 'Hatudu Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Mudansa Diretóriu';

  @override
  String get donateSettingTitle => 'Doasaun';

  @override
  String get donateSettingDescription => 'Se ita gosta app ida ne’e, favor konsidera doasaun.';

  @override
  String get versionAboutScreenTitle => 'Versaun';

  @override
  String get madeWithLoveTitle => 'Halo ho ❤️ por';

  @override
  String get noMusicFilesFound => 'Laiha Múzika';

  @override
  String get noArtistsFound => 'Laiha Artista';

  @override
  String get noAlbumsFound => 'Laiha Album';

  @override
  String get unknownSong => 'Knananuk Deskoñesidu';

  @override
  String get unknownArtist => 'Artista Deskoñesidu';

  @override
  String get unknownAlbum => 'Album Deskoñesidu';

  @override
  String get unknownGenre => 'Géneru Deskoñesidu';

  @override
  String get buttonConfirmText => 'DI\'AK';

  @override
  String get tileValueOn => 'Iha';

  @override
  String get tileValueOff => 'Sai';

  @override
  String get commonOfText => 'husi';

  @override
  String get pageNotFoundText => 'Pájina ne’ebé fó la hetan .';

  @override
  String get commonErrorText => 'Erru';

  @override
  String get retryButtonText => 'Koko';

  @override
  String get filePickerDialogTitle => 'Hili Diretóriu ida ba Scan ba Múzika';

  @override
  String get searchScreenTitle => 'Ba buka';

  @override
  String get searchEmptyText => 'Laiha Rezultadu Peskiza';

  @override
  String get searchResultsText => 'Rezultadu Peskiza:';

  @override
  String get resultsForText => 'Rezultadu ba:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimizasaun Bateria Defisiente';

  @override
  String get disableBatteryOptimizationContent => 'Favor ida dezativa optimizasaun bateria ba app ne’e iha konfigurasaun dispozitivu hodi permite playback background husi múzika.';

  @override
  String get languageScreenTitle => 'Lingua';

  @override
  String get silverDeviceColor => 'Osan-mutin';

  @override
  String get blackDeviceColor => 'Metan';

  @override
  String get resetSettingsTitle => 'Settings Reset';

  @override
  String get browseArtist => 'Artista buka';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Kansela';

  @override
  String get playlistsScreenTitle => 'Playlista';

  @override
  String get addToOnTheGoPlaylist => 'Aumenta ba On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aumenta Album ba iha-Te-Go .';

  @override
  String get removeSongFromThePlaylist => 'Hasai husi Jogador .';

  @override
  String get allAlbums => 'Album hotu';

  @override
  String get scanningMusicFiles => 'Arkivu Múzika Scanning';

  @override
  String get newPlaylist => 'Jogadór foun';

  @override
  String get savePlaylist => 'Lista Jogamentu Poupa';

  @override
  String get clearPlaylist => 'Lista Jogadór Klaru';

  @override
  String get rescanMusicFilesSettingTitle => 'Arkivu Múzika Rescan';

  @override
  String get deviceControlMenuTutorialText => 'Muda ita-nia liman-fuan boot ho kmaan iha Wheel Click nia sorin-sorin hodi navega menu .';

  @override
  String get centerButtonMenuTutorialText => 'Tekan butaun sentru hodi hili item menu ne’ebé destakadu .';

  @override
  String get playPauseMenuTutorialText => 'Prense butaun ne’e hodi toka ka pauza knananuk ida .';

  @override
  String get nextButtonMenuTutorialText => 'Prense butaun ne\'e hodi skip ba knananuk tuir mai';

  @override
  String get previousButtonMenuTutorialText => 'Prense butaun ne\'e hodi rewind ka fila fali ba knananuk anterior .';

  @override
  String get menuButtonTutorialText => 'Prense butaun ne’e atu ba fali menu uluk. Ita bele hanehan no kaer husi kualker ekran seluk atu direitamente ba iha menu prinsipal.';

  @override
  String get deviceScreenMenuTutorialText => 'Ida ne’e mak ekran display. Toque Screen no Modu Screen Screen ativadu ho default no bele konfigura liu tan iha settings.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Muda ita-nia liman-fuan boot haleu Klik Roda hodi ajusta volume .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Prense butaun Center hodi halo siklu liu husi barra buka, scrubber bar no shuffle slider. Prense no kaer metin butaun Center hodi asesu ba opsaun adisional.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Prense no kaer butaun ne\'e hodi fast forward ba knananuk .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Prense no kaer butaun ne’e hodi rewind knananuk .';

  @override
  String get deviceControlSearchTutorialText => 'Muda ita-nia liman-fuan boot ho kmaan iha Wheel nia sorin-sorin hodi destaka alfabetu ida .';

  @override
  String get centerButtonSearchTutorialText => 'Tekan butaun sentru hodi hili alfabetu ne’ebé destakadu .';

  @override
  String get nextButtonSearchTutorialText => 'Tekan butaun ne’e hodi aumenta espasu ida .';

  @override
  String get previousButtonSearchTutorialText => 'Tekan butaun ne’e hodi apaga karakter ikus .';

  @override
  String get menuButtonSearchTutorialText => 'Tekan butaun ne’e hodi taka keyboard no interasaun ho rezultadu peskiza .';
}
