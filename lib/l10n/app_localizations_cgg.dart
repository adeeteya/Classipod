// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chiga (`cgg`).
class AppLocalizationsCgg extends AppLocalizations {
  AppLocalizationsCgg([String locale = 'cgg']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Okusazaho Audio kukaba nikwetengyesa';

  @override
  String get audioAccessPermissionContent =>
      'Nyabura we hereze fairo z’amakuru z’okutubaasisa kuzaana fairo zaawe z’ebyeshongoro.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Okusazaho Audio Edizi';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Nyabura we heereza fairo z’amakuru g’okutunga app egi omu nkora y’ebikwato kutubaasisa kuteera fairo zaawe z’ebyeshongoro.';

  @override
  String get menuScreenTitle => 'nyowe';

  @override
  String get musicMenuScreenTitle => 'Ebyeshongoro';

  @override
  String get nowPlayingScreenTitle => 'Hati nazaana';

  @override
  String get shuffleSongsMenuTitle => 'Ebyeshongoro';

  @override
  String get shuffleSettingTitle => 'Eshuura';

  @override
  String get settingsScreenTitle => 'Okutebekanisa';

  @override
  String get aboutScreenTitle => 'Ahari';

  @override
  String get coverFlowScreenTitle => 'Shoma';

  @override
  String get artistsScreenTitle => 'Abanyabwengye';

  @override
  String get albumsScreenTitle => 'Amabara';

  @override
  String get songsScreenTitle => 'Ebyeshongoro';

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
      other: '$countString Albums',
      one: '1 Album',
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Entare';

  @override
  String get genreSongsScreenTitle => 'Ebyeshongoro by’obwengye';

  @override
  String get deviceColorSettingTitle => 'Erangi y’omuramuzi';

  @override
  String get touchScreenSettingTitle => 'Okukozesa Screen';

  @override
  String get repeatModeSettingTitle => 'Kugarukamu';

  @override
  String get repeatModeOne => 'Omwe';

  @override
  String get repeatModeAll => 'Byona';

  @override
  String get vibrateSettingTitle => 'Okureeba';

  @override
  String get clickWheelSettingTitle => 'Nyiga Ebirungo';

  @override
  String get splitScreenSettingTitle => 'Omuringo gw’omukibira';

  @override
  String get touchSoundsDialogTitle => 'Ebirungo';

  @override
  String get touchSoundsDialogContent =>
      'Nyabura we Tamu Esounds kuruga omu System Settings kuhurira amaraka g\'enziga z\'okuteera .';

  @override
  String get immersiveModeSettingTitle => 'Omuringo gw’okutahamu';

  @override
  String get showAppTutorialSettingTitle => 'Yoreka Twetorial';

  @override
  String get changeDirectorySettingTitle => 'Empindahinduka';

  @override
  String get donateSettingTitle => 'Okugabira';

  @override
  String get donateSettingDescription =>
      'Waaba nookunda app egi, teekateeka aha kuhayo.';

  @override
  String get versionAboutScreenTitle => 'Omuringo';

  @override
  String get madeWithLoveTitle => 'Ekikozirwe na ❤️ by';

  @override
  String get noMusicFilesFound => 'Tihariho Omwanya';

  @override
  String get noArtistsFound => 'Tihariho Abanyabwengye';

  @override
  String get noAlbumsFound => 'Tihariho Albums';

  @override
  String get unknownSong => 'Ekyeshongoro ekimanyirwe';

  @override
  String get unknownArtist => 'Omunyabwengye otamanyirwe';

  @override
  String get unknownAlbum => 'Album etamanyirwe';

  @override
  String get unknownGenre => 'Amazira agamanyirwe';

  @override
  String get buttonConfirmText => 'KARE';

  @override
  String get tileValueOn => 'Aha';

  @override
  String get tileValueOff => 'Kuhumura';

  @override
  String get commonOfText => 'kya';

  @override
  String get pageNotFoundText => 'Orupapura oruhairwe tirurashangirwe';

  @override
  String get commonErrorText => 'Enshobi';

  @override
  String get retryButtonText => 'okugaruzaho';

  @override
  String get filePickerDialogTitle =>
      'Toorana omukuru wa Scan ahabwa Ebyeshongoro';

  @override
  String get searchScreenTitle => 'Kuronda';

  @override
  String get searchEmptyText => 'Tihariho ebyarugiremu';

  @override
  String get searchResultsText => 'Ebirugire omu kucondooza:';

  @override
  String get resultsForText => 'Ebirugire omu:';

  @override
  String get disableBatteryOptimizationTitle => 'Okutunguura Battery';

  @override
  String get disableBatteryOptimizationContent =>
      'Nyabura we, battery okutunguura app egi omu nkora y’ebikwato kubaasa kuha okuzaana kw’ebyeshongoro bya enyima.';

  @override
  String get languageScreenTitle => 'Orurimi';

  @override
  String get silverDeviceColor => 'Ezaabu';

  @override
  String get blackDeviceColor => 'Ekiriiragura';

  @override
  String get resetSettingsTitle => 'Okugarukaho';

  @override
  String get browseArtist => 'Omunyabwengye';

  @override
  String get browseAlbum => 'Okureeba Album';

  @override
  String get cancelText => 'okushazamu';

  @override
  String get playlistsScreenTitle => 'Abazaani';

  @override
  String get addToOnTheGoPlaylist => 'Yongyeraho On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Yongyera Album aha On-Go-Go';

  @override
  String get removeSongFromThePlaylist => 'Ijuka kuruga aha Playlist';

  @override
  String get allAlbums => 'Byona';

  @override
  String get scanningMusicFiles => 'Fayiro z’ebyeshongoro';

  @override
  String get newPlaylist => 'Empandiki ensya';

  @override
  String get savePlaylist => 'Biika Playrust';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Fiayiro z’ebyeshongoro';

  @override
  String get deviceControlMenuTutorialText =>
      'Taho ekikumu kyawe omu muringo mukye munonga aha Click Wheel kusharaho ebiri omu menyu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Nyiga aha rupapura rwa rwagati kutoorana ekintu ekirikworekwa .';

  @override
  String get playPauseMenuTutorialText =>
      'Nyiga akapesha aka kuzaana nari akahuumuraho ekyeshongoro .';

  @override
  String get nextButtonMenuTutorialText =>
      'Nyiga akapesha aka okuguruka aha kyeshongoro ekirikukurataho .';

  @override
  String get previousButtonMenuTutorialText =>
      'Nyiga akapesha aka kugaruka kusheesha nari kugaruka omu kyeshongoro ekyahingwire .';

  @override
  String get menuButtonTutorialText =>
      'Nyiga akapesha aka kugaruka omu menyu eyahingwire. Noobaasa kunyiga kandi okagikwata kuruga aha skriini endiijo yoona kuza aha menyu enkuru butunu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Egi niyo skriini y’okworeka. Touch Screen na Split Screen Mode neekorwaho nk’oku kiri kandi neebaasa kutebeekanisibwa omu ntebeekanisa.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Taho ekikumu kyawe okwehinguririza Click Wheel kuhindura eiraka .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Nyiga akapesha ka Center kugyendera omu roon, scrubber bar na shuffle slider. Nyiga kandi okwate akapesha ka Centre kubaasa kutunga emiringo endiijo.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Nyiga kandi okwate akapesha aka okusiiba ekyeshongoro';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Nyiga kandi okwate akapesha aka ogaruke ekyeshongoro';

  @override
  String get deviceControlSearchTutorialText =>
      'Taho ekikumu kyawe omu muringo mukye munonga aha Click Wheel kworeka alfabeti .';

  @override
  String get centerButtonSearchTutorialText =>
      'Nyiga akapesha ka rwagati kutoorana alfabeti erikworekwa .';

  @override
  String get nextButtonSearchTutorialText =>
      'Nyiga akapesha aka okwongyeraho omwanya';

  @override
  String get previousButtonSearchTutorialText =>
      'Nyiga akapesha aka okusazaho omuntu owahererukireyo';

  @override
  String get menuButtonSearchTutorialText =>
      'Nyiga akapesha aka okukinga ekiiboodi kandi okakwatanisa n\'ebyarugire omu kusherura .';
}
