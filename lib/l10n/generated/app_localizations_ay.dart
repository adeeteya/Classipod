// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Aymara (`ay`).
class AppLocalizationsAy extends AppLocalizations {
  AppLocalizationsAy([String locale = 'ay']) : super(locale);

  @override
  String get appTitle => 'Classipod ukax 1.1.';

  @override
  String get menuButtonText => 'Menú ukax 1.1.';

  @override
  String get audioAccessPermissionTitle =>
      'Audio ukar mantañ permiso ukax wakisiwa .';

  @override
  String get audioAccessPermissionContent =>
      'Ukhamaraki, audio archivonakax mantañapatakiw yanapt’añama, ukhamat musica archivonakam phust’añapataki.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Acceso Permiso ukax jan iyawsatawa .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Aka app ukatakix audio archivonakax dispositivo ukan utt’ayat ukar mantañapatakiw churañama, ukhamat musica archivonakam phust’añataki.';

  @override
  String get menuScreenTitle => 'Menú ukax 1.1.';

  @override
  String get musicMenuScreenTitle => 'Jaylliwi';

  @override
  String get nowPlayingScreenTitle => 'Jichhajj anattʼañajj walikïskiwa .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle sat qʼochunaka .';

  @override
  String get shuffleSettingTitle => 'Ukax mä juk’a pachanakanwa.';

  @override
  String get settingsScreenTitle => 'Ukaxa utt’ayatawa.';

  @override
  String get aboutScreenTitle => 'Ukxata';

  @override
  String get coverFlowScreenTitle => 'Tapa Flow ukax 1.1.';

  @override
  String get artistsScreenTitle => 'Artistas ukanakax .';

  @override
  String get albumsScreenTitle => 'Álbumes ukanakax .';

  @override
  String get songsScreenTitle => 'Qʼochunaka .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString q’uchunaka',
      one: '1 jaylli',
      zero: 'janiw q’uchunakax utjkiti',
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
      other: '$countString álbumanak uñt’ayañataki',
      one: '1 álbum',
      zero: 'janiw kuna álbums ukanakas utjkiti',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Géneros ukanakax .';

  @override
  String get genreSongsScreenTitle => 'Género sat qʼochunaka .';

  @override
  String get deviceColorSettingTitle => 'dispositivo color .';

  @override
  String get touchScreenSettingTitle => 'Pantalla táctil ukax ch’amanchatawa .';

  @override
  String get repeatModeSettingTitle => 'Ripitiña';

  @override
  String get repeatModeOne => 'Maya';

  @override
  String get repeatModeAll => 'Taqini';

  @override
  String get vibrateSettingTitle => 'Vibrate .';

  @override
  String get clickWheelSettingTitle => 'Ukax Rueda satawa.';

  @override
  String get splitScreenSettingTitle => 'Pantalla jaljaña modalidad .';

  @override
  String get touchSoundsDialogTitle => 'Ukax sañ muniwa.';

  @override
  String get touchSoundsDialogContent =>
      'Ukhamaraki, sistema ukan utt’ayatanakapat llamkt’añ sonidonak ch’amanchañamawa, ukhamat clic rueda sonidos ist’añataki .';

  @override
  String get immersiveModeSettingTitle => 'Modo inmerso ukaxa 1.1.';

  @override
  String get showAppTutorialSettingTitle => 'Uñacht’ayaña yatichawi .';

  @override
  String get changeDirectorySettingTitle => 'Mayjt’ayaña Directorio .';

  @override
  String get donateSettingTitle => 'Khuyapayaña';

  @override
  String get donateSettingDescription =>
      'Jumatix aka app ukar munassta ukhax, churañ amtañamawa.';

  @override
  String get versionAboutScreenTitle => 'Wirsyuna';

  @override
  String get madeWithLoveTitle => '❤️ ukampiw lurata .';

  @override
  String get noMusicFilesFound => 'Janiw musicax utjkiti .';

  @override
  String get noArtistsFound => 'Janiw artistanakax utjkiti .';

  @override
  String get noAlbumsFound => 'Janiw kuna álbumanaksa .';

  @override
  String get unknownSong => 'Jan uñtʼat qʼochu .';

  @override
  String get unknownArtist => 'Jan uñt’at artista .';

  @override
  String get unknownAlbum => 'Jan uñt’at álbum .';

  @override
  String get unknownGenre => 'Jan uñt’at género .';

  @override
  String get buttonConfirmText => 'WALIKI';

  @override
  String get tileValueOn => 'Ukana';

  @override
  String get tileValueOff => 'Jiwata';

  @override
  String get commonOfText => 'ta';

  @override
  String get pageNotFoundText => 'Uka churat pankajj janiw jikjjataskänti .';

  @override
  String get commonErrorText => 'Pantja';

  @override
  String get retryButtonText => 'Ukax wasitat yant’atawa.';

