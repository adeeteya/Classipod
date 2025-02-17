// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkmen (`tk`).
class AppLocalizationsTk extends AppLocalizations {
  AppLocalizationsTk([String locale = 'tk']) : super(locale);

  @override
  String get appTitle => 'Siz synpy';

  @override
  String get menuButtonText => 'Menýu';

  @override
  String get audioAccessPermissionTitle => 'Ses giriş rugsady talap edilýär';

  @override
  String get audioAccessPermissionContent =>
      'Aýdym-saz faýllaryňyzy oýnamaga rugsat bermek üçin ses faýllaryny ibermegiňizi haýyş edýäris.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ses giriş rugsady ret edildi';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Suratda aýdym-saz faýllaryny oýnamak üçin enjam sazlamalarynda ses faýllaryna girmegiňizi haýyş edýäris.';

  @override
  String get menuScreenTitle => 'Menýu';

  @override
  String get musicMenuScreenTitle => 'Aýdym-saz';

  @override
  String get nowPlayingScreenTitle => 'Indi oýnamak';

  @override
  String get shuffleSongsMenuTitle => 'Çalyşmak aýdymlary';

  @override
  String get shuffleSettingTitle => 'Çalyş';

  @override
  String get settingsScreenTitle => 'Sazlamalar';

  @override
  String get aboutScreenTitle => 'Hakda';

  @override
  String get coverFlowScreenTitle => 'Gaplaň';

  @override
  String get artistsScreenTitle => 'Aýdymçylar';

  @override
  String get albumsScreenTitle => 'AMBOLS';

  @override
  String get songsScreenTitle => 'Aýdymlar';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Aýdymlar',
      one: '1 Aýdym',
      zero: 'Aýdym ýok',
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
      other: '$countString Albomlar',
      one: '1 Albom',
      zero: 'Albom ýok',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Resanr';

  @override
  String get genreSongsScreenTitle => 'Reaner aýdymlary';

  @override
  String get deviceColorSettingTitle => 'Enjamyň reňki';

  @override
  String get touchScreenSettingTitle => 'Degişli ekrana açyk';

  @override
  String get repeatModeSettingTitle => 'Gaýtalama';

  @override
  String get repeatModeOne => 'Biri';

  @override
  String get repeatModeAll => 'Hemmesi';

  @override
  String get vibrateSettingTitle => 'Titremek';

  @override
  String get clickWheelSettingTitle => 'Tigir seslerine basyň';

  @override
  String get splitScreenSettingTitle => 'Ekranyň tertibi';

  @override
  String get touchSoundsDialogTitle => 'Görlenişe degirmenleri';

  @override
  String get touchSoundsDialogContent =>
      'Tigir seslerini görmek üçin ulgam sazlamalaryny sistema sazlamalaryna degmäň';

  @override
  String get immersiveModeSettingTitle => 'Çümdüriji tertibi';

  @override
  String get showAppTutorialSettingTitle => 'Gollanma görkez';

  @override
  String get changeDirectorySettingTitle => 'Katalogy üýtgetmek';

  @override
  String get donateSettingTitle => 'Bagyş et';

  @override
  String get donateSettingDescription =>
      'Bu programmany halaýan bolsaňyz, bagyşlaň.';

  @override
  String get versionAboutScreenTitle => 'Wersiýasy';

  @override
  String get madeWithLoveTitle => '❤️ bilen ýasaldy';

  @override
  String get noMusicFilesFound => 'Saz ýok';

  @override
  String get noArtistsFound => 'Sungat işgärleri ýok';

  @override
  String get noAlbumsFound => 'Albom ýok';

  @override
  String get unknownSong => 'Näbelli aýdymy';

  @override
  String get unknownArtist => 'Näbelli suratkeş';

  @override
  String get unknownAlbum => 'Näbelli albom';

  @override
  String get unknownGenre => 'Näbelli reanr';

  @override
  String get buttonConfirmText => 'Bolýar';

  @override
  String get tileValueOn => 'Üstünde';

  @override
  String get tileValueOff => 'Ondan offter';

  @override
  String get commonOfText => 'we';

  @override
  String get pageNotFoundText => 'Berlen sahypa tapylmady';

  @override
  String get commonErrorText => 'Ýalňyşlyk';

