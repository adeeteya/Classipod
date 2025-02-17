// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bosnian (`bs`).
class AppLocalizationsBs extends AppLocalizations {
  AppLocalizationsBs([String locale = 'bs']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Meni';

  @override
  String get audioAccessPermissionTitle =>
      'Potrebna je dozvola za audio pristup';

  @override
  String get audioAccessPermissionContent =>
      'Molimo obratite audio datoteke Pristup kako biste nam omogućili reprodukciju muzičkih datoteka.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Odbijen dozvola za audio pristup';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Molimo obratite audio datoteke Pristup ovoj aplikaciji u postavkama uređaja kako biste nam omogućili reprodukciju muzičkih datoteka.';

  @override
  String get menuScreenTitle => 'Meni';

  @override
  String get musicMenuScreenTitle => 'Muzika';

  @override
  String get nowPlayingScreenTitle => 'Sada igranje';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle pjesme';

  @override
  String get shuffleSettingTitle => 'Miješati';

  @override
  String get settingsScreenTitle => 'Postavke';

  @override
  String get aboutScreenTitle => 'O';

  @override
  String get coverFlowScreenTitle => 'Protok pokrivanja';

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
      one: '1 pjesma',
      zero: 'no pjesme',
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
      zero: 'No Albums',
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
  String get touchScreenSettingTitle => 'Omogućen dodirni ekran';

  @override
  String get repeatModeSettingTitle => 'Ponoviti';

  @override
  String get repeatModeOne => 'Jedan';

  @override
  String get repeatModeAll => 'Sve';

  @override
  String get vibrateSettingTitle => 'Vibrirati';

  @override
  String get clickWheelSettingTitle => 'Klikni zvukovi kotača';

  @override
  String get splitScreenSettingTitle => 'Režim podijeljenog ekrana';

  @override
  String get touchSoundsDialogTitle => 'Dodirni zvukovi';

  @override
  String get touchSoundsDialogContent =>
      'Molimo omogućite dodirnite zvukove iz sistemskih postavki da biste čuli zvukove kotača klikne';

  @override
  String get immersiveModeSettingTitle => 'Umetni mod';

  @override
  String get showAppTutorialSettingTitle => 'Prikaži vodič';

  @override
  String get changeDirectorySettingTitle => 'Promjena direktorija';

  @override
  String get donateSettingTitle => 'Donirati';

  @override
  String get donateSettingDescription =>
      'Ako vam se sviđa ova aplikacija, razmotrite doniranje.';

  @override
  String get versionAboutScreenTitle => 'Verzija';

  @override
  String get madeWithLoveTitle => 'Napravljeno sa ❤️ by';

  @override
  String get noMusicFilesFound => 'Bez muzike';

  @override
  String get noArtistsFound => 'Nema umjetnika';

  @override
  String get noAlbumsFound => 'Nema albuma';

  @override
  String get unknownSong => 'Nepoznata pjesma';

  @override
  String get unknownArtist => 'Nepoznati izvođač';

  @override
  String get unknownAlbum => 'Nepoznati album';

  @override
  String get unknownGenre => 'Nepoznati žanr';

  @override
  String get buttonConfirmText => 'U redu';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'od';

  @override
  String get pageNotFoundText => 'Data stranica nije pronađena';

  @override
  String get commonErrorText => 'Greška';

  @override
  String get retryButtonText => 'Pokušati';

  @override
  String get filePickerDialogTitle =>
      'Odaberite direktorij za skeniranje muzike';

  @override
  String get searchScreenTitle => 'Pretražiti';

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
      'Onemogućite optimizaciju baterije za ovu aplikaciju u postavkama uređaja kako biste omogućili reprodukciju pozadine muzike.';

  @override
  String get languageScreenTitle => 'Jezik';

  @override
  String get silverDeviceColor => 'Srebro';

  @override
  String get blackDeviceColor => 'Crn';

  @override
  String get resetSettingsTitle => 'Resetiranje postavki';

  @override
  String get browseArtist => 'Pregledajte izvođača';

  @override
  String get browseAlbum => 'Pregledajte album';

  @override
  String get cancelText => 'Otkazati';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Dodaj u un-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Dodajte album u idi';

  @override
  String get removeSongFromThePlaylist => 'Uklonite sa liste reprodukcije';

  @override
  String get allAlbums => 'Svi albumi';

  @override
  String get scanningMusicFiles => 'Skeniranje muzičkih datoteka';

  @override
  String get newPlaylist => 'Nova lista za reprodukciju';

  @override
  String get savePlaylist => 'Spremi popis za reprodukciju';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan muzičke datoteke';

  @override
  String get deviceControlMenuTutorialText =>
      'Lagano pomaknite palac oko kotača kliknite da biste se kretali po izborniku';

  @override
  String get centerButtonMenuTutorialText =>
      'Pritisnite tipku CENTER za odabir označene stavke izbornika';

  @override
  String get playPauseMenuTutorialText =>
      'Pritisnite ovo dugme za reprodukciju ili pauziranje pjesme';

  @override
  String get nextButtonMenuTutorialText =>
      'Pritisnite ovo dugme da biste preskočili na sljedeću pjesmu';

  @override
  String get previousButtonMenuTutorialText =>
      'Pritisnite ovo dugme da biste premotali ili vratili na prethodnu pjesmu';

  @override
  String get menuButtonTutorialText =>
      'Pritisnite ovo dugme da biste se vratili na prethodni meni. Možete ga pritisnuti i zadržati s bilo kojeg drugog ekrana da biste direktno otišli u glavni izbornik.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ovo je ekran. Na dodir i režim podijeljenog ekrana omogućeni su prema zadanim postavkama i mogu se dalje konfigurirati u postavkama.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pomaknite palac oko kotača kliknika da biste podesili jačinu zvuka';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pritisnite središnju tipku za ciklus kroz tražite bar, čivnica i klizač shuffle. Pritisnite i držite središnju tipku za pristup dodatnim opcijama.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pritisnite i držite ovo dugme da biste brzo nadjeli pjesmu';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pritisnite i držite ovo dugme da biste premotali pjesmu';

  @override
  String get deviceControlSearchTutorialText =>
      'Lagano pomaknite palac oko kotača kliknite da biste istakli abecedu';

  @override
  String get centerButtonSearchTutorialText =>
      'Pritisnite tipku CENTER za odabir označene abecede';

  @override
  String get nextButtonSearchTutorialText =>
      'Pritisnite ovo dugme da biste dodali prostor';

  @override
  String get previousButtonSearchTutorialText =>
      'Pritisnite ovo dugme da biste izbrisali zadnji znak';

  @override
  String get menuButtonSearchTutorialText =>
      'Pritisnite ovo dugme da biste zatvorili tastaturu i interakciju sa rezultatima pretraživanja';
}
