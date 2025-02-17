// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Klassipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Tilladelse af lydadgang krævet';

  @override
  String get audioAccessPermissionContent =>
      'Giv lydfiler adgang til at give os mulighed for at afspille dine musikfiler.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Tilladelse af lydadgang afvist';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Giv lydfiler adgang til denne app i enhedsindstillingerne for at give os mulighed for at afspille dine musikfiler.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Spiller nu';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle -sange';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Indstillinger';

  @override
  String get aboutScreenTitle => 'Om';

  @override
  String get coverFlowScreenTitle => 'Dækningsstrøm';

  @override
  String get artistsScreenTitle => 'Kunstnere';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Sange';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Sange',
      one: '1 Song',
      zero: 'ingen sange',
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
      one: '1 album',
      zero: 'ingen albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genrer';

  @override
  String get genreSongsScreenTitle => 'Genresange';

  @override
  String get deviceColorSettingTitle => 'Enhedsfarve';

  @override
  String get touchScreenSettingTitle => 'Berøringsskærm aktiveret';

  @override
  String get repeatModeSettingTitle => 'Gentage';

  @override
  String get repeatModeOne => 'En';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Vibrere';

  @override
  String get clickWheelSettingTitle => 'Klik på hjullyde';

  @override
  String get splitScreenSettingTitle => 'Split skærmtilstand';

  @override
  String get touchSoundsDialogTitle => 'Berør lyde';

  @override
  String get touchSoundsDialogContent =>
      'Aktivér touch -lyde fra systemindstillinger for at høre klikhjulets lyde';

  @override
  String get immersiveModeSettingTitle => 'Immersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'Vis tutorial';

  @override
  String get changeDirectorySettingTitle => 'Skift bibliotek';

  @override
  String get donateSettingTitle => 'Doner';

  @override
  String get donateSettingDescription =>
      'Hvis du kan lide denne app, skal du overveje at donere.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Lavet med ❤ af';

  @override
  String get noMusicFilesFound => 'Ingen musik';

  @override
  String get noArtistsFound => 'Ingen kunstnere';

  @override
  String get noAlbumsFound => 'Ingen albums';

  @override
  String get unknownSong => 'Ukendt sang';

  @override
  String get unknownArtist => 'Ukendt kunstner';

  @override
  String get unknownAlbum => 'Ukendt album';

  @override
  String get unknownGenre => 'Ukendt genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'På';

  @override
  String get tileValueOff => 'Slukket';

  @override
  String get commonOfText => 'af';

  @override
  String get pageNotFoundText => 'Den givne side blev ikke fundet';

  @override
  String get commonErrorText => 'Fejl';

  @override
  String get retryButtonText => 'Ret igen igen';

  @override
  String get filePickerDialogTitle =>
      'Vælg et bibliotek for at scanne for musik';

  @override
  String get searchScreenTitle => 'Søge';

  @override
  String get searchEmptyText => 'Ingen søgeresultater';

  @override
  String get searchResultsText => 'Søgeresultater:';

  @override
  String get resultsForText => 'Resultater for:';

  @override
  String get disableBatteryOptimizationTitle => 'Deaktiver batterietoptimering';

  @override
  String get disableBatteryOptimizationContent =>
      'Deaktiver venligst batterietoptimering til denne app i enhedsindstillingerne for at tillade baggrundsafspilning af musik.';

  @override
  String get languageScreenTitle => 'Sprog';

  @override
  String get silverDeviceColor => 'Sølv';

  @override
  String get blackDeviceColor => 'Sort';

  @override
  String get resetSettingsTitle => 'Nulstil indstillinger';

  @override
  String get browseArtist => 'Gennemse kunstner';

  @override
  String get browseAlbum => 'Gennemse album';

  @override
  String get cancelText => 'Ophæve';

  @override
  String get playlistsScreenTitle => 'Afspilningslister';

  @override
  String get addToOnTheGoPlaylist => 'Føj til på farten';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Føj album til on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Fjern det fra playlisten';

  @override
  String get allAlbums => 'Alle albums';

  @override
  String get scanningMusicFiles => 'Scanning af musikfiler';

  @override
  String get newPlaylist => 'Ny playliste';

  @override
  String get savePlaylist => 'Gem playliste';

  @override
  String get clearPlaylist => 'Klar playliste';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan -musikfiler';

  @override
  String get deviceControlMenuTutorialText =>
      'Flyt tommelfingeren let rundt om klikhjulet for at navigere i menuen';

  @override
  String get centerButtonMenuTutorialText =>
      'Tryk på midten af ​​knappen for at vælge det fremhævede menupunkt';

  @override
  String get playPauseMenuTutorialText =>
      'Tryk på denne knap for at afspille eller pause en sang';

  @override
  String get nextButtonMenuTutorialText =>
      'Tryk på denne knap for at springe til den næste sang';

  @override
  String get previousButtonMenuTutorialText =>
      'Tryk på denne knap for at spole tilbage eller gå tilbage til den forrige sang';

  @override
  String get menuButtonTutorialText =>
      'Tryk på denne knap for at gå tilbage til den forrige menu. Du kan trykke og holde den fra enhver anden skærm for at gå direkte til hovedmenuen.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dette er skærmbilledet. Berøringsskærm og delt skærmtilstand er som standard aktiveret og kan konfigureres yderligere i indstillingerne.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Flyt tommelfingeren rundt om klikhjulet for at justere lydstyrken';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tryk på midten af ​​knappen for at cykle gennem søgen, skrubberbjælke og bland skyderen. Tryk og hold på midten af ​​knappen for at få adgang til yderligere indstillinger.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tryk på og hold på denne knap for at faste sangen frem';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tryk og hold på denne knap for at spole tilbage sangen';

  @override
  String get deviceControlSearchTutorialText =>
      'Flyt tommelfingeren let rundt om klikhjulet for at fremhæve et alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Tryk på midten af ​​knappen for at vælge det fremhævede alfabet';

  @override
  String get nextButtonSearchTutorialText =>
      'Tryk på denne knap for at tilføje et rum';

  @override
  String get previousButtonSearchTutorialText =>
      'Tryk på denne knap for at slette den sidste karakter';

  @override
  String get menuButtonSearchTutorialText =>
      'Tryk på denne knap for at lukke tastaturet og interagere med søgeresultaterne';
}
