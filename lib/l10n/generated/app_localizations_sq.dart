// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Klasifikim';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Kërkohet leje e hyrjes audio';

  @override
  String get audioAccessPermissionContent =>
      'Ju lutemi jepni qasje të skedarëve audio për të na lejuar të luajmë skedarët tuaj muzikorë.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Leja e hyrjes audio u mohua';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ju lutemi jepni hyrje të skedarëve audio për këtë aplikacion në cilësimet e pajisjes për të na lejuar të luajmë skedarët tuaj muzikorë.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muzikë';

  @override
  String get nowPlayingScreenTitle => 'Tani duke luajtur';

  @override
  String get shuffleSongsMenuTitle => 'Këngë të Shuffle';

  @override
  String get shuffleSettingTitle => 'Shkundje';

  @override
  String get settingsScreenTitle => 'Cilësimet';

  @override
  String get aboutScreenTitle => 'Afër';

  @override
  String get coverFlowScreenTitle => 'Rrjedhë e mbuluar';

  @override
  String get artistsScreenTitle => 'Artistë';

  @override
  String get albumsScreenTitle => 'Albume';

  @override
  String get songsScreenTitle => 'Këngë';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Këngët',
      one: '1 këngë',
      zero: 'pa këngë',
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
      other: '$countString Albumet',
      one: '1 album',
      zero: 'pa albume',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Zhanre';

  @override
  String get genreSongsScreenTitle => 'Këngë zhanër';

  @override
  String get deviceColorSettingTitle => 'Ngjyra e pajisjes';

  @override
  String get touchScreenSettingTitle => 'Ekrani me prekje të aktivizuar';

  @override
  String get repeatModeSettingTitle => 'Përsërit';

  @override
  String get repeatModeOne => 'Një';

  @override
  String get repeatModeAll => 'Të gjithë';

  @override
  String get vibrateSettingTitle => 'Dridhem';

  @override
  String get clickWheelSettingTitle => 'Kliko Tinguj të rrotës';

  @override
  String get splitScreenSettingTitle => 'Mënyra e ekranit të ndarë';

  @override
  String get touchSoundsDialogTitle => 'Tinguj prekës';

  @override
  String get touchSoundsDialogContent =>
      'Ju lutemi aktivizoni tingujt e prekjes nga cilësimet e sistemit për të dëgjuar tingujt e rrotës së klikimit';

  @override
  String get immersiveModeSettingTitle => 'Modaliteti zhytës';

  @override
  String get showAppTutorialSettingTitle => 'Shfaq tutorialin';

  @override
  String get changeDirectorySettingTitle => 'Ndryshoni drejtori';

  @override
  String get donateSettingTitle => 'Dhuroj';

  @override
  String get donateSettingDescription =>
      'Nëse ju pëlqen kjo aplikacion, ju lutemi merrni parasysh dhurimin.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Bërë me ❤ nga';

  @override
  String get noMusicFilesFound => 'Pa muzikë';

  @override
  String get noArtistsFound => 'Asnjë artistë';

  @override
  String get noAlbumsFound => 'Pa albume';

  @override
  String get unknownSong => 'Këngë e panjohur';

  @override
  String get unknownArtist => 'Artist i panjohur';

  @override
  String get unknownAlbum => 'Album i panjohur';

  @override
  String get unknownGenre => 'Zhanër i panjohur';

  @override
  String get buttonConfirmText => 'I mirë';

  @override
  String get tileValueOn => 'Në';

  @override
  String get tileValueOff => 'Larg';

  @override
  String get commonOfText => 'nga';

  @override
  String get pageNotFoundText => 'Faqja e dhënë nuk u gjet';

  @override
  String get commonErrorText => 'Gabim';

  @override
  String get retryButtonText => 'Rigjykoj';

  @override
  String get filePickerDialogTitle =>
      'Zgjidhni një direktori për të skanuar për muzikë';

  @override
  String get searchScreenTitle => 'Kërkim';

  @override
  String get searchEmptyText => 'Nuk ka rezultate kërkimi';

  @override
  String get searchResultsText => 'Rezultatet e kërkimit:';

  @override
  String get resultsForText => 'Rezultatet për:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Çaktivizo optimizimin e baterisë';

  @override
  String get disableBatteryOptimizationContent =>
      'Ju lutemi çaktivizoni optimizimin e baterisë për këtë aplikacion në cilësimet e pajisjes për të lejuar riprodhimin në sfond të muzikës.';

  @override
  String get languageScreenTitle => 'Gjuhë';

  @override
  String get silverDeviceColor => 'Argjend';

  @override
  String get blackDeviceColor => 'I zi';

  @override
  String get resetSettingsTitle => 'Rivendosni cilësimet';

  @override
  String get browseArtist => 'Shfletoni artist';

  @override
  String get browseAlbum => 'Shfletoni albumin';

  @override
  String get cancelText => 'Anuloj';

  @override
  String get playlistsScreenTitle => 'Listat e listave';

  @override
  String get addToOnTheGoPlaylist => 'Shtojini në vend';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Shtoni albumin në ON-GO';

  @override
  String get removeSongFromThePlaylist => 'Hiqeni nga playlist';

  @override
  String get allAlbums => 'Të gjithë albumet';

  @override
  String get scanningMusicFiles => 'Skanimi i skedarëve muzikorë';

  @override
  String get newPlaylist => 'Lista e re e luajtjes';

  @override
  String get savePlaylist => 'Ruani listën e luajtjes';

  @override
  String get clearPlaylist => 'Lista e qartë e luajtjes';

  @override
  String get rescanMusicFilesSettingTitle => 'Skedarët e Rescan Music';

  @override
  String get deviceControlMenuTutorialText =>
      'Lëvizni gishtin e madh lehtë rreth timonit të klikimit për të lundruar në menunë';

  @override
  String get centerButtonMenuTutorialText =>
      'Shtypni butonin qendror për të zgjedhur artikullin e menusë së theksuar';

  @override
  String get playPauseMenuTutorialText =>
      'Shtypni këtë buton për të luajtur ose ndalur një këngë';

  @override
  String get nextButtonMenuTutorialText =>
      'Shtypni këtë buton për të kaluar në këngën tjetër';

  @override
  String get previousButtonMenuTutorialText =>
      'Shtypni këtë buton për të rivendosur ose kthehuni te kënga e mëparshme';

  @override
  String get menuButtonTutorialText =>
      'Shtypni këtë buton për t\'u rikthyer në menunë e mëparshme. Ju mund të shtypni dhe ta mbani atë nga çdo ekran tjetër për të shkuar direkt në menunë kryesore.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ky është ekrani i ekranit. Ekrani me prekje dhe modaliteti i ekranit të ndarë janë aktivizuar si parazgjedhje dhe mund të konfigurohen më tej në cilësimet.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Lëvizni gishtin e madh rreth rrotës së klikimit për të rregulluar vëllimin';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Shtypni butonin qendror për të ciklin përmes kërkimit të shiritit, shiritit pastrues dhe rrëshqitjes së shuffle. Shtypni dhe mbani butonin qendror për të hyrë në opsione shtesë.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Shtypni dhe mbajeni këtë buton për të shpejtuar këngën';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Shtypni dhe mbajeni këtë buton për të rivendosur këngën';

  @override
  String get deviceControlSearchTutorialText =>
      'Lëvizni gishtin e madh lehtë rreth timonit të klikimit për të nënvizuar një alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Shtypni butonin qendror për të zgjedhur alfabetin e theksuar';

  @override
  String get nextButtonSearchTutorialText =>
      'Shtypni këtë buton për të shtuar një hapësirë';

  @override
  String get previousButtonSearchTutorialText =>
      'Shtypni këtë buton për të fshirë karakterin e fundit';

  @override
  String get menuButtonSearchTutorialText =>
      'Shtypni këtë buton për të mbyllur tastierën dhe bashkëvepruar me rezultatet e kërkimit';

  @override
  String get allSongs => 'Të gjitha këngët';
}
