// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Vyžaduje se povolení k přístupu zvuku';

  @override
  String get audioAccessPermissionContent => 'Udělejte zvukové soubory přístup, abyste nám mohli přehrávat vaše hudební soubory.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Oprávnění přístupu zvuku odepřeno';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Udělejte prosím přístup zvukových souborů pro tuto aplikaci v nastavení zařízení a umožňují nám přehrávat vaše hudební soubory.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Hudba';

  @override
  String get nowPlayingScreenTitle => 'Teď hraje';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle písně';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Nastavení';

  @override
  String get aboutScreenTitle => 'O';

  @override
  String get coverFlowScreenTitle => 'Tok krytu';

  @override
  String get artistsScreenTitle => 'Umělci';

  @override
  String get albumsScreenTitle => 'Alba';

  @override
  String get songsScreenTitle => 'Písně';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Písně',
      one: '1 Písně',
      zero: 'Žádné písně',
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
      other: '$countString alba',
      one: '1 album',
      zero: 'bez alb',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Žánry';

  @override
  String get genreSongsScreenTitle => 'Žánrové písně';

  @override
  String get deviceColorSettingTitle => 'Barva zařízení';

  @override
  String get touchScreenSettingTitle => 'Povolená dotyková obrazovka';

  @override
  String get repeatModeSettingTitle => 'Opakovat';

  @override
  String get repeatModeOne => 'Jeden';

  @override
  String get repeatModeAll => 'Vše';

  @override
  String get vibrateSettingTitle => 'Vibrovat';

  @override
  String get clickWheelSettingTitle => 'Klikněte na zvuky kola';

  @override
  String get splitScreenSettingTitle => 'Režim rozdělení obrazovky';

  @override
  String get touchSoundsDialogTitle => 'Dotykové zvuky';

  @override
  String get touchSoundsDialogContent => 'Povolte prosím dotykové zvuky z nastavení systému a uslyšíte zvuky kliknutí';

  @override
  String get immersiveModeSettingTitle => 'Pohlcující režim';

  @override
  String get showAppTutorialSettingTitle => 'Zobrazit tutoriál';

  @override
  String get changeDirectorySettingTitle => 'Změnit adresář';

  @override
  String get donateSettingTitle => 'Darovat';

  @override
  String get donateSettingDescription => 'Pokud se vám tato aplikace líbí, zvažte prosím darování.';

  @override
  String get versionAboutScreenTitle => 'Verze';

  @override
  String get madeWithLoveTitle => 'Vyrobeno s ❤ od';

  @override
  String get noMusicFilesFound => 'Žádná hudba';

  @override
  String get noArtistsFound => 'Žádní umělci';

  @override
  String get noAlbumsFound => 'Žádná alba';

  @override
  String get unknownSong => 'Neznámá píseň';

  @override
  String get unknownArtist => 'Neznámý umělec';

  @override
  String get unknownAlbum => 'Neznámé album';

  @override
  String get unknownGenre => 'Neznámý žánr';

  @override
  String get buttonConfirmText => 'Dobře';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Vypnuto';

  @override
  String get commonOfText => 'z';

  @override
  String get pageNotFoundText => 'Daná stránka nebyla nalezena';

  @override
  String get commonErrorText => 'Chyba';

  @override
  String get retryButtonText => 'Opakovat';

  @override
  String get filePickerDialogTitle => 'Vyberte adresář pro skenování hudby';

  @override
  String get searchScreenTitle => 'Vyhledávání';

  @override
  String get searchEmptyText => 'Žádné výsledky vyhledávání';

  @override
  String get searchResultsText => 'Výsledky hledání:';

  @override
  String get resultsForText => 'Výsledky pro:';

  @override
  String get disableBatteryOptimizationTitle => 'Zakázat optimalizaci baterie';

  @override
  String get disableBatteryOptimizationContent => 'Zakázat optimalizaci baterie pro tuto aplikaci v nastavení zařízení, abyste umožnili přehrávání hudby na pozadí.';

  @override
  String get languageScreenTitle => 'Jazyk';

  @override
  String get silverDeviceColor => 'Stříbro';

  @override
  String get blackDeviceColor => 'Černý';

  @override
  String get resetSettingsTitle => 'Resetování nastavení';

  @override
  String get browseArtist => 'Procházet umělce';

  @override
  String get browseAlbum => 'Procházet album';

  @override
  String get cancelText => 'Zrušit';

  @override
  String get playlistsScreenTitle => 'Seznamy skladeb';

  @override
  String get addToOnTheGoPlaylist => 'Přidejte na cest';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Přidejte album na go';

  @override
  String get removeSongFromThePlaylist => 'Odstraňte ze seznamu skladeb';

  @override
  String get allAlbums => 'Všechna alba';

  @override
  String get scanningMusicFiles => 'Skenování hudebních souborů';

  @override
  String get newPlaylist => 'Nový seznam skladeb';

  @override
  String get savePlaylist => 'Uložit seznam skladeb';

  @override
  String get clearPlaylist => 'Jasný seznam skladeb';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Posuňte palec lehce kolem kliknutí na promování po nabídce';

  @override
  String get centerButtonMenuTutorialText => 'Stisknutím tlačítka středu vyberte zvýrazněnou položku nabídky';

  @override
  String get playPauseMenuTutorialText => 'Stisknutím tohoto tlačítka přehráváte nebo pozastavíte píseň';

  @override
  String get nextButtonMenuTutorialText => 'Stisknutím tohoto tlačítka přeskočte další skladbu';

  @override
  String get previousButtonMenuTutorialText => 'Stisknutím tohoto tlačítka přejděte nebo se vrátíte k předchozí písni';

  @override
  String get menuButtonTutorialText => 'Stisknutím tohoto tlačítka se vrátíte do předchozí nabídky. Dalo by se stisknout a držet ji z jakékoli jiné obrazovky a přímo přejít do hlavní nabídky.';

  @override
  String get deviceScreenMenuTutorialText => 'Toto je obrazovka displeje. Ve výchozím nastavení jsou povoleny dotykové obrazovky a režim rozdělení obrazovky a v nastavení je lze dále nakonfigurovat.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Posuňte palce kolem kliknutí a upravte hlasitost';

  @override
  String get centerButtonNowPlayingTutorialText => 'Stisknutím tlačítka středu procházejte vyhledáváním tyče, pračky a posuvníku shuffle. Stisknutím a podržením tlačítka Centra přistupujte k dalším možnostem.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Stisknutím a podržením tohoto tlačítka rychle přesunujte skladbu';

  @override
  String get previousButtonNowPlayingTutorialText => 'Stisknutím a podržením tohoto tlačítka převinete píseň';

  @override
  String get deviceControlSearchTutorialText => 'Přesuňte palec lehce kolem kliknutí a zvýrazněte abecedu';

  @override
  String get centerButtonSearchTutorialText => 'Stisknutím tlačítka středu vyberte zvýrazněnou abecedu';

  @override
  String get nextButtonSearchTutorialText => 'Stisknutím tohoto tlačítka přidejte prostor';

  @override
  String get previousButtonSearchTutorialText => 'Stisknutím tohoto tlačítka odstraníte poslední znak';

  @override
  String get menuButtonSearchTutorialText => 'Stisknutím tohoto tlačítka zavřete klávesnici a komunikujte s výsledky vyhledávání';
}
