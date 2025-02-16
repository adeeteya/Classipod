// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Krio (`kri`).
class AppLocalizationsKri extends AppLocalizations {
  AppLocalizationsKri([String locale = 'kri']) : super(locale);

  @override
  String get appTitle => 'Klasipod .';

  @override
  String get menuButtonText => 'Menu we yu go yuz fɔ .';

  @override
  String get audioAccessPermissionTitle => 'Odio akses permishɔn we dɛn nid fɔ gɛt .';

  @override
  String get audioAccessPermissionContent => 'Duya gi Odio Fayl dɛn akses fɔ alaw wi fɔ ple yu myuzik fayl dɛn.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Odio akses permishɔn we dɛn nɔ gri fɔ gi .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Duya gi Odio Fayl dɛn akses fɔ dis ap na di divays sɛtin fɔ alaw wi fɔ ple yu myuzik fayl dɛn.';

  @override
  String get menuScreenTitle => 'Menu we yu go yuz fɔ .';

  @override
  String get musicMenuScreenTitle => 'Myuzik';

  @override
  String get nowPlayingScreenTitle => 'Naw i de ple .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Sɛtin dɛn .';

  @override
  String get aboutScreenTitle => 'Bɔt';

  @override
  String get coverFlowScreenTitle => 'Kɔva Flɔ .';

  @override
  String get artistsScreenTitle => 'Atis dɛn .';

  @override
  String get albumsScreenTitle => 'Albam dɛn .';

  @override
  String get songsScreenTitle => 'Sɔng dɛn .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Sɔng dɛn',
      one: '1 siŋ',
      zero: 'Nɔ siŋ dɛn',
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
      one: '1 albɔm',
      zero: 'nɔ albɔm',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jɛnrɛs dɛn .';

  @override
  String get genreSongsScreenTitle => 'Jɛnre siŋ dɛn .';

  @override
  String get deviceColorSettingTitle => 'Divays Kɔlɔ .';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Enabled .';

  @override
  String get repeatModeSettingTitle => 'Tɔk bak';

  @override
  String get repeatModeOne => 'Wan';

  @override
  String get repeatModeAll => 'Ɔl';

  @override
  String get vibrateSettingTitle => 'Vaybrɛt .';

  @override
  String get clickWheelSettingTitle => 'Klik Wil Sɔnd dɛn .';

  @override
  String get splitScreenSettingTitle => 'Split Skrin mod .';

  @override
  String get touchSoundsDialogTitle => 'Tɔch Sɔnd dɛn .';

  @override
  String get touchSoundsDialogContent => 'Duya ɛnabul tɔch sawnd dɛn frɔm sistem sɛtin fɔ yɛri di klik wil sawnd dɛn .';

  @override
  String get immersiveModeSettingTitle => 'Mod we de insay di bɔdi .';

  @override
  String get showAppTutorialSettingTitle => 'Sho tutoriɛl .';

  @override
  String get changeDirectorySettingTitle => 'Chenj Dairekta .';

  @override
  String get donateSettingTitle => 'Gi';

  @override
  String get donateSettingDescription => 'If yu laik dis app, duya tink abaut donate.';

  @override
  String get versionAboutScreenTitle => 'Dis wan';

  @override
  String get madeWithLoveTitle => 'Dɛn mek am wit ❤️ bay .';

  @override
  String get noMusicFilesFound => 'No Myuzik .';

  @override
  String get noArtistsFound => 'No atis dɛn nɔ de .';

  @override
  String get noAlbumsFound => 'No albam dɛn nɔ gɛt albam .';

  @override
  String get unknownSong => 'Sɔng we wi nɔ no bɔt .';

  @override
  String get unknownArtist => 'Atis we dɛn nɔ no bɔt atis';

  @override
  String get unknownAlbum => 'Album we wi nɔ no bɔt .';

  @override
  String get unknownGenre => 'Jɛnre we dɛn nɔ no bɔt .';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Pantap';

  @override
  String get tileValueOff => 'Ɔf';

  @override
  String get commonOfText => 'ɔf';

  @override
  String get pageNotFoundText => 'Dɛn nɔ bin fɛn di pej we dɛn gi .';

  @override
  String get commonErrorText => 'Mistek';

  @override
  String get retryButtonText => 'Ritray fɔ mek yu go bak .';

