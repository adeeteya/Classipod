// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kurdish (`ku`).
class AppLocalizationsKu extends AppLocalizations {
  AppLocalizationsKu([String locale = 'ku']) : super(locale);

  @override
  String get appTitle => 'Klasîk';

  @override
  String get menuButtonText => 'QERTA XÛREKÊ';

  @override
  String get audioAccessPermissionTitle => 'Destûra gihîştina bihîst';

  @override
  String get audioAccessPermissionContent =>
      'Ji kerema xwe pelên bihîstinê bistînin da ku em destûr bidin ku hûn pelên muzîka xwe bilîzin.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Destûra gihîştina bihîstbar red dike';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ji kerema xwe pelên bihîstinê yên ji bo vê sepanê di mîhengên cîhazê de bistînin da ku em destûr bidin ku pelên muzîka xwe bilîzin.';

  @override
  String get menuScreenTitle => 'Qerta xûrekê';

  @override
  String get musicMenuScreenTitle => 'Mûzîk';

  @override
  String get nowPlayingScreenTitle => 'Naha lîstin';

  @override
  String get shuffleSongsMenuTitle => 'Stranên Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Mîhengan';

  @override
  String get aboutScreenTitle => 'Ji dor';

  @override
  String get coverFlowScreenTitle => 'Pêça cover';

  @override
  String get artistsScreenTitle => 'Hunermend';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Stranên';

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
  String get genresScreenTitle => 'Şano';

  @override
  String get genreSongsScreenTitle => 'Stranên şanoyê';

  @override
  String get deviceColorSettingTitle => 'Rengê cîhazê';

  @override
  String get touchScreenSettingTitle => 'Ekrana touch çalak kirin';

  @override
  String get repeatModeSettingTitle => 'Dûbare';

  @override
  String get repeatModeOne => 'Yek';

  @override
  String get repeatModeAll => 'Gişt';

  @override
  String get vibrateSettingTitle => 'Lerzîn';

  @override
  String get clickWheelSettingTitle => 'Dengên Wheel bikirtînin';

  @override
  String get splitScreenSettingTitle => 'Moda screenê dabeş';

  @override
  String get touchSoundsDialogTitle => 'Dengên Touch';

  @override
  String get touchSoundsDialogContent =>
      'Ji kerema xwe dengên Touch ji Mîhengên Pergalê Vebijêrin ku dengên Wheel Wheel bibihîzin';

  @override
  String get immersiveModeSettingTitle => 'Mode Nemaze';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial nîşan bide';

  @override
  String get changeDirectorySettingTitle => 'Directory Directory';

  @override
  String get donateSettingTitle => 'Bêşdan';

  @override
  String get donateSettingDescription =>
      'Heke hûn vê sepanê hez dikin, ji kerema xwe donating bifikirin.';

  @override
  String get versionAboutScreenTitle => 'Awa';

  @override
  String get madeWithLoveTitle => 'Bi ❤️ ve hatî çêkirin';

  @override
  String get noMusicFilesFound => 'Bê muzîk';

  @override
  String get noArtistsFound => 'No hunermend';

  @override
  String get noAlbumsFound => 'Albûm tune';

  @override
  String get unknownSong => 'Strana nenas';

  @override
  String get unknownArtist => 'Hunermendê nenas';

  @override
  String get unknownAlbum => 'Albumek nenas';

  @override
  String get unknownGenre => 'Şanoya naskirî';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Li';

  @override
  String get tileValueOff => 'Ji';

  @override
  String get commonOfText => 'ji';

  @override
  String get pageNotFoundText => 'Rûpela dayîn nehat dîtin';

  @override
  String get commonErrorText => 'Şaşî';

  @override
  String get retryButtonText => 'Xweberbawer';

  @override
  String get filePickerDialogTitle =>
      'Peldanka hilbijêrin ku ji bo muzîkê dakêşin';

  @override
  String get searchScreenTitle => 'Gerr';

  @override
  String get searchEmptyText => 'Encamên lêgerînê tune';

  @override
  String get searchResultsText => 'Encamên lêgerînê:';

