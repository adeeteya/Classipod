// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Shan (`shn`).
class AppLocalizationsShn extends AppLocalizations {
  AppLocalizationsShn([String locale = 'shn']) : super(locale);

  @override
  String get appTitle => 'ၶလႅတ်ႉသ်သီႇပုတ်ႈ';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'ၶေႃႈပၼ်ၶႂၢင်ႉ တႃႇၶဝ်ႈထိုင် ႁူင်းပွႆႇသဵင် လူဝ်ႇ';

  @override
  String get audioAccessPermissionContent =>
      'ၶႅၼ်းတေႃႈ ပၼ်ၶႂၢင်ႉ တႃႇၶဝ်ႈတူၺ်း ၾၢႆႇသဵင် ႁႂ်ႈႁဝ်းလဵၼ်ႈ ၾၢႆႇၽဵင်းၵႂၢမ်း ၸဝ်ႈၵဝ်ႇ။';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ၶႂၢင်ႉတႃႇၶဝ်ႈဢွၵ်ႇသဵင်';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ၶႅၼ်းတေႃႈ ပၼ်ၶႂၢင်ႉ တႃႇၶဝ်ႈတူၺ်း ၾၢႆႇသဵင် တွၼ်ႈတႃႇ ဢႅပ်ႉၼႆႉ တီႈၼႂ်း ၶိူင်ႈတင်ႈၶိူင်ႈ ႁႂ်ႈႁဝ်းၶႃႈ လဵၼ်ႈလႆႈ ၾၢႆႇၽဵင်းၵႂၢမ်း ၸဝ်ႈၵဝ်ႇ။';

  @override
  String get menuScreenTitle => 'မေႇၼူႇ';

  @override
  String get musicMenuScreenTitle => 'ၽဵင်း';

  @override
  String get nowPlayingScreenTitle => 'မိူဝ်ႈလဵဝ်လဵၼ်ႈ';

  @override
  String get shuffleSongsMenuTitle => 'ၽိင်းၵႂၢမ်း';

  @override
  String get shuffleSettingTitle => 'ၶျွပ်ႈ';

  @override
  String get settingsScreenTitle => 'လွင်ႈတမ်းဝၢင်း';

  @override
  String get aboutScreenTitle => 'လွင်ႈတၢင်း';

  @override
  String get coverFlowScreenTitle => 'ႁူမ်ႇထႆ';

  @override
  String get artistsScreenTitle => 'ၸဝ်ႈပၢႆးမွၼ်း';

  @override
  String get albumsScreenTitle => 'ၶႅပ်းၵႂၢမ်း';

  @override
  String get songsScreenTitle => 'ၽဵင်းၵႂၢမ်း';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ၽဵင်းၵႂၢမ်း',
      one: '1 ၵႂၢမ်း',
      zero: 'ဢမ်ႇမီးၽဵင်း',
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
      other: '$countString ၶႅပ်းၵႂၢမ်း',
      one: '1 ၶႅပ်းၵႂၢမ်း',
      zero: 'ဢမ်ႇမီးၶႅပ်းၵႂၢမ်း',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'သႅၼ်းသႅၼ်း';

  @override
  String get genreSongsScreenTitle => 'ၵႂၢမ်းပၢၼ်ၵဝ်ႇ';

  @override
  String get deviceColorSettingTitle => 'သီၶိူင်ႈမိုဝ်း';

  @override
  String get touchScreenSettingTitle => 'Touch Screen ပိုတ်ႇ';

  @override
  String get repeatModeSettingTitle => 'သမ်ႉထႅင်ႈ';

  @override
  String get repeatModeOne => 'ဢၼ်ၼိူင်ႈ';

  @override
  String get repeatModeAll => 'တင်းမူတ်း';

  @override
  String get vibrateSettingTitle => 'သတ်းတူဝ်';

  @override
  String get clickWheelSettingTitle => 'ၼဵၵ်းတီႈသဵင်ဝူၺ်ႇႁင်ႈ';

  @override
  String get splitScreenSettingTitle => 'ၽူင်းသလဵတ်ႈ';

  @override
  String get touchSoundsDialogTitle => 'တိူဝ်ႉၺႃး';

  @override
  String get touchSoundsDialogContent =>
      'ၶႅၼ်းတေႃႈ Enable Touch Sounds ဢၼ်လုၵ်ႉတီႈ System Settings သေ ထွမ်ႇလႆႈ သဵင်မၢၵ်ႇလေႃႉ ဢၼ်ၼဵၵ်းဝႆႉ';

  @override
  String get immersiveModeSettingTitle => 'Mowersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'ၼႄတၢင်းသွၼ်လိၵ်ႈ';

  @override
  String get changeDirectorySettingTitle => 'လႅၵ်ႈငိုၼ်း';

  @override
  String get donateSettingTitle => 'လူႇတၢၼ်း';

