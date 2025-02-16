// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Access -toestemming vereist';

  @override
  String get audioAccessPermissionContent => 'Geef audiobestanden toegang om ons in staat te stellen uw muziekbestanden te spelen.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Access -toestemming geweigerd';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Geef audiobestanden toegang tot deze app in de apparaatinstellingen zodat we uw muziekbestanden kunnen afspelen.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muziek';

  @override
  String get nowPlayingScreenTitle => 'Nu spelen';

  @override
  String get shuffleSongsMenuTitle => 'Schuifelen liedjes';

  @override
  String get shuffleSettingTitle => 'Schuifelen';

  @override
  String get settingsScreenTitle => 'Instellingen';

  @override
  String get aboutScreenTitle => 'Over';

  @override
  String get coverFlowScreenTitle => 'Dekselstroom';

  @override
  String get artistsScreenTitle => 'Kunstenaars';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Liedjes';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString nummers',
      one: '1 song',
      zero: 'geen nummers',
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
      other: '$countString albums',
      one: '1 album',
      zero: 'geen albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre -liedjes';

  @override
  String get deviceColorSettingTitle => 'Apparaatkleur';

  @override
  String get touchScreenSettingTitle => 'Aanraakscherm ingeschakeld';

  @override
  String get repeatModeSettingTitle => 'Herhalen';

  @override
  String get repeatModeOne => 'Een';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Trillen';

  @override
  String get clickWheelSettingTitle => 'Klik op wielgeluiden';

  @override
  String get splitScreenSettingTitle => 'Split -schermmodus';

  @override
  String get touchSoundsDialogTitle => 'Raak geluiden aan';

  @override
  String get touchSoundsDialogContent => 'Schakel Touch Sounds uit systeeminstellingen in om het klikwielgeluiden te horen';

  @override
  String get immersiveModeSettingTitle => 'Immersieve modus';

  @override
  String get showAppTutorialSettingTitle => 'Toon tutorial tonen';

  @override
  String get changeDirectorySettingTitle => 'Verander directory';

  @override
  String get donateSettingTitle => 'Doneren';

  @override
  String get donateSettingDescription => 'Als je deze app leuk vindt, overweeg dan om te doneren.';

  @override
  String get versionAboutScreenTitle => 'Versie';

  @override
  String get madeWithLoveTitle => 'Gemaakt met ❤️ door';

  @override
  String get noMusicFilesFound => 'Geen muziek';

  @override
  String get noArtistsFound => 'Geen artiesten';

  @override
  String get noAlbumsFound => 'Geen albums';

  @override
  String get unknownSong => 'Onbekend nummer';

  @override
  String get unknownArtist => 'Onbekende kunstenaar';

  @override
  String get unknownAlbum => 'Onbekend album';

  @override
  String get unknownGenre => 'Onbekend genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Op';

  @override
  String get tileValueOff => 'Uit';

  @override
  String get commonOfText => 'van';

  @override
  String get pageNotFoundText => 'De gegeven pagina is niet gevonden';

  @override
  String get commonErrorText => 'Fout';

  @override
  String get retryButtonText => 'Opnieuw proberen';

  @override
  String get filePickerDialogTitle => 'Selecteer een map om op muziek te scannen';

  @override
  String get searchScreenTitle => 'Zoekopdracht';

  @override
  String get searchEmptyText => 'Geen zoekresultaten';

  @override
  String get searchResultsText => 'Zoekresultaten:';

  @override
  String get resultsForText => 'Resultaten voor:';

  @override
  String get disableBatteryOptimizationTitle => 'Schakel de batterijoptimalisatie uit';

  @override
  String get disableBatteryOptimizationContent => 'Schakel de batterijoptimalisatie voor deze app uit in de apparaatinstellingen om het afspelen van muziek achtergrond mogelijk te maken.';

  @override
  String get languageScreenTitle => 'Taal';

  @override
  String get silverDeviceColor => 'Zilver';

  @override
  String get blackDeviceColor => 'Zwart';

  @override
  String get resetSettingsTitle => 'Reset instellingen';

  @override
  String get browseArtist => 'Blader artiest';

  @override
  String get browseAlbum => 'Blader album';

  @override
  String get cancelText => 'Annuleren';

  @override
  String get playlistsScreenTitle => 'Afspeellijsten';

  @override
  String get addToOnTheGoPlaylist => 'Toevoegen aan onderweg';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Voeg album toe aan on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Verwijder uit de afspeellijst';

  @override
  String get allAlbums => 'Alle albums';

  @override
  String get scanningMusicFiles => 'Muziekbestanden scannen';

  @override
  String get newPlaylist => 'Nieuwe afspeellijst';

  @override
  String get savePlaylist => 'Sla de afspeellijst op';

  @override
  String get clearPlaylist => 'Duidelijke afspeellijst';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan -muziekbestanden';

  @override
  String get deviceControlMenuTutorialText => 'Verplaats uw duim lichtjes rond het klikwiel om door het menu te navigeren';

  @override
  String get centerButtonMenuTutorialText => 'Druk op de middelste knop om het gemarkeerde menu -item te selecteren';

  @override
  String get playPauseMenuTutorialText => 'Druk op deze knop om een ​​nummer te spelen of te pauzeren';

  @override
  String get nextButtonMenuTutorialText => 'Druk op deze knop om over te slaan naar het volgende nummer';

  @override
  String get previousButtonMenuTutorialText => 'Druk op deze knop om terug te spoelen of terug te gaan naar het vorige nummer';

  @override
  String get menuButtonTutorialText => 'Druk op deze knop om terug te gaan naar het vorige menu. U kunt het op elk ander scherm ingedrukt houden om rechtstreeks naar het hoofdmenu te gaan.';

  @override
  String get deviceScreenMenuTutorialText => 'Dit is het schermscherm. Touchscreen en split -schermmodus zijn standaard ingeschakeld en kunnen verder worden geconfigureerd in de instellingen.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Verplaats uw duim rond het klikwiel om het volume aan te passen';

  @override
  String get centerButtonNowPlayingTutorialText => 'Druk op de middelste knop om door zoekbalk, scrubberbar en shuffle schuifregelaar te fietsen. Druk op de middelste knop ingedrukt om toegang te krijgen tot extra opties.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Houd deze knop ingedrukt om het nummer snel vooruit te maken';

  @override
  String get previousButtonNowPlayingTutorialText => 'Houd deze knop ingedrukt om het nummer terug te spoelen';

  @override
  String get deviceControlSearchTutorialText => 'Verplaats uw duim lichtjes rond het klikwiel om een ​​alfabet te markeren';

  @override
  String get centerButtonSearchTutorialText => 'Druk op de middelste knop om het gemarkeerde alfabet te selecteren';

  @override
  String get nextButtonSearchTutorialText => 'Druk op deze knop om een ​​ruimte toe te voegen';

  @override
  String get previousButtonSearchTutorialText => 'Druk op deze knop om het laatste teken te verwijderen';

  @override
  String get menuButtonSearchTutorialText => 'Druk op deze knop om het toetsenbord te sluiten en te communiceren met de zoekresultaten';
}
