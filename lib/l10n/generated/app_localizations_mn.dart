// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get appTitle => 'Хамр бүл';

  @override
  String get menuButtonText => 'Хоолны нэрс';

  @override
  String get audioAccessPermissionTitle =>
      'Аудио нэвтрэх зөвшөөрөл шаардлагатай байна';

  @override
  String get audioAccessPermissionContent =>
      'Хөгжмийн файлуудаа тоглох боломжийг олгохын тулд аудио файлууд нэвтрэх боломжтой.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Аудио нэвтрэх зөвшөөрөл татгалзсан';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Төхөөрөмжийн тохиргоонд нэвтрэхэд аудио файлд хандах боломжтой.';

  @override
  String get menuScreenTitle => 'Хоолны нэрс';

  @override
  String get musicMenuScreenTitle => 'Хөгжим';

  @override
  String get nowPlayingScreenTitle => 'Одоо тоглож байгаа';

  @override
  String get shuffleSongsMenuTitle => 'Дуу';

  @override
  String get shuffleSettingTitle => 'Зөөлөх';

  @override
  String get settingsScreenTitle => 'Тохиргоо';

  @override
  String get aboutScreenTitle => 'Тухай';

  @override
  String get coverFlowScreenTitle => 'Бамарийн урсгал';

  @override
  String get artistsScreenTitle => 'Зурдарлагчид';

  @override
  String get albumsScreenTitle => 'Цергийн цөгий';

  @override
  String get songsScreenTitle => 'Дуу';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Дуунууд',
      one: '1 Дуу',
      zero: 'Дуу байхгүй',
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
      other: '$countString Цомгууд',
      one: '1 Цомог',
      zero: 'Цомог байхгүй',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Сарны эзэн';

  @override
  String get genreSongsScreenTitle => 'Жанрын дуунууд';

  @override
  String get deviceColorSettingTitle => 'Тотын өнгө';

  @override
  String get touchScreenSettingTitle => 'Гарын дэлгэц идэвхжсэн';

  @override
  String get repeatModeSettingTitle => 'Давтах';

  @override
  String get repeatModeOne => 'Нэг';

  @override
  String get repeatModeAll => 'Бүгд';

  @override
  String get vibrateSettingTitle => 'Доргих';

  @override
  String get clickWheelSettingTitle => 'Дугуйны дууг товшино уу';

  @override
  String get splitScreenSettingTitle => 'Дэлгэцийн горимыг хуваах';

  @override
  String get touchSoundsDialogTitle => 'Хүрэхийнх';

  @override
  String get touchSoundsDialogContent =>
      'Системийн тохиргооноос SEAL SELESTS-ээс SEARD SELDINGS-ийг идэвхжүүлнэ үү';

  @override
  String get immersiveModeSettingTitle => 'Дүрсний горим';

  @override
  String get showAppTutorialSettingTitle => 'Зааварчилга';

  @override
  String get changeDirectorySettingTitle => 'Лангет өөрчлөх';

  @override
  String get donateSettingTitle => 'Бэлэглэх';

  @override
  String get donateSettingDescription =>
      'Хэрэв танд энэ апп таалагдаж байвал хандив өгөхийг анхаарна уу.';

  @override
  String get versionAboutScreenTitle => 'Таамаглал';

  @override
  String get madeWithLoveTitle => '❤️-ээр хийсэн';

  @override
  String get noMusicFilesFound => 'Хөгжим гэж';

  @override
  String get noArtistsFound => 'Зураач байхгүй';

  @override
  String get noAlbumsFound => 'Цомог байхгүй';

  @override
  String get unknownSong => 'Үл боломжгүй дуу';

  @override
  String get unknownArtist => 'Мэдэгдэх зураач';

  @override
  String get unknownAlbum => 'Үл мэдэгдэх цомог';

  @override
  String get unknownGenre => 'Үл мэдэгдэх төрөл';

  @override
  String get buttonConfirmText => 'Бас';

  @override
  String get tileValueOn => '-Тухай';

  @override
  String get tileValueOff => 'Унтраах';

  @override
  String get commonOfText => '-оор / -өөр';

  @override
  String get pageNotFoundText => 'Өгөгдсөн хуудсыг олдсонгүй';

  @override
  String get commonErrorText => 'Алдаа';

  @override
  String get retryButtonText => 'Уилах';

  @override
  String get filePickerDialogTitle =>
      'Хөгжимд сканнердах директорыг сонгоно уу';

  @override
  String get searchScreenTitle => 'Эрэл хайгуул хийх';

  @override
  String get searchEmptyText => 'Хайлтын үр дүн байхгүй байна';

  @override
  String get searchResultsText => 'Хайлтын үр дүн:';

  @override
  String get resultsForText => 'Үр дүн:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Батерейны оновчлолыг идэвхгүй болгох';

  @override
  String get disableBatteryOptimizationContent =>
      'Энэ програмын тохиргоог ашиглан энэ апп-ыг ашиглан хөгжмийн тоглолтыг ашиглахыг зөвшөөрнө үү.';

  @override
  String get languageScreenTitle => 'Хэл';

  @override
  String get silverDeviceColor => 'Мөнгө';

  @override
  String get blackDeviceColor => 'Хар';

  @override
  String get resetSettingsTitle => 'Тохиргоог дахин тохируулах';

  @override
  String get browseArtist => 'Уран бүтээлчийг үзэх';

  @override
  String get browseAlbum => 'Цомгоо үзэх';

  @override
  String get cancelText => 'Цуаах';

  @override
  String get playlistsScreenTitle => 'Тоглуулагчуудын хавтас';

  @override
  String get addToOnTheGoPlaylist => 'Дээр нэмэх';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Обумыг үүн дээрээс нааж';

  @override
  String get removeSongFromThePlaylist => 'Тоглуулах жагсаалтаас хасах';

  @override
  String get allAlbums => 'Бүх цомог';

  @override
  String get scanningMusicFiles => 'Хөгжмийн файл сканнердах';

  @override
  String get newPlaylist => 'Шинэ тоглуулагч';

  @override
  String get savePlaylist => 'Тоглуулах жагсаалтыг хадгалах';

  @override
  String get clearPlaylist => 'Тоглуулах жагсаалт';

  @override
  String get rescanMusicFilesSettingTitle => 'Хөгжмийн файлуудыг сэргээх';

  @override
  String get deviceControlMenuTutorialText =>
      'Цэсийг чиглүүлэхийн тулд товшиж эрхий хуруугаа нүүж ав';

  @override
  String get centerButtonMenuTutorialText => 'Тодруулсан цэсийг сонгоно уу';

  @override
  String get playPauseMenuTutorialText =>
      'Дууг тоглох эсвэл түр зогсоохын тулд энэ товчийг дарна уу';

  @override
  String get nextButtonMenuTutorialText =>
      'Дараагийн дуу руу шилжихийн тулд энэ товчийг дарна уу';

  @override
  String get previousButtonMenuTutorialText =>
      'Энэ товчийг дарж, өмнөх дуу руу буцах эсвэл буцах';

  @override
  String get menuButtonTutorialText =>
      'Өмнөх цэс рүү буцахын тулд энэ товчийг дарна уу. Та үүнийг үндсэн цэс рүү шууд очихын тулд бусад дэлгэцээс үүнийг дарж, барьж болно.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Энэ бол дэлгэцийн дэлгэц юм. Дэлгэц, хуваах дэлгэцийн горимыг анхдагчаар тохируулж, тохиргоонд тохируулж болно.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Дууг тохируулахын тулд товшиж эрхий хуруугаа хөдөлгө';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Төвийн товчийг дарж, Scrubber Bar болон Sluffle Slider-ээр дамжуулан дугуйг дарна уу. Төвийг дараад Нэмэлт сонголтууд руу нэвтрэхийн тулд дарна уу.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Дууг хурдан дамжуулахын тулд энэ товчийг дараад барина уу';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Дууг буцаахын тулд энэ товчийг дараад барина уу';

  @override
  String get deviceControlSearchTutorialText =>
      'Цагаан толгойн тодрохын тулд эрхий хуруугаа нүүж ав';

  @override
  String get centerButtonSearchTutorialText =>
      'Тодруулсан цагаан толгойг сонгохын тулд төв товчийг дарна уу';

  @override
  String get nextButtonSearchTutorialText => 'Энэ товчийг дарна уу';

  @override
  String get previousButtonSearchTutorialText =>
      'Сүүлийн дүрийг устгахын тулд энэ товчийг дарна уу';

  @override
  String get menuButtonSearchTutorialText =>
      'Гарыг хаахын тулд энэ товчийг дараад хайлтын үр дүнтэй харилцах';

  @override
  String get allSongs => 'Бүх Дуу';
}
