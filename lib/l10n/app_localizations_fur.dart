// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Friulian (`fur`).
class AppLocalizationsFur extends AppLocalizations {
  AppLocalizationsFur([String locale = 'fur']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Ricuistâ l’acès audio Recuisît';

  @override
  String get audioAccessPermissionContent =>
      'Par plasê dâ l’acès ai file audio par permeti di sunâ i file di musiche.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio di acès Denins di acè';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Par plasê concedi l’acès ai file audio par cheste aplicazion intes impostazions dal dispositîf par permeti di sunâ i file di musiche.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musiche';

  @override
  String get nowPlayingScreenTitle => 'Cumò zuiâ';

  @override
  String get shuffleSongsMenuTitle => 'Cjançons di spazzatura';

  @override
  String get shuffleSettingTitle => 'Sumole';

  @override
  String get settingsScreenTitle => 'Impostazions';

  @override
  String get aboutScreenTitle => 'Rivuart';

  @override
  String get coverFlowScreenTitle => 'Flus';

  @override
  String get artistsScreenTitle => 'Artistics';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'cjançons';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Cjançons',
      one: '1 Cjançon',
      zero: 'Nissune cjançon',
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
      zero: 'Nissun albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gjeners';

  @override
  String get genreSongsScreenTitle => 'Cjançons di gjenar';

  @override
  String get deviceColorSettingTitle => 'Colôr dal dispositîf';

  @override
  String get touchScreenSettingTitle => 'Tocjâ Screen Abilît';

  @override
  String get repeatModeSettingTitle => 'Ripeti';

  @override
  String get repeatModeOne => 'Un';

  @override
  String get repeatModeAll => 'Dut';

  @override
  String get vibrateSettingTitle => 'Vibûr';

  @override
  String get clickWheelSettingTitle => 'Clicâ su lis suns de ruede';

  @override
  String get splitScreenSettingTitle => 'Mode Screle Splade';

  @override
  String get touchSoundsDialogTitle => 'Tocs suns';

  @override
  String get touchSoundsDialogContent =>
      'Par plasê Abilite i suns di Toc di Impostazions dal sisteme par sintî i suns de ruede di clic';

  @override
  String get immersiveModeSettingTitle => 'Mod imersîf';

  @override
  String get showAppTutorialSettingTitle => 'Mostrâ tutoriâl';

  @override
  String get changeDirectorySettingTitle => 'Cambiâ la direzion';

  @override
  String get donateSettingTitle => 'Donâ';

  @override
  String get donateSettingDescription =>
      'Se tu âs gust di cheste aplicazion, par plasê pense di donâ.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Fat cun ❤️';

  @override
  String get noMusicFilesFound => 'Nissune musiche';

  @override
  String get noArtistsFound => 'Nissun artist';

  @override
  String get noAlbumsFound => 'Nissun alumi';

  @override
  String get unknownSong => 'Cjançon no cognossude';

  @override
  String get unknownArtist => 'Artist no cognossût';

  @override
  String get unknownAlbum => 'Album no cognossût';

  @override
  String get unknownGenre => 'Un Gjenar no cognossût';

  @override
  String get buttonConfirmText => 'VA BEN';

  @override
  String get tileValueOn => 'Su';

  @override
  String get tileValueOff => 'Studât';

  @override
  String get commonOfText => 'di';

  @override
  String get pageNotFoundText => 'La pagjine date no je stade cjatade';

  @override
  String get commonErrorText => 'Erôr';

  @override
  String get retryButtonText => 'Cori';

  @override
  String get filePickerDialogTitle =>
      'Seleziona un Repertori par Scansionâ par musiche';

  @override
  String get searchScreenTitle => 'Ricercje';

  @override
  String get searchEmptyText => 'Nissun risultâts di ricercje';

  @override
  String get searchResultsText => 'Risultâts di ricercje:';

  @override
  String get resultsForText => 'Risultâts par:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Disabilitâ la otimizazion de baterie';

  @override
  String get disableBatteryOptimizationContent =>
      'Par plasê disabilitâ la otimizazion de baterie par cheste aplicazion intes impostazions dal dispositîf par permeti il ​​riproduzion di fonts de musiche.';

  @override
  String get languageScreenTitle => 'Lenghe';

  @override
  String get silverDeviceColor => 'Arint';

  @override
  String get blackDeviceColor => 'Neri';

  @override
  String get resetSettingsTitle => 'Impostazions di ripristin';

  @override
  String get browseArtist => 'Artist broncs';

  @override
  String get browseAlbum => 'Brusâ l’album';

  @override
  String get cancelText => 'cancelâ';

  @override
  String get playlistsScreenTitle => 'playlists';

  @override
  String get addToOnTheGoPlaylist => 'Azontâ al On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist =>
      'A puedin jessi zontâts l’album al On-Gjestôr';

  @override
  String get removeSongFromThePlaylist => 'Cjapâ vie de liste dai zuiadôrs';

  @override
  String get allAlbums => 'Ducj i alums';

  @override
  String get scanningMusicFiles => 'Filis di musiche scanalizade';

  @override
  String get newPlaylist => 'Gnove playlist';

  @override
  String get savePlaylist => 'Salvâ la liste di zûc di zûc';

  @override
  String get clearPlaylist => 'Liste di zûc clare';

  @override
  String get rescanMusicFilesSettingTitle => 'Filis di musiche di riscaldazion';

  @override
  String get deviceControlMenuTutorialText =>
      'Spostâ il polsar a pôc ator ator de Ruede Clicâ par navigâ il menût';

  @override
  String get centerButtonMenuTutorialText =>
      'Preme il botôn centrâl par selezionâ l’ogjet di menu evidenziât';

  @override
  String get playPauseMenuTutorialText =>
      'Preme chest botôn par sunâ o fermâ une cjançon';

  @override
  String get nextButtonMenuTutorialText =>
      'Preme chest botôn par saltâ al prossim';

  @override
  String get previousButtonMenuTutorialText =>
      'Preme chest botôn par tornâ o tornâ ae cjançon precedent';

  @override
  String get menuButtonTutorialText =>
      'Preme chest botôn par tornâ al menût precedent. Si podarès premi e tignîlu di ogni altri schermi par lâ in maniere direte al menût principâl.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Chest al è il schermi di visualizazion. Touch Screen e Mode Screen Screen a son abilitâts par automatic e a puedin jessi configurâts plui in là intes impostazions.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Spostâ il polsar ator ator de Ruede Clic par regolâ il volum';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Preme il botôn dal Centri par lâ in biciclete traviers de barre di ricercje, dal bar di scrupul e dal cursôr di tremul. Preme e tignî il botôn dal Centri par vê acès a opzions adizionâls.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Preme e tignî chest botôn par sveltî indenant la cjançon';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Preme e tignî chest botôn par tornâ a meti sù la cjançon';

  @override
  String get deviceControlSearchTutorialText =>
      'Spostâ il polsar a pôc ator ator de Ruede Clic par evidenziâ un alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Preme il tast centrâl par selezionâ il alfabet evidenziât';

  @override
  String get nextButtonSearchTutorialText =>
      'Preme chest botôn par zontâ un spazi';

  @override
  String get previousButtonSearchTutorialText =>
      'Preme chest botôn par cancelâ l’ultin caratar';

  @override
  String get menuButtonSearchTutorialText =>
      'Preme chest botôn par sierâ il tastier e interagjî cui risultâts de ricercje';
}