  @override
  String get retryButtonText => 'Gaýtadan synanyşyň';

  @override
  String get filePickerDialogTitle =>
      'Saz üçin skanirlemek üçin katalog saýlaň';

  @override
  String get searchScreenTitle => 'Gözlemek';

  @override
  String get searchEmptyText => 'Gözleg netijeleri ýok';

  @override
  String get searchResultsText => 'Gözleg netijeleri:';

  @override
  String get resultsForText => 'Netijeler:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batareýany optimizasiýa öçüriň';

  @override
  String get disableBatteryOptimizationContent =>
      'Sazyň fon sanawyna girmek üçin enjam sazlamalarynda batareýa optimizasiýasyny öçüriň.';

  @override
  String get languageScreenTitle => 'Dili';

  @override
  String get silverDeviceColor => 'Kümüş';

  @override
  String get blackDeviceColor => 'Gara';

  @override
  String get resetSettingsTitle => 'Sazlamalary täzeden düzmek';

  @override
  String get browseArtist => 'Suratkeşlere göz aýlamak';

  @override
  String get browseAlbum => 'Alboma göz aýlaň';

  @override
  String get cancelText => 'Ýatyr';

  @override
  String get playlistsScreenTitle => 'Sanawlar';

  @override
  String get addToOnTheGoPlaylist => 'Gitmek üçin goşuň';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Gitmek üçin albom goşuň';

  @override
  String get removeSongFromThePlaylist => 'Aýdym sanawyndan aýyryň';

  @override
  String get allAlbums => 'Albhli albomlar';

  @override
  String get scanningMusicFiles => 'Aýdym-saz faýllaryny skanirlemek';

  @override
  String get newPlaylist => 'Täze pleýlist';

  @override
  String get savePlaylist => 'Pleýl sanyny ýazdyryň';

  @override
  String get clearPlaylist => 'PlayyList';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan aýdym-saz faýllary';

  @override
  String get deviceControlMenuTutorialText =>
      'MENU-ny menýudan geçmek üçin basmak tigirine ýeňil süýşüriň';

  @override
  String get centerButtonMenuTutorialText =>
      'Aýratynlandyrylan menýu elementini saýlamak üçin merkez düwmesine basyň';

  @override
  String get playPauseMenuTutorialText =>
      'Aýdym oýnamak ýa-da durmak üçin bu düwmä basyň';

  @override
  String get nextButtonMenuTutorialText =>
      'Indiki aýdymyna geçmek üçin şu düwmä basyň';

  @override
  String get previousButtonMenuTutorialText =>
      'Yza çekmek ýa-da öňki aýdymy yza çekmek üçin bu düwmä basyň';

  @override
  String get menuButtonTutorialText =>
      'Öňki menýuda dolanmak üçin şu düwmä basyň. Başga ekrana gönüden-göni internete giren beýleki ekrana basyp saklap bilersiňiz.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Bu ekran ekrany. Duýgur ekran we bölüň ekranyň re modeimesi, Sazlamalara goşmaça düzüp bilersiňiz.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Göwrümi sazlamak üçin başam barmagyňyzy basyň';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Gysga, swöter bar we çalçly slaýderi gözlemek arkaly sikl üçin merkezi düwmesini basyň. Goşmaça wariantlara girmek üçin merkez düwmesine basyň we saklaň.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Aýdymy çalt öňe sürmek üçin bu düwmä basyň we saklaň';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Aýdymy yza öwürmek üçin bu düwmäni basyň we saklaň';

  @override
  String get deviceControlSearchTutorialText =>
      'Elipbiýi bellemek üçin başam barmagyňyzy ýeňilleşdiriň';

  @override
  String get centerButtonSearchTutorialText =>
      'Aýratynlandyrylan elipbiýi saýlamak üçin merkez düwmesine basyň';

  @override
  String get nextButtonSearchTutorialText =>
      'Boş ýer goşmak üçin şu düwmä basyň';

  @override
  String get previousButtonSearchTutorialText =>
      'Iň soňky häsiýeti pozmak üçin şu düwmä basyň';

  @override
  String get menuButtonSearchTutorialText =>
      'Klawiaturany ýapmak we gözleg netijeleri bilen täsir etmek üçin şu düwmä basyň';
}
