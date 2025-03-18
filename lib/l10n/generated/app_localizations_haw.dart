// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hawaiian (`haw`).
class AppLocalizationsHaw extends AppLocalizations {
  AppLocalizationsHaw([String locale = 'haw']) : super(locale);

  @override
  String get appTitle => 'Circhipod';

  @override
  String get menuButtonText => 'Papa kuhikuhi';

  @override
  String get audioAccessPermissionTitle => 'Ponoʻiaʻo Audio i kahiʻaeʻia';

  @override
  String get audioAccessPermissionContent =>
      'Eʻoluʻolu e hāʻawi i nā faila audio eʻae iā mākou eʻae iā mākou e pāʻani i kāu mau faila mele.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ua hōʻoleʻiaʻo Audio iʻaeʻia';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Eʻoluʻolu e hāʻawi i nā faila leo audio e komo no kēia app ma nā hoʻonohonoho pūnaewele eʻae iā mākou e pāʻani i kāu mau faila mele.';

  @override
  String get menuScreenTitle => 'Papa kuhikuhi';

  @override
  String get musicMenuScreenTitle => 'Mele';

  @override
  String get nowPlayingScreenTitle => 'Ke pāʻani nei';

  @override
  String get shuffleSongsMenuTitle => 'Nā mele Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Nā hoʻonohonoho';

  @override
  String get aboutScreenTitle => 'E pili ana';

  @override
  String get coverFlowScreenTitle => 'Kole Pahu';

  @override
  String get artistsScreenTitle => 'Artiski';

  @override
  String get albumsScreenTitle => 'Nā Pūnaewele';

  @override
  String get songsScreenTitle => 'Nā mele';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nā mele',
      one: '1 Mele',
      zero: 'ʻAʻohe Mele',
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
      zero: 'ʻAʻohe Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Nā mele Gens';

  @override
  String get deviceColorSettingTitle => 'ʻAno kala';

  @override
  String get touchScreenSettingTitle => 'Hoʻokomoʻia ka pā';

  @override
  String get repeatModeSettingTitle => 'Hana';

  @override
  String get repeatModeOne => 'ʻekahi';

  @override
  String get repeatModeAll => 'Wale';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'E nānā i nā kani uila';

  @override
  String get splitScreenSettingTitle => 'Slatch shower mode';

  @override
  String get touchSoundsDialogTitle => 'Pākuʻi Pūila';

  @override
  String get touchSoundsDialogContent =>
      'Eʻoluʻolu e hoʻopili i nā leo mai nā hoʻonohonoho hoʻonohonoho e hoʻolohe ai i nā leo kelepona';

  @override
  String get immersiveModeSettingTitle => 'Mode mode';

  @override
  String get showAppTutorialSettingTitle => 'Hōʻike i ke aʻoʻana';

  @override
  String get changeDirectorySettingTitle => 'Hoʻololi Uila';

  @override
  String get donateSettingTitle => 'Hāʻawi';

  @override
  String get donateSettingDescription =>
      'Inā makemakeʻoe i kēia app, e noʻonoʻo e hāʻawi i ka hāʻawiʻana.';

  @override
  String get versionAboutScreenTitle => 'Kūlana';

  @override
  String get madeWithLoveTitle => 'Hana me ❤️ e';

  @override
  String get noMusicFilesFound => 'ʻAʻohe mele';

  @override
  String get noArtistsFound => 'ʻAʻohe pena kiʻi';

  @override
  String get noAlbumsFound => 'No Hua Huawaiwai';

  @override
  String get unknownSong => 'ʻAʻole mele \'ole\'';

  @override
  String get unknownArtist => 'UnkuiʻIkeʻia';

  @override
  String get unknownAlbum => 'ĀpanaʻAʻe';

  @override
  String get unknownGenre => 'ʻIkeʻiaʻoiaʻiʻo';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Ma';

  @override
  String get tileValueOff => 'Mai';

  @override
  String get commonOfText => 'no';

  @override
  String get pageNotFoundText => 'ʻAʻole i loaʻa kaʻaoʻao i hāʻawiʻia';

  @override
  String get commonErrorText => 'Haki';

  @override
  String get retryButtonText => 'Retry';

  @override
  String get filePickerDialogTitle =>
      'E koho i kahi papa kuhikuhi e scan no ke mele';

  @override
  String get searchScreenTitle => 'Huli';

  @override
  String get searchEmptyText => 'ʻAʻohe hualoaʻa inke';

