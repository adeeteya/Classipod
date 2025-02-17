// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malagasy (`mg`).
class AppLocalizationsMg extends AppLocalizations {
  AppLocalizationsMg([String locale = 'mg']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'sakafo';

  @override
  String get audioAccessPermissionTitle => 'Ilaina ny fahazoan-dàlana Audio';

  @override
  String get audioAccessPermissionContent =>
      'Azafady mba omeo ny fidirana am-peo Audio dia mamela anay hilalao ny rakitra mozika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ny fahazoan-dàlana Audio dia nolavina';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Azafady mba omeo ny rakitra Audio Fandraisana an-tsoratra amin\'ity fampiharana ity ao amin\'ny Fikirana Fitaovana mba hahafahantsika milalao ny rakitra mozika.';

  @override
  String get menuScreenTitle => 'sakafo';

  @override
  String get musicMenuScreenTitle => 'MOZIKA';

  @override
  String get nowPlayingScreenTitle => 'Izao milalao izao';

  @override
  String get shuffleSongsMenuTitle => 'Hira Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Fikirana';

  @override
  String get aboutScreenTitle => 'About';

  @override
  String get coverFlowScreenTitle => 'Mandrakotra';

  @override
  String get artistsScreenTitle => 'Artists';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Hira';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hira',
      one: '1 hira',
      zero: 'tsy misy hira',
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
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'karazan-dahatsoratra';

  @override
  String get genreSongsScreenTitle => 'Genre Songs';

  @override
  String get deviceColorSettingTitle => 'Loko fitaovana';

  @override
  String get touchScreenSettingTitle => 'Ny efijery hikasika dia azo atao';

  @override
  String get repeatModeSettingTitle => 'Avereno';

  @override
  String get repeatModeOne => 'Iray';

  @override
  String get repeatModeAll => 'rehetra';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Kitiho ny feon\'ny kodiarana';

  @override
  String get splitScreenSettingTitle => 'Fomba fanoratana efijery';

  @override
  String get touchSoundsDialogTitle => 'Hikasika feo';

  @override
  String get touchSoundsDialogContent =>
      'Azafady azafady alefaso ny feo avy amin\'ny Settings Settings handrenesana ny feon\'ny kitay click';

  @override
  String get immersiveModeSettingTitle => 'Modely milentika';

  @override
  String get showAppTutorialSettingTitle => 'Asehoy ny tutorial';

  @override
  String get changeDirectorySettingTitle => 'Manova ny direktory';

  @override
  String get donateSettingTitle => 'Manomeza';

  @override
  String get donateSettingDescription =>
      'Raha tianao ity fampiharana ity, azafady mba hevero ny fanomezana.';

  @override
  String get versionAboutScreenTitle => 'Malagasy Bible';

  @override
  String get madeWithLoveTitle => 'Natao tamin\'ny ❤️';

  @override
  String get noMusicFilesFound => 'Tsy misy mozika';

  @override
  String get noArtistsFound => 'Tsy misy mpanakanto';

  @override
  String get noAlbumsFound => 'Tsy misy rakitsary';

  @override
  String get unknownSong => 'Hira tsy fantatra';

  @override
  String get unknownArtist => 'Mpanakanto tsy fantatra';

  @override
  String get unknownAlbum => 'Album tsy fantatra';

  @override
  String get unknownGenre => 'Genre tsy fantatra';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'NIALA';

  @override
  String get commonOfText => 'nY';

  @override
  String get pageNotFoundText => 'Tsy hita ny pejy nomena';

  @override
  String get commonErrorText => 'fahadisoana';

  @override
  String get retryButtonText => 'Hanandrana indray';

  @override
  String get filePickerDialogTitle =>
      'Safidio ny lahatahiry iray hikoropaka mozika';

  @override
  String get searchScreenTitle => 'karohy';

  @override
  String get searchEmptyText => 'Tsy misy valiny fikarohana';

  @override
  String get searchResultsText => 'Voka-pikarohana:';

  @override
  String get resultsForText => 'Vokatry ny:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Ampidiro ny fanalan-karena bateria';

  @override
  String get disableBatteryOptimizationContent =>
      'Azafady azafady azafady azafady ny bateria momba ny bateria ho an\'ity fampiharana ity ao amin\'ny sehatry ny fitaovana mba ahafahana mamoaka ny mozika mozika.';

  @override
  String get languageScreenTitle => 'Fiteny';

  @override
  String get silverDeviceColor => 'Silver';

  @override
  String get blackDeviceColor => 'Mainty';

  @override
  String get resetSettingsTitle => 'Reset';

  @override
  String get browseArtist => 'Zahao ny mpanakanto';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'hanafoana';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Ampio amin\'ny On-the-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ampio rakitsary amin\'ny On-the-Go';

  @override
  String get removeSongFromThePlaylist => 'Esory amin\'ny lisitry ny lisitra';

  @override
  String get allAlbums => 'All rakitsary rehetra';

  @override
  String get scanningMusicFiles => 'Ireo rakitra mozika scanning';

  @override
  String get newPlaylist => 'Playlist vaovao';

  @override
  String get savePlaylist => 'Tehirizo ny Playlist Playlist';

  @override
  String get clearPlaylist => 'Playlist mazava';

  @override
  String get rescanMusicFilesSettingTitle => 'Rakitra Rescan Music';

  @override
  String get deviceControlMenuTutorialText =>
      'Arosoy moramora ny kitrokelinao manodidina ny kitiho tsindrio mba hivezivezena ny menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Tsindrio ny bokotra Center mba hisafidy ny lisitry ny menu nalehany';

  @override
  String get playPauseMenuTutorialText =>
      'Tsindrio ity bokotra ity hilalao na hiato ny hira iray';

  @override
  String get nextButtonMenuTutorialText =>
      'Tsindrio ity bokotra ity mba hialana amin\'ny hira manaraka';

  @override
  String get previousButtonMenuTutorialText =>
      'Tsindrio ity bokotra ity mba hamerenany na hiverina amin\'ny hira teo aloha';

  @override
  String get menuButtonTutorialText =>
      'Tsindrio ity bokotra ity mba hiverina any amin\'ny menu teo aloha. Azonao atao ny manery sy mitazona azy amin\'ny efijery hafa mba handehanana mivantana amin\'ny menu lehibe.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ity no efijery fampisehoana. Ny efijery hikasika sy ny zoro efijery split dia alefa amin\'ny alàlan\'ny default ary azo amboarina bebe kokoa amin\'ny toe-javatra.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Afindra ny ankihibenanao manodidina ny kitay tsindrio hanitsy ny tahiry';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tsindrio ny bokotra Centre amin\'ny tsingerin-taona amin\'ny alàlan\'ny fikatsahana bara, barazy scrubber ary slider shuffle. Tsindrio ary mitazona ny bokotra Center mba hidirana safidy fanampiny.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tsindrio ary hazaho ity bokotra ity mba hanamafisana ny hira';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tsindrio ary hazaho ity bokotra ity mba hamerenanao ny hira';

  @override
  String get deviceControlSearchTutorialText =>
      'Arosoy moramora ny kitrokelinao manodidina ny kitiho tsindrio mba hanasongadinana ny abidia';

  @override
  String get centerButtonSearchTutorialText =>
      'Tsindrio ny bokotra Center hisafidy ny abidia nasongadina';

  @override
  String get nextButtonSearchTutorialText =>
      'Tsindrio ity bokotra ity mba hanampiana toerana';

  @override
  String get previousButtonSearchTutorialText =>
      'Tsindrio ity bokotra ity mba hamafa ny toetra farany';

  @override
  String get menuButtonSearchTutorialText =>
      'Tsindrio ity bokotra ity hanakatonana ny fitendry ary hifanerasera amin\'ny valin\'ny fikarohana';
}
