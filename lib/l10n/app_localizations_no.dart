// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get appTitle => 'Klassipod';

  @override
  String get menuButtonText => 'MENY';

  @override
  String get audioAccessPermissionTitle => 'Tillatelse om lydtilgang som kreves';

  @override
  String get audioAccessPermissionContent => 'Vennligst gi lydfiler tilgang til at vi kan spille av musikkfilene dine.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Tillatelse for lydtilgang nektet';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Vennligst gi lydfiler tilgang til denne appen i enhetsinnstillingene for å la oss spille av musikkfilene dine.';

  @override
  String get menuScreenTitle => 'Meny';

  @override
  String get musicMenuScreenTitle => 'Musikk';

  @override
  String get nowPlayingScreenTitle => 'Spiller nå';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle -sanger';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Innstillinger';

  @override
  String get aboutScreenTitle => 'Om';

  @override
  String get coverFlowScreenTitle => 'Dekkstrøm';

  @override
  String get artistsScreenTitle => 'Artister';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Sanger';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString sanger',
      one: '1 sang',
      zero: 'Ingen sanger',
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
      zero: 'Ingen album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Sjangre';

  @override
  String get genreSongsScreenTitle => 'Sjanger sanger';

  @override
  String get deviceColorSettingTitle => 'Enhetsfarge';

  @override
  String get touchScreenSettingTitle => 'Berøringsskjerm aktivert';

  @override
  String get repeatModeSettingTitle => 'Gjenta';

  @override
  String get repeatModeOne => 'En';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Vibrere';

  @override
  String get clickWheelSettingTitle => 'Klikk på hjullyder';

  @override
  String get splitScreenSettingTitle => 'Splitt skjermmodus';

  @override
  String get touchSoundsDialogTitle => 'Berøringslyder';

  @override
  String get touchSoundsDialogContent => 'Aktiver berøringslyder fra systeminnstillinger for å høre klikkhjulslydene';

  @override
  String get immersiveModeSettingTitle => 'Oppslukende modus';

  @override
  String get showAppTutorialSettingTitle => 'Vis opplæring';

  @override
  String get changeDirectorySettingTitle => 'Endre katalog';

  @override
  String get donateSettingTitle => 'Donere';

  @override
  String get donateSettingDescription => 'Hvis du liker denne appen, kan du vurdere å donere.';

  @override
  String get versionAboutScreenTitle => 'Versjon';

  @override
  String get madeWithLoveTitle => 'Laget med ❤ av';

  @override
  String get noMusicFilesFound => 'Ingen musikk';

  @override
  String get noArtistsFound => 'Ingen artister';

  @override
  String get noAlbumsFound => 'Ingen album';

  @override
  String get unknownSong => 'Ukjent sang';

  @override
  String get unknownArtist => 'Ukjent kunstner';

  @override
  String get unknownAlbum => 'Ukjent album';

  @override
  String get unknownGenre => 'Ukjent sjanger';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'På';

  @override
  String get tileValueOff => 'Av';

  @override
  String get commonOfText => 'av';

  @override
  String get pageNotFoundText => 'Den gitte siden ble ikke funnet';

  @override
  String get commonErrorText => 'Feil';

  @override
  String get retryButtonText => 'Prøv på nytt';

  @override
  String get filePickerDialogTitle => 'Velg en katalog for å skanne etter musikk';

  @override
  String get searchScreenTitle => 'Søk';

  @override
  String get searchEmptyText => 'Ingen søkeresultater';

  @override
  String get searchResultsText => 'Søkeresultater:';

  @override
  String get resultsForText => 'Resultater for:';

  @override
  String get disableBatteryOptimizationTitle => 'Deaktiver batterioptimalisering';

  @override
  String get disableBatteryOptimizationContent => 'Deaktiver batterioptimalisering for denne appen i enhetsinnstillingene for å tillate bakgrunnsavspilling av musikk.';

  @override
  String get languageScreenTitle => 'Språk';

  @override
  String get silverDeviceColor => 'Sølv';

  @override
  String get blackDeviceColor => 'Svart';

  @override
  String get resetSettingsTitle => 'Tilbakestill innstillinger';

  @override
  String get browseArtist => 'Bla gjennom artist';

  @override
  String get browseAlbum => 'Bla gjennom album';

  @override
  String get cancelText => 'Kansellere';

  @override
  String get playlistsScreenTitle => 'Spillelister';

  @override
  String get addToOnTheGoPlaylist => 'Legg til on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Legg til album til on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Fjern fra spillelisten';

  @override
  String get allAlbums => 'Alle albumene';

  @override
  String get scanningMusicFiles => 'Skanne musikkfiler';

  @override
  String get newPlaylist => 'Ny spilleliste';

  @override
  String get savePlaylist => 'Lagre spilleliste';

  @override
  String get clearPlaylist => 'Klar spilleliste';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Flytt tommelen lett rundt klikkhjulet for å navigere på menyen';

  @override
  String get centerButtonMenuTutorialText => 'Trykk på midtknappen for å velge uthevet menyelement';

  @override
  String get playPauseMenuTutorialText => 'Trykk på denne knappen for å spille eller pause en sang';

  @override
  String get nextButtonMenuTutorialText => 'Trykk på denne knappen for å hoppe til neste sang';

  @override
  String get previousButtonMenuTutorialText => 'Trykk på denne knappen for å spole tilbake eller gå tilbake til forrige sang';

  @override
  String get menuButtonTutorialText => 'Trykk på denne knappen for å gå tilbake til forrige meny. Du kan trykke og holde den fra et hvilket som helst annet skjermbilde for å gå direkte til hovedmenyen.';

  @override
  String get deviceScreenMenuTutorialText => 'Dette er skjermbildet. Berøringsskjerm- og delt skjermmodus er aktivert som standard og kan konfigureres videre i innstillingene.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Flytt tommelen rundt klikkhjulet for å justere volumet';

  @override
  String get centerButtonNowPlayingTutorialText => 'Trykk på midtknappen for å sykle gjennom Seek Bar, Scrubber Bar og Shuffle Slider. Trykk og hold på midtknappen for å få tilgang til flere alternativer.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Trykk og hold denne knappen for å spole frem sangen';

  @override
  String get previousButtonNowPlayingTutorialText => 'Trykk og hold denne knappen for å spole tilbake sangen';

  @override
  String get deviceControlSearchTutorialText => 'Flytt tommelen lett rundt klikkhjulet for å markere et alfabet';

  @override
  String get centerButtonSearchTutorialText => 'Trykk på midtknappen for å velge uthevet alfabet';

  @override
  String get nextButtonSearchTutorialText => 'Trykk på denne knappen for å legge til et rom';

  @override
  String get previousButtonSearchTutorialText => 'Trykk på denne knappen for å slette det siste tegnet';

  @override
  String get menuButtonSearchTutorialText => 'Trykk på denne knappen for å lukke tastaturet og samhandle med søkeresultatene';
}
