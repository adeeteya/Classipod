// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Klassipod';

  @override
  String get menuButtonText => 'Menüü';

  @override
  String get audioAccessPermissionTitle => 'Vajalik heli juurdepääsu luba';

  @override
  String get audioAccessPermissionContent =>
      'Andke helifailidele juurdepääs, et saaksime teie muusikafaile mängida.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Heli juurdepääsu luba on keelatud';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Andke selle rakenduse jaoks seadme sätetes juurdepääs helifailidele, et saaksime teie muusikafaile mängida.';

  @override
  String get menuScreenTitle => 'Menüü';

  @override
  String get musicMenuScreenTitle => 'Muusika';

  @override
  String get nowPlayingScreenTitle => 'Nüüd mängib';

  @override
  String get shuffleSongsMenuTitle => 'Laulud segama';

  @override
  String get shuffleSettingTitle => 'Segadus';

  @override
  String get settingsScreenTitle => 'Sätted';

  @override
  String get aboutScreenTitle => 'Ümber';

  @override
  String get coverFlowScreenTitle => 'Kattevool';

  @override
  String get artistsScreenTitle => 'Kunstnikud';

  @override
  String get albumsScreenTitle => 'Albumid';

  @override
  String get songsScreenTitle => 'Laulud';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString laulud',
      one: '1 laul',
      zero: 'pole laule',
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
      other: '$countString albumid',
      one: '1 album',
      zero: 'pole albumeid',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Žanrid';

  @override
  String get genreSongsScreenTitle => 'Žanrilaulud';

  @override
  String get deviceColorSettingTitle => 'Seadme värv';

  @override
  String get touchScreenSettingTitle => 'Puutetundlik ekraan lubatud';

  @override
  String get repeatModeSettingTitle => 'Kordama';

  @override
  String get repeatModeOne => 'Üks';

  @override
  String get repeatModeAll => 'Kõik';

  @override
  String get vibrateSettingTitle => 'Vibreerima';

  @override
  String get clickWheelSettingTitle => 'Klõpsake rattahelid';

  @override
  String get splitScreenSettingTitle => 'Jagatud ekraanirežiim';

  @override
  String get touchSoundsDialogTitle => 'Puudutushelid';

  @override
  String get touchSoundsDialogContent =>
      'Klõpsukera helide kuulmiseks lubage süsteemi sätetelt puudutushelid';

  @override
  String get immersiveModeSettingTitle => 'Ümbritsev režiim';

  @override
  String get showAppTutorialSettingTitle => 'Näitama õpetust';

  @override
  String get changeDirectorySettingTitle => 'Muutke kataloog';

  @override
  String get donateSettingTitle => 'Annetama';

  @override
  String get donateSettingDescription =>
      'Kui teile see rakendus meeldib, kaaluge annetamist.';

  @override
  String get versionAboutScreenTitle => 'Versioon';

  @override
  String get madeWithLoveTitle => 'Valmistatud ❤️ poolt';

  @override
  String get noMusicFilesFound => 'Pole muusikat';

  @override
  String get noArtistsFound => 'Kunstnikke pole';

  @override
  String get noAlbumsFound => 'Pole albumeid';

  @override
  String get unknownSong => 'Tundmatu laul';

  @override
  String get unknownArtist => 'Tundmatu kunstnik';

  @override
  String get unknownAlbum => 'Tundmatu album';

  @override
  String get unknownGenre => 'Tundmatu žanr';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Edasi';

  @override
  String get tileValueOff => 'Ära';

  @override
  String get commonOfText => 'osa';

  @override
  String get pageNotFoundText => 'Antud lehte ei leitud';

  @override
  String get commonErrorText => 'Viga';

  @override
  String get retryButtonText => 'Uuesti proovima';

  @override
  String get filePickerDialogTitle => 'Valige kataloog muusika skannimiseks';

  @override
  String get searchScreenTitle => 'Otsima';

  @override
  String get searchEmptyText => 'Otsingu tulemusi pole';

  @override
  String get searchResultsText => 'Otsingu tulemused:';

  @override
  String get resultsForText => 'Tulemused:';

  @override
  String get disableBatteryOptimizationTitle => 'Keelake aku optimeerimine';

  @override
  String get disableBatteryOptimizationContent =>
      'Keelake selle rakenduse aku optimeerimine seadme seadetes, et võimaldada muusika tausta taasesitust.';

  @override
  String get languageScreenTitle => 'Keel';

  @override
  String get silverDeviceColor => 'Hõbedane';

  @override
  String get blackDeviceColor => 'Must';

  @override
  String get resetSettingsTitle => 'Lähtesta sätted';

  @override
  String get browseArtist => 'Sirvija';

  @override
  String get browseAlbum => 'Sirvimisalbum';

  @override
  String get cancelText => 'Tühistama';

  @override
  String get playlistsScreenTitle => 'Esitusloendid';

  @override
  String get addToOnTheGoPlaylist => 'Lisage liikvel';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Lisage album liikvel';

  @override
  String get removeSongFromThePlaylist => 'Eemaldage esitusloendist';

  @override
  String get allAlbums => 'Kõik albumid';

  @override
  String get scanningMusicFiles => 'Muusikafailide skannimine';

  @override
  String get newPlaylist => 'Uus esitusloend';

  @override
  String get savePlaylist => 'Salvesta esitusloend';

  @override
  String get clearPlaylist => 'Selge esitusloend';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Musici failid';

  @override
  String get deviceControlMenuTutorialText =>
      'Menüü navigeerimiseks liigutage pöial kergekäeliselt ümber klõpsuratta';

  @override
  String get centerButtonMenuTutorialText =>
      'Hõlmatud menüüelemendi valimiseks vajutage keskpunkti nuppu';

  @override
  String get playPauseMenuTutorialText =>
      'Laulu mängimiseks või peatamiseks vajutage seda nuppu';

  @override
  String get nextButtonMenuTutorialText =>
      'Järgmise laulu vahelejätmiseks vajutage seda nuppu';

  @override
  String get previousButtonMenuTutorialText =>
      'Vajutage seda nuppu, et kerida või minna tagasi eelmise laulu juurde';

  @override
  String get menuButtonTutorialText =>
      'Vajutage seda nuppu, et minna tagasi eelmise menüü juurde. Peamenüüsse otse suvalise ekraanilt vajutada ja hoida seda mis tahes muult ekraanilt.';

  @override
  String get deviceScreenMenuTutorialText =>
      'See on ekraan. Puutetundlik ekraan ja jagatud ekraanirežiim on vaikimisi lubatud ja seda saab seadetes veelgi konfigureerida.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Liigutage oma pöialt ümber klikkratta, et helitugevust reguleerida';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Vajutage keskmist nuppu, et tsüklida läbi lüüa, puhastubaba ja liuguri segamiseks. Täiendavate suvandite juurdepääsu saamiseks hoidke keskpunkti nuppu ja hoidke all.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Vajutage ja hoidke seda nuppu, et laulu kiireks edastada';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Vajutage ja hoidke seda nuppu, et laulu tagasi kerida';

  @override
  String get deviceControlSearchTutorialText =>
      'Liigutage pöial kergelt klikkiratta ümber, et esile tõsta tähestikku';

  @override
  String get centerButtonSearchTutorialText =>
      'Tõstetud tähestiku valimiseks vajutage keskmist nuppu';

  @override
  String get nextButtonSearchTutorialText =>
      'Ruumi lisamiseks vajutage seda nuppu';

  @override
  String get previousButtonSearchTutorialText =>
      'Viimase tähemärgi kustutamiseks vajutage seda nuppu';

  @override
  String get menuButtonSearchTutorialText =>
      'Klaviatuuri sulgemiseks ja otsingutulemustega suhtlemiseks vajutage seda nuppu';
}
