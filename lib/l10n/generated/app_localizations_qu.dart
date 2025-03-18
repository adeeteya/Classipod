// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Quechua (`qu`).
class AppLocalizationsQu extends AppLocalizations {
  AppLocalizationsQu([String locale = 'qu']) : super(locale);

  @override
  String get appTitle => 'Classipite .';

  @override
  String get menuButtonText => 'Menú .';

  @override
  String get audioAccessPermissionTitle => 'Audio Yaykuna Permisota mañasqa .';

  @override
  String get audioAccessPermissionContent =>
      'Ama hina kaspa, uyarinapaq archivokuna yaykuyta quy, takiy archivoykikunata tocanaykupaq.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Yaykuna Permiso negasqa .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ama hina kaspa, kay apppaq uyarina archivokuna yaykuyta quy dispositivo churanakunapi takiy archivokunayki tocayta atisqaykumanta.';

  @override
  String get menuScreenTitle => 'Menú .';

  @override
  String get musicMenuScreenTitle => 'Taki';

  @override
  String get nowPlayingScreenTitle => 'Kunanqa pukllaspa .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle takikuna .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Ajustes .';

  @override
  String get aboutScreenTitle => 'imamanta .';

  @override
  String get coverFlowScreenTitle => 'Flujo de tapa .';

  @override
  String get artistsScreenTitle => 'Artistas .';

  @override
  String get albumsScreenTitle => 'Álbumes .';

  @override
  String get songsScreenTitle => 'Takikuna .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString takikuna',
      one: '1 taki',
      zero: 'mana takikuna',
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
      other: '$countString álbum',
      one: '1 álbum',
      zero: 'mana álbumkuna',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Géneros .';

  @override
  String get genreSongsScreenTitle => 'Género takikuna .';

  @override
  String get deviceColorSettingTitle => 'Dispositivo color .';

  @override
  String get touchScreenSettingTitle => 'Pantalla llachpana atichisqa .';

  @override
  String get repeatModeSettingTitle => 'Kutipay';

  @override
  String get repeatModeOne => 'Huk';

  @override
  String get repeatModeAll => 'Llapan';

  @override
  String get vibrateSettingTitle => 'Vibrado .';

  @override
  String get clickWheelSettingTitle => 'Rueda t\'uqyaykuna ñit\'iy .';

  @override
  String get splitScreenSettingTitle => 'Modo de pantalla rakisqa .';

  @override
  String get touchSoundsDialogTitle => 'T\'uqyaykuna llamiy .';

  @override
  String get touchSoundsDialogContent =>
      'Ama hina kaspa, sistemapa churayninkunamanta llachpay uyarinakunata atichiy, ñit\'iy rueda t\'uqyaykunata uyarinaykipaq .';

  @override
  String get immersiveModeSettingTitle => 'Modo inmerso .';

  @override
  String get showAppTutorialSettingTitle => 'Yachachiyta rikuchiy .';

  @override
  String get changeDirectorySettingTitle => 'Directoriota tikray .';

  @override
  String get donateSettingTitle => 'Quy';

  @override
  String get donateSettingDescription =>
      'Sichus kay app gustanki chayqa, ama hina kaspa qhawariy qoyta.';

  @override
  String get versionAboutScreenTitle => 'Ima niraq';

  @override
  String get madeWithLoveTitle => '❤️ nisqawan ruwasqa .';

  @override
  String get noMusicFilesFound => 'Mana Musiku .';

  @override
  String get noArtistsFound => 'Mana artistakuna .';

  @override
  String get noAlbumsFound => 'Mana álbumkuna .';

  @override
  String get unknownSong => 'Mana riqsisqa taki .';

  @override
  String get unknownArtist => 'Mana riqsisqa artista .';

  @override
  String get unknownAlbum => 'Mana riqsisqa álbum .';

  @override
  String get unknownGenre => 'Mana riqsisqa género .';

  @override
  String get buttonConfirmText => 'KUSA';

  @override
  String get tileValueOn => 'on .';

  @override
  String get tileValueOff => 'Wañuchisqa';

  @override
  String get commonOfText => 'de .';

  @override
  String get pageNotFoundText =>
      'Chay qusqa p\'anqaqa manam tarisqachu karqan .';

  @override
  String get commonErrorText => 'Pantay';

  @override
  String get retryButtonText => 'Retry .';

  @override
  String get filePickerDialogTitle =>
      'Musikuta escaneanapaq huk directoriota akllay .';

  @override
  String get searchScreenTitle => 'Maskay';