  @override
  String get donateSettingDescription =>
      'သင်သူင်ၸႂ် ဢႅပ်ႉၼႆႉၸိုင် ၶႅၼ်းတေႃႈ ဝူၼ်ႉတႃႇလူႇႁွမ်းတၢၼ်းလႆႈၶႃႈ';

  @override
  String get versionAboutScreenTitle => 'လၢႆးႁွင်ႉ';

  @override
  String get madeWithLoveTitle => 'ႁဵတ်းလူၺ်ႈ ❤️ ၊';

  @override
  String get noMusicFilesFound => 'ဢမ်ႇမီးၽဵင်းၵႂၢမ်း';

  @override
  String get noArtistsFound => 'ဢမ်ႇမီးၸဝ်ႈပၢႆးမွၼ်း';

  @override
  String get noAlbumsFound => 'ဢမ်ႇမီး ၶႅပ်းၵႂၢမ်း';

  @override
  String get unknownSong => 'ဢမ်ႇႁူႉၵႂၢမ်း';

  @override
  String get unknownArtist => 'ၶူးမေႃတႆး ဢၼ်ဢမ်ႇႁူႉၸၵ်း';

  @override
  String get unknownAlbum => 'ၶႅပ်းၵႂၢမ်း ၶႅပ်းၵႂၢမ်းတႆး';

  @override
  String get unknownGenre => 'ဢုပ်ႇဢမ်ႇႁူႉၸၵ်း';

  @override
  String get buttonConfirmText => 'လႆႈယူႇ';

  @override
  String get tileValueOn => 'တၢင်းၼိူဝ်';

  @override
  String get tileValueOff => 'ႁပ်း';

  @override
  String get commonOfText => 'ၶွင်';

  @override
  String get pageNotFoundText => 'ၼႃႈလိၵ်ႈဢၼ်ပၼ်ဝႆႉၼၼ်ႉ ဢမ်ႇႁၼ်';

  @override
  String get commonErrorText => 'ပဵၼ်လူႉ';

  @override
  String get retryButtonText => 'ၵမ်ႉ';

  @override
  String get filePickerDialogTitle => 'လိူၵ်ႈဢဝ် Directory တီႈ Scan for Music';

  @override
  String get searchScreenTitle => 'သွၵ်ႈႁႃ';

  @override
  String get searchEmptyText => 'ဢမ်ႇမီးၶေႃႈတွပ်ႇသွၵ်ႈႁႃ';

  @override
  String get searchResultsText => 'သွၵ်ႈႁႃ ၶေႃႈတွပ်ႇ:';

  @override
  String get resultsForText => 'ၶေႃႈတွပ်ႇ တႃႇ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'လွင်ႈႁဵတ်းႁႂ်ႈ ပႅတ်ႉထရီႇ ဢမ်ႇတဵမ်ထူၼ်ႈ';

  @override
  String get disableBatteryOptimizationContent =>
      'ၶႅၼ်းတေႃႈ ယႃႉပႅတ်ႈ လွင်ႈႁဵတ်းႁႂ်ႈ ပႅတ်ႉထီးရီးယႃး လီလိူဝ်မႃး တွၼ်ႈတႃႇ ဢႅပ်ႉၼႆႉ ၼႂ်းၶိူင်ႈ တႃႇပၼ် ပိုၼ်ႉလင် ၽဵင်းၵႂၢမ်း။';

  @override
  String get languageScreenTitle => 'လိၵ်ႈလၢႆးၵႂၢမ်းလၢတ်ႈ';

  @override
  String get silverDeviceColor => 'ငိုၼ်း';

  @override
  String get blackDeviceColor => 'သီလမ်';

  @override
  String get resetSettingsTitle => 'ၶိုၼ်းမႄးတမ်းဝၢင်း';

  @override
  String get browseArtist => 'တူၺ်းပၢႆးမွၼ်း၊';

  @override
  String get browseAlbum => 'ၶၢဝ်ႇလိုဝ်းလင်';

  @override
  String get cancelText => 'ႁူၼ်ၶိုၼ်း';

  @override
  String get playlistsScreenTitle => 'Playlist';

  @override
  String get addToOnTheGoPlaylist => 'ၽိူမ်ႉသႂ်ႇတီႈ- ၵူဝ်ႇ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ထႅမ်ၶႅပ်းႁၢင်ႊ တီႈ On-the-go';

  @override
  String get removeSongFromThePlaylist => 'ဢဝ်ဢွၵ်ႇၼႂ်း Playlist';

  @override
  String get allAlbums => 'ၶႅပ်းၵႂၢမ်းတင်းသဵင်ႈ';

  @override
  String get scanningMusicFiles => 'သၵႅၼ်ႇၼိင်း ၾၢႆႇၽဵင်းၵႂၢမ်း';

  @override
  String get newPlaylist => 'လႆၢးမႂ်ႇ';

  @override
  String get savePlaylist => 'သိမ်းဝႆႉ Playlist';

  @override
  String get clearPlaylist => 'လၢင်ႉၶလႄးတဵတ်ႇ';

