// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lao (`lo`).
class AppLocalizationsLo extends AppLocalizations {
  AppLocalizationsLo([String locale = 'lo']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'ເມນູ';

  @override
  String get audioAccessPermissionTitle => 'ຕ້ອງການອະນຸຍາດເຂົ້າໃຊ້ສຽງ';

  @override
  String get audioAccessPermissionContent => 'ກະລຸນາໃຫ້ການເຂົ້າເຖິງໄຟລ໌ສຽງເພື່ອໃຫ້ພວກເຮົາຫຼີ້ນໄຟລ໌ດົນຕີຂອງທ່ານ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ການອະນຸຍາດເຂົ້າໃຊ້ສຽງທີ່ຖືກປະຕິເສດ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'ກະລຸນາໃຫ້ການເຂົ້າເຖິງໄຟລ໌ສຽງສໍາລັບແອັບນີ້ໃນການຕັ້ງຄ່າອຸປະກອນເພື່ອໃຫ້ພວກເຮົາຫຼີ້ນໄຟລ໌ດົນຕີຂອງທ່ານ.';

  @override
  String get menuScreenTitle => 'ເມນູ';

  @override
  String get musicMenuScreenTitle => 'ດົນຕີ';

  @override
  String get nowPlayingScreenTitle => 'ດຽວນີ້ຫຼີ້ນ';

  @override
  String get shuffleSongsMenuTitle => 'ສັ່ນເພງ';

  @override
  String get shuffleSettingTitle => 'ຊູ່';

  @override
  String get settingsScreenTitle => 'ການກໍານົດ';

  @override
  String get aboutScreenTitle => 'ກ່ຽວກັບ';

  @override
  String get coverFlowScreenTitle => 'ຝາປິດ';

  @override
  String get artistsScreenTitle => 'ສິຣິ';

  @override
  String get albumsScreenTitle => 'ອະພິນ';

  @override
  String get songsScreenTitle => 'ເພງ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ເພງ',
      one: '1 ເພງ',
      zero: 'ບໍ່ມີເພງ',
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
      other: '$countString ອະລະບໍ້າ',
      one: '1 ອະລະບໍ້າ',
      zero: 'ບໍ່ມີອະລະບໍ້າ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ປະເພດ';

  @override
  String get genreSongsScreenTitle => 'ເພງປະເພດ';

  @override
  String get deviceColorSettingTitle => 'ສີຂອງອຸປະກອນ';

  @override
  String get touchScreenSettingTitle => 'ເປີດຫນ້າຈໍສໍາພັດ';

  @override
  String get repeatModeSettingTitle => 'ຊ້ໍາ';

  @override
  String get repeatModeOne => 'ຫນື່ງ';

  @override
  String get repeatModeAll => 'ທັງຫມົດ';

  @override
  String get vibrateSettingTitle => 'ສັ່ນສະເທືອນ';

  @override
  String get clickWheelSettingTitle => 'ກົດສຽງລໍ້';

  @override
  String get splitScreenSettingTitle => 'ຮູບແບບຫນ້າຈໍ';

  @override
  String get touchSoundsDialogTitle => 'ສຽງສໍາພັດ';

  @override
  String get touchSoundsDialogContent => 'ກະລຸນາເປີດໃຊ້ສຽງສໍາຜັດຈາກການຕັ້ງຄ່າລະບົບເພື່ອຟັງສຽງກົດປຸ່ມກົດປຸ່ມ';

  @override
  String get immersiveModeSettingTitle => 'ຮູບແບບທີ່ບໍ່ມີຕົວຕົນ';

  @override
  String get showAppTutorialSettingTitle => 'ສະແດງ tutorial';

  @override
  String get changeDirectorySettingTitle => 'ການປ່ຽນແປງລະບົບ';

  @override
  String get donateSettingTitle => 'ບໍລິຈາກ';

  @override
  String get donateSettingDescription => 'ຖ້າທ່ານມັກແອັບ this ນີ້, ກະລຸນາພິຈາລະນາການບໍລິຈາກ.';

  @override
  String get versionAboutScreenTitle => 'ສະບັບ';

  @override
  String get madeWithLoveTitle => 'ເຮັດດ້ວຍ❤️ໂດຍ';

  @override
  String get noMusicFilesFound => 'ບໍ່ມີດົນຕີ';

  @override
  String get noArtistsFound => 'ບໍ່ມີນັກສິລະປິນ';

  @override
  String get noAlbumsFound => 'ບໍ່ມີອັນລະບັ້ມ';

  @override
  String get unknownSong => 'ເພງທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get unknownArtist => 'ນັກສິລະປິນທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get unknownAlbum => 'ອັລບັມທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get unknownGenre => 'ປະເພດທີ່ບໍ່ຮູ້ຈັກ';

  @override
  String get buttonConfirmText => 'ຕົກລົງ';

  @override
  String get tileValueOn => 'ຕໍ່ໆໄປ';

  @override
  String get tileValueOff => 'ປິດ';

  @override
  String get commonOfText => 'ຂອງ';

  @override
  String get pageNotFoundText => 'ຫນ້າທີ່ກໍານົດບໍ່ພົບ';

  @override
  String get commonErrorText => 'ຜິດ';

  @override
  String get retryButtonText => 'ລອງໃຫມ່';

  @override
  String get filePickerDialogTitle => 'ເລືອກໄດເລກະທໍລີເພື່ອສະແກນເພັງ';

  @override
  String get searchScreenTitle => 'ຄົ້ນຫາ';

  @override
  String get searchEmptyText => 'ບໍ່ມີຜົນການຄົ້ນຫາ';

  @override
  String get searchResultsText => 'ຜົນການຄົ້ນຫາ:';

  @override
  String get resultsForText => 'ຜົນໄດ້ຮັບສໍາລັບ:';

  @override
  String get disableBatteryOptimizationTitle => 'ປິດການແຂ່ງຂັນແບັດເຕີຣີ';

  @override
  String get disableBatteryOptimizationContent => 'ກະລຸນາປິດການໃຊ້ງານສໍາລັບການເພີ່ມປະສິດທິພາບຂອງແບດເຕີຣີສໍາລັບແອັບ this ນີ້ໃນການຕັ້ງຄ່າອຸປະກອນເພື່ອອະນຸຍາດການຫຼີ້ນໃຫມ່ຂອງດົນຕີ.';

  @override
  String get languageScreenTitle => 'ພາສາ';

  @override
  String get silverDeviceColor => 'ເງິນ';

  @override
  String get blackDeviceColor => 'ດໍາ';

  @override
  String get resetSettingsTitle => 'ຕັ້ງຄ່າຄືນໃຫມ່';

  @override
  String get browseArtist => 'ຊອກຫານັກສິລະປິນ';

  @override
  String get browseAlbum => 'browse album';

  @override
  String get cancelText => 'ຍົກເລີກ';

  @override
  String get playlistsScreenTitle => 'ເຄື່ອງຫຼີ້ນ';

  @override
  String get addToOnTheGoPlaylist => 'ເພີ່ມເຂົ້າໃນການໄປ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ເພີ່ມອັນລະບັ້ມໃສ່ໃນການໄປ';

  @override
  String get removeSongFromThePlaylist => 'ເອົາອອກຈາກລາຍຊື່';

  @override
  String get allAlbums => 'ອະທິບາຍທັງຫມົດ';

  @override
  String get scanningMusicFiles => 'ສະແກນເອກະສານດົນຕີ';

  @override
  String get newPlaylist => 'ບົດລາຍງານໃຫມ່';

  @override
  String get savePlaylist => 'ບັນທຶກ Playlist';

  @override
  String get clearPlaylist => 'ສະນາຈາລຶກ';

  @override
  String get rescanMusicFilesSettingTitle => 'rescan ໄຟລ໌ດົນຕີ';

  @override
  String get deviceControlMenuTutorialText => 'ຍ້າຍນິ້ວໂປ້ຂອງທ່ານເບົາລົງຮອບລໍ້ກົດເພື່ອນໍາໃຊ້ເມນູ';

  @override
  String get centerButtonMenuTutorialText => 'ກົດປຸ່ມ STENTS ເພື່ອເລືອກລາຍການເມນູທີ່ຖືກເນັ້ນໃຫ້';

  @override
  String get playPauseMenuTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອຫຼີ້ນຫລືຢຸດເພງ';

  @override
  String get nextButtonMenuTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອຂ້າມໄປທີ່ເພງຕໍ່ໄປ';

  @override
  String get previousButtonMenuTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອອ່ານຄືນຫຼືກັບໄປທີ່ເພງທີ່ຜ່ານມາ';

  @override
  String get menuButtonTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອກັບໄປທີ່ເມນູກ່ອນຫນ້ານີ້. ທ່ານສາມາດກົດແລະກົດມັນຈາກຫນ້າຈໍອື່ນເພື່ອໄປທີ່ເມນູຫລັກໂດຍກົງ.';

  @override
  String get deviceScreenMenuTutorialText => 'ນີ້ແມ່ນຫນ້າຈໍສະແດງ. ຮູບແບບຫນ້າຈໍສໍາຜັດແລະແບ່ງປັນຫນ້າຈໍແມ່ນເປີດໃຊ້ໂດຍຄ່າເລີ່ມຕົ້ນແລະສາມາດຕັ້ງຄ່າຕື່ມອີກໃນການຕັ້ງຄ່າ.';

  @override
  String get deviceControlNowPlayingTutorialText => 'ຍ້າຍໂປ້ໂປ້ຂອງທ່ານຮອບລໍ້ກົດເພື່ອປັບປະລິມານ';

  @override
  String get centerButtonNowPlayingTutorialText => 'ກົດປຸ່ມສູນກາງຫາວົງຈອນໂດຍຜ່ານການສະແຫວງຫາແຖບ, ແຖບ Scrubber ແລະເລື່ອນເລື່ອນ. ກົດແລະກົດປຸ່ມສູນກາງເພື່ອເຂົ້າຫາຕົວເລືອກເພີ່ມເຕີມ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'ກົດປຸ່ມແລະກົດປຸ່ມນີ້ເພື່ອກ້າວໄປຂ້າງຫນ້າເພງ';

  @override
  String get previousButtonNowPlayingTutorialText => 'ກົດປຸ່ມແລະກົດປຸ່ມນີ້ເພື່ອຫວນຄືນເພງ';

  @override
  String get deviceControlSearchTutorialText => 'ຍ້າຍນິ້ວໂປ້ຂອງທ່ານເບົາລົງຮອບລໍ້ກົດເພື່ອຊີ້ໃຫ້ເຫັນຕົວຫນັງສື';

  @override
  String get centerButtonSearchTutorialText => 'ກົດປຸ່ມ STENTS ເພື່ອເລືອກຕົວຫນັງສືທີ່ໂດດເດັ່ນ';

  @override
  String get nextButtonSearchTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອເພີ່ມພື້ນທີ່';

  @override
  String get previousButtonSearchTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອລຶບຕົວລະຄອນສຸດທ້າຍ';

  @override
  String get menuButtonSearchTutorialText => 'ກົດປຸ່ມນີ້ເພື່ອປິດແປ້ນພິມແລະພົວພັນກັບຜົນການຄົ້ນຫາ';
}
