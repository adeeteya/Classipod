// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nuer (`nus`).
class AppLocalizationsNus extends AppLocalizations {
  AppLocalizationsNus([String locale = 'nus']) : super(locale);

  @override
  String get appTitle => 'thok Kila̱thiöd';

  @override
  String get menuButtonText => 'MIN Wor';

  @override
  String get audioAccessPermissionTitle => 'Audio Accessces min ca gɔ̱r piny';

  @override
  String get audioAccessPermissionContent =>
      'Ɣän göörä ɣöö bä ji̱ moc jɔw kɛ ɣöö bi kɔ moc kɛ gua̱a̱th mi̱ deri lät kɛ file as music.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio kɛ ja̱l nhial kɛ nhök';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ɣän göörä ɣöö bä ji̱ moc kɛ jɔw kɛ kui̱ app ɛmɛ rɛy kuakni̱ tin ca la̱th thi̱n kɛ ɣöö biɛ kulɛ nhɔk ɛn ɣöö banɛ file-ni̱ku la̱th lät.';

  @override
  String get menuScreenTitle => 'ŋiɛ̱ny';

  @override
  String get musicMenuScreenTitle => 'Diit';

  @override
  String get nowPlayingScreenTitle => 'Täämɛ, liɛc';

  @override
  String get shuffleSongsMenuTitle => 'Sruple Song';

  @override
  String get shuffleSettingTitle => 'nyɔk';

  @override
  String get settingsScreenTitle => 'läth kä gua̱th';

  @override
  String get aboutScreenTitle => 'Kɛ kui̱ kä';

  @override
  String get coverFlowScreenTitle => 'Kä gua̱th in cieŋ ji thi̱n';

  @override
  String get artistsScreenTitle => 'käp ŋɔa̱kni';

  @override
  String get albumsScreenTitle => 'min ca nyoth';

  @override
  String get songsScreenTitle => 'ji';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Diit',
      one: '1 Dit',
      zero: 'Thiɛlɛ Diit',
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
      other: '$countString Albämni̱',
      one: '1 Albäm',
      zero: '/Thiɛlɛ Albämni̱',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Generi';

  @override
  String get genreSongsScreenTitle => 'Ga̱ŋkɛ rɔ';

  @override
  String get deviceColorSettingTitle => 'Devil Color';

  @override
  String get touchScreenSettingTitle => 'Cuɛ thɛm kɛ I̱thɛrɛnebɔlid';

  @override
  String get repeatModeSettingTitle => 'Nyɔk kɛ luɔc';

  @override
  String get repeatModeOne => 'Kɛl';

  @override
  String get repeatModeAll => 'Kɛn dia̱l';

  @override
  String get vibrateSettingTitle => 'wër kɛ ji';

  @override
  String get clickWheelSettingTitle => 'Kɔl Wi̱t Thöundni̱';

  @override
  String get splitScreenSettingTitle => 'I̱thpitt I̱thkien Mode';

  @override
  String get touchSoundsDialogTitle => 'ji';

  @override
  String get touchSoundsDialogContent =>
      'Gɔ̱ri Toch Souch Sounds kä System Settings kɛ ɣöö biɛ liŋ ɛn jɔw wi̱i̱l';

  @override
  String get immersiveModeSettingTitle => 'Ɛmdɛ raar ɛn ɣöö';

  @override
  String get showAppTutorialSettingTitle => 'nyuɔ̱k naath';

  @override
  String get changeDirectorySettingTitle => 'Gër Direc Kä';

  @override
  String get donateSettingTitle => 'Tho̱p ra̱m mi dɔŋ';

  @override
  String get donateSettingDescription =>
      'Mi nhɔki app ɛmɛ, carɛ jɛ ɛn ɣöö deri jɛ car ɛn ɣöö deri jɛ thöp.';

  @override
  String get versionAboutScreenTitle => 'Ta̱a̱ kä duɔ̱̱r mi go̱l';

  @override
  String get madeWithLoveTitle => 'Mi̱ ca gɔ̱r kɛ ‐4️ a̱ .';

  @override
  String get noMusicFilesFound => 'thuk';

  @override
  String get noArtistsFound => 'Nhɔakɛ kɛ kui̱ ji̱ Ar Ar-th thin';

  @override
  String get noAlbumsFound => '/thiɛlɛ Alumni̱';

  @override
  String get unknownSong => '/kenɛ ŋa̱c';

  @override
  String get unknownArtist => '/ka̱nɛ ŋa̱c rɛy Arti̱th mi̱ /ka̱n ŋa̱c';

  @override
  String get unknownAlbum => 'Albu̱nyä mi /ka̱n ŋa̱c.';

  @override
  String get unknownGenre => 'min kueckɛ Gener in /thiɛl ŋäc';

  @override
  String get buttonConfirmText => 'GƆ̱A̱̱';

  @override
  String get tileValueOn => 'Wi̱c';

  @override
  String get tileValueOff => 'Gäk';

  @override
  String get commonOfText => 'duŋ kä';

  @override
  String get pageNotFoundText => 'Kä wargak min ca ŋun /ka̱nɛ jek';

  @override
  String get commonErrorText => 'Duër';

  @override
  String get retryButtonText => 'gɔa̱r';

  @override
  String get filePickerDialogTitle => 'Kuɛn Directory kä Scanic kɛ kui̱ Muthik';

  @override
  String get searchScreenTitle => 'Go̱̱r kä duɔ̱r';

