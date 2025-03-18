// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Khmer Central Khmer (`km`).
class AppLocalizationsKm extends AppLocalizations {
  AppLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'បហ្ជីមុខម្ហូប';

  @override
  String get audioAccessPermissionTitle =>
      'តម្រូវឱ្យមានការអនុញ្ញាតឱ្យចូលប្រើអូឌីយ៉ូ';

  @override
  String get audioAccessPermissionContent =>
      'សូមផ្តល់ឯកសារអូឌីយ៉ូចូលប្រើដើម្បីអនុញ្ញាតឱ្យយើងលេងឯកសារតន្ត្រីរបស់អ្នក។';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'សិទ្ធិចូលដំណើរការអូឌីយ៉ូត្រូវបានបដិសេធ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'សូមផ្តល់ឯកសារអូឌីយ៉ូចូលប្រើសម្រាប់កម្មវិធីនេះនៅក្នុងការកំណត់ឧបករណ៍ដើម្បីអនុញ្ញាតឱ្យយើងលេងឯកសារតន្ត្រីរបស់អ្នក។';

  @override
  String get menuScreenTitle => 'បហ្ជីមុខម្ហូប';

  @override
  String get musicMenuScreenTitle => 'តន្រ្ដី';

  @override
  String get nowPlayingScreenTitle => 'ឥឡូវលេង';

  @override
  String get shuffleSongsMenuTitle => 'ច្រៀងចម្រៀង';

  @override
  String get shuffleSettingTitle => 'សាប់';

  @override
  String get settingsScreenTitle => 'ការកំណត់';

  @override
  String get aboutScreenTitle => 'អមបី';

  @override
  String get coverFlowScreenTitle => 'លំហូរគម្រប';

  @override
  String get artistsScreenTitle => 'សិល្បករ';

  @override
  String get albumsScreenTitle => 'អាល់មង្គល';

  @override
  String get songsScreenTitle => 'ចម្រៀង';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ចម្រៀង',
      one: '1 ចម្រៀង',
      zero: 'គ្មានបទចម្រៀង',
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
      other: '$countString អាល់ប៊ុម',
      one: '1 អាល់ប៊ុម',
      zero: 'គ្មានអាល់ប៊ុម',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'បណ្ដឹង';

  @override
  String get genreSongsScreenTitle => 'ប្រភេទចម្រៀង';

  @override
  String get deviceColorSettingTitle => 'ពណ៌ឧបករណ៍';

  @override
  String get touchScreenSettingTitle => 'បានបើកដំណើរការលើអេក្រង់ប៉ះ';

  @override
  String get repeatModeSettingTitle => 'ថាលើងវិញ';

  @override
  String get repeatModeOne => 'មយយ';

  @override
  String get repeatModeAll => 'តាមងអស់';

  @override
  String get vibrateSettingTitle => 'ញ័រ';

  @override
  String get clickWheelSettingTitle => 'ចុចសំឡេងរោទិ៍';

  @override
  String get splitScreenSettingTitle => 'បំបែករបៀបអេក្រង់';

  @override
  String get touchSoundsDialogTitle => 'ប៉ះសំឡេង';

  @override
  String get touchSoundsDialogContent =>
      'សូមអនុញ្ញាតឱ្យប៉ះសំឡេងពីការកំណត់ប្រព័ន្ធដើម្បីស្តាប់សំឡេងចុចកង់';

  @override
  String get immersiveModeSettingTitle => 'របៀបវង្វេងស្មារតី';

  @override
  String get showAppTutorialSettingTitle => 'បង្ហាញការបង្រៀន';

  @override
  String get changeDirectorySettingTitle => 'ផ្លាស់ប្តូរថតឯកសារ';

  @override
  String get donateSettingTitle => 'បរិច្ចាក';

  @override
  String get donateSettingDescription =>
      'ប្រសិនបើអ្នកចូលចិត្តកម្មវិធីនេះសូមពិចារណាបរិច្ចាគ។';

  @override
  String get versionAboutScreenTitle => 'កមបុរក្នា';

  @override
  String get madeWithLoveTitle => 'ធ្វើជាមួយ❤️ដោយ';

  @override
  String get noMusicFilesFound => 'គ្មានតន្ត្រី';

  @override
  String get noArtistsFound => 'គ្មានសិល្បករ';

  @override
  String get noAlbumsFound => 'គ្មានអាល់ប៊ុមទេ';

  @override
  String get unknownSong => 'ចម្រៀងដែលមិនស្គាល់';

  @override
  String get unknownArtist => 'អ្នកមិនស្គាល់សិល្បករ';

  @override
  String get unknownAlbum => 'អាល់ប៊ុមមិនស្គាល់';

  @override
  String get unknownGenre => 'មិនស្គាល់ប្រភេទ';

  @override
  String get buttonConfirmText => 'យល់ព្រម';

  @override
  String get tileValueOn => 'លើ';

  @override
  String get tileValueOff => 'រលត់';

  @override
  String get commonOfText => 'នៃ';

  @override
  String get pageNotFoundText => 'ទំព័រដែលបានផ្តល់ឱ្យមិនត្រូវបានរកឃើញទេ';

  @override
  String get commonErrorText => 'កមហុស';

  @override
  String get retryButtonText => 'ាប់រេគ្រប់យ៉ាងបី';

  @override
  String get filePickerDialogTitle => 'ជ្រើសរើសថតឯកសារមួយដើម្បីស្កេនតន្ត្រី';

  @override
  String get searchScreenTitle => 'ការឆេកឆេ';

