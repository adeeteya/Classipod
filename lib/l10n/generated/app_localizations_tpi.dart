// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tok Pisin (`tpi`).
class AppLocalizationsTpi extends AppLocalizations {
  AppLocalizationsTpi([String locale = 'tpi']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Odio Akses Permisen i nidim';

  @override
  String get audioAccessPermissionContent =>
      'Plis givim ol odio fail long larim mipela i pilaim ol musik fail bilong yu.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Odio Akses Pemisen Ol i no laikim';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Plis givim ol odio fail ekses bilong dispela ap long ol seting bilong divais long larim mipela i pilaim ol musik fail bilong yu.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Nau Plei';

  @override
  String get shuffleSongsMenuTitle => 'Ol Singsing blong ol shuffle';

  @override
  String get shuffleSettingTitle => 'Safel';

  @override
  String get settingsScreenTitle => 'Ol seting';

  @override
  String get aboutScreenTitle => 'Long';

  @override
  String get coverFlowScreenTitle => 'Kava Flo';

  @override
  String get artistsScreenTitle => 'Ol atis';

  @override
  String get albumsScreenTitle => 'Ol album';

  @override
  String get songsScreenTitle => 'Ol song';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Ol singsing',
      one: '1 Song',
      zero: 'Nogat ol singsing',
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
      other: '$countString Ol albam',
      one: '1 Albam',
      zero: 'Nogat Albam',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ol Genres';

  @override
  String get genreSongsScreenTitle => 'Ol Olpela Song';

  @override
  String get deviceColorSettingTitle => 'Kala bilong Divais';

  @override
  String get touchScreenSettingTitle => 'Tajem Skrin I Stap';

  @override
  String get repeatModeSettingTitle => 'Ripit';

  @override
  String get repeatModeOne => 'Wanpela';

  @override
  String get repeatModeAll => 'Olgeta';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Klik long Wil';

  @override
  String get splitScreenSettingTitle => 'Split Skrin Mod';

  @override
  String get touchSoundsDialogTitle => 'Tajem Saon';

  @override
  String get touchSoundsDialogContent =>
      'Plis Enablem Ol Saon blong Tajem long ol Seting blong Sistem blong harem ol noes blong klik wil.';

  @override
  String get immersiveModeSettingTitle => 'Mod bilong imerseiv';

  @override
  String get showAppTutorialSettingTitle => 'Soim Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Senisim Dairektori';

  @override
  String get donateSettingTitle => 'Donetim';

  @override
  String get donateSettingDescription =>
      'Sapos yu laikim dispela ap, plis tingim long givim mani.';

  @override
  String get versionAboutScreenTitle => 'Vesen';

  @override
  String get madeWithLoveTitle => 'Ol i wokim wantaim ❤️ long';

  @override
  String get noMusicFilesFound => 'Nogat musik';

  @override
  String get noArtistsFound => 'Nogat Ol Atist';

  @override
  String get noAlbumsFound => 'No gat ol Album';

  @override
  String get unknownSong => 'Song Bilong No Save .';

  @override
  String get unknownArtist => 'Atist Ol i no save long em';

  @override
  String get unknownAlbum => 'Album i no save';

  @override
  String get unknownGenre => 'Genre yu no save long en';

  @override
  String get buttonConfirmText => 'OKEI';

  @override
  String get tileValueOn => 'Antap';

  @override
  String get tileValueOff => 'I of';

  @override
  String get commonOfText => 'bilong';

  @override
  String get pageNotFoundText => 'Ol i no painim dispela pes ol i bin givim .';

  @override
  String get commonErrorText => 'Mistek';

  @override
  String get retryButtonText => 'Ritri';

  @override
  String get filePickerDialogTitle =>
      'Makim wanpela Dairektri long Sken bilong Musik';

  @override
  String get searchScreenTitle => 'Painim';

  @override
  String get searchEmptyText => 'No gat ol Risal blong Sej';

  @override
  String get searchResultsText => 'Ol Risal blong lukaotem:';

  @override
  String get resultsForText => 'Ol risal blong:';

  @override
  String get disableBatteryOptimizationTitle => 'Disebol Bateri Optimaisesen';

  @override
  String get disableBatteryOptimizationContent =>
      'Plis disabelim bateri optimaisesen bilong dispela ap long ol seting bilong divais long larim bekgraun pleibek bilong musik.';

  @override
  String get languageScreenTitle => 'Tok ples';

  @override
  String get silverDeviceColor => 'Silva';

  @override
  String get blackDeviceColor => 'Blak';

  @override
  String get resetSettingsTitle => 'Reset Seting';

  @override
  String get browseArtist => 'Brausim Atis';

  @override
  String get browseAlbum => 'Brausim mak';

  @override
  String get cancelText => 'kensel';

  @override
  String get playlistsScreenTitle => 'Pleilis';

  @override
  String get addToOnTheGoPlaylist => 'Addim long On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Addim Album long On-The-.';

  @override
  String get removeSongFromThePlaylist => 'Rausim long Pleilis';

  @override
  String get allAlbums => 'Olgeta Album';

  @override
  String get scanningMusicFiles => 'Skenim Musik Fail';

  @override
  String get newPlaylist => 'Nupela Pleilis';

  @override
  String get savePlaylist => 'Sevim Pleilis';

  @override
  String get clearPlaylist => 'Klia Pleilis';

  @override
  String get rescanMusicFilesSettingTitle =>
      'Ol File blong ol Musik blong Resken';

  @override
  String get deviceControlMenuTutorialText =>
      'Muvum bigfala fingga blong yu smol raon long Click Wheel blong navigatem menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Presim senta baten bilong makim dispela menu samting i gat bikpela mak';

  @override
  String get playPauseMenuTutorialText =>
      'Presim dispela baten long pilai o stopim wanpela singsing';

  @override
  String get nextButtonMenuTutorialText =>
      'Presim dispela baten bilong kalap i go long narapela singsing';

  @override
  String get previousButtonMenuTutorialText =>
      'Presim dispela baten long kisim bek o go bek long singsing bilong bipo';

  @override
  String get menuButtonTutorialText =>
      'Presim dispela baten long go bek long menu bilong bipo. Yu ken presim na holim long narapela skrin bilong go stret long bikpela menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dispela em i soim skrin. Tajem Skrin mo Split Skrin Mod oli mekem se oli save mekem folem defolt mo oli save konfigurem moa long ol seting.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Muvum bigfala fingga blong yu raon long Click Wheel blong stretem volium';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Presem Senta baten blong saekol tru long lukaotem bar, skraba bar mo slaida we i shuffle. Presem mo holem baten blong Senta blong kasem sam moa opsen.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Presim na holim dispela baten long hariapim dispela singsing';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Presim na holim dispela baten long kisim bek singsing';

  @override
  String get deviceControlSearchTutorialText =>
      'Muvum bigfala fingga blong yu raon long Click Wheel blong haelaetem wan alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Presim senta baten bilong makim alfabet ol i bin hailait';

  @override
  String get nextButtonSearchTutorialText =>
      'Presim dispela baten long putim spes';

  @override
  String get previousButtonSearchTutorialText =>
      'Presim dispela baten long rausim laspela pasin';

  @override
  String get menuButtonSearchTutorialText =>
      'Presim dispela baten long pasim kibod na wok bung wantaim ol wok painim.';
}
