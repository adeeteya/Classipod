// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Igbo (`ig`).
class AppLocalizationsIg extends AppLocalizations {
  AppLocalizationsIg([String locale = 'ig']) : super(locale);

  @override
  String get appTitle => 'Oge ntoko';

  @override
  String get menuButtonText => 'Nri enwere';

  @override
  String get audioAccessPermissionTitle => 'Ikike inweta ikike';

  @override
  String get audioAccessPermissionContent => 'Biko Grata faịlụ ohere iji mee ka anyị kpọọ faịlụ egwu gị.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Ekwela ka ohere nweta ikike';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Biko Grata Audio Nweta maka ngwa a na ntọala ngwaọrụ iji mee ka anyị kpọọ faịlụ egwu gị.';

  @override
  String get menuScreenTitle => 'Nri enwere';

  @override
  String get musicMenuScreenTitle => 'Uneghune';

  @override
  String get nowPlayingScreenTitle => 'Ugbu a igwu egwu';

  @override
  String get shuffleSongsMenuTitle => 'Song songs';

  @override
  String get shuffleSettingTitle => 'Isiju';

  @override
  String get settingsScreenTitle => 'Ntọala';

  @override
  String get aboutScreenTitle => 'Maka';

  @override
  String get coverFlowScreenTitle => 'Cover';

  @override
  String get artistsScreenTitle => 'Omenkà';

  @override
  String get albumsScreenTitle => 'Abomu';

  @override
  String get songsScreenTitle => 'Egwu';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Egwu',
      one: '1 Abụ',
      zero: 'Enweghị egwu',
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
      zero: 'Enweghị albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ikpo ohia';

  @override
  String get genreSongsScreenTitle => 'Songs';

  @override
  String get deviceColorSettingTitle => 'Agba agba';

  @override
  String get touchScreenSettingTitle => 'Emetụ aka na ihuenyo';

  @override
  String get repeatModeSettingTitle => 'Imekwa';

  @override
  String get repeatModeOne => 'Otu';

  @override
  String get repeatModeAll => 'Dum';

  @override
  String get vibrateSettingTitle => 'Vaibret';

  @override
  String get clickWheelSettingTitle => 'Pịa Walk Heals';

  @override
  String get splitScreenSettingTitle => 'Gbasaa ihuenyo ihu';

  @override
  String get touchSoundsDialogTitle => 'Mmetụ mmetụ';

  @override
  String get touchSoundsDialogContent => 'Biko mee ka ụda mmetụ si na ntọala sistemụ iji nụ ụda pịa';

  @override
  String get immersiveModeSettingTitle => 'Modem mode';

  @override
  String get showAppTutorialSettingTitle => 'Gosi nkuzi';

  @override
  String get changeDirectorySettingTitle => 'Gbanwee ndekọ';

  @override
  String get donateSettingTitle => 'Inye';

  @override
  String get donateSettingDescription => 'Ọ bụrụ na ịchọrọ ngwa a, biko tụlee inye onyinye.';

  @override
  String get versionAboutScreenTitle => 'Veshion';

  @override
  String get madeWithLoveTitle => 'Emere na ❤️ site na';

  @override
  String get noMusicFilesFound => 'Enweghị egwu';

  @override
  String get noArtistsFound => 'Ọ dịghị ihe nkiri';

  @override
  String get noAlbumsFound => 'Enweghị ọba';

  @override
  String get unknownSong => 'Abụ A Na-amaghị';

  @override
  String get unknownArtist => 'Onye omenkà amaghi ama';

  @override
  String get unknownAlbum => 'Album amabeghị';

  @override
  String get unknownGenre => 'Amaghi ama';

  @override
  String get buttonConfirmText => 'Ọ DỊ MMA';

  @override
  String get tileValueOn => 'Inwu';

  @override
  String get tileValueOff => 'Igbanyu';

  @override
  String get commonOfText => 'nke';

  @override
  String get pageNotFoundText => 'Achọpụtaghị peeji enyere';

  @override
  String get commonErrorText => 'Mmejo';

  @override
  String get retryButtonText => 'Vipe';

  @override
  String get filePickerDialogTitle => 'Họrọ ndekọ ka ị nyocha maka egwu';

  @override
  String get searchScreenTitle => 'Ochucho';

