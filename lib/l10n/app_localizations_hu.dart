// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENÜ';

  @override
  String get audioAccessPermissionTitle =>
      'Audio hozzáférési engedély szükséges';

  @override
  String get audioAccessPermissionContent =>
      'Kérjük, biztosítsa az audio fájlok hozzáférését, hogy lehetővé tegyük a zenei fájlok lejátszását.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Az audio hozzáférési engedély megtagadva';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Kérjük, adja meg az audio fájlok hozzáférését az alkalmazáshoz az eszköz beállításaiban, hogy lejátsszuk a zenei fájlokat.';

  @override
  String get menuScreenTitle => 'Menü';

  @override
  String get musicMenuScreenTitle => 'Zene';

  @override
  String get nowPlayingScreenTitle => 'Most játszik';

  @override
  String get shuffleSongsMenuTitle => 'Zsufferi dalok';

  @override
  String get shuffleSettingTitle => 'Keverés';

  @override
  String get settingsScreenTitle => 'Beállítások';

  @override
  String get aboutScreenTitle => 'Körülbelül';

  @override
  String get coverFlowScreenTitle => 'Fedőáramlás';

  @override
  String get artistsScreenTitle => 'Művészek';

  @override
  String get albumsScreenTitle => 'Albumok';

  @override
  String get songsScreenTitle => 'Dalok';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString dalok',
      one: '1 dal',
      zero: 'nincs dal',
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
      other: '$countString albumok',
      one: '1 album',
      zero: 'nincs album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Műfajok';

  @override
  String get genreSongsScreenTitle => 'Műfaji dalok';

  @override
  String get deviceColorSettingTitle => 'Eszköz színe';

  @override
  String get touchScreenSettingTitle => 'Az érintőképernyő engedélyezve';

  @override
  String get repeatModeSettingTitle => 'Ismétlés';

  @override
  String get repeatModeOne => 'Egy';

  @override
  String get repeatModeAll => 'Minden';

  @override
  String get vibrateSettingTitle => 'Rezeg';

  @override
  String get clickWheelSettingTitle => 'Kattintson a kerék hangjaira';

  @override
  String get splitScreenSettingTitle => 'Osztott képernyő mód';

  @override
  String get touchSoundsDialogTitle => 'Érintse meg a hangokat';

  @override
  String get touchSoundsDialogContent =>
      'Kérjük, engedélyezze az érintési hangokat a rendszerbeállításoktól a kattintáskerék hangjainak meghallgatásához';

  @override
  String get immersiveModeSettingTitle => 'Magával ragadó mód';

  @override
  String get showAppTutorialSettingTitle => 'Bemutató bemutató';

  @override
  String get changeDirectorySettingTitle => 'Változtassa meg a könyvtárat';

  @override
  String get donateSettingTitle => 'Adományoz';

  @override
  String get donateSettingDescription =>
      'Ha tetszik ez az alkalmazás, kérjük, fontolja meg az adományozást.';

  @override
  String get versionAboutScreenTitle => 'Változat';

  @override
  String get madeWithLoveTitle => 'Készítette ❤️ by';

  @override
  String get noMusicFilesFound => 'Nincs zene';

  @override
  String get noArtistsFound => 'Nincs művész';

  @override
  String get noAlbumsFound => 'Nincs album';

  @override
  String get unknownSong => 'Ismeretlen dal';

  @override
  String get unknownArtist => 'Ismeretlen művész';

  @override
  String get unknownAlbum => 'Ismeretlen album';

  @override
  String get unknownGenre => 'Ismeretlen műfaj';

  @override
  String get buttonConfirmText => 'RENDBEN';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Le';

  @override
  String get commonOfText => '-y -az';

  @override
  String get pageNotFoundText => 'Az adott oldalt nem találták meg';

  @override
  String get commonErrorText => 'Hiba';

  @override
  String get retryButtonText => 'Újjáépít';

  @override
  String get filePickerDialogTitle =>
      'Válasszon egy könyvtárat a zene szkenneléséhez';

  @override
  String get searchScreenTitle => 'Keresés';

  @override
  String get searchEmptyText => 'Nincs keresési eredmény';

  @override
  String get searchResultsText => 'Keresési eredmények:';

  @override
  String get resultsForText => 'Eredmények:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Tiltsa le az akkumulátor optimalizálását';

  @override
  String get disableBatteryOptimizationContent =>
      'Kérjük, tiltsa le az alkalmazás akkumulátor optimalizálását az eszköz beállításaiban, hogy lehetővé tegye a zene háttér lejátszását.';

  @override
  String get languageScreenTitle => 'Nyelv';

  @override
  String get silverDeviceColor => 'Ezüst';

  @override
  String get blackDeviceColor => 'Fekete';

  @override
  String get resetSettingsTitle => 'A beállítások visszaállítása';

  @override
  String get browseArtist => 'Böngésszen a művész';

  @override
  String get browseAlbum => 'Böngésző album';

  @override
  String get cancelText => 'Töröl';

  @override
  String get playlistsScreenTitle => 'Lejátszási listák';

  @override
  String get addToOnTheGoPlaylist => 'Adja hozzá az on-the-go-t';

  @override
  String get addAlbumToOnTheGoPlaylist =>
      'Adjon hozzá albumot az on-the-go-hoz';

  @override
  String get removeSongFromThePlaylist => 'Távolítsa el a lejátszási listáról';

  @override
  String get allAlbums => 'Minden album';

  @override
  String get scanningMusicFiles => 'Zenei fájlok beolvasása';

  @override
  String get newPlaylist => 'Új lejátszási lista';

  @override
  String get savePlaylist => 'Mentse el a lejátszási listát';

  @override
  String get clearPlaylist => 'TIPLE PLAYLIST';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan zenei fájlok';

  @override
  String get deviceControlMenuTutorialText =>
      'A menüben a navigáláshoz mozgassa enyhén a hüvelykujját a kattintáskerék körül';

  @override
  String get centerButtonMenuTutorialText =>
      'Nyomja meg a Center gombot a kiemelt menüpont kiválasztásához';

  @override
  String get playPauseMenuTutorialText =>
      'Nyomja meg ezt a gombot a dal lejátszásához vagy szüneteltetéséhez';

  @override
  String get nextButtonMenuTutorialText =>
      'Nyomja meg ezt a gombot a következő dal kihagyásához';

  @override
  String get previousButtonMenuTutorialText =>
      'Nyomja meg ezt a gombot a visszatekeréshez vagy az előző dalhoz való visszatéréshez';

  @override
  String get menuButtonTutorialText =>
      'Nyomja meg ezt a gombot, hogy visszatérjen az előző menübe. Bármely más képernyőn megnyomhatja és megtarthatja, hogy közvetlenül a főmenübe léphessen.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ez a kijelző képernyő. Az érintőképernyő és a megosztott képernyő mód alapértelmezés szerint engedélyezve van, és a beállításokban tovább konfigurálható.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mozgassa a hüvelykujját a kattintó kerék körül a hangerő beállításához';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Nyomja meg a középső gombot a kerekes sávon, a súrolóval és a csúszdán való kerékpározáshoz. Nyomja meg és tartsa be a Center gombot a további beállítások eléréséhez.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Nyomja meg és tartsa be ezt a gombot a dal gyors előmozdításához';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Nyomja meg és tartsa be ezt a gombot a dal visszatekeréséhez';

  @override
  String get deviceControlSearchTutorialText =>
      'Mozgassa a hüvelykujját enyhén a kattintó kerék körül, hogy kiemelje az ábécét';

  @override
  String get centerButtonSearchTutorialText =>
      'Nyomja meg a Center gombot a kiemelt ábécé kiválasztásához';

  @override
  String get nextButtonSearchTutorialText =>
      'Nyomja meg ezt a gombot a hely hozzáadásához';

  @override
  String get previousButtonSearchTutorialText =>
      'Nyomja meg ezt a gombot az utolsó karakter törléséhez';

  @override
  String get menuButtonSearchTutorialText =>
      'Nyomja meg ezt a gombot a billentyűzet bezárásához és a keresési eredményekkel való interakcióhoz';
}
