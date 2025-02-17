// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tumbuka (`tum`).
class AppLocalizationsTum extends AppLocalizations {
  AppLocalizationsTum([String locale = 'tum']) : super(locale);

  @override
  String get appTitle => 'Kusambira';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Kuzomerezga kwa Adio Kukhumba Kukhumba';

  @override
  String get audioAccessPermissionContent =>
      'Chonde tipeleke ku mafayilo ghakupulikika kuti ghatizomerezge kuseŵera mafayilo ghinu gha sumu.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Accesssion Kuchita Kuleka .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Chonde perekani mafayilo ghakupulikikwa gha pulogiramu iyi mu vipangizo vya chipangizo kuti vizomerezgeke kuseŵera mafayilo ghinu gha sumu.';

  @override
  String get menuScreenTitle => 'Meno';

  @override
  String get musicMenuScreenTitle => 'Sumu';

  @override
  String get nowPlayingScreenTitle => 'Sono Kuseŵera';

  @override
  String get shuffleSongsMenuTitle => 'Nyimbo za Shuffle';

  @override
  String get shuffleSettingTitle => 'Sintha';

  @override
  String get settingsScreenTitle => 'vyakuŵikapo';

  @override
  String get aboutScreenTitle => 'Pafupifupi';

  @override
  String get coverFlowScreenTitle => 'Kuvika Kuvika Kulila';

  @override
  String get artistsScreenTitle => 'Ŵanthu awo ŵakususka vyakupangapanga';

  @override
  String get albumsScreenTitle => 'Ma album';

  @override
  String get songsScreenTitle => 'Nyino';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nyimbo',
      one: '1 Sumu',
      zero: 'Palije Nyimbo',
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
      other: '$countString Ma albamu',
      one: '1 Albamu',
      zero: 'Palije ma albamu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mitundu';

  @override
  String get genreSongsScreenTitle => 'Nyino za Ŵamitundu';

  @override
  String get deviceColorSettingTitle => 'Munthu wa Upangizi';

  @override
  String get touchScreenSettingTitle => 'Kukhwaska Kumanyikwa';

  @override
  String get repeatModeSettingTitle => 'Welezga';

  @override
  String get repeatModeOne => 'Chimoza';

  @override
  String get repeatModeAll => 'Tose';

  @override
  String get vibrateSettingTitle => 'Fumbani';

  @override
  String get clickWheelSettingTitle => 'Dofyani pa Malemba';

  @override
  String get splitScreenSettingTitle => 'Munthu wa Sclit';

  @override
  String get touchSoundsDialogTitle => 'Kukhwaska Mazgu';

  @override
  String get touchSoundsDialogContent =>
      'Chonde lembani Vimanyikwiro vyakufuma ku System Settings kuti mupulike mazgu gha thaya la click';

  @override
  String get immersiveModeSettingTitle => 'Mode Yakubizga';

  @override
  String get showAppTutorialSettingTitle => 'Mulongolo Chisambizgo';

  @override
  String get changeDirectorySettingTitle => 'Kusintha';

  @override
  String get donateSettingTitle => 'Peleka';

  @override
  String get donateSettingDescription =>
      'Usange mukutemwa pulogiramu iyi, chonde khalani na mwaŵi wa kupeleka.';

  @override
  String get versionAboutScreenTitle => 'Baibolo';

  @override
  String get madeWithLoveTitle => 'Kupangika na ❤mpumara na .';

  @override
  String get noMusicFilesFound => 'Palije Nyiniko';

  @override
  String get noArtistsFound =>
      'Ŵanthu awo ŵakaŵa ŵaluso yayi, no Mafitithanji ŵacita vya Ŵaluso, ŵakusambizga vya Ŵaluso.';

  @override
  String get noAlbumsFound => 'Palije Albums';

  @override
  String get unknownSong => 'Nyimbo yambura kumanyikwa';

  @override
  String get unknownArtist =>
      'Munthu uyo ​​wakamanyikwanga yayi wakuchita maseŵero';

  @override
  String get unknownAlbum => 'Album wambura kumanyikwa';

  @override
  String get unknownGenre => 'Genre wakamanyikwa yayi';

  @override
  String get buttonConfirmText => 'ENYA';

  @override
  String get tileValueOn => 'Pa';

  @override
  String get tileValueOff => 'Kuzimwa';

