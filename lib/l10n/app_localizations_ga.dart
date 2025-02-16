// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'Aicmeipod';

  @override
  String get menuButtonText => 'Biachlár';

  @override
  String get audioAccessPermissionTitle => 'Cead rochtana fuaime ag teastáil';

  @override
  String get audioAccessPermissionContent => 'Deonaigh rochtain ar chomhaid fuaime le do thoil chun ligean dúinn do chuid comhad ceoil a imirt.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Diúltaíodh cead rochtana fuaime';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Deonaigh rochtain ar chomhaid fuaime don aip seo i socruithe na bhfeistí chun ligean dúinn do chuid comhad ceoil a imirt.';

  @override
  String get menuScreenTitle => 'Biachlár';

  @override
  String get musicMenuScreenTitle => 'Ceol';

  @override
  String get nowPlayingScreenTitle => 'Anois ag imirt';

  @override
  String get shuffleSongsMenuTitle => 'Amhráin Shuffle';

  @override
  String get shuffleSettingTitle => 'Seafta';

  @override
  String get settingsScreenTitle => 'Socruithe';

  @override
  String get aboutScreenTitle => 'Thart ar';

  @override
  String get coverFlowScreenTitle => 'Sreabhadh clúdaigh';

  @override
  String get artistsScreenTitle => 'Ealaíontóirí';

  @override
  String get albumsScreenTitle => 'Albam';

  @override
  String get songsScreenTitle => 'Amhrán';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Amhráin',
      one: '1 amhrán',
      zero: 'gan aon amhráin',
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
      other: '$countString Albam',
      one: '1 albam',
      zero: 'gan aon albam',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Seánraí';

  @override
  String get genreSongsScreenTitle => 'Amhráin seánra';

  @override
  String get deviceColorSettingTitle => 'Dath gléas';

  @override
  String get touchScreenSettingTitle => 'Scáileán tadhaill cumasaithe';

  @override
  String get repeatModeSettingTitle => 'Athchraol';

  @override
  String get repeatModeOne => 'Aon ... amháin';

  @override
  String get repeatModeAll => 'Uile';

  @override
  String get vibrateSettingTitle => 'Creathadh';

  @override
  String get clickWheelSettingTitle => 'Cliceáil Fuaimeanna Wheel';

  @override
  String get splitScreenSettingTitle => 'Mód scáileáin scoilte';

  @override
  String get touchSoundsDialogTitle => 'Fuaimeanna tadhaill';

  @override
  String get touchSoundsDialogContent => 'Cumasaigh fuaimeanna tadhaill ó shuíomhanna córais le do thoil chun na fuaimeanna roth cliceáil a chloisteáil';

  @override
  String get immersiveModeSettingTitle => 'Mód tumtha';

  @override
  String get showAppTutorialSettingTitle => 'Taispeáin rang teagaisc';

  @override
  String get changeDirectorySettingTitle => 'Athrú ar an eolaire';

  @override
  String get donateSettingTitle => 'Síntigh';

  @override
  String get donateSettingDescription => 'Más maith leat an feidhmchlár seo, smaoinigh ar bhronnadh.';

  @override
  String get versionAboutScreenTitle => 'Leagan';

  @override
  String get madeWithLoveTitle => 'Déanta le ❤️ le';

  @override
  String get noMusicFilesFound => 'Aon cheol';

  @override
  String get noArtistsFound => 'Gan Ealaíontóirí';

  @override
  String get noAlbumsFound => 'Uimh Albam';

  @override
  String get unknownSong => 'Amhrán Anaithnid';

  @override
  String get unknownArtist => 'Ealaíontóir Anaithnid';

  @override
  String get unknownAlbum => 'Albam anaithnid';

  @override
  String get unknownGenre => 'Seánra anaithnid';

  @override
  String get buttonConfirmText => 'Go maith';

  @override
  String get tileValueOn => 'Ar';

  @override
  String get tileValueOff => 'Ar ceal';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'Níor aimsíodh an leathanach a tugadh';

  @override
  String get commonErrorText => 'Earráid';

  @override
  String get retryButtonText => 'Ais a chur ar ais';

  @override
  String get filePickerDialogTitle => 'Roghnaigh eolaire le scanadh don cheol';

  @override
  String get searchScreenTitle => 'Cíor';

  @override
  String get searchEmptyText => 'Gan Torthaí Cuardaigh';

  @override
  String get searchResultsText => 'Torthaí cuardaigh:';

  @override
  String get resultsForText => 'Torthaí do:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimization ceallraí a dhíchumasú';

  @override
  String get disableBatteryOptimizationContent => 'Díchumasaigh barrfheabhsú ceallraí don aip seo i suíomhanna na bhfeistí chun athsheinm cúlra an cheoil a cheadú.';

  @override
  String get languageScreenTitle => 'Teanga';

  @override
  String get silverDeviceColor => 'Airgead';

  @override
  String get blackDeviceColor => 'Dubh salach';

  @override
  String get resetSettingsTitle => 'Socruithe a athshocrú';

  @override
  String get browseArtist => 'Brabhsáil Ealaíontóir';

  @override
  String get browseAlbum => 'Brabhsáil albam';

  @override
  String get cancelText => 'Cealaigh';

  @override
  String get playlistsScreenTitle => 'Seinmliostaí';

  @override
  String get addToOnTheGoPlaylist => 'Cuir le dul ar-an-dul';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Cuir albam leis ar-an-dul';

  @override
  String get removeSongFromThePlaylist => 'Bain as an seinmliosta';

  @override
  String get allAlbums => 'Gach albam';

  @override
  String get scanningMusicFiles => 'Comhaid cheoil a scanadh';

  @override
  String get newPlaylist => 'Seinmliosta nua';

  @override
  String get savePlaylist => 'Sábháil seinmliosta';

  @override
  String get clearPlaylist => 'Seinmliosta soiléir';

  @override
  String get rescanMusicFilesSettingTitle => 'Comhaid cheoil a athscríobh';

  @override
  String get deviceControlMenuTutorialText => 'Bog do ordóg go héadrom timpeall an roth cliceáil chun nascleanúint a dhéanamh ar an roghchlár';

  @override
  String get centerButtonMenuTutorialText => 'Brúigh an cnaipe Ionad chun an mhír roghchlár aibhsithe a roghnú';

  @override
  String get playPauseMenuTutorialText => 'Brúigh an cnaipe seo chun amhrán a imirt nó sos';

  @override
  String get nextButtonMenuTutorialText => 'Brúigh an cnaipe seo chun scipeáil chuig an gcéad amhrán eile';

  @override
  String get previousButtonMenuTutorialText => 'Brúigh an cnaipe seo chun athghairm a dhéanamh nó dul ar ais chuig an amhrán roimhe seo';

  @override
  String get menuButtonTutorialText => 'Brúigh an cnaipe seo chun dul ar ais go dtí an roghchlár roimhe seo. D\'fhéadfá é a bhrú agus a choinneáil ó aon scáileán eile chun dul go díreach chuig an bpríomh -roghchlár.';

  @override
  String get deviceScreenMenuTutorialText => 'Is é seo an scáileán taispeána. Cumasaítear an scáileán tadhaill agus an modh scáileáin scoilte de réir réamhshocraithe agus is féidir iad a chumrú tuilleadh sna suíomhanna.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Bog do ordóg timpeall an roth cliceáil chun an toirt a choigeartú';

  @override
  String get centerButtonNowPlayingTutorialText => 'Brúigh an cnaipe Ionad chun rothaíocht a dhéanamh trí bharra, barra sciúrtha agus sleamhnán a shuaitheadh. Brúigh agus coinnigh an cnaipe Ionad chun rochtain a fháil ar roghanna breise.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Brúigh agus coinnigh an cnaipe seo chun an t -amhrán a chur ar aghaidh go tapa';

  @override
  String get previousButtonNowPlayingTutorialText => 'Brúigh agus coinnigh an cnaipe seo chun an t -amhrán a athsheoladh';

  @override
  String get deviceControlSearchTutorialText => 'Bog do ordóg go héadrom timpeall an roth cliceáil chun aibítir a aibhsiú';

  @override
  String get centerButtonSearchTutorialText => 'Brúigh an cnaipe Ionad chun an aibítir aibhsithe a roghnú';

  @override
  String get nextButtonSearchTutorialText => 'Brúigh an cnaipe seo chun spás a chur leis';

  @override
  String get previousButtonSearchTutorialText => 'Brúigh an cnaipe seo chun an carachtar deireanach a scriosadh';

  @override
  String get menuButtonSearchTutorialText => 'Brúigh an cnaipe seo chun an méarchlár a dhúnadh agus idirghníomhú leis na torthaí cuardaigh';
}
