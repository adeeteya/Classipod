// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENIU';

  @override
  String get audioAccessPermissionTitle =>
      'Permisiunea de acces audio necesară';

  @override
  String get audioAccessPermissionContent =>
      'Vă rugăm să acordați accesul fișierelor audio pentru a ne permite să redăm fișierele dvs. de muzică.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Permisiunea de acces audio refuzată';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Vă rugăm să acordați accesul fișierelor audio pentru această aplicație în setările dispozitivului pentru a ne permite să redăm fișierele dvs. de muzică.';

  @override
  String get menuScreenTitle => 'Meniu';

  @override
  String get musicMenuScreenTitle => 'Muzică';

  @override
  String get nowPlayingScreenTitle => 'Acum jucând';

  @override
  String get shuffleSongsMenuTitle => 'Cântece de amestecare';

  @override
  String get shuffleSettingTitle => 'Amesteca';

  @override
  String get settingsScreenTitle => 'Setări';

  @override
  String get aboutScreenTitle => 'Despre';

  @override
  String get coverFlowScreenTitle => 'Fluxul de acoperire';

  @override
  String get artistsScreenTitle => 'Artiști';

  @override
  String get albumsScreenTitle => 'Albume';

  @override
  String get songsScreenTitle => 'Cântece';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString cântece',
      one: '1 melodie',
      zero: 'fără melodii',
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
      other: '$countString albume',
      one: '1 album',
      zero: 'fără albume',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genuri';

  @override
  String get genreSongsScreenTitle => 'Cântece de gen';

  @override
  String get deviceColorSettingTitle => 'Culoarea dispozitivului';

  @override
  String get touchScreenSettingTitle => 'Ecran tactil activat';

  @override
  String get repeatModeSettingTitle => 'Repeta';

  @override
  String get repeatModeOne => 'Unul';

  @override
  String get repeatModeAll => 'Toate';

  @override
  String get vibrateSettingTitle => 'Vibrați';

  @override
  String get clickWheelSettingTitle => 'Faceți clic pe sunete de roată';

  @override
  String get splitScreenSettingTitle => 'Mod de ecran împărțit';

  @override
  String get touchSoundsDialogTitle => 'Touch sunete';

  @override
  String get touchSoundsDialogContent =>
      'Vă rugăm să activați sunetele tactile din setările sistemului pentru a auzi sunetele roților de clic';

  @override
  String get immersiveModeSettingTitle => 'Mod imersiv';

  @override
  String get showAppTutorialSettingTitle => 'Arată tutorial';

  @override
  String get changeDirectorySettingTitle => 'Director de schimbare';

  @override
  String get donateSettingTitle => 'Dona';

  @override
  String get donateSettingDescription =>
      'Dacă vă place această aplicație, vă rugăm să luați în considerare donarea.';

  @override
  String get versionAboutScreenTitle => 'Versiune';

  @override
  String get madeWithLoveTitle => 'Făcut cu ❤️ de';

  @override
  String get noMusicFilesFound => 'Fără muzică';

  @override
  String get noArtistsFound => 'Fără artiști';

  @override
  String get noAlbumsFound => 'Fără albume';

  @override
  String get unknownSong => 'Cântec necunoscut';

  @override
  String get unknownArtist => 'Artist necunoscut';

  @override
  String get unknownAlbum => 'Album necunoscut';

  @override
  String get unknownGenre => 'Gen necunoscut';

  @override
  String get buttonConfirmText => 'Bine';

  @override
  String get tileValueOn => 'Pe';

  @override
  String get tileValueOff => 'OFF';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'Pagina dată nu a fost găsită';

  @override
  String get commonErrorText => 'Eroare';

  @override
  String get retryButtonText => 'Din nou';

  @override
  String get filePickerDialogTitle =>
      'Selectați un director pentru a scana pentru muzică';

  @override
  String get searchScreenTitle => 'Căutare';

  @override
  String get searchEmptyText => 'Fără rezultate ale căutării';

  @override
  String get searchResultsText => 'Rezultatele căutării:';

  @override
  String get resultsForText => 'Rezultate pentru:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Dezactivați optimizarea bateriei';

  @override
  String get disableBatteryOptimizationContent =>
      'Vă rugăm să dezactivați optimizarea bateriei pentru această aplicație în setările dispozitivului pentru a permite redarea de fundal a muzicii.';

  @override
  String get languageScreenTitle => 'Limbă';

  @override
  String get silverDeviceColor => 'Argint';

  @override
  String get blackDeviceColor => 'Negru';

  @override
  String get resetSettingsTitle => 'Resetați setările';

  @override
  String get browseArtist => 'Căutați artist';

  @override
  String get browseAlbum => 'Căutați albumul';

  @override
  String get cancelText => 'Anula';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Adăugați la plecare';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Adăugați albumul la';

  @override
  String get removeSongFromThePlaylist => 'Scoateți din lista de redare';

  @override
  String get allAlbums => 'Toate albumele';

  @override
  String get scanningMusicFiles => 'Scanarea fișierelor muzicale';

  @override
  String get newPlaylist => 'Lista de redare nouă';

  @override
  String get savePlaylist => 'Salvați lista de redare';

  @override
  String get clearPlaylist => 'Lista de redare clară';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescris fișiere de muzică';

  @override
  String get deviceControlMenuTutorialText =>
      'Mutați ușor degetul mare în jurul roții de clic pentru a naviga în meniu';

  @override
  String get centerButtonMenuTutorialText =>
      'Apăsați butonul Centrul pentru a selecta elementul de meniu evidențiat';

  @override
  String get playPauseMenuTutorialText =>
      'Apăsați acest buton pentru a reda sau a întrerupe o melodie';

  @override
  String get nextButtonMenuTutorialText =>
      'Apăsați acest buton pentru a sări la următoarea melodie';

  @override
  String get previousButtonMenuTutorialText =>
      'Apăsați acest buton pentru a derula sau reveni la melodia anterioară';

  @override
  String get menuButtonTutorialText =>
      'Apăsați acest buton pentru a reveni la meniul anterior. Puteți apăsa și țineți apăsat de pe orice alt ecran pentru a merge direct la meniul principal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Acesta este ecranul de afișare. Ecranul tactil și modul de ecran împărțit sunt activate în mod implicit și pot fi configurate în continuare în setări.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mutați degetul mare în jurul roții de clic pentru a regla volumul';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Apăsați butonul central pentru a circula printr -o bară de căutare, bara de scrubber și shuffle shuffle. Apăsați și mențineți apăsat butonul Center pentru a accesa opțiuni suplimentare.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Apăsați și mențineți apăsat acest buton pentru a transmite rapid melodia';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Apăsați și mențineți apăsat acest buton pentru a derula melodia';

  @override
  String get deviceControlSearchTutorialText =>
      'Mutați -vă ușor degetul în jurul roții de clic pentru a evidenția un alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Apăsați butonul central pentru a selecta alfabetul evidențiat';

  @override
  String get nextButtonSearchTutorialText =>
      'Apăsați acest buton pentru a adăuga un spațiu';

  @override
  String get previousButtonSearchTutorialText =>
      'Apăsați acest buton pentru a șterge ultimul personaj';

  @override
  String get menuButtonSearchTutorialText =>
      'Apăsați acest buton pentru a închide tastatura și a interacționa cu rezultatele căutării';

  @override
  String get allSongs => 'Toate melodiile';
}
