// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mam (`mam`).
class AppLocalizationsMam extends AppLocalizations {
  AppLocalizationsMam([String locale = 'mam']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Aju Permiso Audio il tiʼj tuʼn tten';

  @override
  String get audioAccessPermissionContent => 'Bʼaʼn tuʼn ttzaj tqʼoʼna ambʼil qeye tuʼn tokx qqʼoʼne qe archivo te audio tuʼntzun tkubʼ qbʼinchaʼne qe archivo te bʼitz.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Aju Permiso Audio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Bʼaʼn tuʼn t-xi qqʼoʼn ambʼil kye archivo te audio tuʼn tokx toj aplicación lu toj ambʼil jaʼlo tuʼntzun t-xi qqʼoʼn ambʼil qeye tuʼn tkubʼ qbʼinchaʼne qe archivo te bʼitz.';

  @override
  String get menuScreenTitle => 'men';

  @override
  String get musicMenuScreenTitle => 'Chnab´';

  @override
  String get nowPlayingScreenTitle => 'Ja’lo';

  @override
  String get shuffleSongsMenuTitle => 'Aju qʼoj tiʼj qʼoj';

  @override
  String get shuffleSettingTitle => 'junchb´';

  @override
  String get settingsScreenTitle => 'iq\'b\'aj';

  @override
  String get aboutScreenTitle => 'Naqaku tkitz';

  @override
  String get coverFlowScreenTitle => 'Chib´a´n';

  @override
  String get artistsScreenTitle => 'b´inchal b´itz';

  @override
  String get albumsScreenTitle => 'Tkyaqil';

  @override
  String get songsScreenTitle => 'Sas';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString B´itz',
      one: '1 B´itz',
      zero: 'myia b´itz',
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
      other: '$countString Albumes',
      one: '1 Album',
      zero: 'myia junjen álbumes',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'q´oj';

  @override
  String get genreSongsScreenTitle => 'Géner';

  @override
  String get deviceColorSettingTitle => 'Aju bʼinchal';

  @override
  String get touchScreenSettingTitle => 'Aju t-xilen yol lu.';

  @override
  String get repeatModeSettingTitle => 'Kyq´amantza';

  @override
  String get repeatModeOne => 'Jun';

  @override
  String get repeatModeAll => 'Tkyaqil';

  @override
  String get vibrateSettingTitle => 'Vintada';

  @override
  String get clickWheelSettingTitle => 'Jaku tzʼok ttzʼibʼina Rueda .';

  @override
  String get splitScreenSettingTitle => 'Aju t-xbʼalun split .';

  @override
  String get touchSoundsDialogTitle => 'B´a´n';

  @override
  String get touchSoundsDialogContent => 'Bʼaʼn tuʼn t-xi qbʼiʼn aju Configuración del sistema tuʼntzun tok qbʼiʼn qe tqʼajqʼajel wibʼaj te rueda te clic .';

  @override
  String get immersiveModeSettingTitle => 'Aju tnam Mo .';

  @override
  String get showAppTutorialSettingTitle => 'Qʼonka twitza';

  @override
  String get changeDirectorySettingTitle => 'Chance';

  @override
  String get donateSettingTitle => 'Oyil';

  @override
  String get donateSettingDescription => 'Qa bʼaʼn in nela toj twitza aju aplicación lu, bʼaʼn tuʼn tkubʼ t-ximana tuʼn t-xi tqʼoʼna oyaj.';

  @override
  String get versionAboutScreenTitle => 'Nim';

  @override
  String get madeWithLoveTitle => 'B’incha’n tuk’il ❤️ tu’n .';

  @override
  String get noMusicFilesFound => 'Ma b´itzin';

  @override
  String get noArtistsFound => 'tzeʼn';

  @override
  String get noAlbumsFound => 'No';

  @override
  String get unknownSong => 'NA';

  @override
  String get unknownArtist => 'tz´ib´il';

  @override
  String get unknownAlbum => 'Mintiʼ ojtzqiʼn';

  @override
  String get unknownGenre => 'Mintiʼ ojtzqiʼn';

  @override
  String get buttonConfirmText => 'B´ANATZ´UN';

  @override
  String get tileValueOn => 'Toj';

  @override
  String get tileValueOff => 'Yupin';

  @override
  String get commonOfText => 'te';

  @override
  String get pageNotFoundText => 'Aju t-xaq uʼj mintiʼ .';

  @override
  String get commonErrorText => 'Nya bʼaʼn';

  @override
  String get retryButtonText => 'Aju qʼol chojbʼil';

  @override
  String get filePickerDialogTitle => 'Jaku jaw tjyoʼna jun Directorio tuʼn tkubʼ bʼinchet bʼitz';

  @override
  String get searchScreenTitle => 'Joyb´aj';

  @override
  String get searchEmptyText => 'Miʼn tzaj jun Xjelbʼitz';

  @override
  String get searchResultsText => 'Aju xjelbʼitz:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle => 'Aju bʼant tuʼn Batería';

  @override
  String get disableBatteryOptimizationContent => 'Bʼaʼn tuʼn tkubʼ qbʼinchaʼn aju bʼaʼn tuʼn tbʼant quʼn tuʼn qbʼet toj aplicación lu toj ambʼil jaʼlo tuʼntzun t-xi qqʼoʼn ambʼil tuʼn qbʼitzin tiʼj bʼitz.';

  @override
  String get languageScreenTitle => 'Yol';

  @override
  String get silverDeviceColor => 'T\'ab';

  @override
  String get blackDeviceColor => 'Q\'aq';

  @override
  String get resetSettingsTitle => 'Resettaril';

  @override
  String get browseArtist => 'ttzi ja';

  @override
  String get browseAlbum => 'Aju qʼuqbʼil qkʼuʼj .';

  @override
  String get cancelText => 'okxju';

  @override
  String get playlistsScreenTitle => 'nimsil';

  @override
  String get addToOnTheGoPlaylist => 'Aju qʼuqbʼil qkʼuʼj toj On-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Jaku tzʼokx qqʼoʼn Álbum toj On-De-Go .';

  @override
  String get removeSongFromThePlaylist => 'Jatz tiʼna aju .';

  @override
  String get allAlbums => 'Kykyaqil qeju';

  @override
  String get scanningMusicFiles => 'Aju xnaqʼtzbʼil tiʼj xnaqʼtzbʼil';

  @override
  String get newPlaylist => 'Ak´aj';

  @override
  String get savePlaylist => 'NA';

  @override
  String get clearPlaylist => 'Clea';

  @override
  String get rescanMusicFilesSettingTitle => 'Aju bʼant tuʼn';

  @override
  String get deviceControlMenuTutorialText => 'Qʼonxa chʼin t-xbʼaluna tiʼjele Rueda de clic tuʼntzun t-xiʼya toj menú .';

  @override
  String get centerButtonMenuTutorialText => 'Jaku tzʼok ttzyuʼna aju botón te tmij tuʼn tjaw tjyoʼna aju tiʼ in tzaj tqʼamaʼn aju menú resaltado .';

  @override
  String get playPauseMenuTutorialText => 'Jaku tzʼok ttzyuʼna aju botón lu tuʼn t-xi t-xoʼna moqa qʼonxa jun bʼitz .';

  @override
  String get nextButtonMenuTutorialText => 'Qʼonka twitza tiʼj botón lu tuʼn tkubʼ t-ximana tuʼn tkubʼ t-ximana juntl bʼitz .';

  @override
  String get previousButtonMenuTutorialText => 'Jaku tzʼok ttzyuʼna aju botón lu tuʼn tkubʼ t-ximana juntl maj moqa jaku meltzʼaja juntl maj tiʼj bʼitz otoq bʼant .';

  @override
  String get menuButtonTutorialText => 'Jaku tzʼok ttzyuʼna aju botón lu tuʼn tmeltzʼaja toj menú otoq bʼaj. Jaku tzʼok ttzyuʼna ex jaku tzʼok ttzyuʼna toj alkyexku juntl pantalla tuʼntzun t-xiʼ directamente toj menú principal.';

  @override
  String get deviceScreenMenuTutorialText => 'Atzun t-xilen jlu. Aju t-xilen yol lu, aju tuʼn tkubʼ qbʼinchaʼn aju in tzaj tqʼamaʼn Tyol Dios.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Qʼonxa t-xbʼaluna tiʼjele Beel de Click tuʼntzun tkubʼ t-ximana aju volumen .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Jaku tzʼok ttzyuʼna aju botón Center tuʼn t-xiʼya toj bicicleta toj barra, toj barra te scribber ex toj deslizador te shuffle. Jaku tzʼok ttzyuʼna ex jaku tzʼok ttzyuʼna aju botón Center tuʼntzun tokxa toj junjuntl tten.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Jaku tzʼok ttzyuʼna ex jaku tzʼok ttzyuʼna aju botón lu tuʼn t-xi t-xnaqʼtzaʼna aju bʼitz .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Jaku tzʼok ttzyuʼna ex jaku tzʼok ttzyuʼna aju botón lu tuʼn tkubʼ t-ximana juntl maj aju bʼitz .';

  @override
  String get deviceControlSearchTutorialText => 'Qʼonxa chʼin t-xbʼaluna tiʼjele Beel Click tuʼntzun tkubʼ tyekʼina jun alfabeto .';

  @override
  String get centerButtonSearchTutorialText => 'Jaku tzʼok ttzyuʼna aju botón centro tuʼn tjaw tjyoʼna aju alfabeto resaltado .';

  @override
  String get nextButtonSearchTutorialText => 'Jaku tzʼok ttzyuʼna aju botón tuʼn tkubʼ tqʼoʼna jun .';

  @override
  String get previousButtonSearchTutorialText => 'Jaku tzʼok ttzyuʼna aju botón lu tuʼn tkubʼ tnajsaʼna aju bʼajsbʼil xjal .';

  @override
  String get menuButtonSearchTutorialText => 'Jaku tzʼok ttzyuʼna aju botón tuʼn tkubʼ ttzʼibʼina teclado ex jaku tzʼok tmojbʼan tibʼa tukʼilju in tzaj tqʼamaʼn xjelbʼitz .';
}