  @override
  String get filePickerDialogTitle =>
      'Mä directorio ajlliñamawa, ukhamat musicanak escanear .';

  @override
  String get searchScreenTitle => 'Thaqhata';

  @override
  String get searchEmptyText => 'Janiw kunas thaqhañax utjkiti .';

  @override
  String get searchResultsText => 'Ukax akham sañ muni:';

  @override
  String get resultsForText => 'Ukax akham sañ muni:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batería ukan optimización ukar jan ch’amanchaña .';

  @override
  String get disableBatteryOptimizationContent =>
      'Ukhamaraki, aka app ukatakix pilas optimización ukax dispositivo ukan configuración ukanx janiw utjkiti, ukhamat musica ukan qhipa uñtawipar jaysañataki.';

  @override
  String get languageScreenTitle => 'Aru';

  @override
  String get silverDeviceColor => 'Qullqi';

  @override
  String get blackDeviceColor => 'Ch\'iyara';

  @override
  String get resetSettingsTitle => 'Reset Configuración ukax 1.1.';

  @override
  String get browseArtist => 'Uñakipt’añataki Artista .';

  @override
  String get browseAlbum => 'Uñakipt’añatakix álbum uñakipt’aña .';

  @override
  String get cancelText => 'Kansilaña';

  @override
  String get playlistsScreenTitle => 'Ukax mä jach’a uñacht’äwiwa.';

  @override
  String get addToOnTheGoPlaylist => 'Ukax on-the-go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ukax on-the-go ukar yapxatatawa .';

  @override
  String get removeSongFromThePlaylist =>
      'Ukax mä lista de reproducción ukankiwa .';

  @override
  String get allAlbums => 'Taqi álbumanak .';

  @override
  String get scanningMusicFiles => 'Scanning Music Archivonaka .';

  @override
  String get newPlaylist => 'Machaq Lista de reproducción .';

  @override
  String get savePlaylist => 'Ukax mä lista de reproducción ukaniwa.';

  @override
  String get clearPlaylist => 'Qhanañchtʼat lista .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Archivonaka .';

  @override
  String get deviceControlMenuTutorialText =>
      'Uka ampar lukʼanamxa mä jukʼa muytʼañamawa, ukhamatwa menú ukar sarañama .';

  @override
  String get centerButtonMenuTutorialText =>
      'Uka chiqaru ch’iqt’aña, ukhamata Menú resaltado uka chimpu ajlliña .';

  @override
  String get playPauseMenuTutorialText =>
      'Aka botón ukar ch’iqt’am mä q’uchu phust’añataki jan ukax samart’ayañataki .';

  @override
  String get nextButtonMenuTutorialText =>
      'Aka botón ukar ch’iqt’am jutir q’uchur jaytañataki .';

  @override
  String get previousButtonMenuTutorialText =>
      'Aka botón ukar ch’iqt’am rebobinar jan ukax nayrïr q’uchur kutt’añataki .';

  @override
  String get menuButtonTutorialText =>
      'Aka botón ukar ch’iqt’aña, nayrïr menú ukar kutt’añataki. Ukhamaraki, yaqha pantallanakatxa ch’allt’asmawa ukatxa chiqapa menú principal ukar sarasma.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Akax pantalla uñacht’ayañawa. Pantalla táctil ukatxa pantalla split ukaxa ch’amanchatawa default ukampi ukatxa juk’ampi configurar ukhamawa configuración ukanxa.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Uka ampar lukʼanamxa, volúmenes ukar chiqañchañatakix ampar lukʼanamwa muytayañama .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Uka chika taypinkir botón ukar ch’iqt’aña, Barra de Seek, barra de fregado ukat deslizador de barate ukanakampiw ciclo ukar ch’iqt’añama. Yaqha amtanakar mantañatakix chika taypinkir botón ukar ch’iqt’añamawa.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Aka botón ukar ch’iqt’aña ukat katxaruña rápida del canción .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Aka botón ukar ch’iqt’aña ukat katxaruña .';

  @override
  String get deviceControlSearchTutorialText =>
      'Mä alfabeto uñacht’ayañatakix clic rueda ukar mä juk’a muytayañamawa .';

  @override
  String get centerButtonSearchTutorialText =>
      'Chika taypinkir botón ukar ch’iqt’asaw alfabeto resaltado ukar ch’iqt’añama .';

  @override
  String get nextButtonSearchTutorialText =>
      'Aka botón ukar ch’iqt’aña mä chiqaru yapxatañataki .';

  @override
  String get previousButtonSearchTutorialText =>
      'Aka botón ukar ch’iqt’aña qhipa chimpu chhaqtayañataki .';

  @override
  String get menuButtonSearchTutorialText =>
      'Aka botón ukar ch’iqt’aña teclado jist’antañataki ukat thakhinchawimp chikt’ata .';

  @override
  String get allSongs => 'Taqi q\'uchunaka .';
}
