// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Buriat (`bua`).
class AppLocalizationsBua extends AppLocalizations {
  AppLocalizationsBua([String locale = 'bua']) : super(locale);

  @override
  String get appTitle => 'КлассикПод';

  @override
  String get menuButtonText => 'МЕНУ';

  @override
  String get audioAccessPermissionTitle => 'Аудио нэбтэрхэ эрхэ хэрэгтэй';

  @override
  String get audioAccessPermissionContent =>
      'Хүгжэмэй файлнуудаа наадаха эрхэ олгохо аудио файлнуудта нэбтэрхэ эрхэ олгогты.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Аудио нэбтэрэлгын зүбшөөрэл үгы болгобо';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Хүгжэмэй файлнуудаа наадаха боломжо олгохын тулада энэ апп-да энэ апп-да аудио файлнуудые нэбтэрүүлхэ хэрэгтэй.';

  @override
  String get menuScreenTitle => 'Меню';

  @override
  String get musicMenuScreenTitle => 'Хүгжэм';

  @override
  String get nowPlayingScreenTitle => 'Мүнөө наадаха';

  @override
  String get shuffleSongsMenuTitle => 'Шуффл дуунууд';

  @override
  String get shuffleSettingTitle => 'Заяаха';

  @override
  String get settingsScreenTitle => 'Настройко';

  @override
  String get aboutScreenTitle => 'Тухай';

  @override
  String get coverFlowScreenTitle => 'Хабтагай';

  @override
  String get artistsScreenTitle => 'Уран зураашад';

  @override
  String get albumsScreenTitle => 'Альбумс';

  @override
  String get songsScreenTitle => 'Дуунууд';

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
  String get genresScreenTitle => 'Жанр';

  @override
  String get genreSongsScreenTitle => 'Жанр дуунууд';

  @override
  String get deviceColorSettingTitle => 'Түхеэрэлгэ үнгэ';

  @override
  String get touchScreenSettingTitle =>
      'Дэлгэстэ хүртэхэ арга боломжотой болгохо';

  @override
  String get repeatModeSettingTitle => 'Дабтаха';

  @override
  String get repeatModeOne => 'Нэгэн';

  @override
  String get repeatModeAll => 'Бүхы';

  @override
  String get vibrateSettingTitle => 'һэдэлгэ';

  @override
  String get clickWheelSettingTitle =>
      'Түхэреэн абяанууд дээрэ дараха хэрэгтэй.';

  @override
  String get splitScreenSettingTitle => 'Хубилгаха дэлгэсэй горим';

  @override
  String get touchSoundsDialogTitle => 'Абяан .';

  @override
  String get touchSoundsDialogContent =>
      'Системнэ тохиргоонуудһаа Touch Sounds Enable Sounds Enable Sounds -ые шагнажа, кликэй хүрдэтэй абяануудые шагнаха';

  @override
  String get immersiveModeSettingTitle => 'Иммеривнэ горим';

  @override
  String get showAppTutorialSettingTitle => 'Заабари .';

  @override
  String get changeDirectorySettingTitle => 'Хубилалтануудай сан';

  @override
  String get donateSettingTitle => 'Мүнгэ үгэхэ';

  @override
  String get donateSettingDescription =>
      'Энэ апп-да һайшаагдаа һаань, хандиб үргэхэ тухай бодожо үзыт.';

  @override
  String get versionAboutScreenTitle => 'Нэгэ илгаань';

  @override
  String get madeWithLoveTitle => '❤️-ээр бүтээгдэһэн';

  @override
  String get noMusicFilesFound => 'Хүгжэм үгы';

  @override
  String get noArtistsFound => 'Уран зураашад үгы';

  @override
  String get noAlbumsFound => 'Үгы Альбумууд';

  @override
  String get unknownSong => 'Мэдэхэгүй дуун';

  @override
  String get unknownArtist => 'Мэдэгдэхэгүй уран зурааша';

  @override
  String get unknownAlbum => 'Мэдэгдэхэгүй Альбум';

  @override
  String get unknownGenre => 'Мэдэгдэхэгүй Жанр';

  @override
  String get buttonConfirmText => 'ЗА';

  @override
  String get tileValueOn => 'Дээрэ';

  @override
  String get tileValueOff => 'Унтарһан';

  @override
  String get commonOfText => 'орохо';

  @override
  String get pageNotFoundText => 'Үгтэһэн хуудаһан олдоогүй .';

  @override
  String get commonErrorText => 'Алдуу';

  @override
  String get retryButtonText => 'Дахин туршаха';

