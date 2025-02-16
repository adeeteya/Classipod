// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Klassipod';

  @override
  String get menuButtonText => 'MENY';

  @override
  String get audioAccessPermissionTitle => 'Ljudåtkomsttillstånd krävs';

  @override
  String get audioAccessPermissionContent => 'Vänligen ge ljudfiler åtkomst så att vi kan spela dina musikfiler.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Ljudåtkomsttillstånd nekas';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Vänligen ge ljudfiler åtkomst för den här appen i enhetsinställningarna så att vi kan spela dina musikfiler.';

  @override
  String get menuScreenTitle => 'Meny';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Spelar nu';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle -låtar';

  @override
  String get shuffleSettingTitle => 'Blanda';

  @override
  String get settingsScreenTitle => 'Inställningar';

  @override
  String get aboutScreenTitle => 'Om';

  @override
  String get coverFlowScreenTitle => 'Täckningsflöde';

  @override
  String get artistsScreenTitle => 'Artister';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Låtar';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString låtar',
      one: '1 sång',
      zero: 'inga låtar',
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
      other: '$countString album',
      one: '1 album',
      zero: 'inga album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genrer';

  @override
  String get genreSongsScreenTitle => 'Genresång';

  @override
  String get deviceColorSettingTitle => 'Enhetsfärg';

  @override
  String get touchScreenSettingTitle => 'Pekskärm aktiverad';

  @override
  String get repeatModeSettingTitle => 'Upprepa';

  @override
  String get repeatModeOne => 'En';

  @override
  String get repeatModeAll => 'Alla';

  @override
  String get vibrateSettingTitle => 'Vibrera';

  @override
  String get clickWheelSettingTitle => 'Klicka på hjulljud';

  @override
  String get splitScreenSettingTitle => 'Delad skärmläge';

  @override
  String get touchSoundsDialogTitle => 'Pekljud';

  @override
  String get touchSoundsDialogContent => 'Vänligen aktivera Touch -ljud från systeminställningar för att höra klickhjulets ljud';

  @override
  String get immersiveModeSettingTitle => 'Uppslukande läge';

  @override
  String get showAppTutorialSettingTitle => 'Showhandledning';

  @override
  String get changeDirectorySettingTitle => 'Ändra katalog';

  @override
  String get donateSettingTitle => 'Donera';

  @override
  String get donateSettingDescription => 'Om du gillar den här appen, överväg att donera.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Gjord med ❤ av';

  @override
  String get noMusicFilesFound => 'Ingen musik';

  @override
  String get noArtistsFound => 'Inga artister';

  @override
  String get noAlbumsFound => 'Inga album';

  @override
  String get unknownSong => 'Okänd låt';

  @override
  String get unknownArtist => 'Okänd konstnär';

  @override
  String get unknownAlbum => 'Okänt album';

  @override
  String get unknownGenre => 'Okänd genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'På';

  @override
  String get tileValueOff => 'Av';

  @override
  String get commonOfText => 'av';

  @override
  String get pageNotFoundText => 'Den givna sidan hittades inte';

  @override
  String get commonErrorText => 'Fel';

  @override
  String get retryButtonText => 'Försöka igen';

  @override
  String get filePickerDialogTitle => 'Välj en katalog för att söka efter musik';

  @override
  String get searchScreenTitle => 'Söka';

  @override
  String get searchEmptyText => 'Inga sökresultat';

  @override
  String get searchResultsText => 'Sökresultat:';

  @override
  String get resultsForText => 'Resultat för:';

  @override
  String get disableBatteryOptimizationTitle => 'Inaktivera batterioptimering';

  @override
  String get disableBatteryOptimizationContent => 'Vänligen inaktivera batterioptimering för den här appen i enhetsinställningarna för att möjliggöra bakgrundsuppspelning av musik.';

  @override
  String get languageScreenTitle => 'Språk';

  @override
  String get silverDeviceColor => 'Silver';

  @override
  String get blackDeviceColor => 'Svart';

  @override
  String get resetSettingsTitle => 'Återställningsinställningar';

  @override
  String get browseArtist => 'Bläddringskonstnär';

  @override
  String get browseAlbum => 'Bläddra album';

  @override
  String get cancelText => 'Avboka';

  @override
  String get playlistsScreenTitle => 'Spellistor';

  @override
  String get addToOnTheGoPlaylist => 'Lägg till på-gå';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Lägg till album till on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Ta bort från spellistan';

  @override
  String get allAlbums => 'Alla album';

  @override
  String get scanningMusicFiles => 'Skanning av musikfiler';

  @override
  String get newPlaylist => 'Ny spellista';

  @override
  String get savePlaylist => 'Spara spellista';

  @override
  String get clearPlaylist => 'Tydlig spellista';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Flytta tummen lätt runt klickhjulet för att navigera på menyn';

  @override
  String get centerButtonMenuTutorialText => 'Tryck på centerknappen för att välja markering av menyalternativ';

  @override
  String get playPauseMenuTutorialText => 'Tryck på den här knappen för att spela eller pausa en låt';

  @override
  String get nextButtonMenuTutorialText => 'Tryck på den här knappen för att hoppa till nästa låt';

  @override
  String get previousButtonMenuTutorialText => 'Tryck på den här knappen för att spola tillbaka eller gå tillbaka till föregående låt';

  @override
  String get menuButtonTutorialText => 'Tryck på den här knappen för att gå tillbaka till föregående meny. Du kan trycka på och hålla den från någon annan skärm för att direkt gå till huvudmenyn.';

  @override
  String get deviceScreenMenuTutorialText => 'Det här är skärmen. Pekskärm och delad skärmläge är aktiverat som standard och kan konfigureras ytterligare i inställningarna.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Flytta tummen runt klickhjulet för att justera volymen';

  @override
  String get centerButtonNowPlayingTutorialText => 'Tryck på mittknappen för att cykla genom sökstång, skrubberfält och skjutreglage. Tryck och håll i mittknappen för att komma åt ytterligare alternativ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Tryck och håll den här knappen för att snabbt framåt låten';

  @override
  String get previousButtonNowPlayingTutorialText => 'Tryck och håll den här knappen för att spola tillbaka låten';

  @override
  String get deviceControlSearchTutorialText => 'Flytta tummen lätt runt klickhjulet för att markera ett alfabet';

  @override
  String get centerButtonSearchTutorialText => 'Tryck på mittknappen för att välja det markerade alfabetet';

  @override
  String get nextButtonSearchTutorialText => 'Tryck på den här knappen för att lägga till ett utrymme';

  @override
  String get previousButtonSearchTutorialText => 'Tryck på den här knappen för att ta bort det sista tecknet';

  @override
  String get menuButtonSearchTutorialText => 'Tryck på den här knappen för att stänga tangentbordet och interagera med sökresultaten';
}
