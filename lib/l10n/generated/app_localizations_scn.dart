// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sicilian (`scn`).
class AppLocalizationsScn extends AppLocalizations {
  AppLocalizationsScn([String locale = 'scn']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Pirmessu di l\'accessu audio.';

  @override
  String get audioAccessPermissionContent =>
      'Si prega di cuncediri li file àudiu pi pirmèttiricci di sunari li file musicali.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Pirmessu d\'accessu audio nigatu';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Si prega di cuncediri l\'accessu ê file àudiu pi sta app nnî paràmitri dû dispusitivu pi pirmèttiricci di sunari li file musicali.';

  @override
  String get menuScreenTitle => 'Menù';

  @override
  String get musicMenuScreenTitle => 'Mùsica';

  @override
  String get nowPlayingScreenTitle => 'Ora jucari';

  @override
  String get shuffleSongsMenuTitle => 'Canti di pizzu';

  @override
  String get shuffleSettingTitle => 'Pizzu';

  @override
  String get settingsScreenTitle => 'Impostazzioni';

  @override
  String get aboutScreenTitle => 'Circa';

  @override
  String get coverFlowScreenTitle => 'Flussu di cupirtina';

  @override
  String get artistsScreenTitle => 'Arti';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Canti';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Canzuni',
      one: '1 Canzuna',
      zero: 'Nisciuna canzuna',
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
      other: '$countString Album',
      one: '1 Album',
      zero: 'Nuddu àlbum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gèricu';

  @override
  String get genreSongsScreenTitle => 'Canti di gèniri';

  @override
  String get deviceColorSettingTitle => 'Culuri dû dispusitivu';

  @override
  String get touchScreenSettingTitle => 'Accessiva lu schermu';

  @override
  String get repeatModeSettingTitle => 'Ripètiri';

  @override
  String get repeatModeOne => 'Unu';

  @override
  String get repeatModeAll => 'Tutti';

  @override
  String get vibrateSettingTitle => 'vibbrari';

  @override
  String get clickWheelSettingTitle => 'Clicca Lunaru';

  @override
  String get splitScreenSettingTitle => 'Modu Scherzu';

  @override
  String get touchSoundsDialogTitle => 'Toccari';

  @override
  String get touchSoundsDialogContent =>
      'Si prega di Attivari li soni di l\'impostazzioni dû sistema pi sèntiri li soni dû rota.';

  @override
  String get immersiveModeSettingTitle => 'Modu immersivu';

  @override
  String get showAppTutorialSettingTitle => 'Mustra tutorial';

  @override
  String get changeDirectorySettingTitle => 'Canciamentu dû Diritturi';

  @override
  String get donateSettingTitle => 'Dunari';

  @override
  String get donateSettingDescription =>
      'Si ti piaci sta app, ti pregu di cunzidirari la dunazzioni.';

  @override
  String get versionAboutScreenTitle => 'Virsiuni';

  @override
  String get madeWithLoveTitle => 'Fatti cu ❤️ pi';

  @override
  String get noMusicFilesFound => 'Nisciuna musica';

  @override
  String get noArtistsFound => 'Nisciunu artisti';

  @override
  String get noAlbumsFound => 'Nisciuna Àurmi';

  @override
  String get unknownSong => 'Canzuna scanusciuta';

  @override
  String get unknownArtist => 'Artista scanusciutu';

  @override
  String get unknownAlbum => 'Scanusciutu Album';

  @override
  String get unknownGenre => 'Genre scanusciutu';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Supra';

  @override
  String get tileValueOff => 'Astutatu';

  @override
  String get commonOfText => 'di';

  @override
  String get pageNotFoundText => 'A pàggina data nun fu truvata';

  @override
  String get commonErrorText => 'Erruri';

  @override
  String get retryButtonText => 'Rivatu';

  @override
  String get filePickerDialogTitle => 'Scegghi nu Diritoriu pâ Scan pâ musica';

  @override
  String get searchScreenTitle => 'Circari';

  @override
  String get searchEmptyText => 'Risultati di ricerca';

  @override
  String get searchResultsText => 'Risultati di ricerca:';

  @override
  String get resultsForText => 'Risultati pi:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disattiva l\'uttimizzazzioni dâ battirìa';

  @override
  String get disableBatteryOptimizationContent =>
      'Si prega di disattivari l\'ottimizzazzioni dâ battirìa pi sta app nnî paràmitri dû dispusitivu pi cunsentiri la riproduzzioni di sfunnu dâ musica.';

  @override
  String get languageScreenTitle => 'Lingua';

  @override
  String get silverDeviceColor => 'Argentu';

  @override
  String get blackDeviceColor => 'Nìguru';

  @override
  String get resetSettingsTitle => 'Impostazzioni di riinizziamentu';

  @override
  String get browseArtist => 'Artista navigabbili';

  @override
  String get browseAlbum => 'Sfoglia album';

  @override
  String get cancelText => 'sfai';

  @override
  String get playlistsScreenTitle => 'Playlist';

  @override
  String get addToOnTheGoPlaylist => 'Aggiungi a On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aggiungi Album a On-Go';

  @override
  String get removeSongFromThePlaylist => 'Rimuovi dâ Playlist';

  @override
  String get allAlbums => 'Tutti l\'àlpi';

  @override
  String get scanningMusicFiles => 'Fasci di scanziuni';

  @override
  String get newPlaylist => 'Nova Lista';

  @override
  String get savePlaylist => 'Playlist di salvataggiu';

  @override
  String get clearPlaylist => 'Playlist chiaru';

  @override
  String get rescanMusicFilesSettingTitle => 'Fascini di musica rescacana';

  @override
  String get deviceControlMenuTutorialText =>
      'Spustati lu pollici ntunnu â Clicca Wheel pi navigari ô menù';

  @override
  String get centerButtonMenuTutorialText =>
      'Primi lu buttuni cintrali pi scègghiri l\'articulu dû menù suttaliniatu';

  @override
  String get playPauseMenuTutorialText =>
      'Prima stu buttuni pi sunari o fari na pausa';

  @override
  String get nextButtonMenuTutorialText =>
      'Prima stu buttuni pi saltari â canzuna appressu';

  @override
  String get previousButtonMenuTutorialText =>
      'Prima stu buttuni ppi ricurdiri o turnari â canzuni pricidenti';

  @override
  String get menuButtonTutorialText =>
      'Prima stu buttuni pi turnari ô menù pricidenti. Putissi apprìmiri e tènirilu di qualegghiè autru schermu pi jiri direttamenti ô menù principali.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Chistu è lu schermu dû schermu. Lu Modu di Schermu di Touch e Screen su\' attivati ​​pi difautu e ponnu èssiri cunfigurati cchiù assai nnî paràmitri.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Spustati lu pollici ntunnu â Clicca Wheel pi aggiustari lu vulumi';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Primi lu buttuni Center pi ciclari attraversu la barra, la barra di lavaggiu e lu cursuri di smuppu. Prima e tèniri lu buttuni Center pi accèdiri a autri opzzioni.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Premi e teniri stu buttuni ppiloti avanti la canzuni';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Premi e teniri stu buttune pi ritruvari la canzuni';

  @override
  String get deviceControlSearchTutorialText =>
      'Spustati liggermenti lu pollici ntunnu â Clicca Wheel pi suttaliniari n\'alfabbetu';

  @override
  String get centerButtonSearchTutorialText =>
      'Primi lu buttuni cintrali pi scègghiri l\'alfabbetu suttaliniatu';

  @override
  String get nextButtonSearchTutorialText =>
      'Primi stu buttuni pi agghiùnciri nu spazziu';

  @override
  String get previousButtonSearchTutorialText =>
      'Prima stu buttuni pi cancillari l\'ùrtimu caràttiri';

  @override
  String get menuButtonSearchTutorialText =>
      'Prima stu buttuni pi chiudiri la tastiera e ntiraggìsciri chî risurtati di circata';
}