  @override
  String get commonOfText => 'wa';

  @override
  String get pageNotFoundText => 'Pa tchati ilo lapelekeka likasangika yayi';

  @override
  String get commonErrorText => 'Zangika';

  @override
  String get retryButtonText => 'Kunozga';

  @override
  String get filePickerDialogTitle => 'Sankhani Directory ku Scan kwa Nyimbo .';

  @override
  String get searchScreenTitle => 'Penja';

  @override
  String get searchEmptyText => 'Palije vyakuchitika vyakupenja';

  @override
  String get searchResultsText => 'Vyakusangika:';

  @override
  String get resultsForText => 'Ivyo vyasangika:';

  @override
  String get disableBatteryOptimizationTitle => 'Batiriya ya kupendera';

  @override
  String get disableBatteryOptimizationContent =>
      'Chonde dinable batire optimization pa pulogiramu iyi mu vipangizo vya chipangizo kuti muzomerezge kuseŵera kwa nyimbo.';

  @override
  String get languageScreenTitle => 'Chiyowoyelo';

  @override
  String get silverDeviceColor => 'Siliva';

  @override
  String get blackDeviceColor => 'Chifipa';

  @override
  String get resetSettingsTitle => 'Kuŵikaso pa malo ghanyake';

  @override
  String get browseArtist => 'Munthu uyo ​​wakupanga mafilimu';

  @override
  String get browseAlbum => 'Album ya kutambala';

  @override
  String get cancelText => 'Kuleka';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Sazgilanipo pa Of-To';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Sazgilanipo Album ku On-T-Go';

  @override
  String get removeSongFromThePlaylist => 'Fumizganipo pa Playst.';

  @override
  String get allAlbums => 'Vyose';

  @override
  String get scanningMusicFiles => 'Kuchemerezga sumu';

  @override
  String get newPlaylist => 'Pulalife Yasono';

  @override
  String get savePlaylist => 'Sungani Plalilist ya Sunganipo';

  @override
  String get clearPlaylist => 'Selis yakuwonekera';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescani sumu';

  @override
  String get deviceControlMenuTutorialText =>
      'Sunthani chigunwe chinu pachoko waka pafupi na Dofyani Wheel kuti muyendeske menyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Tinikani batani la pakati kuti musankhe chinthu icho chaŵikika pa menyu .';

  @override
  String get playPauseMenuTutorialText =>
      'Tinikani batani ili kuti museŵerenge panji kuleka sumu .';

  @override
  String get nextButtonMenuTutorialText =>
      'Tinikani batani ili kuti mujumphe ku sumu yakulondezgapo .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tinikani batani ili kuti muwelere panji kuwelera ku sumu iyo yikaŵako kumanyuma .';

  @override
  String get menuButtonTutorialText =>
      'Tinikani batani ili kuti muwelere ku menyu iyo yikaŵako kumanyuma. Mungafikiska na kuchikora pa chithuzithuzi chilichose kuti mulute ku menyu yikuru.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Iyi ndiyo skrini yakulongolera. Kukhwaska Screen na Split Screen Mode ŵakuzomerezgeka mwa kuŵikapo mtima ndipo ŵangakonzekeraso mu vigaŵa.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Sinthani chigunwe chinu kuzingilizga Click Wheel kuti musinthe voliyumu .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tinikani batani la Center kuti liyenderenge mu bar yakupenja, bar ya scrubber na slider ya slider. Dinikani na kusunga Center kuti muŵe na mwaŵi wa kusanga vinthu vinyake.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Dinikani na kukora batani ili mwaluŵiro panthazi pa sumu .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tinikani na kukora batani ili kuti muwiske sumu .';

  @override
  String get deviceControlSearchTutorialText =>
      'Sunthani chigunwe chinu pachoko waka pafupi na Click Wheel kuti muwoneske alfabeti .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tinikani batani la pakati kuti musankhe alfabeti iyo yalongosoreka .';

  @override
  String get nextButtonSearchTutorialText =>
      'Tinikani batani ili kuti musazgireko malo';

  @override
  String get previousButtonSearchTutorialText =>
      'Tinikani batani ili kuti mufunyepo munthu waumaliro .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tinikani batani ili kuti mujalire kiyibodi na kuchezga na ivyo mwapenja .';
}
