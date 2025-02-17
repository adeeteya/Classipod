// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ligurian (`lij`).
class AppLocalizationsLij extends AppLocalizations {
  AppLocalizationsLij([String locale = 'lij']) : super(locale);

  @override
  String get appTitle => 'ClassePod';

  @override
  String get menuButtonText => 'MEU';

  @override
  String get audioAccessPermissionTitle =>
      'Permiscion de l\'accesso audio Requixito';

  @override
  String get audioAccessPermissionContent =>
      'Pe favô, concede l\'accesso a-i file audio pe permette de sunâ i vòstri file de muxica.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Permiscion de l\'accesso audio Denegou';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Pe favô, concede l\'accesso a-i file audio pe st\'app inte impostaçioin do dispoxitivo pe permette de sunâ i vòstri file de muxica.';

  @override
  String get menuScreenTitle => 'menû';

  @override
  String get musicMenuScreenTitle => 'Muxica';

  @override
  String get nowPlayingScreenTitle => 'Ora zugando';

  @override
  String get shuffleSongsMenuTitle => 'Cansoin sciortie';

  @override
  String get shuffleSettingTitle => 'Fombente';

  @override
  String get settingsScreenTitle => 'Impostensa';

  @override
  String get aboutScreenTitle => 'Pöcassæ';

  @override
  String get coverFlowScreenTitle => 'Cresce de Copertua';

  @override
  String get artistsScreenTitle => 'archivini';

  @override
  String get albumsScreenTitle => 'Accòrdi';

  @override
  String get songsScreenTitle => 'candele';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Cansoin',
      one: '1 Canson',
      zero: 'Nisciuña Canson',
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
      zero: 'Nisciun album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Geso';

  @override
  String get genreSongsScreenTitle => 'Cansoin de genere';

  @override
  String get deviceColorSettingTitle => 'Colore do dispoxitivo';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Affidabile';

  @override
  String get repeatModeSettingTitle => 'Repete';

  @override
  String get repeatModeOne => 'Un';

  @override
  String get repeatModeAll => 'Tutti';

  @override
  String get vibrateSettingTitle => 'Vibra';

  @override
  String get clickWheelSettingTitle => 'Clicca in sce Reua Son';

  @override
  String get splitScreenSettingTitle => 'Modo de schermo de split';

  @override
  String get touchSoundsDialogTitle => 'Toccole tocco';

  @override
  String get touchSoundsDialogContent =>
      'Pe favô, Attiva i soin de tocco da-e Impostaçioin do scistema pe ascoltâ i soin de reua de clic';

  @override
  String get immersiveModeSettingTitle => 'Modo immerscivo';

  @override
  String get showAppTutorialSettingTitle => 'Mostra Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Cangiâ a Direçion';

  @override
  String get donateSettingTitle => 'Donâ';

  @override
  String get donateSettingDescription =>
      'Se ti piaxe st\'app, pe favô, pensâ à donâ.';

  @override
  String get versionAboutScreenTitle => 'Verscion';

  @override
  String get madeWithLoveTitle => 'Fato con ❤️ pe';

  @override
  String get noMusicFilesFound => 'Nisciuña muxica';

  @override
  String get noArtistsFound => 'No artisti';

  @override
  String get noAlbumsFound => 'Nisciun Albus';

  @override
  String get unknownSong => 'Canson desconosciua';

  @override
  String get unknownArtist => 'Artista desconosciuo';

  @override
  String get unknownAlbum => 'Albusto desconosciuo';

  @override
  String get unknownGenre => 'Genê desconosciuo';

  @override
  String get buttonConfirmText => 'VA BEN';

  @override
  String get tileValueOn => 'Sciù';

  @override
  String get tileValueOff => 'Asmòrto';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'A pagina dæta a no s\'é attrovâ';

  @override
  String get commonErrorText => 'Errô';

  @override
  String get retryButtonText => 'Repiggiâ';

  @override
  String get filePickerDialogTitle =>
      'Seleçionâ un Directory a-a Scangia pe-a muxica';