  @override
  String get searchEmptyText => 'Enweghị nsonaazụ ọchụchọ';

  @override
  String get searchResultsText => 'Nsonaazụ ọchụchọ:';

  @override
  String get resultsForText => 'Nsonaazụ maka:';

  @override
  String get disableBatteryOptimizationTitle => 'Gbanyụọ batrị batrị';

  @override
  String get disableBatteryOptimizationContent => 'Biko gbanyụọ batrị batrị maka ngwa a na ntọala ngwaọrụ iji mee ka egwu dị na egwu.';

  @override
  String get languageScreenTitle => 'Asusu';

  @override
  String get silverDeviceColor => 'Silva';

  @override
  String get blackDeviceColor => 'Oji';

  @override
  String get resetSettingsTitle => 'Ntọala ntọala';

  @override
  String get browseArtist => 'Na-agagharị Artist';

  @override
  String get browseAlbum => 'Browsum a album';

  @override
  String get cancelText => 'Ikansulu';

  @override
  String get playlistsScreenTitle => 'Limslists';

  @override
  String get addToOnTheGoPlaylist => 'Tinye na-a';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tinye album na-aga';

  @override
  String get removeSongFromThePlaylist => 'Wepu egwu na egwu';

  @override
  String get allAlbums => 'ABAK ALL';

  @override
  String get scanningMusicFiles => 'Scankpọ faịlụ egwu';

  @override
  String get newPlaylist => 'Listi ọhụụ';

  @override
  String get savePlaylist => 'Chekwaa ndepụta ọkpụkpọ';

  @override
  String get clearPlaylist => 'Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Faịlị egwu na-egwu';

  @override
  String get deviceControlMenuTutorialText => 'Bugharịa mkpịsị aka ukwu gị gburugburu na wheel ga-agagharị na menu';

  @override
  String get centerButtonMenuTutorialText => 'Pịa bọtịnụ etiti ka ịhọrọ ihe menu pụtara ìhè';

  @override
  String get playPauseMenuTutorialText => 'Pịa bọtịnụ a iji kpọọ ma ọ bụ kwụsịtụ abụ';

  @override
  String get nextButtonMenuTutorialText => 'Pịa bọtịnụ a ka ọ gaa na egwu na-esote';

  @override
  String get previousButtonMenuTutorialText => 'Pịa bọtịnụ a ka ịlaghachi ma ọ bụ laghachi na egwu gara aga';

  @override
  String get menuButtonTutorialText => 'Pịa bọtịnụ a ka ịlaghachi na menu gara aga. Nwere ike pịa ma jide ya na ihuenyo ọ bụla ọzọ iji gaa na nchịkọta nhọrọ.';

  @override
  String get deviceScreenMenuTutorialText => 'Nke a bụ enyo ngosi. A na-akwado ihuenyo mmetụ ma gbasaa na ọnọdụ ihuenyo ma enwere ike ịhazi ya na ntọala ahụ.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Bugharịa mkpịsị aka ukwu gị gburugburu na wiil pịa iji dozie olu';

  @override
  String get centerButtonNowPlayingTutorialText => 'Pịa bọtịnụ etiti iji chọọ mmanya, sctufber mmanya na mmịfe mmịfe. Pịa ma jide bọtịnụ etiti iji nweta nhọrọ ndị ọzọ.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Pịa ma jide bọtịnụ a iji bulie egwu ahụ ọsọ';

  @override
  String get previousButtonNowPlayingTutorialText => 'Pịa ma jide bọtịnụ a iji weghachi abụ ahụ';

  @override
  String get deviceControlSearchTutorialText => 'Bugharịa mkpịsị aka ukwu gị gburugburu n\'akụkụ wiilịpụta iji gosipụta mkpụrụedemede';

  @override
  String get centerButtonSearchTutorialText => 'Pịa bọtịnụ etiti iji họrọ mkpụrụ akwụkwọ akọwapụtara';

  @override
  String get nextButtonSearchTutorialText => 'Pịa bọtịnụ a ka ịgbakwunye oghere';

  @override
  String get previousButtonSearchTutorialText => 'Pịa bọtịnụ a ka ihichapụ agwa ikpeazụ';

  @override
  String get menuButtonSearchTutorialText => 'Pịa bọtịnụ a iji mechie usoro ma soro nsonaazụ ọchụchọ ahụ';
}