  @override
  String get searchResultsText => 'Nā hualoaʻa huli aʻe:';

  @override
  String get resultsForText => 'Nā hopena no:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Hoʻopaʻa i ka Optimization Battery';

  @override
  String get disableBatteryOptimizationContent =>
      'Eʻoluʻolu e hōʻole i nā koho balota no kēia app ma kaʻaoʻao o kaʻaoʻao eʻae i keʻano o ke mele mele.';

  @override
  String get languageScreenTitle => 'Kanakai';

  @override
  String get silverDeviceColor => 'Dala';

  @override
  String get blackDeviceColor => 'ʻeleʻele';

  @override
  String get resetSettingsTitle => 'Hoʻonohonoho i nā hoʻonohonoho';

  @override
  String get browseArtist => 'E nānā Lāʻau kiʻi kiʻi';

  @override
  String get browseAlbum => 'E nānā iāʻoe';

  @override
  String get cancelText => 'Ke kāpae nei';

  @override
  String get playlistsScreenTitle => 'Pāʻani pāʻani';

  @override
  String get addToOnTheGoPlaylist => 'E hoʻohui i ka-hele-hele';

  @override
  String get addAlbumToOnTheGoPlaylist => 'E hoʻohui i ka album i-O-O-hele';

  @override
  String get removeSongFromThePlaylist => 'Wehe i ka papa inoa';

  @override
  String get allAlbums => 'Nā Paule Loa';

  @override
  String get scanningMusicFiles => 'Nā faila mele mele';

  @override
  String get newPlaylist => 'Hoʻolālā Pihi';

  @override
  String get savePlaylist => 'Hoʻopakele i ka puke';

  @override
  String get clearPlaylist => 'Maopopo o waihona';

  @override
  String get rescanMusicFilesSettingTitle => 'ʻO nā faila mele rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'E hoʻoneʻe i kou manamana lima e pili ana i ka huila e hoʻokele ai i ka papa kuhikuhi';

  @override
  String get centerButtonMenuTutorialText =>
      'E kaomi i ke pihi Center e koho i ka waihona papa kuhikuhi';

  @override
  String get playPauseMenuTutorialText =>
      'E kaomi i kēia pihi e pāʻani a nānā aku i kahi mele';

  @override
  String get nextButtonMenuTutorialText =>
      'E kaomi i kēia pihi e holo i ke mele hou aʻe';

  @override
  String get previousButtonMenuTutorialText =>
      'E kaomi i kēia pihi e hoʻihoʻi hou a hoʻi hou i ka mele ma mua';

  @override
  String get menuButtonTutorialText =>
      'E kaomi i kēia pihi e hoʻi i ka papa kuhikuhi ma mua. Hiki iāʻoe ke kaomi a hoʻopaʻa iā ia mai kekahiʻaoʻao\'ē aʻe e hele pololei i ka papa kuhikuhi nui.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ʻO kēia ka pale hōʻike. Hoʻokomoʻia ka SCA SCACE a me SPLIT SPECH SPECE e hiki ke hoʻopaʻaʻia e ka maʻamau a hiki ke hoʻonohonohoʻia ma nā hoʻonohonoho.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'E hoʻoneʻe i kou manamana lima a puni ka huila e hoʻoponopono i ka leo';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'E kaomi i ke pihi Center e hiki ai i ke kiʻi ma o kaʻimiʻana, scrubber bar a shuffle slider. E kaomi a hoʻopaʻa i ka pihi Center e komo ai i nā koho hou aʻe.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'E kaomi a hoʻopaʻa i kēia pihi e wikiwiki i ka mele';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'E kaomi a hoʻopaʻa i kēia pihi e hana hou i ke mele';

  @override
  String get deviceControlSearchTutorialText =>
      'E neʻe i kāu manamana aniani e pili ana i ka paena kaomi e hōʻike i kahi kiʻi';

  @override
  String get centerButtonSearchTutorialText =>
      'E kaomi i ke pihi Center e koho i ka leka i hōʻikeʻia';

  @override
  String get nextButtonSearchTutorialText =>
      'E kaomi i kēia pihi e hoʻohui i kahi wahi';

  @override
  String get previousButtonSearchTutorialText =>
      'E kaomi i kēia pihi e hoʻopau i keʻano hope';

  @override
  String get menuButtonSearchTutorialText =>
      'E kaomi i kēia pihi e pani i ke kīwī a kamaʻilio pū me nā hopena huli';

  @override
  String get allSongs => 'Nā mele a pau';
}