  @override
  String get rescanMusicFilesSettingTitle =>
      'ၽိုၼ်လိၵ်ႈၽဵင်းၵႂၢမ်း ရႅတ်ႉသၵႅၼ်ႇ';

  @override
  String get deviceControlMenuTutorialText =>
      'ၶၢႆႉၼိဝ်ႉမိုဝ်းၸဝ်ႈၵဝ်ႇ ဢိတ်းဢွတ်း ႁိမ်းႁွမ်း Click Wheel သေ ၼႄတၢင်း ၼႂ်းမႅၼ်ႇၼူဝ်ႇ';

  @override
  String get centerButtonMenuTutorialText =>
      'ၼဵၵ်းတီႈ ၼဵၼ်ၵၢင် တႃႇလိူၵ်ႈ ၶူဝ်းၶွင် ဢၼ်ႁိူဝ်ႈလႅင်း';

  @override
  String get playPauseMenuTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉ တႃႇလဵၼ်ႈ ဢမ်ႇၼၼ် ၵိုတ်းၽဵင်းၵႂၢမ်း';

  @override
  String get nextButtonMenuTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉသေ ၶၢမ်ႈၵႂႃႇတီႈၽဵင်းၵႂၢမ်းထႅင်ႈ';

  @override
  String get previousButtonMenuTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉ တႃႇၶိုၼ်းပိုတ်ႇၶိုၼ်း ဢမ်ႇၼၼ် ၶိုၼ်းၵႂႃႇတီႈၽဵင်းၵဝ်ႇ';

  @override
  String get menuButtonTutorialText =>
      'ၼဵၵ်းတီႈဢၼ်ၼႆႉသေ ၶိုၼ်းၵႂႃႇတီႈ Menu ဢၼ်ပူၼ်ႉမႃးၼၼ်ႉ။ ၼဵၵ်းသေ ယိပ်းဢဝ်တီႈ ၽႅၼ်ႇတူၺ်းတၢင်ႇဢၼ်သေ ၶဝ်ႈၵႂႃႇတီႈ menu ၼၼ်ႉၵမ်းသိုဝ်ႈ။';

  @override
  String get deviceScreenMenuTutorialText =>
      'ၼႆႉပဵၼ်ၽႅၼ်ႇၼႄ။ Touch Screen လႄႈ Screen Screen Screen Mode ၼႆႉ လႆႈပိုတ်ႇပၼ် ၸွမ်းၼင်ႇ ပိူင်မၼ်းသေ ၸၢင်ႈၵေႃႇသၢင်ႈလႆႈထႅင်ႈ တီႈၼႂ်း Settings ၼၼ်ႉယဝ်ႉ။';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ၶၢႆႉၼိဝ်ႉမိုဝ်းၸဝ်ႈၵဝ်ႇ ႁိမ်းႁွမ်း Click Wheel သေ မႄးပၼ် သဵင်';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ၼဵၵ်းတီႈ Center သေ လႄႇလဵပ်ႈ ႁႃ bar ၊ ၼဵၵ်းလႄႈ ယိပ်းဝႆႉ ၼဵၼ် Center သေ ၶဝ်ႈတူၺ်းလႆႈ တၢင်းလိူၵ်ႈထႅင်ႈ။';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ၼဵၵ်းလႄႈယိပ်းဝႆႉ ၼဵၼ်ၼႆႉ ႁႂ်ႈဝႆးၽဵင်းၵႂၢမ်း';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ၼဵၵ်းတိတ်းတၢမ်းပၼ် ၼဵၼ်ဢၼ်ၼႆႉ တႃႇၶိုၼ်းပိုတ်ႇၽဵင်းၵႂၢမ်း';

  @override
  String get deviceControlSearchTutorialText =>
      'ၶၢႆႉၼိဝ်ႉမိုဝ်းၸဝ်ႈၵဝ်ႇ ဢိတ်းဢွတ်း ႁိမ်းႁွမ်း Click Wheel သေ ၼႄပၼ် တူဝ်မႄႈလိၵ်ႈ';

  @override
  String get centerButtonSearchTutorialText =>
      'ၼဵၵ်းတီႈ ၼဵၼ်ၵၢင်သေ လိူၵ်ႈဢဝ် တူဝ်မႄႈလိၵ်ႈဢၼ်ၼႄဝႆႉၼၼ်ႉ';

  @override
  String get nextButtonSearchTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉသေ သႂ်ႇပၼ်တီႈ space';

  @override
  String get previousButtonSearchTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉသေ မွတ်ႇပႅတ်ႈ တူဝ်လိၵ်ႈၵမ်းလိုၼ်းသုတ်း';

  @override
  String get menuButtonSearchTutorialText =>
      'တဵၵ်းၼဵၼ်ဢၼ်ၼႆႉသေ ဢိုတ်းၶီးပူတ်ႉသေ တိတ်းတေႃႇၸွမ်း ၶေႃႈတွပ်ႇဢၼ်သွၵ်ႈႁႃၼၼ်ႉ';
}