  @override
  String get searchEmptyText => 'Mana maskaypa taripayninkuna .';

  @override
  String get searchResultsText => 'Maskanapaq taripaykuna:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Pilakuna allinchayta mana llamk\'achiy .';

  @override
  String get disableBatteryOptimizationContent =>
      'Ama hina kaspa, kay apppaq pila allinchayta dispositivo churaykunapi mana llamk\'achiy, takiypa qhipa takiyninta saqinanpaq.';

  @override
  String get languageScreenTitle => 'Simi';

  @override
  String get silverDeviceColor => 'Qullqi';

  @override
  String get blackDeviceColor => 'Yana';

  @override
  String get resetSettingsTitle => 'Ajustes kaqmanta churay .';

  @override
  String get browseArtist => 'Artista de navegación .';

  @override
  String get browseAlbum => 'Álbum de navegación .';

  @override
  String get cancelText => 'Sayachiy';

  @override
  String get playlistsScreenTitle => 'Listas de reproducción .';

  @override
  String get addToOnTheGoPlaylist => 'on-the-go nisqaman yapay .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Añadir álbum en el on-the-go .';

  @override
  String get removeSongFromThePlaylist => 'Pukllay listamanta hurquy .';

  @override
  String get allAlbums => 'Tukuy álbumkuna .';

  @override
  String get scanningMusicFiles => 'Musiku willañiqikunata qhaway .';

  @override
  String get newPlaylist => 'Musuq pukllay lista .';

  @override
  String get savePlaylist => 'Waqaychay Lista de reproducción .';

  @override
  String get clearPlaylist => 'Sut\'i Lista de reproducción .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Musiku Archivokuna .';

  @override
  String get deviceControlMenuTutorialText =>
      'Rueda de clic nisqapi hatun makiykita llampullata kuyuchiy menú nisqapi purinaykipaq .';

  @override
  String get centerButtonMenuTutorialText =>
      'Chawpi kaq botonta ñit\'iy Resaltado nisqa menú nisqapi akllanaykipaq .';

  @override
  String get playPauseMenuTutorialText =>
      'Kay botonta ñit’iy huk takiyta tocanaykipaq otaq samarinaykipaq .';

  @override
  String get nextButtonMenuTutorialText =>
      'Kay ñit\'inata ñit\'iy qatiq takiman saltanaykipaq .';

  @override
  String get previousButtonMenuTutorialText =>
      'Kay ñit\'inata ñit\'iy kutiy kutinaykipaq icha ñawpaq takiman kutinaykipaq .';

  @override
  String get menuButtonTutorialText =>
      'Kay ñit’inata ñit’iy ñawpaq menú nisqaman kutinaykipaq. Huk pantallamanta ñit\'iy chaymanta hap\'iy atikunki chiqamanta menú principal kaqman riyta.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Kayqa pantalla qhawaymi. Pantalla ñit\'iy chaymanta pantalla rakisqa modo kaqmanta atichisqa kanku ñawpaqmanta chaymanta aswan ruwanakuna ruwaypi ruwasqa kanku.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Rueda de clic nisqapi hatun makiykita kuyuchiy volumen nisqa allinchanaykipaq .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Chawpi boton ñit’iy bicicletapi purinaykipaq Seek Bar, Scrubber Bar chaymanta Shuffle Slider kaqnintakama. Chawpi kaq botonta ñit’iy hinaspa hap’iy huk akllanakunaman haykunapaq.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Kay botonta ñit\'ispa hap\'iy takita usqhaylla ñawpaqman purichinaykipaq .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Kay ñit\'inata ñit\'ispa hap\'iy takiyta kutinanpaq .';

  @override
  String get deviceControlSearchTutorialText =>
      'Rueda de clic nisqapi hatun makiykita llampullata kuyuchiy huk alfabetota resaltanaykipaq .';

  @override
  String get centerButtonSearchTutorialText =>
      'Chawpi kaq botonta ñit’iy resaltasqa alfabetota akllanaykipaq .';

  @override
  String get nextButtonSearchTutorialText =>
      'Kay ñit\'inata ñit\'iy huk espaciota yapanaykipaq .';

  @override
  String get previousButtonSearchTutorialText =>
      'Kay ñit\'inata ñit\'iy qhipa kaq qillqata qulluchinaykipaq .';

  @override
  String get menuButtonSearchTutorialText =>
      'Kay ñit\'inata ñit\'iy teclado wichq\'anapaq chaymanta maskana ruwaykunawan tinkiy .';

  @override
  String get allSongs => 'Tukuy takikuna .';
}
