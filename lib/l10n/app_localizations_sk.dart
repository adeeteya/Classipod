// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Ponuka';

  @override
  String get audioAccessPermissionTitle =>
      'Vyžaduje sa povolenie na prístup zvuku';

  @override
  String get audioAccessPermissionContent =>
      'Poskytnite prístup k zvukovým súborom, aby ste nám umožnili prehrávať vaše hudobné súbory.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Povolenie pre zvukový prístup zamietnuté';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Poskytnite prístup k zvukovým súborom pre túto aplikáciu v nastaveniach zariadenia, aby ste nám umožnili prehrávať vaše hudobné súbory.';

  @override
  String get menuScreenTitle => 'Ponuka';

  @override
  String get musicMenuScreenTitle => 'Hudba';

  @override
  String get nowPlayingScreenTitle => 'Teraz hranie';

  @override
  String get shuffleSongsMenuTitle => 'Prerušenie piesní';

  @override
  String get shuffleSettingTitle => 'Zamiešanie';

  @override
  String get settingsScreenTitle => 'Nastavenia';

  @override
  String get aboutScreenTitle => 'O';

  @override
  String get coverFlowScreenTitle => 'Tok krytu';

  @override
  String get artistsScreenTitle => 'Umelci';

  @override
  String get albumsScreenTitle => 'Albumy';

  @override
  String get songsScreenTitle => 'Piesne';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Piesne',
      one: '1 pieseň',
      zero: 'no piesne',
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
      other: '$countString Albumy',
      one: '1 album',
      zero: 'no albumy',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Žánre';

  @override
  String get genreSongsScreenTitle => 'Žánrové piesne';

  @override
  String get deviceColorSettingTitle => 'Farba zariadenia';

  @override
  String get touchScreenSettingTitle => 'Povolené dotykové obrazovky';

  @override
  String get repeatModeSettingTitle => 'Opakovať';

  @override
  String get repeatModeOne => 'Jeden';

  @override
  String get repeatModeAll => 'Všetko';

  @override
  String get vibrateSettingTitle => 'Biť';

  @override
  String get clickWheelSettingTitle => 'Kliknite na zvuky kolies';

  @override
  String get splitScreenSettingTitle => 'Režim rozdelenej obrazovky';

  @override
  String get touchSoundsDialogTitle => 'Dotykové zvuky';

  @override
  String get touchSoundsDialogContent =>
      'Povoľte dotykové zvuky zo nastavení systému, aby ste počuli zvuky kolieska kliknutia';

  @override
  String get immersiveModeSettingTitle => 'Pohlcujúci režim';

  @override
  String get showAppTutorialSettingTitle => 'Ukázať návod';

  @override
  String get changeDirectorySettingTitle => 'Zmena adresára';

  @override
  String get donateSettingTitle => 'Darovať';

  @override
  String get donateSettingDescription =>
      'Ak sa vám táto aplikácia páči, zvážte darovanie.';

  @override
  String get versionAboutScreenTitle => 'Verzia';

  @override
  String get madeWithLoveTitle => 'Vyrobené s ❤ do';

  @override
  String get noMusicFilesFound => 'Žiadna hudba';

  @override
  String get noArtistsFound => 'Žiadni umelci';

  @override
  String get noAlbumsFound => 'Žiadne albumy';

  @override
  String get unknownSong => 'Neznáma pieseň';

  @override
  String get unknownArtist => 'Neznámy umelec';

  @override
  String get unknownAlbum => 'Neznámy album';

  @override
  String get unknownGenre => 'Neznámy žáner';

  @override
  String get buttonConfirmText => 'V poriadku';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Vypnutý';

  @override
  String get commonOfText => 'z';

  @override
  String get pageNotFoundText => 'Daná stránka sa nenašla';

  @override
  String get commonErrorText => 'Chyba';

  @override
  String get retryButtonText => 'Pokus';

  @override
  String get filePickerDialogTitle => 'Vyberte adresár na skenovanie hudby';

  @override
  String get searchScreenTitle => 'Prehliadka';

  @override
  String get searchEmptyText => 'Žiadne výsledky vyhľadávania';

  @override
  String get searchResultsText => 'Výsledky vyhľadávania:';

  @override
  String get resultsForText => 'Výsledky pre:';

  @override
  String get disableBatteryOptimizationTitle => 'Zakázať optimalizáciu batérie';

  @override
  String get disableBatteryOptimizationContent =>
      'Zakážte optimalizáciu batérie pre túto aplikáciu v nastaveniach zariadenia, aby ste umožnili prehrávanie pozadia hudby.';

  @override
  String get languageScreenTitle => 'Jazyk';

  @override
  String get silverDeviceColor => 'Striebro';

  @override
  String get blackDeviceColor => 'Čierny';

  @override
  String get resetSettingsTitle => 'Nastavenia resetov';

  @override
  String get browseArtist => 'Prehliadať umelec';

  @override
  String get browseAlbum => 'Prehliadať album';

  @override
  String get cancelText => 'Zrušiť';

  @override
  String get playlistsScreenTitle => 'Zoznamy skladieb';

  @override
  String get addToOnTheGoPlaylist => 'Pridať na cestu';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Pridajte album na cestu na cestách';

  @override
  String get removeSongFromThePlaylist => 'Odstráňte zo zoznamu skladieb';

  @override
  String get allAlbums => 'Všetky albumy';

  @override
  String get scanningMusicFiles => 'Skenovanie hudobných súborov';

  @override
  String get newPlaylist => 'Nový zoznam skladieb';

  @override
  String get savePlaylist => 'Uložiť zoznam skladieb';

  @override
  String get clearPlaylist => 'Zoznam skladieb';

  @override
  String get rescanMusicFilesSettingTitle => 'Výmenné hudobné súbory';

  @override
  String get deviceControlMenuTutorialText =>
      'Pohybujte palcom zľahka okolo kliknutia a navigujte v ponuke';

  @override
  String get centerButtonMenuTutorialText =>
      'Stlačením tlačidla stredu vyberte zvýraznenú položku ponuky';

  @override
  String get playPauseMenuTutorialText =>
      'Stlačením tohto tlačidla prehráte alebo pozastavte pieseň';

  @override
  String get nextButtonMenuTutorialText =>
      'Stlačením tohto tlačidla preskočte na ďalšiu skladbu';

  @override
  String get previousButtonMenuTutorialText =>
      'Stlačením tohto tlačidla sa vrátite alebo sa vráťte k predchádzajúcej skladbe';

  @override
  String get menuButtonTutorialText =>
      'Stlačením tohto tlačidla sa vrátite späť do predchádzajúcej ponuky. Môžete ho stlačiť a podržať z akejkoľvek inej obrazovky, aby ste priamo prešli do hlavnej ponuky.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Toto je obrazovka displeja. Režim dotykovej obrazovky a režim rozdelenej obrazovky sú v predvolenom nastavení povolené a v nastaveniach sa dajú nakonfigurovať ďalej.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Posuňte palec okolo kliknutia a upravte hlasitosť';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Stlačením tlačidla stredu prechádzate cez prúžok vyhľadávania, prabeckej tyčinky a posúvača Shuffle. Stlačením a podržaním tlačidla stredu získate prístup k ďalším možnostiam.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Stlačte a podržte toto tlačidlo, aby ste pieseň rýchlo postlali vpred';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Stlačte a podržte toto tlačidlo, aby ste pieseň pretočili';

  @override
  String get deviceControlSearchTutorialText =>
      'Pohybujte palcom okolo kliknutia a zvýraznite abecedu';

  @override
  String get centerButtonSearchTutorialText =>
      'Stlačením tlačidla stredu vyberte zvýraznenú abecedu';

  @override
  String get nextButtonSearchTutorialText =>
      'Stlačením tohto tlačidla pridáte priestor';

  @override
  String get previousButtonSearchTutorialText =>
      'Stlačením tohto tlačidla odstráňte posledný znak';

  @override
  String get menuButtonSearchTutorialText =>
      'Stlačením tohto tlačidla zatvorte klávesnicu a interaguje s výsledkami vyhľadávania';
}
