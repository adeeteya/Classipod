// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kinyarwanda (`rw`).
class AppLocalizationsRw extends AppLocalizations {
  AppLocalizationsRw([String locale = 'rw']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Uruhushya rwo kwinjira rusabwa';

  @override
  String get audioAccessPermissionContent =>
      'Nyamuneka tanga amajwi yamajwi yo kubona kugirango dukine dosiye yawe yumuziki.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Uruhushya rwamajwi ruhambiriye';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Nyamuneka tanga dosiye ya Audio kwinjira kuriyi porogaramu mubikoresho kugirango utwemere gucuranga dosiye yawe yumuziki.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Umuziki';

  @override
  String get nowPlayingScreenTitle => 'Noneho gukina';

  @override
  String get shuffleSongsMenuTitle => 'Indirimbo za Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Igenamiterere';

  @override
  String get aboutScreenTitle => 'Hafi';

  @override
  String get coverFlowScreenTitle => 'Gutwikira';

  @override
  String get artistsScreenTitle => 'Abahanzi';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Indirimbo';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Indirimbo',
      one: '1 Indirimbo',
      zero: 'Nta ndirimbo',
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
      one: '1 Album',
      zero: 'Nta Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ubwoko';

  @override
  String get genreSongsScreenTitle => 'Indirimbo';

  @override
  String get deviceColorSettingTitle => 'Ibara ryibikoresho';

  @override
  String get touchScreenSettingTitle => 'Gukoraho Gukoraho';

  @override
  String get repeatModeSettingTitle => 'Subiramo';

  @override
  String get repeatModeOne => 'Imwe';

  @override
  String get repeatModeAll => 'Byose';

  @override
  String get vibrateSettingTitle => 'Kunyeganyega';

  @override
  String get clickWheelSettingTitle => 'Kanda amajwi';

  @override
  String get splitScreenSettingTitle => 'Kugabana uburyo bwa ecran';

  @override
  String get touchSoundsDialogTitle => 'Touch';

  @override
  String get touchSoundsDialogContent =>
      'Nyamuneka Gushoboza gukoraho amajwi muri sisitemu kugirango wumve kanda yimodoka';

  @override
  String get immersiveModeSettingTitle => 'Uburyo bwo kwinjiza';

  @override
  String get showAppTutorialSettingTitle => 'Erekana inyigisho';

  @override
  String get changeDirectorySettingTitle => 'Hindura Ububiko';

  @override
  String get donateSettingTitle => 'Gutanga';

  @override
  String get donateSettingDescription =>
      'Niba ukunda iyi porogaramu, nyamuneka tekereza gutanga impano.';

  @override
  String get versionAboutScreenTitle => 'Verisiyo';

  @override
  String get madeWithLoveTitle => 'Bikozwe na ❤️ by';

  @override
  String get noMusicFilesFound => 'Nta muziki';

  @override
  String get noArtistsFound => 'Nta bahanzi';

  @override
  String get noAlbumsFound => 'Nta alubumu';

  @override
  String get unknownSong => 'Indirimbo itazwi';

  @override
  String get unknownArtist => 'Umuhanzi utazwi';

  @override
  String get unknownAlbum => 'Album itazwi';

  @override
  String get unknownGenre => 'Ubwoko butazwi';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Kuri';

  @override
  String get tileValueOff => 'Hanze';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Urupapuro rwatanzwe ntirwigeze ruboneka';

  @override
  String get commonErrorText => 'Ikosa';

  @override
  String get retryButtonText => 'Gusubiramo';

  @override
  String get filePickerDialogTitle => 'Hitamo ububiko bwo gusikana umuziki';

  @override
  String get searchScreenTitle => 'Shakisha';

  @override
  String get searchEmptyText => 'Nta bisubizo by\'ishakisha';

  @override
  String get searchResultsText => 'Ibisubizo by\'ishakisha:';

  @override
  String get resultsForText => 'Ibisubizo kuri:';

  @override
  String get disableBatteryOptimizationTitle => 'Hagarika uburyo bwo guhitamo';

  @override
  String get disableBatteryOptimizationContent =>
      'Nyamuneka uhagarike uburyo bwo gutegura bateri kuriyi porogaramu mubikoresho kugirango ukemere gukina umuziki.';

  @override
  String get languageScreenTitle => 'Ururimi';

  @override
  String get silverDeviceColor => 'Ifeza';

  @override
  String get blackDeviceColor => 'Umukara';

  @override
  String get resetSettingsTitle => 'Kugarura Igenamiterere';

  @override
  String get browseArtist => 'Reba umuhanzi';

  @override
  String get browseAlbum => 'Brewese Album';

  @override
  String get cancelText => 'Guhagarika';

  @override
  String get playlistsScreenTitle => 'Urutonde';

  @override
  String get addToOnTheGoPlaylist => 'Ongeraho kuri-kugenda';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ongeraho alubumu kuri-kugenda';

  @override
  String get removeSongFromThePlaylist => 'Kuraho kurutonde';

  @override
  String get allAlbums => 'Album zose';

  @override
  String get scanningMusicFiles => 'Scanning dosiye yumuziki';

  @override
  String get newPlaylist => 'Urutonde rushya';

  @override
  String get savePlaylist => 'Kubika urutonde';

  @override
  String get clearPlaylist => 'Urutonde rusobanutse';

  @override
  String get rescanMusicFilesSettingTitle => 'Idosiye Yumuziki Yumuziki';

  @override
  String get deviceControlMenuTutorialText =>
      'Kwimura igikumwe cyawe cyoroshye kuzenguruka uruziga kugirango uyobore menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Kanda buto ya Centre kugirango uhitemo ibintu byerekanwe na menu';

  @override
  String get playPauseMenuTutorialText =>
      'Kanda iyi buto kugirango ukine cyangwa uhagarike indirimbo';

  @override
  String get nextButtonMenuTutorialText =>
      'Kanda iyi buto kugirango usimbuke indirimbo ikurikira';

  @override
  String get previousButtonMenuTutorialText =>
      'Kanda iyi buto kugirango usubize cyangwa usubire mu ndirimbo ibanza';

  @override
  String get menuButtonTutorialText =>
      'Kanda iyi buto kugirango usubire kuri menu yabanjirije. Urashobora gukanda no kubifata mubindi bya ecran kugirango ujye kuri menu nkuru.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Iyi ni ecran ya ecran. Gukoraho ecran no kugabanyirizwa ecran byashoboka kubisanzwe kandi birashobora gushyirwaho byinshi murwego.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Kwimura igikumwe cyawe hafi ya kanda uruziga kugirango uhindure amajwi';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Kanda buto ya Centre kugirango ukoreshe bar, Scrubber Bar na Shuffle Slider. Kanda hanyuma ufate buto yo hagati kugirango ugere kumahitamo yinyongera.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Kanda kandi ufate iyi buto kugirango wihute imbere indirimbo';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Kanda kandi ufate iyi buto kugirango usubize indirimbo';

  @override
  String get deviceControlSearchTutorialText =>
      'Kwimura igikumwe cyawe kumurika kuzenguruka uruziga kugirango ugaragaze inyuguti';

  @override
  String get centerButtonSearchTutorialText =>
      'Kanda buto ya Centre kugirango uhitemo inyuguti zerekanwe';

  @override
  String get nextButtonSearchTutorialText =>
      'Kanda iyi buto kugirango wongere umwanya';

  @override
  String get previousButtonSearchTutorialText =>
      'Kanda iyi buto kugirango usibe inyuguti yanyuma';

  @override
  String get menuButtonSearchTutorialText =>
      'Kanda iyi buto kugirango ufunge clavier hanyuma usangire nibisubizo byubushakashatsi';
}