  @override
  String get searchEmptyText => '/Thiɛlɛ mi̱ cua guic ɛ ji̱ Rec Relts';

  @override
  String get searchResultsText => 'Gör Rethudäth:';

  @override
  String get resultsForText => 'Kä min ci̱ ben raar kɛ kui̱:';

  @override
  String get disableBatteryOptimizationTitle => 'Battery Ɣɔpti̱mai̱dhëcin';

  @override
  String get disableBatteryOptimizationContent =>
      'Ɣän la̱ŋä ji̱ i̱ di̱thpi̱ti̱ battery öpti̱mai̱dhëcin kɛ kui̱ app ɛmɛ rɛy di̱bai̱ thɛttiŋä kɛ kui̱ kä ɣöö ba bɛkgi̱rɔɔn kulɛ nhɔk ni̱ ŋar kɛ buɔ̱l.';

  @override
  String get languageScreenTitle => 'Tho̱k in rua̱c kɛ naath';

  @override
  String get silverDeviceColor => 'La̱dit mi ja̱ŋja̱ŋ';

  @override
  String get blackDeviceColor => 'Ca̱r';

  @override
  String get resetSettingsTitle => 'thok Rese Settings';

  @override
  String get browseArtist => 'Böth Arti̱th';

  @override
  String get browseAlbum => 'Böth Albu';

  @override
  String get cancelText => 'wuɔ̱c';

  @override
  String get playlistsScreenTitle => 'Plathai̱li̱thni̱';

  @override
  String get addToOnTheGoPlaylist => 'Cuɛ mat thi̱n kä On The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Cuɛ Alum yuɔr piny kä On-Go';

  @override
  String get removeSongFromThePlaylist => 'Ɛ wä nhial kä Päyli̱th .';

  @override
  String get allAlbums => 'A-ma̱mni diaal';

  @override
  String get scanningMusicFiles => 'I̱thkaniŋ Muthik Pi̱i̱li̱';

  @override
  String get newPlaylist => 'New';

  @override
  String get savePlaylist => 'Save Playl.';

  @override
  String get clearPlaylist => 'Päl Päl';

  @override
  String get rescanMusicFilesSettingTitle => 'Rekancan Muthik Pi̱i̱li̱';

  @override
  String get deviceControlMenuTutorialText =>
      'La̱tdɛ umbdu min te gekä Click Wheel kɛ ɣöö bi menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Kämni button in te däär thi̱n kɛ ɣöö biɛ kuany ɛn menu min ca la̱th thi̱n';

  @override
  String get playPauseMenuTutorialText =>
      'La̱tdɛ button ɛmɛ kɛ ɣöö biɛ ŋar kiɛ biɛ jakä gɔaa.';

  @override
  String get nextButtonMenuTutorialText =>
      'Gɔ̱ri button ɛmɛ kɛ ɣöö bi wä kä dit in dɔ̱ŋ';

  @override
  String get previousButtonMenuTutorialText =>
      'Gɔ̱ri button ɛmɛ kɛ ɣöö biɛ nyɔk kɛ loc kiɛ bi loc kä dit ëë wal';

  @override
  String get menuButtonTutorialText =>
      'Gɔ̱ri button ɛmɛ kɛ ɣöö bi loc kä menu ëë wal. Ji̱n deri̱ jɛ la̱th kä kä deri̱ jɛ la̱th kä ɛni̱ i̱thkri̱i̱n mi̱ dɔ̱ŋ mi̱ wä kä menu in di̱i̱t.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Nɛmɛ ɛ jɛn nyuuth i̱thkri̱i̱nä. Tuch Screen kɛnɛ Split Screen Mode caa kɛ kuëŋ ɛ la ti̱ caa la̱th gua̱a̱thdiɛn kä dëë kɛ kuëŋ gua̱a̱th mi̱ dɔ̱ŋ rɛy gua̱thni̱ tin caa la̱th thi̱n.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'La̱tdɛ umbdu min te gekä Click Wheel kɛ ɣöö bɛ volume riali̱kä';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Kämni button Centre kä thärkäl kɛ rɛy bar in görkɛ, scrubber bar kɛnɛ shruffle slider. Käpdɛ raar kɛnɛ ɣöö ba Centre button te thi̱n kɛ ɣöö ba ca̱p mi̱ dɔ̱ŋ kulɛ jiek.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Press kä käp button ɛmɛ bɛ dit ɛmɛ käp kɛ pɛ̈th .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Käpdɛ kä käp button ɛmɛ kɛ ɣöö ba dit nyɔk kɛ loc thi̱n';

  @override
  String get deviceControlSearchTutorialText =>
      'La̱tdɛ min ci̱ rɔ lɛp kä Cuk Wheel kɛ ɣöö biɛ nyoth ɛ la alpabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Kämni button in te däär thi̱n kɛ ɣöö biɛ kuany ɛn alpabet min ca lar';

  @override
  String get nextButtonSearchTutorialText =>
      'La̱tdɛ button ɛmɛ kɛ ɣöö biɛ mat thi̱n.';

  @override
  String get previousButtonSearchTutorialText =>
      'Gɔ̱ri button ɛmɛ kɛ ɣöö biɛ woc kä ram in jɔak';

  @override
  String get menuButtonSearchTutorialText =>
      'Gɔ̱ri button ɛmɛ kɛ ɣöö biɛ kulɛ gäk kä biɛ ruac kɛ min ca jiek rɛy go̱rä';

  @override
  String get allSongs => 'All Cuŋ';
}