  @override
  String get searchScreenTitle => 'Çercâ';

  @override
  String get searchEmptyText => 'Nisciun resultato de reçerca';

  @override
  String get searchResultsText => 'Resultati de reçerca:';

  @override
  String get resultsForText => 'I exiti pe:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Ottimizzaçion disabilitâ de disabili';

  @override
  String get disableBatteryOptimizationContent =>
      'Pe favô, disattivâ l\'ottimizzaçion de battëie pe st\'app inte impostaçioin do dispoxitivo pe permette a reproduçion do sfondo da muxica.';

  @override
  String get languageScreenTitle => 'Lengua';

  @override
  String get silverDeviceColor => 'Argento';

  @override
  String get blackDeviceColor => 'Neigro';

  @override
  String get resetSettingsTitle => 'Impostaçioin resettâ';

  @override
  String get browseArtist => 'Artista soffito';

  @override
  String get browseAlbum => 'Sfoggiâ Albus';

  @override
  String get cancelText => 'Scassa';

  @override
  String get playlistsScreenTitle => 'Alists de zugo';

  @override
  String get addToOnTheGoPlaylist => 'Azzonta a-o O-Te-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Azzonta Album à l\'on-Te-Go';

  @override
  String get removeSongFromThePlaylist => 'Retiâ da-a lista de zugo';

  @override
  String get allAlbums => 'Tutti i Albus';

  @override
  String get scanningMusicFiles => 'Scane de Scangia File';

  @override
  String get newPlaylist => 'Neuva lista de zugo';

  @override
  String get savePlaylist => 'Salvâ o zeugo';

  @override
  String get clearPlaylist => 'Alista de Playlista ciæa';

  @override
  String get rescanMusicFilesSettingTitle => 'File de Muxica de Rescal';

  @override
  String get deviceControlMenuTutorialText =>
      'Mesciâ o polegâ de lengê in gio a-a reua Clicca pe navigâ into menù';

  @override
  String get centerButtonMenuTutorialText =>
      'Premme o botton çentrâ pe seleçionâ l\'elemento de menù evidençiou';

  @override
  String get playPauseMenuTutorialText =>
      'Premme sto botton pe sonâ ò fâ unna pausa unna canson';

  @override
  String get nextButtonMenuTutorialText =>
      'Premme sto botton pe saltâ a-a canson apreuvo';

  @override
  String get previousButtonMenuTutorialText =>
      'Premme sto botton pe fâ renovâ ò tornâ a-a canson passâ';

  @override
  String get menuButtonTutorialText =>
      'Premme sto botton pe tornâ a-o menù preçedente. O porrieiva appressâlo e tegnîlo da quæ se segge atro schermo pe anâ direttamente a-o menù prinçipâ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Sto chì o l\'é o schermo de visualizzaçion. O schermo de tocco e a modalitæ scritta split son attivæ pe automatico e peuan ëse configuræ ancon de ciù inte impostaçioin.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Sposta o polegâ in gio a-a reua Clicca pe regolâ o volumme';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Premme o botton do Çentro pe çiclâ pe mezo da barra, unna barra de scrubber e de cursô de sfummatua. Premme e tegnî o botton do Çentro pe açede à de opçioin in ciù.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Premme e tegnî sto botton pe inversâ a canson';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Premme e tegnî sto botton pe reverze a canson';

  @override
  String get deviceControlSearchTutorialText =>
      'Mesciâ o polegâ de lengê in gio a-a reua de clic pe mette in luxe un alfabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Premme o botton çentrale pe seleçionâ l’alfabeto evidençiou';

  @override
  String get nextButtonSearchTutorialText =>
      'Premme sto botton pe azzonze un spaçio';

  @override
  String get previousButtonSearchTutorialText =>
      'Premme sto botton pe cancellâ l\'urtimo carattere';

  @override
  String get menuButtonSearchTutorialText =>
      'Premme sto botton pe serrâ o tastierino e interagî co-i resultati de reçerca';
}
