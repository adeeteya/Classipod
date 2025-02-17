// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Scottish Gaelic Gaelic (`gd`).
class AppLocalizationsGd extends AppLocalizations {
  AppLocalizationsGd([String locale = 'gd']) : super(locale);

  @override
  String get appTitle => 'Clascipod';

  @override
  String get menuButtonText => 'Clàr-taice';

  @override
  String get audioAccessPermissionTitle =>
      'Feumar cead ruigsinneachd claisneachd a tha a dhìth';

  @override
  String get audioAccessPermissionContent =>
      'Feuch an toir thu cothrom air faidhlichean claisneachd gus leigeil leinn na faidhlichean ciùil agad a chluich.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ruigsinneachd ruigsinneachd claisneachd air a dhiùltadh';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Feuch an toir thu cothrom air faidhlichean claisneachd airson an aplacaid seo ann an suidheachadh an inneal gus leigeil leinn faidhlichean ciùil agad a chluich.';

  @override
  String get menuScreenTitle => 'Clàr-taice';

  @override
  String get musicMenuScreenTitle => 'Ceòl';

  @override
  String get nowPlayingScreenTitle => 'A-nis a \'cluich';

  @override
  String get shuffleSongsMenuTitle => 'Òrain shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Roghainnean';

  @override
  String get aboutScreenTitle => 'Mu dheidhinn';

  @override
  String get coverFlowScreenTitle => 'Sruthadh còmhdach';

  @override
  String get artistsScreenTitle => 'Luchd-ealain';

  @override
  String get albumsScreenTitle => 'Clàran';

  @override
  String get songsScreenTitle => 'Òrain';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lalai',
      one: '1 Lala',
      zero: 'Lalai Bɛ',
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
      other: '$countString Albɔm',
      one: '1 Albɔm',
      zero: 'Album ko bɛ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gnèithean';

  @override
  String get genreSongsScreenTitle => 'Òrain gnè';

  @override
  String get deviceColorSettingTitle => 'Dath inneal';

  @override
  String get touchScreenSettingTitle => 'Sgrùdadh Touch air a chomasachadh';

  @override
  String get repeatModeSettingTitle => 'Ath-aithris';

  @override
  String get repeatModeOne => 'Aon';

  @override
  String get repeatModeAll => 'Uile';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Cliog air fuaimean cuibhle';

  @override
  String get splitScreenSettingTitle => 'Modh Sgrion Split';

  @override
  String get touchSoundsDialogTitle => 'Fuaimean suathadh';

  @override
  String get touchSoundsDialogContent =>
      'Feuch an cuir thu le bhith a \'suathadh ri fuaimean an t-siostaim gus na fuaimean cuibhle cliog cliog claidheamh a chluinntinn';

  @override
  String get immersiveModeSettingTitle => 'Modh bogaidh';

  @override
  String get showAppTutorialSettingTitle => 'Seall Oideachadh';

  @override
  String get changeDirectorySettingTitle => 'Atharraich eòlaire';

  @override
  String get donateSettingTitle => 'Thoir seachad';

  @override
  String get donateSettingDescription =>
      'Mas toil leat an aplacaid seo, smaoinich air a bhith a \'toirt seachad.';

  @override
  String get versionAboutScreenTitle => 'Tionndadh';

  @override
  String get madeWithLoveTitle => 'Air a dhèanamh le ❤️ le';

  @override
  String get noMusicFilesFound => 'Gun cheòl';

  @override
  String get noArtistsFound => 'Gun luchd-ealain';

  @override
  String get noAlbumsFound => 'No albums';

  @override
  String get unknownSong => 'Òran neo-aithnichte';

  @override
  String get unknownArtist => 'Neach-ealain neo-aithnichte';

  @override
  String get unknownAlbum => 'Album neo-aithnichte';

  @override
  String get unknownGenre => 'Gnè neo-aithnichte';

  @override
  String get buttonConfirmText => 'Ceart gu leòr';

  @override
  String get tileValueOn => 'Air';

  @override
  String get tileValueOff => 'Dheth';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText =>
      'Cha deach an duilleag a chaidh a thoirt seachad a lorg';

  @override
  String get commonErrorText => 'Mearachd';

  @override
  String get retryButtonText => 'Ath-ghairm';

  @override
  String get filePickerDialogTitle => 'Tagh eòlaire airson scan airson ceòl';

  @override
  String get searchScreenTitle => 'Rannsaich';