  @override
  String get searchEmptyText => 'គ្មានលទ្ធផលស្វែងរក';

  @override
  String get searchResultsText => 'លទ្ធផលស្វែងរក:';

  @override
  String get resultsForText => 'លទ្ធផលសម្រាប់:';

  @override
  String get disableBatteryOptimizationTitle =>
      'បិទដំណើរការថ្មបង្កើនប្រសិទ្ធភាព';

  @override
  String get disableBatteryOptimizationContent =>
      'សូមបិទការបង្កើនប្រសិទ្ធិភាពអាគុយសម្រាប់កម្មវិធីនេះក្នុងការកំណត់ឧបករណ៍ដើម្បីអនុញ្ញាតឱ្យមានប្រវត្តិរូបសង្ខេបនៃតន្ត្រី។';

  @override
  String get languageScreenTitle => 'ផាសា';

  @override
  String get silverDeviceColor => 'របាក់';

  @override
  String get blackDeviceColor => 'ខ្ផោ';

  @override
  String get resetSettingsTitle => 'កំណត់ការកំណត់ឡើងវិញ';

  @override
  String get browseArtist => 'វិចិត្រកររកមើល';

  @override
  String get browseAlbum => 'រកមើលអាល់ប៊ុម';

  @override
  String get cancelText => 'លប់ចោល';

  @override
  String get playlistsScreenTitle => 'តង់ចើង';

  @override
  String get addToOnTheGoPlaylist => 'បន្ថែមទៅនៅលើ - ទៅ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'បន្ថែមអាល់ប៊ុមទៅនឹងការធ្វើដំណើរទៅ';

  @override
  String get removeSongFromThePlaylist => 'យកចេញពីបញ្ជីចាក់';

  @override
  String get allAlbums => 'អាល់ប៊ុមទាំងអស់';

  @override
  String get scanningMusicFiles => 'ស្កេនឯកសារតន្ត្រី';

  @override
  String get newPlaylist => 'បញ្ជីចាក់ថ្មី';

  @override
  String get savePlaylist => 'រក្សាទុកបញ្ជីចាក់';

  @override
  String get clearPlaylist => 'សំអាតបញ្ជីចាក់';

  @override
  String get rescanMusicFilesSettingTitle => 'រេនកូរ៉េឡើងវិញ';

  @override
  String get deviceControlMenuTutorialText =>
      'ផ្លាស់ទីមេដៃរបស់អ្នកស្រាល ៗ ជុំវិញកង់ចុចដើម្បីរុករកម៉ឺនុយ';

  @override
  String get centerButtonMenuTutorialText =>
      'ចុចប៊ូតុងកណ្តាលដើម្បីជ្រើសរើសធាតុម៉ឺនុយដែលបានបន្លិច';

  @override
  String get playPauseMenuTutorialText => 'ចុចប៊ូតុងនេះដើម្បីលេងឬផ្អាកបទចម្រៀង';

  @override
  String get nextButtonMenuTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីរំលងទៅបទចម្រៀងបន្ទាប់';

  @override
  String get previousButtonMenuTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីរំកិលឬត្រលប់ទៅបទចម្រៀងមុនវិញ';

  @override
  String get menuButtonTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីត្រលប់ទៅម៉ឺនុយមុន។ អ្នកអាចចុចហើយសង្កត់វាពីអេក្រង់ផ្សេងទៀតដើម្បីចូលទៅកាន់ម៉ឺនុយមេដោយផ្ទាល់។';

  @override
  String get deviceScreenMenuTutorialText =>
      'នេះគឺជាអេក្រង់បង្ហាញ។ ប៉ះអេក្រង់និងបំបែករបៀបអេក្រង់ត្រូវបានបើកតាមលំនាំដើមហើយអាចត្រូវបានតំឡើងបន្ថែមទៀតនៅក្នុងការកំណត់។';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ផ្លាស់ទីមេដៃរបស់អ្នកជុំវិញកង់ចុចដើម្បីកែសម្រួលបរិមាណ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ចុចប៊ូតុងកណ្តាលដើម្បីវដ្តដែលឆ្លងកាត់ការស្វែងរករបារដាស់ត្នោតរបារព្រងើយកន្តើយនិងសាប់គ្រាប់រំកិល។ ចុចនិងសង្កត់ប៊ូតុងកណ្តាលដើម្បីចូលប្រើជម្រើសបន្ថែម។';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ចុចហើយសង្កត់ប៊ូតុងនេះដើម្បីបញ្ជូនបន្តទៅមុខ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ចុចហើយសង្កត់ប៊ូតុងនេះដើម្បីបង្វែរបទចម្រៀងឡើងវិញ';

  @override
  String get deviceControlSearchTutorialText =>
      'ផ្លាស់ទីមេដៃរបស់អ្នកស្រាល ៗ ជុំវិញកង់ចុចដើម្បីរំលេចអក្ខរក្រម';

  @override
  String get centerButtonSearchTutorialText =>
      'ចុចប៊ូតុងកណ្តាលដើម្បីជ្រើសរើសអក្ខរក្រមដែលបានបន្លិច';

  @override
  String get nextButtonSearchTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីបន្ថែមចន្លោះមួយ';

  @override
  String get previousButtonSearchTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីលុបតួអក្សរចុងក្រោយ';

  @override
  String get menuButtonSearchTutorialText =>
      'ចុចប៊ូតុងនេះដើម្បីបិទក្តារចុចនិងធ្វើអន្តរកម្មជាមួយលទ្ធផលស្វែងរក';

  @override
  String get allSongs => 'ចម្រៀងទាំងអស់';
}
