// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Clasipod';

  @override
  String get menuButtonText => 'JELOVNIK';

  @override
  String get audioAccessPermissionTitle =>
      'Potrebno je dopuštenje za pristup zvuku';

  @override
  String get audioAccessPermissionContent =>
      'Omogućite pristup audio datotekama kako bi nam omogućili da reproduciramo vaše glazbene datoteke.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Odobrenje za pristup audio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Omogućite pristup audio datotekama za ovu aplikaciju u postavkama uređaja kako bi nam omogućio reprodukciju vaših glazbenih datoteka.';

  @override
  String get menuScreenTitle => 'Jelovnik ';

  @override
  String get musicMenuScreenTitle => 'Glazba';

  @override
  String get nowPlayingScreenTitle => 'Sada igranje';

  @override
  String get shuffleSongsMenuTitle => 'Pomicanje pjesama';

  @override
  String get shuffleSettingTitle => 'Miješati';

  @override
  String get settingsScreenTitle => 'Postavke';

  @override
  String get aboutScreenTitle => 'Oko';

  @override
  String get coverFlowScreenTitle => 'Prekrivač';

  @override
  String get artistsScreenTitle => 'Umjetnici';

  @override
  String get albumsScreenTitle => 'Albumi';

  @override
  String get songsScreenTitle => 'Pjesme';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pjesme',
      one: '1 Pjesma',
      zero: 'Nema pjesama',
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
      other: '$countString Albumi',
      one: '1 album',
      zero: 'bez albuma',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Žanrovi';

  @override
  String get genreSongsScreenTitle => 'Žanrovske pjesme';

  @override
  String get deviceColorSettingTitle => 'Boja uređaja';

  @override
  String get touchScreenSettingTitle => 'Omogućen zaslon osjetljiv na dodir';

  @override
  String get repeatModeSettingTitle => 'Ponoviti';

  @override
  String get repeatModeOne => 'Jedan';

  @override
  String get repeatModeAll => 'Sve';

  @override
  String get vibrateSettingTitle => 'Vibrirati';

  @override
  String get clickWheelSettingTitle => 'Kliknite zvukove kotača';

  @override
  String get splitScreenSettingTitle => 'Split zaslon Način';

  @override
  String get touchSoundsDialogTitle => 'Dodirni zvukovi';

  @override
  String get touchSoundsDialogContent =>
      'Omogućite dodirne zvukove iz postavki sustava da biste čuli zvukove klika';

  @override
  String get immersiveModeSettingTitle => 'Uronjen način rada';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Promijenite direktorij';

  @override
  String get donateSettingTitle => 'Donirati';

  @override
  String get donateSettingDescription =>
      'Ako vam se sviđa ova aplikacija, razmislite o donaciji.';

  @override
  String get versionAboutScreenTitle => 'Verzija';

  @override
  String get madeWithLoveTitle => 'Napravljeno s ❤️';

  @override
  String get noMusicFilesFound => 'Nema glazbe';

  @override
  String get noArtistsFound => 'Nema umjetnika';

  @override
  String get noAlbumsFound => 'Nema albuma';

  @override
  String get unknownSong => 'Nepoznata pjesma';

  @override
  String get unknownArtist => 'Nepoznati umjetnik';

  @override
  String get unknownAlbum => 'Nepoznati album';

  @override
  String get unknownGenre => 'Nepoznati žanr';

  @override
  String get buttonConfirmText => 'U REDU';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Izvan';

  @override
  String get commonOfText => 'od';

  @override
  String get pageNotFoundText => 'Dana stranica nije pronađena';

  @override
  String get commonErrorText => 'Pogreška';

  @override
  String get retryButtonText => 'Ponovo namotati';

  @override
  String get filePickerDialogTitle =>
      'Odaberite direktorij za skeniranje za glazbu';

  @override
  String get searchScreenTitle => 'Pretraživanje';

  @override
  String get searchEmptyText => 'Nema rezultata pretraživanja';

  @override
  String get searchResultsText => 'Rezultati pretraživanja:';

  @override
  String get resultsForText => 'Rezultati za:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Onemogući optimizaciju baterije';

  @override
  String get disableBatteryOptimizationContent =>
      'Onemogućite optimizaciju baterije za ovu aplikaciju u postavkama uređaja kako biste omogućili pozadinu reprodukcije glazbe.';

  @override
  String get languageScreenTitle => 'Jezik';

  @override
  String get silverDeviceColor => 'Srebro';

  @override
  String get blackDeviceColor => 'Crni';

  @override
  String get resetSettingsTitle => 'Postavite postavke';

  @override
  String get browseArtist => 'Pregledajte umjetnik';

  @override
  String get browseAlbum => 'Pregledajte album';

  @override
  String get cancelText => 'Otkazati';

  @override
  String get playlistsScreenTitle => 'Popisa za reprodukciju';

  @override
  String get addToOnTheGoPlaylist => 'Dodaj u pokret';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Dodaj album u pokret';

  @override
  String get removeSongFromThePlaylist => 'Uklonite s popisa za reprodukciju';

  @override
  String get allAlbums => 'Svi albumi';

  @override
  String get scanningMusicFiles => 'Skeniranje glazbenih datoteka';

  @override
  String get newPlaylist => 'Novi popis za reprodukciju';

  @override
  String get savePlaylist => 'Spremi popis za reprodukciju';

  @override
  String get clearPlaylist => 'Jasan popis za reprodukciju';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan glazbene datoteke';

  @override
  String get deviceControlMenuTutorialText =>
      'Lagano pomaknite palac oko kotača za klik da biste kretali u izborniku';

  @override
  String get centerButtonMenuTutorialText =>
      'Pritisnite središnji gumb za odabir označene stavke izbornika';

  @override
  String get playPauseMenuTutorialText =>
      'Pritisnite ovaj gumb za reprodukciju ili zaustavljanje pjesme';

  @override
  String get nextButtonMenuTutorialText =>
      'Pritisnite ovaj gumb za preskakanje na sljedeću pjesmu';

  @override
  String get previousButtonMenuTutorialText =>
      'Pritisnite ovaj gumb za premotavanje ili se vratite na prethodnu pjesmu';

  @override
  String get menuButtonTutorialText =>
      'Pritisnite ovaj gumb da biste se vratili na prethodni izbornik. Možete ga pritisnuti i držati s bilo kojeg drugog zaslona da biste izravno otišli na glavni izbornik.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ovo je zaslon. Način dodirnog zaslona i Split Screen Način omogućen su prema zadanim postavkama i mogu se dalje konfigurirati u postavkama.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pomaknite palac oko kotača za klikom da biste prilagodili glasnoću';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pritisnite središnji gumb za vožnju kroz traženje trake, trake za pročišćavanje i klizača. Pritisnite i držite gumb Center za pristup dodatnim opcijama.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pritisnite i držite ovaj gumb da biste brzo proslijedili pjesmu';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pritisnite i držite ovaj gumb da biste premotali pjesmu';

  @override
  String get deviceControlSearchTutorialText =>
      'Lagano pomaknite palac oko kotača klika kako biste istaknuli abecedu';

  @override
  String get centerButtonSearchTutorialText =>
      'Pritisnite središnji gumb za odabir istaknute abecede';

  @override
  String get nextButtonSearchTutorialText =>
      'Pritisnite ovaj gumb za dodavanje prostora';

  @override
  String get previousButtonSearchTutorialText =>
      'Pritisnite ovaj gumb da biste izbrisali posljednji znak';

  @override
  String get menuButtonSearchTutorialText =>
      'Pritisnite ovaj gumb za zatvaranje tipkovnice i interakciju s rezultatima pretraživanja';
}