  @override
  String get filePickerDialogTitle => 'Pik wan dairektrɔ fɔ skan fɔ myuzik .';

  @override
  String get searchScreenTitle => 'Luk fɔ';

  @override
  String get searchEmptyText => 'Nɔ Sɔch Rizɔlt dɛn .';

  @override
  String get searchResultsText => 'Di tin dɛn we yu go fɛn:';

  @override
  String get resultsForText => 'Rizult fɔ:';

  @override
  String get disableBatteryOptimizationTitle => 'Disable Batri Optimayzeshɔn .';

  @override
  String get disableBatteryOptimizationContent => 'Duya disable battery optimization fɔ dis ap na di divays sɛtin fɔ alaw bakgrɔn ple bak fɔ myuzik.';

  @override
  String get languageScreenTitle => 'Langwej';

  @override
  String get silverDeviceColor => 'Silva';

  @override
  String get blackDeviceColor => 'Blak';

  @override
  String get resetSettingsTitle => 'Riset Sɛtin dɛn .';

  @override
  String get browseArtist => 'Browse Artist .';

  @override
  String get browseAlbum => 'Browse album .';

  @override
  String get cancelText => 'nɔ';

  @override
  String get playlistsScreenTitle => 'Plelist dɛn .';

  @override
  String get addToOnTheGoPlaylist => 'Add to on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Add albom to on-the-go .';

  @override
  String get removeSongFromThePlaylist => 'Rimov frɔm di plelis .';

  @override
  String get allAlbums => 'Ɔl di Albɔm dɛn .';

  @override
  String get scanningMusicFiles => 'Skanin Myuzik Fayl dɛn .';

  @override
  String get newPlaylist => 'Nyu plelist .';

  @override
  String get savePlaylist => 'Sev plelist .';

  @override
  String get clearPlaylist => 'Klia plelist .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan myusik fayl dɛn .';

  @override
  String get deviceControlMenuTutorialText => 'Muv yu tumbu layt wan rawnd di klik wil fɔ go na di menyu .';

  @override
  String get centerButtonMenuTutorialText => 'Pres di Senta bɔtin fɔ pik di meny aytem we dɛn aylayt .';

  @override
  String get playPauseMenuTutorialText => 'Pres dis bɔtin fɔ ple ɔ stɔp fɔ ple wan siŋ .';

  @override
  String get nextButtonMenuTutorialText => 'Pres dis bɔtin fɔ skip to di nɛks siŋ .';

  @override
  String get previousButtonMenuTutorialText => 'Pres dis bɔtin fɔ riwind ɔ go bak to di fɔs siŋ .';

  @override
  String get menuButtonTutorialText => 'Pres dis bɔtin fɔ go bak to di meny we bin dɔn de bifo. Yu kin pres ɛn ol am frɔm ɛni ɔda skrin fɔ go dairekt na di men mɛnyu.';

  @override
  String get deviceScreenMenuTutorialText => 'Dis na di displei skrin. Tɔch skrin ɛn split skrin mɔd de ɛnabul bay difɔlt ɛn dɛn kin kɔnfigyut am mɔ na di sɛtin dɛn.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Muv yu big an rawnd di klik wil fɔ ajɔst di vɔlyum .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Pres di senta bɔtin fɔ saykl tru Seek Bar, Scrubber bar ɛn shuffle slider. Pres ɛn ol di Sɛntral bɔtin fɔ akses ɔda opshɔn dɛn.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Pres ɛn ol dis bɔtin fɔ fast fɔwad di siŋ .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Pres ɛn ol dis bɔtin fɔ riwind di siŋ .';

  @override
  String get deviceControlSearchTutorialText => 'Muv yu tumbu layt wan rawnd di klik wil fɔ aylayt wan alfabɛt .';

  @override
  String get centerButtonSearchTutorialText => 'Pres di Senta bɔtin fɔ pik di alfabɛt we dɛn aylayt .';

  @override
  String get nextButtonSearchTutorialText => 'Pres dis bɔtin fɔ ad wan spɛshal ples .';

  @override
  String get previousButtonSearchTutorialText => 'Pres dis bɔtin fɔ dilit di las aks .';

  @override
  String get menuButtonSearchTutorialText => 'Pres dis bɔtin fɔ lɔk di kibɔd ɛn intarakt wit di sɔch rizulyt dɛn .';
}