  @override
  String get filePickerDialogTitle => 'Хүгжэмэй түлөө сканерлэхэ сан шэлэхэ';

  @override
  String get searchScreenTitle => 'Бэдэрэлгэ';

  @override
  String get searchEmptyText => 'Бэдэрэлгын дүнгүүд үгы';

  @override
  String get searchResultsText => 'Бэдэрэлгын дүнгүүд:';

  @override
  String get resultsForText => 'Дүн гаргалга:';

  @override
  String get disableBatteryOptimizationTitle => 'Батарейка оновчтой болгохогүй';

  @override
  String get disableBatteryOptimizationContent =>
      'Хүгжэмэй арын тоглолто хэхэ боломжо олгохын тулада энэ апп-да батарейн оновчтой болгохо арга унтараагты.';

  @override
  String get languageScreenTitle => 'Хэлэн';

  @override
  String get silverDeviceColor => 'Мүнгэн';

  @override
  String get blackDeviceColor => 'Хара';

  @override
  String get resetSettingsTitle => 'Настройкануудые һэргээхэ';

  @override
  String get browseArtist => 'Уран зурааша харахын';

  @override
  String get browseAlbum => 'Албумые хараад үзыт';

  @override
  String get cancelText => 'Болюулга';

  @override
  String get playlistsScreenTitle => 'Наадагшад';

  @override
  String get addToOnTheGoPlaylist => 'Он-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Он-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Плейлистһээ зайлаха';

  @override
  String get allAlbums => 'Бүхы Альбумууд';

  @override
  String get scanningMusicFiles => 'Хүгжэмэй файлнууд';

  @override
  String get newPlaylist => 'Шэнэ плейлист';

  @override
  String get savePlaylist => 'Нааданай жагсаалтые хэмнэхэ';

  @override
  String get clearPlaylist => 'Тодорхой плейлист';

  @override
  String get rescanMusicFilesSettingTitle => 'Ресканай хүгжэмэй файлууд';

  @override
  String get deviceControlMenuTutorialText =>
      'Меню руу орохогүйн тула эрхиеэ дарахадаа, өөрынгөө эрхиеэ хүнгэнөөр хүдэлгэхэ';

  @override
  String get centerButtonMenuTutorialText =>
      'Түбэй тобшо даража, онсолһон менюин зүйл шэлэхэ .';

  @override
  String get playPauseMenuTutorialText =>
      'Энэ тобшо даража наадаха гү, али дуу зогсогты .';

  @override
  String get nextButtonMenuTutorialText =>
      'Энэ тобшо даража, удаадахи дуунда алгасаха .';

  @override
  String get previousButtonMenuTutorialText =>
      'Энэ тобшо даража, һөөргөө бусаха гү, али урданай дуунда бусаха';

  @override
  String get menuButtonTutorialText =>
      'Энэ тобшо даража, урданай меню руу бусаха. Гол меню руу шууд орохын тулада бусад ямаршье дэлгэсһээ даража, барижа болохо.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Энэ хадаа дэлгэсэй дэлгэс болоно. Touch Screen болон Split Screen Mode стандартаар нээгдэжэ, тохиргоонуудта саашаа тохируулжа болоно.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Дуунай хэмжээе тааруулхадаа, өөрынгөө эрхие дараха Түхэреэн тойруулан хүдэлгэхэ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Түбэй тобшо даража, бэдэрэлгын зурлаа, скруббер бар болон шуффель гулдирмагаар велосипедээр ябаха. Нэмэлтэ опцинуудта орохын тула Түбэй тобшо даража, барижа байгты.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Энэ тобшо даража, дуугаа түргэн урагшань ябуулжа байгты';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Энэ тобшо даража, дуугаа бусааха .';

  @override
  String get deviceControlSearchTutorialText =>
      'Өөрынгөө эрхиеэ хүнгэнөөр даража, алфавид онсолхын тула алфавит онсолон тэмдэглэхэ .';

  @override
  String get centerButtonSearchTutorialText =>
      'Түбэй тобшо даража, онсолһон үзэг шэлэхэ .';

  @override
  String get nextButtonSearchTutorialText => 'Энэ тобшо даража, зай нэмэхэ .';

  @override
  String get previousButtonSearchTutorialText =>
      'Энэ тобшо даража, һүүлшын дүрэ усадхаха .';

  @override
  String get menuButtonSearchTutorialText =>
      'Энэ тобшо даража, гар бэшэгые хаажа, хайлтын дүнгүүдтэй харилсаха';
}
