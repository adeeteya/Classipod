// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Klassipode';

  @override
  String get menuButtonText => 'Spyskaart';

  @override
  String get audioAccessPermissionTitle =>
      'Toestemming vir klanktoegang benodig';

  @override
  String get audioAccessPermissionContent =>
      'Toegegee Audio -lêers toegang om ons musieklêers te laat speel.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Toestemming vir klanktoegang word geweier';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Toekenning vir klanklêers vir hierdie app in die toestelinstellings sodat ons u musieklêers kan speel.';

  @override
  String get menuScreenTitle => 'Spyskaart';

  @override
  String get musicMenuScreenTitle => 'Musiek';

  @override
  String get nowPlayingScreenTitle => 'Speel nou';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Skuifel';

  @override
  String get settingsScreenTitle => 'Instellings';

  @override
  String get aboutScreenTitle => 'Rondom';

  @override
  String get coverFlowScreenTitle => 'Dekking vloei';

  @override
  String get artistsScreenTitle => 'Kunstenaars';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Liedjies';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Songs',
      one: '1 liedjie',
      zero: 'geen liedjies',
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
  String get genreSongsScreenTitle => 'Genre liedjies';

  @override
  String get deviceColorSettingTitle => 'Toestelkleur';

  @override
  String get touchScreenSettingTitle => 'Aanraakskerm geaktiveer';

  @override
  String get repeatModeSettingTitle => 'Herhaal';

  @override
  String get repeatModeOne => 'Een';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Vibreer';

  @override
  String get clickWheelSettingTitle => 'Klik wielklanke';

  @override
  String get splitScreenSettingTitle => 'Split skermmodus';

  @override
  String get touchSoundsDialogTitle => 'Raak klanke';

  @override
  String get touchSoundsDialogContent =>
      'Aktiveer aanraking van klanke van die stelselinstellings om die klikwielgeluide te hoor';

  @override
  String get immersiveModeSettingTitle => 'Oorsigende modus';

  @override
  String get showAppTutorialSettingTitle => 'Toon tutoriaal';

  @override
  String get changeDirectorySettingTitle => 'Verander gids';

  @override
  String get donateSettingTitle => 'Skenk';

  @override
  String get donateSettingDescription =>
      'Oorweeg dit om te skenk as u van hierdie app hou.';

  @override
  String get versionAboutScreenTitle => 'Weergawe';

  @override
  String get madeWithLoveTitle => 'Gemaak met ❤️ deur';

  @override
  String get noMusicFilesFound => 'Geen musiek nie';

  @override
  String get noArtistsFound => 'Geen kunstenaars nie';

  @override
  String get noAlbumsFound => 'Geen albums nie';

  @override
  String get unknownSong => 'Onbekende liedjie';

  @override
  String get unknownArtist => 'Onbekende kunstenaar';

  @override
  String get unknownAlbum => 'Onbekende album';

  @override
  String get unknownGenre => 'Onbekende genre';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Op';

  @override
  String get tileValueOff => 'Af';

  @override
  String get commonOfText => 'van';

  @override
  String get pageNotFoundText => 'Die gegewe bladsy is nie gevind nie';

  @override
  String get commonErrorText => 'Fout';

  @override
  String get retryButtonText => 'Herver hierdie';

  @override
  String get filePickerDialogTitle => 'Kies \'n gids om na musiek te skandeer';

  @override
  String get searchScreenTitle => 'Soek';

  @override
  String get searchEmptyText => 'Geen soekresultate nie';

  @override
  String get searchResultsText => 'Soekresultate:';

  @override
  String get resultsForText => 'Resultate vir:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Skakel batteryoptimalisering uit';

  @override
  String get disableBatteryOptimizationContent =>
      'Deaktiveer asseblief die optimalisering van die battery vir hierdie app in die toestelinstellings om die agtergrond van musiek moontlik te maak.';

  @override
  String get languageScreenTitle => 'Taal';

  @override
  String get silverDeviceColor => 'Silwer';

  @override
  String get blackDeviceColor => 'Swart';

  @override
  String get resetSettingsTitle => 'Stel instellings terug';

  @override
  String get browseArtist => 'Blaai deur kunstenaar';

  @override
  String get browseAlbum => 'Blaai deur album';

  @override
  String get cancelText => 'Kanselleer';

  @override
  String get playlistsScreenTitle => 'Snitlyste';

  @override
  String get addToOnTheGoPlaylist => 'Voeg by die ondergang';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Voeg album by die ondergang';

  @override
  String get removeSongFromThePlaylist => 'Verwyder van die snitlys';

  @override
  String get allAlbums => 'Alle albums';

  @override
  String get scanningMusicFiles => 'Skandeer musieklêers';

  @override
  String get newPlaylist => 'Nuwe snitlys';

  @override
  String get savePlaylist => 'Stoor snitlys';

  @override
  String get clearPlaylist => 'Duidelike snitlys';

  @override
  String get rescanMusicFilesSettingTitle => 'Herstel musieklêers';

  @override
  String get deviceControlMenuTutorialText =>
      'Beweeg jou duim liggies om die klikwiel om die menu te navigeer';

  @override
  String get centerButtonMenuTutorialText =>
      'Druk op die middelste knoppie om die gemerkte menu -item te kies';

  @override
  String get playPauseMenuTutorialText =>
      'Druk op hierdie knoppie om \'n liedjie te speel of te onderbreek';

  @override
  String get nextButtonMenuTutorialText =>
      'Druk op hierdie knoppie om na die volgende liedjie oor te slaan';

  @override
  String get previousButtonMenuTutorialText =>
      'Druk op hierdie knoppie om terug te spoel of terug te gaan na die vorige liedjie';

  @override
  String get menuButtonTutorialText =>
      'Druk op hierdie knoppie om terug te gaan na die vorige menu. U kan dit van enige ander skerm hou en hou om direk na die hoofmenu te gaan.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dit is die vertoonskerm. Aanraakskerm en split -skermmodus is standaard ingeskakel en kan verder in die instellings gekonfigureer word.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Beweeg jou duim om die klikwiel om die volume aan te pas';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Druk op die middelste knoppie om deur Seek Bar, Scrubber Bar en Shuffle Slider te fiets. Druk en hou die middelknoppie in om toegang tot addisionele opsies te kry.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Druk en hou hierdie knoppie in om die liedjie vinnig te stuur';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Druk en hou hierdie knoppie in om die liedjie weer te laat herwin';

  @override
  String get deviceControlSearchTutorialText =>
      'Beweeg jou duim liggies om die klikwiel om \'n alfabet uit te lig';

  @override
  String get centerButtonSearchTutorialText =>
      'Druk op die middelste knoppie om die gemerkte alfabet te kies';

  @override
  String get nextButtonSearchTutorialText =>
      'Druk op hierdie knoppie om \'n ruimte by te voeg';

  @override
  String get previousButtonSearchTutorialText =>
      'Druk op hierdie knoppie om die laaste karakter te verwyder';

  @override
  String get menuButtonSearchTutorialText =>
      'Druk op hierdie knoppie om die sleutelbord te sluit en met die soekresultate te kommunikeer';

  @override
  String get allSongs => 'Alle liedjies';
}
