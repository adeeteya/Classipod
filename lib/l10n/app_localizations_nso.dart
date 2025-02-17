// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pedi Northern Sotho Sepedi (`nso`).
class AppLocalizationsNso extends AppLocalizations {
  AppLocalizationsNso([String locale = 'nso']) : super(locale);

  @override
  String get appTitle => 'ClassIpod';

  @override
  String get menuButtonText => 'Menu ya';

  @override
  String get audioAccessPermissionTitle =>
      'Tumelelo ya phihlelelo ya modumo e a nyakega';

  @override
  String get audioAccessPermissionContent =>
      'Hle fa difaele tša mamelwang phihlelelo go re dumelela go bapala difaele tša gago tša mmino.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Tumelelo ya Phihlelelo ya Modumo e gannwe';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Hle fa difaele tša modumo phihlelelo ya tirišo ye ka go dipeakanyo tša sedirišwa go re dumelela go bapala difaele tša gago tša mmino.';

  @override
  String get menuScreenTitle => 'Menu ya';

  @override
  String get musicMenuScreenTitle => 'Mmino';

  @override
  String get nowPlayingScreenTitle => 'Bjale o bapala';

  @override
  String get shuffleSongsMenuTitle => 'Dikoša tša go hlakahlakanya';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Dipeakanyo';

  @override
  String get aboutScreenTitle => 'Mabapi le';

  @override
  String get coverFlowScreenTitle => 'Sekhurumelo Phallo';

  @override
  String get artistsScreenTitle => 'Bataki';

  @override
  String get albumsScreenTitle => 'Dialbamo';

  @override
  String get songsScreenTitle => 'Dipina';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Dipina',
      one: '1 Koša',
      zero: 'Ga go na Dikoša',
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
      other: '$countString Dialbamo tša go šoma',
      one: '1 Alebamo ya',
      zero: 'Ga go na Dialbamo',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mehuta ya Dikanegelo';

  @override
  String get genreSongsScreenTitle => 'Dikoša tša mohutana';

  @override
  String get deviceColorSettingTitle => 'Mmala wa sesebediswa';

  @override
  String get touchScreenSettingTitle => 'Skrine sa go kgoma se kgontšhitšwe';

  @override
  String get repeatModeSettingTitle => 'Bušeletša';

  @override
  String get repeatModeOne => 'Tee';

  @override
  String get repeatModeAll => 'Ka moka';

  @override
  String get vibrateSettingTitle => 'Go thothomela';

  @override
  String get clickWheelSettingTitle => 'Tobetsa Medumo ya Leotwana';

  @override
  String get splitScreenSettingTitle => 'Mokgwa wa skrine se arohaneng';

  @override
  String get touchSoundsDialogTitle => 'Medumo ya go kgoma';

  @override
  String get touchSoundsDialogContent =>
      'Hle kgontšha medumo ya go kgoma go tšwa go dipeakanyo tša tshepedišo go kwa medumo ya maotwana ya go kgotla';

  @override
  String get immersiveModeSettingTitle => 'Mokgwa wa go nwelela';

  @override
  String get showAppTutorialSettingTitle => 'Thuto ya Bontša';

  @override
  String get changeDirectorySettingTitle => 'Phetogo ya tšhupetšo';

  @override
  String get donateSettingTitle => 'Neela';

  @override
  String get donateSettingDescription =>
      'Ge o rata app ye, hle nagana ka go neela.';

  @override
  String get versionAboutScreenTitle => 'Bešene';

  @override
  String get madeWithLoveTitle => 'E dirilwe ka ❤️ ka';

  @override
  String get noMusicFilesFound => 'Ga go na mmino';

  @override
  String get noArtistsFound => 'Ga go na bo-rabokgabo';

  @override
  String get noAlbumsFound => 'Ga go na dialbamo';

  @override
  String get unknownSong => 'Pina e sa tsejoeng';

  @override
  String get unknownArtist => 'Motaki yo a sa tsebjego';

  @override
  String get unknownAlbum => 'Alebamo e sa tsejoeng';

  @override
  String get unknownGenre => 'Mohuta wo o sa tsebjego';

  @override
  String get buttonConfirmText => 'GO LOKILE';

  @override
  String get tileValueOn => 'Go';

  @override
  String get tileValueOff => 'Tima';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Letlakala leo le neilwego ga se la hwetšwa';