  @override
  String get searchEmptyText => 'Chan eil toraidhean rannsachaidh ann';

  @override
  String get searchResultsText => 'Toraidhean rannsachaidh:';

  @override
  String get resultsForText => 'Toraidhean airson:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Cuir à comas Optimization bataraidh';

  @override
  String get disableBatteryOptimizationContent =>
      'Cuir a-mach an optas bataraidh airson an aplacaid seo ann an suidheachadh an inneal gus leigeil le cùl-taic ceòl.';

  @override
  String get languageScreenTitle => 'Cànan';

  @override
  String get silverDeviceColor => 'Airgead';

  @override
  String get blackDeviceColor => 'Dubh';

  @override
  String get resetSettingsTitle => 'Reseting Settings';

  @override
  String get browseArtist => 'Dèan brobhsadh Neach-ealain';

  @override
  String get browseAlbum => 'Dèan brobhsadh air a \'chlàr';

  @override
  String get cancelText => 'Sguir dheth';

  @override
  String get playlistsScreenTitle => 'Clàran-ciùil';

  @override
  String get addToOnTheGoPlaylist => 'Cuir ris an taobh a-muigh';

  @override
  String get addAlbumToOnTheGoPlaylist =>
      'Cuir a-steach Album gu air-the-dol-falbh';

  @override
  String get removeSongFromThePlaylist => 'Thoir air falbh bhon liosta-cluiche';

  @override
  String get allAlbums => 'A h-uile clàr';

  @override
  String get scanningMusicFiles => 'Sganadh faidhlichean ciùil';

  @override
  String get newPlaylist => 'Liosta-cluiche ùr';

  @override
  String get savePlaylist => 'Sàbhail Playlist';

  @override
  String get clearPlaylist => 'Liosta-cluiche soilleir';

  @override
  String get rescanMusicFilesSettingTitle => 'Faidhlichean ciùil Freecan';

  @override
  String get deviceControlMenuTutorialText =>
      'Gluais do òrdag timcheall air a \'chuibhle cliog gus an clàr-bìdh a sheòladh';

  @override
  String get centerButtonMenuTutorialText =>
      'Brùth putan an ionaid gus an rud a \'phrìomh stiùireadh a thaghadh';

  @override
  String get playPauseMenuTutorialText =>
      'Brùth am putan seo gus òran a chluich no stad a chuir air òran';

  @override
  String get nextButtonMenuTutorialText =>
      'Brùth am putan seo gus leum chun ath òran';

  @override
  String get previousButtonMenuTutorialText =>
      'Brùth am putan seo gus ath-fhilleadh no a dhol air ais chun òran roimhe';

  @override
  String get menuButtonTutorialText =>
      'Brùth am putan seo gus a dhol air ais chun chlàr roimhe. B \'urrainn dhut a bhrùth agus a chumail bho scrion sam bith eile gus a dhol chun phrìomh chlàr.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Is e seo an scrion taisbeanaidh. Tha Modh Foot Food agus Modh Sgrion Roinnte air an comasachadh gu bunaiteach agus faodar an cur air dòigh nas fhaide anns na suidheachaidhean.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Gluais do òrdag timcheall air a \'chuibhle cliog gus an tomhas-lìonaidh atharrachadh';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Brùth putan an ionaid gus rothaireachd tro shireadh bàr, bàr scuubber bàr agus sleamhnaiche shuffle. Brùth agus cùm putan an ionaid gus faighinn gu roghainnean a bharrachd.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Brùth agus cùm am putan seo gus an t-òran a chuir air adhart gu luath air adhart';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Brùth agus cùm am putan seo gus an t-òran ath-shuidheachadh';

  @override
  String get deviceControlSearchTutorialText =>
      'Gluais do òrdag timcheall air a \'chuibhle cliog gus a bhith a\' soilleireachadh aibideil';

  @override
  String get centerButtonSearchTutorialText =>
      'Brùth putan an Ionaid gus an aibideil a tha air an comharrachadh';

  @override
  String get nextButtonSearchTutorialText =>
      'Brùth am putan seo gus àite a chuir ris';

  @override
  String get previousButtonSearchTutorialText =>
      'Brùth am putan seo gus cuir às don charactar mu dheireadh';

  @override
  String get menuButtonSearchTutorialText =>
      'Brùth am putan seo gus am meur-chlàr a dhùnadh agus eadar-obrachadh leis na toraidhean rannsachaidh';
}
