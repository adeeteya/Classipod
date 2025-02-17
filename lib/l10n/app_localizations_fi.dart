// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Valikko';

  @override
  String get audioAccessPermissionTitle => 'Vaadittava äänen käyttöoikeus';

  @override
  String get audioAccessPermissionContent =>
      'Anna äänitiedostojen käyttöoikeus, jotta voimme toistaa musiikkitiedostoja.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Äänen käyttöoikeus hylättiin';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Antakaa tämän sovelluksen äänitiedostot laiteasetuksissa, jotta voimme toistaa musiikkitiedostoja.';

  @override
  String get menuScreenTitle => 'Valikko';

  @override
  String get musicMenuScreenTitle => 'Musiikki';

  @override
  String get nowPlayingScreenTitle => 'Nyt pelaaminen';

  @override
  String get shuffleSongsMenuTitle => 'Sekoituslaulut';

  @override
  String get shuffleSettingTitle => 'Sekoittaa';

  @override
  String get settingsScreenTitle => 'Asetukset';

  @override
  String get aboutScreenTitle => 'Noin';

  @override
  String get coverFlowScreenTitle => 'Peitevirta';

  @override
  String get artistsScreenTitle => 'Taiteilijat';

  @override
  String get albumsScreenTitle => 'Albumit';

  @override
  String get songsScreenTitle => 'Lauluja';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kappaleet',
      one: '1 kappale',
      zero: 'ei kappaleita',
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
      other: '$countString albumit',
      one: '1 albumi',
      zero: 'ei albumit',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Tyylilaji';

  @override
  String get genreSongsScreenTitle => 'Tyylilaulut';

  @override
  String get deviceColorSettingTitle => 'Laitteen väri';

  @override
  String get touchScreenSettingTitle => 'Kosketusnäyttö käytössä';

  @override
  String get repeatModeSettingTitle => 'Toistaa';

  @override
  String get repeatModeOne => 'Yksi';

  @override
  String get repeatModeAll => 'Kaikki';

  @override
  String get vibrateSettingTitle => 'Väristyä';

  @override
  String get clickWheelSettingTitle => 'Napsauta pyörän ääniä';

  @override
  String get splitScreenSettingTitle => 'Jaettu näyttötila';

  @override
  String get touchSoundsDialogTitle => 'Kosketusäänet';

  @override
  String get touchSoundsDialogContent =>
      'Ota yhteyttä kosketusäänet järjestelmän asetuksista kuullaksesi Click Wheel -äänet';

  @override
  String get immersiveModeSettingTitle => 'Syventävä tila';

  @override
  String get showAppTutorialSettingTitle => 'Näyttely -opetusohjelma';

  @override
  String get changeDirectorySettingTitle => 'Muutoshakemisto';

  @override
  String get donateSettingTitle => 'Lahjoittaa';

  @override
  String get donateSettingDescription =>
      'Jos pidät tästä sovelluksesta, harkitse lahjoittamista.';

  @override
  String get versionAboutScreenTitle => 'Versio';

  @override
  String get madeWithLoveTitle => 'Tehty ❤️: llä';

  @override
  String get noMusicFilesFound => 'Ei musiikkia';

  @override
  String get noArtistsFound => 'Ei taiteilijoita';

  @override
  String get noAlbumsFound => 'Ei albumeja';

  @override
  String get unknownSong => 'Tuntematon kappale';

  @override
  String get unknownArtist => 'Tuntematon taiteilija';

  @override
  String get unknownAlbum => 'Tuntematon albumi';

  @override
  String get unknownGenre => 'Tuntematon genre';

  @override
  String get buttonConfirmText => 'Hyvä';

  @override
  String get tileValueOn => '-Lla';

  @override
  String get tileValueOff => 'Pois';

  @override
  String get commonOfText => '-';

  @override
  String get pageNotFoundText => 'Annettua sivua ei löytynyt';

  @override
  String get commonErrorText => 'Virhe';

  @override
  String get retryButtonText => 'Tehdä uudelleen';

  @override
  String get filePickerDialogTitle =>
      'Valitse hakemisto skannataksesi musiikkia';

  @override
  String get searchScreenTitle => 'Haku';

  @override
  String get searchEmptyText => 'Ei hakutuloksia';

  @override
  String get searchResultsText => 'Hakutulokset:';

  @override
  String get resultsForText => 'Tulokset:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Poista akun optimointi käytöstä';

  @override
  String get disableBatteryOptimizationContent =>
      'Poista tämän sovelluksen akun optimointi käytöstä laiteasetuksissa, jotta musiikin tausta on toisto.';

  @override
  String get languageScreenTitle => 'Kieli';

  @override
  String get silverDeviceColor => 'Hopea';

  @override
  String get blackDeviceColor => 'Musta';

  @override
  String get resetSettingsTitle => 'Reset -asetukset';

  @override
  String get browseArtist => 'Selata taiteilijaa';

  @override
  String get browseAlbum => 'Selausalbumi';

  @override
  String get cancelText => 'Peruuttaa';

  @override
  String get playlistsScreenTitle => 'Soittolistat';

  @override
  String get addToOnTheGoPlaylist => 'Lisätä';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Lisää albumi On-the-Go-';

  @override
  String get removeSongFromThePlaylist => 'Poista soittolista';

  @override
  String get allAlbums => 'Kaikki albumit';

  @override
  String get scanningMusicFiles => 'Musiikkitiedostojen skannaaminen';

  @override
  String get newPlaylist => 'Uusi soittolista';

  @override
  String get savePlaylist => 'Tallenna soittolista';

  @override
  String get clearPlaylist => 'Selkeä soittolista';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan -musiikkitiedostot';

  @override
  String get deviceControlMenuTutorialText =>
      'Siirrä peukaloa kevyesti napsauta pyörän ympäri navigoidaksesi valikossa';

  @override
  String get centerButtonMenuTutorialText =>
      'Valitse korostettu valikkokohta painamalla keski -painiketta';

  @override
  String get playPauseMenuTutorialText =>
      'Paina tätä painiketta soittaaksesi tai keskeyttääksesi kappaleen';

  @override
  String get nextButtonMenuTutorialText =>
      'Paina tätä painiketta siirtyäksesi seuraavaan kappaleeseen';

  @override
  String get previousButtonMenuTutorialText =>
      'Paina tätä painiketta kelata uudelleen tai palata takaisin edelliseen kappaleeseen';

  @override
  String get menuButtonTutorialText =>
      'Paina tätä painiketta palataksesi edelliseen valikkoon. Voit painaa sitä muusta näytöstä siirtyäksesi suoraan päävalikkoon.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Tämä on näyttönäyttö. Kosketusnäyttö ja jaettu näyttötila ovat oletuksena käytössä ja ne voidaan määrittää edelleen asetuksissa.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Siirrä peukaloa napsauta pyörän ympärillä säätääksesi äänenvoimakkuutta';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Paina keskipainiketta kiertääksesi Seek -palkin, pesulapalkin ja sekoituksen liukusäätimen läpi. Pidä keski -painiketta painamalla lisävaihtoehtoja.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pidä tätä painiketta painettuna eteenpäin kappaleen eteenpäin';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pidä tätä painiketta painettuna takaisin kappaleeseen';

  @override
  String get deviceControlSearchTutorialText =>
      'Siirrä peukaloa kevyesti napsautuskohdan ympäri korostaaksesi aakkoset';

  @override
  String get centerButtonSearchTutorialText =>
      'Valitse korostettu aakkoset painamalla keskuspainiketta';

  @override
  String get nextButtonSearchTutorialText =>
      'Lisää tilaa painamalla tätä painiketta';

  @override
  String get previousButtonSearchTutorialText =>
      'Poista viimeinen merkki painamalla tätä painiketta';

  @override
  String get menuButtonSearchTutorialText =>
      'Paina tätä painiketta sulkeaksesi näppäimistön ja vuorovaikutuksessa hakutulosten kanssa';
}
