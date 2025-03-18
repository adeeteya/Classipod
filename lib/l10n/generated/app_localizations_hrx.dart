// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hunsrik (`hrx`).
class AppLocalizationsHrx extends AppLocalizations {
  AppLocalizationsHrx([String locale = 'hrx']) : super(locale);

  @override
  String get appTitle => 'KlaasichPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Access Erlaupnis ferlangt';

  @override
  String get audioAccessPermissionContent =>
      'Tuu khanst aach ti autio-file fine fer uns erlaupe tayn musik fiile se xpiile.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Akses Erlaupnis Denied';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Tuu khanst aach ti autio-file penutse fer tiise applicatsioon in te apteelung instellunge fer uns erlaupe tayn musik fiile se xpiile.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Yets Xpiile';

  @override
  String get shuffleSongsMenuTitle => 'Schuffel Liiter';

  @override
  String get shuffleSettingTitle => 'Shuffe; Shuufe';

  @override
  String get settingsScreenTitle => 'Insetsunge';

  @override
  String get aboutScreenTitle => 'Iwich';

  @override
  String get coverFlowScreenTitle => 'Flucht';

  @override
  String get artistsScreenTitle => 'Kunstlere';

  @override
  String get albumsScreenTitle => 'Alte';

  @override
  String get songsScreenTitle => 'liite';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Liiter',
      one: '1 Liit',
      zero: 'Keen Liiter',
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
      other: '$countString Albëme',
      one: '1 Alpëm',
      zero: 'Keen albëm',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre Liiter';

  @override
  String get deviceColorSettingTitle => 'Apparate';

  @override
  String get touchScreenSettingTitle => 'Tuu Screen Enabled';

  @override
  String get repeatModeSettingTitle => 'Noch mool';

  @override
  String get repeatModeOne => 'Eens';

  @override
  String get repeatModeAll => 'Ale';

  @override
  String get vibrateSettingTitle => 'Krifix';

  @override
  String get clickWheelSettingTitle => 'Klik uf te Wayse Klingt';

  @override
  String get splitScreenSettingTitle => 'Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Toch Klingt';

  @override
  String get touchSoundsDialogContent =>
      'Bitte Enable Touch fon Sisteem Instellunge fer ti klik rail klangs heere .';

  @override
  String get immersiveModeSettingTitle => 'Immersiif Mode';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial .';

  @override
  String get changeDirectorySettingTitle => 'Ferënke';

  @override
  String get donateSettingTitle => 'Aan wëne';

  @override
  String get donateSettingDescription =>
      'Wëns tuu tiise app kërn host, tuu tich traan hale aan se këpe.';

  @override
  String get versionAboutScreenTitle => 'Wersyoon';

  @override
  String get madeWithLoveTitle => 'Mit ❤️ torich';

  @override
  String get noMusicFilesFound => 'Nee Musik';

  @override
  String get noArtistsFound => 'Keen Kunstler';

  @override
  String get noAlbumsFound => 'Keen Albëme';

  @override
  String get unknownSong => 'Unkeweenliche Song';

  @override
  String get unknownArtist => 'Unkeweenliche Kunstler';

  @override
  String get unknownAlbum => 'Unkeweenliche Album';

  @override
  String get unknownGenre => 'Unkeweenlich Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Uf';

  @override
  String get tileValueOff => 'Aus';

  @override
  String get commonOfText => 'fon';

  @override
  String get pageNotFoundText => 'Ti kepoote sayt waar nët kefun këp .';

  @override
  String get commonErrorText => 'Feeler';

  @override
  String get retryButtonText => 'Penhërtslich';

  @override
  String get filePickerDialogTitle => 'Tuu een Direktor fer Scan raus suuche .';

  @override
  String get searchScreenTitle => 'Suuche';

  @override
  String get searchEmptyText => 'Keen Such Resultados';

  @override
  String get searchResultsText => 'Suuch Resultaate:';

  @override
  String get resultsForText => 'Resultados fer:';

  @override
  String get disableBatteryOptimizationTitle =>
      'In eenmaal optimatsioon fon te bateria .';

  @override
  String get disableBatteryOptimizationContent =>
      'Tuu khanst aach ti optimatsioon fon te bateria fer tiise applicatsioon in te apteelungs instellunge aus mache, tas ti musik xpiile fon te musik erlaupt.';

  @override
  String get languageScreenTitle => 'Xprooch';

  @override
  String get silverDeviceColor => 'Silwer';

  @override
  String get blackDeviceColor => 'Xwats';

  @override
  String get resetSettingsTitle => 'Reset Instellunge';

  @override
  String get browseArtist => 'Kunstler';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'ap saan';

  @override
  String get playlistsScreenTitle => 'Xpiile';

  @override
  String get addToOnTheGoPlaylist => 'Tuu tich in te On-The .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tuu Album in te On-Kee.';

  @override
  String get removeSongFromThePlaylist => 'Tuu fon te Playlist raus hoole .';

  @override
  String get allAlbums => 'Al ti Alte';

  @override
  String get scanningMusicFiles => 'Scanne Musik Fes';

  @override
  String get newPlaylist => 'Noye Platt';

  @override
  String get savePlaylist => 'Reserveer';

  @override
  String get clearPlaylist => 'Kleer Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText =>
      'Tuu tayn thumle licht um te Klik uf mache fer tas menu se navikeere .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tuu te sentrum knoop xmayse fer tas menú menú .';

  @override
  String get playPauseMenuTutorialText =>
      'Tuu tiise knoop xmayse fer een liit se xpiile orer se paue .';

  @override
  String get nextButtonMenuTutorialText =>
      'Tuu tiise knoop xmayse fer tas neekste liit se xpiile .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tuu tiise knoop xmayse fer noch mool se winxe orer tsurik ins foerxtëlungs liit keen .';

  @override
  String get menuButtonTutorialText =>
      'Tuu tiise knoop xmayse fer tsurik ins foerxtëlungs menu se keen. Tuu khanst tas fon yeete aner xpiichel xmayse un hale fer ti haupste menu direktsioone se mache.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Tas is te display-xpiichel. Toch Screen un Split Screen Modus sin fon te xprooch in kextelt kep un khëne wayter in te instëlunge konfituert wëre.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tuu tayn thumb um te Klik uf mache fer tas volumen aanpase .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Press te Centro-knop fer torich suuche bar, skupber bar un shuffle xliise. Tuu te Centro-knop xmayse un hale fer noch anere optsioone se kriin.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tuu tiise knoop xmayse un hale fer tas liit xnël foran keen .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tuu tiise knoop xmayse un hale fer tas liit noch mool se winxe .';

  @override
  String get deviceControlSearchTutorialText =>
      'Tuu tayn thumle licht um te Klik uf mache fer een alfapët se markiire .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tuu te sentrum knoop xmayse fer tas markiirt alfapët raus suuche .';

  @override
  String get nextButtonSearchTutorialText =>
      'Tuu tiise knoop xmayse fer een plats se tuun .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tuu tiise knoop xmayse fer te letste persoon aus lëye .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tuu tiise knoop xmayse fer tas tastatur se mache un mit te suuchungs resultaate interakteere .';

  @override
  String get allSongs => 'Ale Liiter';
}
