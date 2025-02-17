// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Fon (`fon`).
class AppLocalizationsFon extends AppLocalizations {
  AppLocalizationsFon([String locale = 'fon']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'GBƐTƆ́ .';

  @override
  String get audioAccessPermissionTitle => 'Audio Access É byɔ';

  @override
  String get audioAccessPermissionContent =>
      'Kɛnklɛn na gbè wema e è nɔ sè lɛ é bo na dó sixu xò hanwema towe lɛ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Auglecée È Nɔ Na Mɛ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Mi kɛnklɛn bo na gbè wema e mɛ è nɔ sè nǔ ɖè lɛ é nú appli enɛ ɖò nǔ e è nɔ zán lɛ é mɛ, bo na dó sixu xò hanwema mitɔn lɛ.';

  @override
  String get menuScreenTitle => 'Mlù';

  @override
  String get musicMenuScreenTitle => 'Nùxixo';

  @override
  String get nowPlayingScreenTitle => 'Dìn ɔ, é ɖò xixo wɛ';

  @override
  String get shuffleSongsMenuTitle => 'Han e è nɔ ylɔ ɖɔ “fleurs .';

  @override
  String get shuffleSettingTitle => 'Yì';

  @override
  String get settingsScreenTitle => 'ɖŏnu';

  @override
  String get aboutScreenTitle => 'Nùɖé';

  @override
  String get coverFlowScreenTitle => 'Wema ɔ';

  @override
  String get artistsScreenTitle => 'Nǔɖetɔ́';

  @override
  String get albumsScreenTitle => 'Albuku';

  @override
  String get songsScreenTitle => 'han';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Han lɛ',
      one: '1 Han',
      zero: 'Han ɖebu ă',
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
      other: '$countString Albɔmu lɛ',
      one: '1 Albɔmu',
      zero: 'Albɔmu ɖebu ɖemɛ ǎ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'nyɔnu lɛ';

  @override
  String get genreSongsScreenTitle => 'Hanjiji sunnu lɛ tɔn';

  @override
  String get deviceColorSettingTitle => 'Sɔ́ sinmɛ dó jǐ';

  @override
  String get touchScreenSettingTitle => 'Touch Screen Enabled';

  @override
  String get repeatModeSettingTitle => 'Lɛ́ ɖɔ̀';

  @override
  String get repeatModeOne => 'Ɖokpo';

  @override
  String get repeatModeAll => 'Bǐ';

  @override
  String get vibrateSettingTitle => 'vivɔ́';

  @override
  String get clickWheelSettingTitle => 'Zǐn Gbè Wheel tɔn';

  @override
  String get splitScreenSettingTitle => 'Mode de lui Split';

  @override
  String get touchSoundsDialogTitle => 'Mi hɛn alɔ';

  @override
  String get touchSoundsDialogContent =>
      'Mi kɛnklɛn bo wlan nǔ dó System Sounds jí bo sè gbè e è nɔ sè lɛ é sín gbè .';

  @override
  String get immersiveModeSettingTitle => 'Mode e nɔ hɛn mɛ lidǒ é';

  @override
  String get showAppTutorialSettingTitle => 'Xlɛ́ Tutoblonunu';

  @override
  String get changeDirectorySettingTitle => 'Dɔn Gǎn lɛ sín Azɔ̌';

  @override
  String get donateSettingTitle => 'Dŏ nù';

  @override
  String get donateSettingDescription =>
      'Enyi a yí wǎn nú appli elɔ hǔn, kɛnklɛn bo lin tamɛ dó nǔnina jí.';

  @override
  String get versionAboutScreenTitle => 'Nùwlanwlan';

  @override
  String get madeWithLoveTitle => 'È bló xá ❤️ gbɔn .';

  @override
  String get noMusicFilesFound => 'Han ɖebǔ ǎ';

  @override
  String get noArtistsFound => 'Nǔɖetɔ́ ɖě ǎ';

  @override
  String get noAlbumsFound => 'Albums ɖebu';

  @override
  String get unknownSong => 'Han e è ma tuùn ǎ lɛ é';

  @override
  String get unknownArtist => 'Nǔɖetɔ́ e è ma tuùn ǎ é';

  @override
  String get unknownAlbum => 'Album e è ma tuùn ǎ é';

  @override
  String get unknownGenre => 'Mɛ e è ma tuùn ǎ é .';

  @override
  String get buttonConfirmText => 'É NYƆ́';

  @override
  String get tileValueOn => 'Ɖò';

  @override
  String get tileValueOff => 'E ɖo azɔ́';

  @override
  String get commonOfText => 'un';

  @override
  String get pageNotFoundText => 'È mɔ wema e è na é ǎ .';

  @override
  String get commonErrorText => 'Nùwanyido';

  @override
  String get retryButtonText => 'tɔn';

  @override
  String get filePickerDialogTitle => 'Hɛn Gǎn ɖé nú Scan nú Han ɔ .';

  @override
  String get searchScreenTitle => 'Ba';

  @override
  String get searchEmptyText => 'Nǔ e è mɔ lɛ é ɖě ǎ';

  @override
  String get searchResultsText => 'Nǔ e è mɔ lɛ é:';

  @override
  String get resultsForText => 'Nǔ e è mɔ ɖ’emɛ lɛ é:';

  @override
  String get disableBatteryOptimizationTitle => 'Batterie optimé .';

  @override
  String get disableBatteryOptimizationContent =>
      'Mi kɛnklɛn bo bló bɔ batterie ɔ na nyɔ́ hugǎn nú appli enɛ ɖò nǔ e è nɔ zán lɛ é mɛ, bo na dó sixu xò han lɛ ɖò gudo.';

  @override
  String get languageScreenTitle => 'Gbè';

  @override
  String get silverDeviceColor => 'Akwɛ';

  @override
  String get blackDeviceColor => 'Awii';

  @override
  String get resetSettingsTitle => 'Vɔ ɖyɔ nǔ e ɖò wema ɔ mɛ lɛ é';

  @override
  String get browseArtist => 'Kpɔ́n nǔɖiɖótɔ́ lɛ';

  @override
  String get browseAlbum => 'Kpɔ́n Album';

  @override
  String get cancelText => 'ÐáñáôçñÞóôå';

  @override
  String get playlistsScreenTitle => 'Ayihunmà lɛ';

  @override
  String get addToOnTheGoPlaylist => 'Gɔ́ nú On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Mi zé Album dó On-The-Go jí .';

  @override
  String get removeSongFromThePlaylist => 'Sún sín Playlist ɔ mɛ';

  @override
  String get allAlbums => 'Album lɛ bi';

  @override
  String get scanningMusicFiles => 'Han e è nɔ zán ɖò hanjiji mɛ lɛ é';

  @override
  String get newPlaylist => 'Ayihunmlimlixo yɔyɔ';

  @override
  String get savePlaylist => 'Hɛn nǔ e è nɔ xò lɛ é ɖó mimɛ̌ jí';

  @override
  String get clearPlaylist => 'Mɛ e nɔ xò nǔ kpɔ́n lɛ é sín ɖiɖe';

  @override
  String get rescanMusicFilesSettingTitle => 'Hanjiji Rescan tɔn lɛ';

  @override
  String get deviceControlMenuTutorialText =>
      'Sɔ́ alɔví towe dó jǐ kpɛɖé bo lɛlɛ̌ dó Click Wheel ɔ bo kpɔ́n nǔ e ɖò wema ɔ mɛ lɛ é .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tɛ́n butɔn tɛntin tɔn ɔ bo sɔ́ nǔ e è ɖè xlɛ́ é';

  @override
  String get playPauseMenuTutorialText =>
      'Tɛ́n butɔn elɔ bo xò alǒ ɖó han ɖé te';

  @override
  String get nextButtonMenuTutorialText =>
      'Tɛ́n butɔn elɔ bo xò han e bɔ d’ewu é .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tɛ́n butɔn elɔ bo na dó gbɔ azɔn alǒ lɛkɔ yì han e wá yì é jí .';

  @override
  String get menuButtonTutorialText =>
      'Tɛ butɔn elɔ bo lɛkɔ yi menu e wa yi ɔ mɛ. A sixu zín bo hɛn sín écran ɖevo jí bo na yì nǔ taji ɔ jí tlɔlɔ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Nǔ e è nɔ xlɛ́ mɛ é wɛ nyí enɛ. Touch Screen kpo Split Screen Mode kpo nɔ w’azɔ̌ ɖò jlɛ̌ jí, bɔ è sixu bló tuto nú ye d’eji ɖò ninɔmɛ lɛ mɛ.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Sɔ́ alɔví towe dó Click Wheel ɔ jí bo jla hlɔnhlɔn ɔ ɖó .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tɛ butɔn Center tɔn ɔ jí bo na dó ɖi zɔnlin gbɔn bar, scrubber bar kpo slider shuffle kpo gblamɛ. Tɛ́n bo hɛn butɔn Centre ɔ bo na mɔ nǔ ɖevo lɛ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tɛ bo hɛn butɔn elɔ bo na do yi nukɔn nu han ɔ .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tɛ́n bo hɛn butɔn elɔ bo na dó vɔ́ han ɔ kpɔ́n .';

  @override
  String get deviceControlSearchTutorialText =>
      'Sɔ́ alɔví towe dó jǐ kpɛɖé bo lɛlɛ̌ dó Click Wheel bo ɖè alfabɛti ɖé xlɛ́';

  @override
  String get centerButtonSearchTutorialText =>
      'Tɛ́n butɔn tɛntin tɔn ɔ bo na dó sɔ́ alfabɛti e è ɖè xlɛ́ é';

  @override
  String get nextButtonSearchTutorialText =>
      'Tɛ́n butɔn elɔ bo na dó gɔ́ tɛnmɛ ɖé .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tɛ́n butɔn elɔ bo súnsún wuntun gudo tɔn ɔ .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tɛ́n butɔn elɔ bo sú klavié ɔ bo nɔ wà nǔ xá nǔ e è ba lɛ é .';
}
