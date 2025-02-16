// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maltese (`mt`).
class AppLocalizationsMt extends AppLocalizations {
  AppLocalizationsMt([String locale = 'mt']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Permess ta \'Aċċess għall-Awdjo Meħtieġ';

  @override
  String get audioAccessPermissionContent => 'Jekk jogħġbok agħti aċċess għall-fajls awdjo biex tippermettilna ndoqq il-fajls tal-mużika tiegħek.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Permess ta \'aċċess awdjo miċħud';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Jekk jogħġbok agħti aċċess għall-fajls awdjo għal din l-app fl-issettjar tal-apparat biex tippermettilna ndoqq il-fajls tal-mużika tiegħek.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Mużika';

  @override
  String get nowPlayingScreenTitle => 'Issa qed tilgħab';

  @override
  String get shuffleSongsMenuTitle => 'Kanzunetti Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Settings';

  @override
  String get aboutScreenTitle => 'Madwar';

  @override
  String get coverFlowScreenTitle => 'Fluss tal-Qoxra';

  @override
  String get artistsScreenTitle => 'Artisti';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Kanzunetti';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kanzunetti',
      one: '1 kanzunetta',
      zero: 'l-ebda kanzunetti',
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
      other: '$countString albums',
      one: '1 album',
      zero: 'l-ebda album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ġeneri';

  @override
  String get genreSongsScreenTitle => 'Kanzunetti tal-ġeneru';

  @override
  String get deviceColorSettingTitle => 'Kulur tal-apparat';

  @override
  String get touchScreenSettingTitle => 'Touch screen attivat';

  @override
  String get repeatModeSettingTitle => 'Irrepeti';

  @override
  String get repeatModeOne => 'Wieħed';

  @override
  String get repeatModeAll => 'Kollha';

  @override
  String get vibrateSettingTitle => 'Jivvibra';

  @override
  String get clickWheelSettingTitle => 'Ikklikkja l-ħsejjes tar-roti';

  @override
  String get splitScreenSettingTitle => 'Mod ta \'skrin maqsum';

  @override
  String get touchSoundsDialogTitle => 'Tmiss il-ħsejjes';

  @override
  String get touchSoundsDialogContent => 'Jekk jogħġbok ħalli l-ħsejjes tal-mess mill-issettjar tas-sistema biex tisma \'l-ħsejjes tar-rota tal-ikklikkja';

  @override
  String get immersiveModeSettingTitle => 'Modalità immersiva';

  @override
  String get showAppTutorialSettingTitle => 'Uri tutorja';

  @override
  String get changeDirectorySettingTitle => 'Ibdel id-direttorju';

  @override
  String get donateSettingTitle => 'Donazzjoni';

  @override
  String get donateSettingDescription => 'Jekk tixtieq din l-app, jekk jogħġbok ikkunsidra li tagħti d-donazzjoni.';

  @override
  String get versionAboutScreenTitle => 'Verżjoni';

  @override
  String get madeWithLoveTitle => 'Magħmul bi ❤️ minn';

  @override
  String get noMusicFilesFound => 'L-ebda mużika';

  @override
  String get noArtistsFound => 'L-ebda artisti';

  @override
  String get noAlbumsFound => 'L-ebda albums';

  @override
  String get unknownSong => 'Kanzunetta mhux magħrufa';

  @override
  String get unknownArtist => 'Artist mhux magħruf';

  @override
  String get unknownAlbum => 'Album mhux magħruf';

  @override
  String get unknownGenre => 'Ġeneru mhux magħruf';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Fuq';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'ta \'';

  @override
  String get pageNotFoundText => 'Il-paġna mogħtija ma nstabetx';

  @override
  String get commonErrorText => 'Żball';

  @override
  String get retryButtonText => 'Erġa \'erġa\'';

  @override
  String get filePickerDialogTitle => 'Agħżel direttorju biex tiskannja għall-mużika';

  @override
  String get searchScreenTitle => 'Tfittxija';

  @override
  String get searchEmptyText => 'L-ebda riżultat ta \'tfittxija';

  @override
  String get searchResultsText => 'Riżultati ta \'tfittxija:';

  @override
  String get resultsForText => 'Riżultati għal:';

  @override
  String get disableBatteryOptimizationTitle => 'Itfi l-ottimizzazzjoni tal-batterija';

  @override
  String get disableBatteryOptimizationContent => 'Jekk jogħġbok itfi l-ottimizzazzjoni tal-batterija għal din l-app fl-issettjar tal-apparat biex tippermetti d-daqq tal-isfond tal-mużika.';

  @override
  String get languageScreenTitle => 'Lingwa';

  @override
  String get silverDeviceColor => 'Fidda';

  @override
  String get blackDeviceColor => 'Iswed';

  @override
  String get resetSettingsTitle => 'Irrisettja l-issettjar';

  @override
  String get browseArtist => 'Ibbrawżja artist';

  @override
  String get browseAlbum => 'Ibbrawżja l-album';

  @override
  String get cancelText => 'Ikkanċella';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Żid ma \'fuq il-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Żid l-album ma \'fuq il-go';

  @override
  String get removeSongFromThePlaylist => 'Neħħi mil-playlist';

  @override
  String get allAlbums => 'L-albums kollha';

  @override
  String get scanningMusicFiles => 'Skennjar ta \'fajls tal-mużika';

  @override
  String get newPlaylist => 'Playlist ġdid';

  @override
  String get savePlaylist => 'Issejvja l-playlist';

  @override
  String get clearPlaylist => 'Playlist ċar';

  @override
  String get rescanMusicFilesSettingTitle => 'Fajls tal-mużika mill-ġdid';

  @override
  String get deviceControlMenuTutorialText => 'Mexxi l-kbir tiegħek ħafif madwar ir-rota tal-ikklikkja biex tinnaviga l-menu';

  @override
  String get centerButtonMenuTutorialText => 'Agħfas il-buttuna Ċentru biex tagħżel l-oġġett tal-menu enfasizzat';

  @override
  String get playPauseMenuTutorialText => 'Agħfas din il-buttuna biex tilgħab jew nieqaf kanzunetta';

  @override
  String get nextButtonMenuTutorialText => 'Agħfas din il-buttuna biex taqbeż il-kanzunetta li jmiss';

  @override
  String get previousButtonMenuTutorialText => 'Agħfas din il-buttuna biex terġa \'tidwir jew mur lura għall-kanzunetta ta\' qabel';

  @override
  String get menuButtonTutorialText => 'Agħfas din il-buttuna biex tmur lura għall-menu preċedenti. Tista \'tagħfas u żżommha minn kwalunkwe skrin ieħor biex tmur direttament fil-menu prinċipali.';

  @override
  String get deviceScreenMenuTutorialText => 'Dan huwa l-iskrin tal-wiri. Touch Screen u Split Screen Mode huma attivati ​​awtomatikament u jistgħu jiġu kkonfigurati aktar fis-settings.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Mexxi l-kbir tiegħek madwar ir-rota tal-ikklikkja biex taġġusta l-volum';

  @override
  String get centerButtonNowPlayingTutorialText => 'Agħfas il-buttuna Ċentru biex tiċċikla permezz ta \'SEEF BAR, SCRUBBER BAR u SHUFFLE SLIDER. Agħfas u żomm il-buttuna Ċentru biex taċċessa għażliet addizzjonali.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Agħfas u żomm din il-buttuna biex tgħaddi l-kanzunetta';

  @override
  String get previousButtonNowPlayingTutorialText => 'Agħfas u żomm din il-buttuna biex terġa \'tidwir il-kanzunetta';

  @override
  String get deviceControlSearchTutorialText => 'Mexxi l-kbir tiegħek ħafif madwar ir-rota tal-ikklikkja biex tenfasizza alfabett';

  @override
  String get centerButtonSearchTutorialText => 'Agħfas il-buttuna Ċentru biex tagħżel l-alfabett enfasizzat';

  @override
  String get nextButtonSearchTutorialText => 'Agħfas din il-buttuna biex iżżid spazju';

  @override
  String get previousButtonSearchTutorialText => 'Agħfas din il-buttuna biex tħassar l-aħħar karattru';

  @override
  String get menuButtonSearchTutorialText => 'Agħfas din il-buttuna biex tagħlaq it-tastiera u tinteraġixxi mar-riżultati tat-tfittxija';
}
