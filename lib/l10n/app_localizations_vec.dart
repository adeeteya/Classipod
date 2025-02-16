// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Venetian (`vec`).
class AppLocalizationsVec extends AppLocalizations {
  AppLocalizationsVec([String locale = 'vec']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Permesso de Audio Accesso Accesso Recusa.';

  @override
  String get audioAccessPermissionContent => 'Te prego, concesion audio el permeter de far el so file de ła muxica.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Accesso Acesso Accesso Accesso Denito';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Par piaser, concede a l’aceso de audio pa sta aplicasion de aplicasion pa permetarne de far i vostri file de muxica.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Mùsica';

  @override
  String get nowPlayingScreenTitle => 'Adesso zogar';

  @override
  String get shuffleSongsMenuTitle => 'Canti de rèscole';

  @override
  String get shuffleSettingTitle => 'Nastro';

  @override
  String get settingsScreenTitle => 'inpostasion';

  @override
  String get aboutScreenTitle => 'Calche';

  @override
  String get coverFlowScreenTitle => 'Coperta Filo';

  @override
  String get artistsScreenTitle => 'Artisti';

  @override
  String get albumsScreenTitle => 'Albumi';

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
      other: '$countString Canti',
      one: '1 Canson',
      zero: 'No canson',
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
      zero: 'No album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Geri';

  @override
  String get genreSongsScreenTitle => 'Canti del genere';

  @override
  String get deviceColorSettingTitle => 'Colore del devizio';

  @override
  String get touchScreenSettingTitle => 'Toca Screna Abilitada';

  @override
  String get repeatModeSettingTitle => 'Ripètar';

  @override
  String get repeatModeOne => 'Uno';

  @override
  String get repeatModeAll => 'Tuti';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Clicca One sona';

  @override
  String get splitScreenSettingTitle => 'Modo de Scren';

  @override
  String get touchSoundsDialogTitle => 'El toc El sone';

  @override
  String get touchSoundsDialogContent => 'Par piasér Toc el sona da Sistema Inpostasion pa sentir ła roda de roda del clic';

  @override
  String get immersiveModeSettingTitle => 'Modalità imersiva';

  @override
  String get showAppTutorialSettingTitle => 'Mostra';

  @override
  String get changeDirectorySettingTitle => 'Canbia ła Diretoria';

  @override
  String get donateSettingTitle => 'Donar';

  @override
  String get donateSettingDescription => 'Se te piase sta aplicasion, te par piaxer de donar.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Fato con ❤️ da';

  @override
  String get noMusicFilesFound => 'No Musica';

  @override
  String get noArtistsFound => 'No Artisti';

  @override
  String get noAlbumsFound => 'No Album';

  @override
  String get unknownSong => 'Sconoto Canto';

  @override
  String get unknownArtist => 'Sconosùo Artista';

  @override
  String get unknownAlbum => 'Sconosùo Album';

  @override
  String get unknownGenre => 'No sconosùo el Genre';

  @override
  String get buttonConfirmText => 'BON';

  @override
  String get tileValueOn => 'So';

  @override
  String get tileValueOff => 'Stuà';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'No se ga catà ła pajina .';

  @override
  String get commonErrorText => 'Eror';

  @override
  String get retryButtonText => 'Ripression';

  @override
  String get filePickerDialogTitle => 'Sełesiona na Diretoria a Scan par ła Musica';

  @override
  String get searchScreenTitle => 'Sercar';

  @override
  String get searchEmptyText => 'No ghe xe ła risulta';

  @override
  String get searchResultsText => 'Cerca Risulta:';

  @override
  String get resultsForText => 'Risulta par:';

  @override
  String get disableBatteryOptimizationTitle => 'Ła stabiłixasion de ła bataria';

  @override
  String get disableBatteryOptimizationContent => 'Par piasér otimixasion de bataria pa sta aplicasion pa ła muxica de ła muxica.';

  @override
  String get languageScreenTitle => 'Léngua';

  @override
  String get silverDeviceColor => 'Arzento';

  @override
  String get blackDeviceColor => 'Nero';

  @override
  String get resetSettingsTitle => 'Resete inpostasion';

  @override
  String get browseArtist => 'Browse Artista';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Anula';

  @override
  String get playlistsScreenTitle => 'Fogołisti';

  @override
  String get addToOnTheGoPlaylist => 'Aggiungere su O-La-Va';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Aggiungere Album a O-La-Go';

  @override
  String get removeSongFromThePlaylist => 'Cava dal Playłista';

  @override
  String get allAlbums => 'Tuti i Albumi';

  @override
  String get scanningMusicFiles => 'Scantando file de Musica .';

  @override
  String get newPlaylist => 'Novo Playłista';

  @override
  String get savePlaylist => 'Salva Playłista';

  @override
  String get clearPlaylist => 'Playłista ciaro';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescal Files .';

  @override
  String get deviceControlMenuTutorialText => 'Sposta el pollice leggermente intorno al Click Rota da navigar el menù';

  @override
  String get centerButtonMenuTutorialText => 'Premi el pulsante sentro pa sełesionar el menù minu evidensià';

  @override
  String get playPauseMenuTutorialText => 'Preme sto boton par zugar o pausa na canson';

  @override
  String get nextButtonMenuTutorialText => 'Preme sto boton da saltare a ła canson dopo';

  @override
  String get previousButtonMenuTutorialText => 'Preme sto boton par rimensar o tornar al canto precedente .';

  @override
  String get menuButtonTutorialText => 'Premi sto boton par tornar indrio al menù precedente. Podevi premere e tegnerlo da qualsiasi altro schermo per andar diretamente al menù principale.';

  @override
  String get deviceScreenMenuTutorialText => 'Questo xe el schermo. El toc Scrin e Scrin Scrin e ativa dała predefinìa e el pol esar configurà pì in pì nełe inpostasion.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Sposta el pollice intorno al Click Rota per regolar el volume .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Premi el pulsante Centro per ciclè traverso cercar bar, bar de scrubri e scivoloso. Premi e tegner el pulsante del Centro par acedar opsion in pì.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Premi e tien sto boton par digiunare in vanti ła canson';

  @override
  String get previousButtonNowPlayingTutorialText => 'Premi e tien sto boton par rimensare la canson';

  @override
  String get deviceControlSearchTutorialText => 'Spostate el pollice leggermente intorno al Click Rota per evidenziar un alfabeto';

  @override
  String get centerButtonSearchTutorialText => 'Premi el pulsante sentro pa sełesionar l’alfabeto evidensià';

  @override
  String get nextButtonSearchTutorialText => 'Preme sto boton par zontar un spasio';

  @override
  String get previousButtonSearchTutorialText => 'Preme sto boton par cancełar l\'ultimo caratere';

  @override
  String get menuButtonSearchTutorialText => 'Premi sto boton par chiudere la tastiera e interagi co i risultati de ricerca';
}
