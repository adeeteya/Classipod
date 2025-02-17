// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Shona (`sn`).
class AppLocalizationsSn extends AppLocalizations {
  AppLocalizationsSn([String locale = 'sn']) : super(locale);

  @override
  String get appTitle => 'Claspod';

  @override
  String get menuButtonText => 'Menyu';

  @override
  String get audioAccessPermissionTitle => 'Audio Kuwana Mvumo Inodiwa';

  @override
  String get audioAccessPermissionContent =>
      'Ndokumbirawo ubudise Audio mafaira ekuwana kuti ubvume kuti utambe mafaera ako emimhanzi.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Stick Mvumo yakarambwa';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ndokumbirawo ubate Audio mafaira ekuwana iyi App muzvishandiso zvekushandisa kuti utore isu kutamba mafaera ako emimhanzi.';

  @override
  String get menuScreenTitle => 'Menyu';

  @override
  String get musicMenuScreenTitle => 'Mumhanzi';

  @override
  String get nowPlayingScreenTitle => 'Zvino kutamba';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Zvirongwa';

  @override
  String get aboutScreenTitle => 'Nezve';

  @override
  String get coverFlowScreenTitle => 'Kufukidza kuyerera';

  @override
  String get artistsScreenTitle => 'Artists';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Nziyo';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nziyo',
      one: '1 Rwiyo',
      zero: 'Hapana ma Nziyo',
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
      zero: 'Hapana ma Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre nziyo';

  @override
  String get deviceColorSettingTitle => 'Mudziyo wedzidzo';

  @override
  String get touchScreenSettingTitle => 'Bata Screen Yakagoneswa';

  @override
  String get repeatModeSettingTitle => 'Dzokorora';

  @override
  String get repeatModeOne => 'Poshi';

  @override
  String get repeatModeAll => 'Zvese';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Dzvanya Wiricheya';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Kubata manzwi';

  @override
  String get touchSoundsDialogContent =>
      'Ndokumbirawo ugonesai ruzha kubva kune system marongero ekunzwa iyo tinya wheel';

  @override
  String get immersiveModeSettingTitle => 'Nyora maitiro';

  @override
  String get showAppTutorialSettingTitle => 'Ratidza Tauraal';

  @override
  String get changeDirectorySettingTitle => 'Shandura Directory';

  @override
  String get donateSettingTitle => 'Kupa';

  @override
  String get donateSettingDescription =>
      'Kana iwe uchida iyi app, ndapota funga kupa.';

  @override
  String get versionAboutScreenTitle => 'Shanduro';

  @override
  String get madeWithLoveTitle => 'Yakagadzirwa ne ❤️ na';

  @override
  String get noMusicFilesFound => 'Hapana mimhanzi';

  @override
  String get noArtistsFound => 'Hapana artists';

  @override
  String get noAlbumsFound => 'Hapana Albums';

  @override
  String get unknownSong => 'Rwiyo isingazivikanwe';

  @override
  String get unknownArtist => 'Undical Artist';

  @override
  String get unknownAlbum => 'Album isingazivikanwe';

  @override
  String get unknownGenre => 'Genre isingazivikanwe';

  @override
  String get buttonConfirmText => 'Zvakanaka';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'of';

  @override
  String get pageNotFoundText => 'Peji rakapihwa harina kuwanikwa';

  @override
  String get commonErrorText => 'Kukanganisa';

  @override
  String get retryButtonText => 'Dzokorora';

  @override
  String get filePickerDialogTitle =>
      'Sarudza dhairekitori kuti utarise mimhanzi';

  @override
  String get searchScreenTitle => 'Tsvaga';

  @override
  String get searchEmptyText => 'Hapana mhinduro dzekutsvaga';

  @override
  String get searchResultsText => 'Mhinduro dzekutsvaga:';

  @override
  String get resultsForText => 'Mhedzisiro ye:';

  @override
  String get disableBatteryOptimizationTitle => 'Dzivisa bhatiri rekubhadhara';

  @override
  String get disableBatteryOptimizationContent =>
      'Ndokumbirawo udzorere bhatiri yekubhadhara kweiyi App muzvishandiso zvekushandisa kubvumira kutamba kwekutamba kwemimhanzi.';

  @override
  String get languageScreenTitle => 'Mutauro';

  @override
  String get silverDeviceColor => 'Sirivheri';

  @override
  String get blackDeviceColor => 'Nhema';

  @override
  String get resetSettingsTitle => 'Reset marongero';

  @override
  String get browseArtist => 'Bhurawuza Artist';

  @override
  String get browseAlbum => 'Bhurawuza Album';

  @override
  String get cancelText => 'Kanzura';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Wedzera kune-On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Wedzera album to-a-go-go';

  @override
  String get removeSongFromThePlaylist => 'Bvisa kubva kune iyo yekutamba';

  @override
  String get allAlbums => 'Zvese Albums';

  @override
  String get scanningMusicFiles => 'Kuongorora mimhanzi mafaera';

  @override
  String get newPlaylist => 'New Playlist';

  @override
  String get savePlaylist => 'Sevha Playlist';

  @override
  String get clearPlaylist => 'Kujeka Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music mafaera';

  @override
  String get deviceControlMenuTutorialText =>
      'Fambisa chigunwe chako chakareruka kutenderedza vhiri vhiri kuti utamire menyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Dzvanya bhatani repakati kuti usarudze iyo yakasimbiswa menyu chinhu';

  @override
  String get playPauseMenuTutorialText =>
      'Dzvanya bhatani iri kutamba kana kumbomira rwiyo';

  @override
  String get nextButtonMenuTutorialText =>
      'Dzvanya bhatani iri kuti uturu parwiyo runotevera';

  @override
  String get previousButtonMenuTutorialText =>
      'Dzvanya bhatani iri kuti udzorere kana kudzokera kumashure kune rwiyo rwekare';

  @override
  String get menuButtonTutorialText =>
      'Dzvanya bhatani iri kuti udzokere kumenyu yapfuura. Iwe unogona kudzvanya uye ubate kubva kune chero imwe skrini kuti uende zvakananga kumenyu menyu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ichi ndicho chirevo chechiratidziro. Bata Screen uye Spark Screen Mode inogoneswa neDefault uye inogona kugadzirirwa mberi muzvirongwa.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Fambisa chigunwe chako chakakomberedza vhiri rekuputika kugadzirisa vhoriyamu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Dzvanya bhatani reCentral kune kutenderera kuburikidza nekutsvaga bar, scrubber bar uye shuffle slider. Dzvanya uye Bata iyo Center bhatani kuti uwane mamwe sarudzo.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Dzvanya uye bata bhatani iri kuti usimudzire rwiyo';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Dzvanya uye bata bhatani iri kuti udzorere rwiyo';

  @override
  String get deviceControlSearchTutorialText =>
      'Fambisa chigunwe chako chakareruka kutenderedza vhiri vhiri kusimbisa mavara';

  @override
  String get centerButtonSearchTutorialText =>
      'Dzvanya bhatani repakati kuti usarudze mavara akaratidzwa';

  @override
  String get nextButtonSearchTutorialText =>
      'Dzvanya bhatani iri kuti uwedzere nzvimbo';

  @override
  String get previousButtonSearchTutorialText =>
      'Dzvanya bhatani iri kuti ubvise hunhu hwekupedzisira';

  @override
  String get menuButtonSearchTutorialText =>
      'Dzvanya bhatani iri kuvhara iyo keyboard uye kudyidzana nemhedzisiro yekutsvaga';
}