  @override
  String get commonErrorText => 'Phošo';

  @override
  String get retryButtonText => 'Leka gape';

  @override
  String get filePickerDialogTitle => 'Kgetha tšhupetšo ya go hlahloba mmino';

  @override
  String get searchScreenTitle => 'Nyaka';

  @override
  String get searchEmptyText => 'Ga go na dipoelo tša nyakišišo';

  @override
  String get searchResultsText => 'Diphetho tša nyakišišo:';

  @override
  String get resultsForText => 'Dipoelo tša:';

  @override
  String get disableBatteryOptimizationTitle => 'Thibela Optimization leshala';

  @override
  String get disableBatteryOptimizationContent =>
      'Hle thibela betri optimization bakeng sa tiriso ye ka di-setting tsa sesebediswa ho dumella background bapala mmino.';

  @override
  String get languageScreenTitle => 'Polelo';

  @override
  String get silverDeviceColor => 'Silibera';

  @override
  String get blackDeviceColor => 'Ntsho';

  @override
  String get resetSettingsTitle => 'Seta Dipeakanyo gape';

  @override
  String get browseArtist => 'Motaki wa Browse';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Khansela';

  @override
  String get playlistsScreenTitle => 'Manane a dipapadi';

  @override
  String get addToOnTheGoPlaylist => 'Oketša go on-the-go-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Oketša alebamo go on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Tlosa lenaneng la dipina';

  @override
  String get allAlbums => 'Dialepamo ka moka';

  @override
  String get scanningMusicFiles => 'Go hlahloba difaele tša mmino';

  @override
  String get newPlaylist => 'Lenaneo le lefsa la dipapadi';

  @override
  String get savePlaylist => 'Boloka Lenaneo la Dipina';

  @override
  String get clearPlaylist => 'Lenaneo la dipapadi le hlakileng';

  @override
  String get rescanMusicFilesSettingTitle => 'Difaele tša Mmino tša Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Suthiša monwana wa gago wa godimo gabonolo go dikologa leotwana la go klika go sepelasepela thepong';

  @override
  String get centerButtonMenuTutorialText =>
      'Tobetsa konopo ya Setsi go kgetha aetheme ya menu yeo e hlaotswego';

  @override
  String get playPauseMenuTutorialText =>
      'Tobetsa konopo ye go bapala goba go khutša koša';

  @override
  String get nextButtonMenuTutorialText =>
      'Tobetsa konopo ena ho tlola ho pina e latelang';

  @override
  String get previousButtonMenuTutorialText =>
      'Tobetsa konopo ye go boela morago goba go boela morago go koša ya go feta';

  @override
  String get menuButtonTutorialText =>
      'Tobetsa konopo ye go boela morago go thepo ya peleng. O ka tobetša le go e swara go tšwa go skrine sefe goba sefe se sengwe go ya ka go lebanya go lenaneo le legolo.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ye ke skrine sa pontšho. Mokgwa wa Skrine wa go kgoma le Split Screen di kgontšhwa ka go ikemela gomme di ka beakanywa go ya pele ka go dipeakanyo.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Suthiša monwana wa gago wa godimo go dikologa leotwana la go klika go beakanya bophagamo';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tobetsa konopo ya bogareng go sepela ka gare ga baara ya go nyaka, bareng ya go gohla le sedirišwa sa go thelela sa go hlakanya. Tobetsa le ho tshwara konopo ya setsi ho fihlella dikgetho tse eketsehileng.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tobetsa o tshware konopo ena ho itima lijo pele pina';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tobetsa o tshware konopo ye go bušetša koša morago';

  @override
  String get deviceControlSearchTutorialText =>
      'Suthiša monwana wa gago wa godimo gabonolo go dikologa leotwana la go kgotla go hlaola alfabete';

  @override
  String get centerButtonSearchTutorialText =>
      'Tobetsa konopo ya setsi ho kgetha alfabeta e hlalositsoeng';

  @override
  String get nextButtonSearchTutorialText =>
      'Tobetsa konopo ye go oketša sekgoba';

  @override
  String get previousButtonSearchTutorialText =>
      'Tobetsa konopo ena ho hlakola tlhaku ya ho qetela';

  @override
  String get menuButtonSearchTutorialText =>
      'Tobetsa konopo ye go tswalela khiiboto le go dirišana le dipoelo tša nyakišišo';
}