  @override
  String get resultsForText => 'Encam ji bo:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Optimîzasyona batterê asteng bikin';

  @override
  String get disableBatteryOptimizationContent =>
      'Ji kerema xwe ji bo vê sepanê di mîhengên cîhazê de optimîzasyona batterê nekişînin da ku destûrê bide lîstika paşîn a muzîkê.';

  @override
  String get languageScreenTitle => 'Ziman';

  @override
  String get silverDeviceColor => 'Zîv';

  @override
  String get blackDeviceColor => 'Reş';

  @override
  String get resetSettingsTitle => 'Mîhengên Reset';

  @override
  String get browseArtist => 'Hunermendê Browse';

  @override
  String get browseAlbum => 'Albumê Browse';

  @override
  String get cancelText => 'Bişûndekirin';

  @override
  String get playlistsScreenTitle => 'Lîstikên lîsteyan';

  @override
  String get addToOnTheGoPlaylist => 'Li ser-go zêde bikin';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Album li ser-the-go zêde bikin';

  @override
  String get removeSongFromThePlaylist => 'Ji lîstika lîstikê dûr bikin';

  @override
  String get allAlbums => 'Hemû Album';

  @override
  String get scanningMusicFiles => 'Pelên muzîkê şehît kirin';

  @override
  String get newPlaylist => 'Lîsteya nû ya nû';

  @override
  String get savePlaylist => 'Playlist hilînin';

  @override
  String get clearPlaylist => 'Playlist zelal';

  @override
  String get rescanMusicFilesSettingTitle => 'Pelên muzîkê yên razdar';

  @override
  String get deviceControlMenuTutorialText =>
      'Thumbê xwe bi rengek sivik li dora pêlika klîk hilînin da ku menu veguherînin';

  @override
  String get centerButtonMenuTutorialText =>
      'Bişkojka navendê bitikîne da ku tiştê menuya balkêş hilbijêrin';

  @override
  String get playPauseMenuTutorialText =>
      'Vê bişkojka çap bikin da ku stranek bilîzin an bisekinin';

  @override
  String get nextButtonMenuTutorialText =>
      'Vê bişkojka bitikînin da ku ji strana duyemîn re bişopînin';

  @override
  String get previousButtonMenuTutorialText =>
      'Vê bişkojka çap bikin da ku ji nû ve bişopînin an vegerin strana berê';

  @override
  String get menuButtonTutorialText =>
      'Vê bişkojka çap bikin da ku vegerin menuya berê. Hûn dikarin ji her ekranek din ve bikin û bigirin ku rasterast biçin menuya sereke.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ev ekrana ekranê ye. Dîmendera ekranê û moda dîmendera parçebûyî ji hêla xwerû ve têne çalak kirin û dikarin di mîhengan de bêtir werin mîheng kirin.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tiliya xwe li dora wheel bikirtînin da ku qumarê veke';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Bişkojka navendê bitikîne ku bi riya baranê vegerin, barika scrubber û şilika shuffle. Bişkojka navendê bigire û bigire da ku vebijarkên zêde bigihîje.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Vê bişkojka bikişînin û bisekinin ku stranê zûtir bikin';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Vebijêrin û vê bişkojka bigire da ku stranê bişîne';

  @override
  String get deviceControlSearchTutorialText =>
      'Tiliya xwe bi rengek sivik li dora pêlika klîk hilînin da ku alfabeyek ronî bikin';

  @override
  String get centerButtonSearchTutorialText =>
      'Bişkojka navendê bitikîne da ku alfabeya balkêş hilbijêrin';

  @override
  String get nextButtonSearchTutorialText =>
      'Vê bişkojka çap bikin da ku cîhek zêde bikin';

  @override
  String get previousButtonSearchTutorialText =>
      'Vê bişkojka çap bikin da ku karaktera paşîn jêbirin';

  @override
  String get menuButtonSearchTutorialText =>
      'Vê bişkojka bitikînin da ku klavyeyê bigire û bi encamên lêgerînê re têkilî daynin';
}
