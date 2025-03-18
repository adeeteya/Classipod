// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uighur Uyghur (`ug`).
class AppLocalizationsUg extends AppLocalizations {
  AppLocalizationsUg([String locale = 'ug']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'تىزىملىك';

  @override
  String get audioAccessPermissionTitle =>
      'ئاۋازلىق زىيارەت ئىجازەتنامىسى تەلەپ قىلىنىدۇ';

  @override
  String get audioAccessPermissionContent =>
      'ئاۋازلىق ھۆججەتلىرىڭىزنى زىيارەت قىلىشىمىزغا ياردەم قىلىڭ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ئۈندىدار قايتۇرۇش ئىجازەتنامىسى رەت قىلىندى';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ئۈسكۈنىنىڭ تەڭشەكلىرىدىكى بۇ دېتالنىڭ ھۆججەتلىرىنى زىيارەت قىلىشىمىزغا يول قويۇڭ.';

  @override
  String get menuScreenTitle => 'تىزىملىك';

  @override
  String get musicMenuScreenTitle => 'مۇزىكا';

  @override
  String get nowPlayingScreenTitle => 'ھازىر ئويناش';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'تەڭشەك';

  @override
  String get aboutScreenTitle => 'ھەققىدە';

  @override
  String get coverFlowScreenTitle => 'يېپىش';

  @override
  String get artistsScreenTitle => 'سەنئەتكارلار';

  @override
  String get albumsScreenTitle => 'پىلاستىنكا';

  @override
  String get songsScreenTitle => 'ناخشالار';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Songs',
      one: '1 Song',
      zero: 'No Songs',
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
      other: '$countString Album',
      one: '1 Album',
      zero: 'ئالبوم يوق',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ژانىرلار';

  @override
  String get genreSongsScreenTitle => 'ژانىكىلىق ناخشا';

  @override
  String get deviceColorSettingTitle => 'ئۈسكۈنە رەڭگى';

  @override
  String get touchScreenSettingTitle => 'سېزىمچان ئېكران قوزغىتىلدى';

  @override
  String get repeatModeSettingTitle => 'تەكرارلاڭ';

  @override
  String get repeatModeOne => 'بىرى';

  @override
  String get repeatModeAll => 'All';

  @override
  String get vibrateSettingTitle => 'تەۋرىنىش';

  @override
  String get clickWheelSettingTitle => 'چاق ئاۋازىنى چېكىڭ';

  @override
  String get splitScreenSettingTitle => 'بۆلۈش ئېكرانى ھالىتى';

  @override
  String get touchSoundsDialogTitle => 'Touch Sounds';

  @override
  String get touchSoundsDialogContent =>
      'سىستېما تەڭشىكىدىن چەكمە ئاۋازلارنى قوزغىتىڭ';

  @override
  String get immersiveModeSettingTitle => 'چاقىرىش ھالىتى';

  @override
  String get showAppTutorialSettingTitle => 'دەرسلىك كۆرسەت';

  @override
  String get changeDirectorySettingTitle => 'مۇندەرىجىنى ئۆزگەرتىڭ';

  @override
  String get donateSettingTitle => 'ئىئانە قىلىڭ';

  @override
  String get donateSettingDescription =>
      'ئەگەر بۇ ئەپنى ياقتۇرسىڭىز, ئىئانە قىلىشنى ئويلىشىڭ.';

  @override
  String get versionAboutScreenTitle => 'نەشرى';

  @override
  String get madeWithLoveTitle => '❤️ بىلەن ياسالغان';

  @override
  String get noMusicFilesFound => 'مۇزىكا يوق';

  @override
  String get noArtistsFound => 'سەنئەتكار يوق';

  @override
  String get noAlbumsFound => 'ھېچقانداق ئالبۇم يوق';

  @override
  String get unknownSong => 'نامەلۇم ناخشا';

  @override
  String get unknownArtist => 'نامەلۇم سەنئەتكار';

  @override
  String get unknownAlbum => 'نامەلۇم پىلاستىنكا';

  @override
  String get unknownGenre => 'نامەلۇم ژانىر';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'Of';

  @override
  String get pageNotFoundText => 'بېرىلگەن بەت تېپىلمىدى';

  @override
  String get commonErrorText => 'خاتالىق';

  @override
  String get retryButtonText => 'قايتا سىناڭ';

  @override
  String get filePickerDialogTitle =>
      'مۇزىكىنى سايىلەش ئۈچۈن مۇندەرىجىنى تاللاڭ';

  @override
  String get searchScreenTitle => 'ئىزدەش';

  @override
  String get searchEmptyText => 'ئىزدەش نەتىجىسى يوق';

  @override
  String get searchResultsText => 'ئىزدەش نەتىجىسى:';

  @override
  String get resultsForText => 'نەتىجە:';

  @override
  String get disableBatteryOptimizationTitle =>
      'باتارېيە ئەلالاشتۇرۇشنى چەكلەش';

  @override
  String get disableBatteryOptimizationContent =>
      'ئۈسكۈنىنىڭ تەڭشەكلىرىگە باتارېيە نەشرىدىكى باتارېيە ئەلالاشتۇرۇشىنى چەكلەش.';

  @override
  String get languageScreenTitle => 'تىل';

  @override
  String get silverDeviceColor => 'كۈمۈش';

  @override
  String get blackDeviceColor => 'قارا';

  @override
  String get resetSettingsTitle => 'تەڭشەكلەرنى ئەسلىگە كەلتۈرۈش';

  @override
  String get browseArtist => 'سەنئەتكارنى كۆرۈڭ';

  @override
  String get browseAlbum => 'پىلاستىنكا';

  @override
  String get cancelText => 'بىكار قىلىش';

  @override
  String get playlistsScreenTitle => 'قويۇش تىزىملىكى';

  @override
  String get addToOnTheGoPlaylist => 'بارىدىغانلارغا قوشۇڭ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'مېڭىش ئۈچۈن پىلاستىنكا قوشۇڭ';

  @override
  String get removeSongFromThePlaylist => 'قويۇش تىزىملىكىدىن چىقىرىۋېتىڭ';

  @override
  String get allAlbums => 'بارلىق پىلاستىنكىلار';

  @override
  String get scanningMusicFiles => 'مۇزىكا ھۆججىتىنى سايىلەش';

  @override
  String get newPlaylist => 'يېڭى قويۇش تىزىملىكى';

  @override
  String get savePlaylist => 'Playlist نى تېجەڭ';

  @override
  String get clearPlaylist => 'قويۇش تىزىملىكى';

  @override
  String get rescanMusicFilesSettingTitle => 'قۇتقۇزۇش مۇزىكا ھۆججىتى';

  @override
  String get deviceControlMenuTutorialText =>
      'باش بارمىقىڭىزنى چېكىپ تىزىملىكنى چېكىپ تىزىملىككە يۆتكىڭ';

  @override
  String get centerButtonMenuTutorialText => 'چوڭ تىزىملىك ​​تۈرىنى تاللاڭ';

  @override
  String get playPauseMenuTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ ناخشىنى قويۇش ياكى توختىتىش ئۈچۈن بۇ كۇنۇپكىنى بېسىڭ';

  @override
  String get nextButtonMenuTutorialText =>
      'كېيىنكى ناخشىغا ئاتلىنىش ئۈچۈن بۇ كۇنۇپكىنى بېسىڭ';

  @override
  String get previousButtonMenuTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ ئىلگىرىكى ناخشىغا قايتىڭ ياكى قاينىتىڭ';

  @override
  String get menuButtonTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ ئالدىنقى تىزىملىككە قايتىڭ. ئۇنى باشقا ئېكراندىن بىۋاسىتە تىزىملىككە بارالايسىز ۋە تۇتالايسىز.';

  @override
  String get deviceScreenMenuTutorialText =>
      'بۇ كۆرسىتىش ئېكرانى. سۈكۈتتىكى ھالەتتە سېزىمچان ئېكران ۋە بۆلۈش ھالىتى قوزغىتىلغان بولۇپ, تەڭشەكلەردە تېخىمۇ چوڭ چەكلىگىلى بولىدۇ.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'باش بارمىقىڭىزنى چېكىپ ئاۋازنى تەڭشەش ئۈچۈن چېكىڭ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'مەركەزنى بېسىپ ئۆتۈش بالدىكنى بېسىپ ئۆگزىسى, سۈرتكۈچ بالداق ۋە Shuffle Sliffer ئارقىلىق دەۋرىيلەڭ. قوشۇمچە تاللاشلارنى زىيارەت قىلىش ئۈچۈن مەركىزى كۇنۇپكىنى بېسىڭ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ بۇ كۇنۇپكىنى بېسىڭ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ بۇ كۇنۇپكىنى بېسىپ ناخشىنى ئەسلىگە كەلتۈرۈڭ';

  @override
  String get deviceControlSearchTutorialText =>
      'باش بارمىقىڭىزنى لامپۇچكىڭىزنى چېكىپ ئېلىپبەنى گەۋدىلەندۈرۈش ئۈچۈن چېكىڭ';

  @override
  String get centerButtonSearchTutorialText =>
      'مەركىزى كۇنۇپكىنى بېسىپ گەۋدىلەنگەن ئېلىپبەنى تاللاڭ';

  @override
  String get nextButtonSearchTutorialText =>
      'بوشلۇق قوشۇش ئۈچۈن بۇ كۇنۇپكىنى بېسىڭ';

  @override
  String get previousButtonSearchTutorialText =>
      'بۇ كۇنۇپكىنى بېسىپ ئاخىرقى ھەرپنى ئۆچۈرۈڭ';

  @override
  String get menuButtonSearchTutorialText =>
      'كۇنۇپكا تاختىسىنى ۋە ئىزدەش نەتىجىسىنى تاقاش ئۈچۈن بۇ كۇنۇپكىنى بېسىڭ';

  @override
  String get allSongs => 'بارلىق ناخشىلار';
}
