// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yue Chinese Cantonese (`yue`).
class AppLocalizationsYue extends AppLocalizations {
  AppLocalizationsYue([String locale = 'yue']) : super(locale);

  @override
  String get appTitle => '經典寶石';

  @override
  String get menuButtonText => '麥科特';

  @override
  String get audioAccessPermissionTitle => '需要音頻存取權';

  @override
  String get audioAccessPermissionContent => '請授予音頻檔案存取權，讓我哋播放音樂檔案。';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => '音頻存取權限拒絕';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => '請喺裝置設定入面提供呢個應用程式嘅音頻檔案存取權，等我哋可以播放你嘅音樂檔案。';

  @override
  String get menuScreenTitle => '菜單';

  @override
  String get musicMenuScreenTitle => '音樂';

  @override
  String get nowPlayingScreenTitle => '而家玩緊';

  @override
  String get shuffleSongsMenuTitle => '混搭歌';

  @override
  String get shuffleSettingTitle => '混音';

  @override
  String get settingsScreenTitle => '設定';

  @override
  String get aboutScreenTitle => '關於';

  @override
  String get coverFlowScreenTitle => '封面流';

  @override
  String get artistsScreenTitle => '藝術家';

  @override
  String get albumsScreenTitle => '專輯';

  @override
  String get songsScreenTitle => '歌曲';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 歌曲',
      one: '1 歌曲',
      zero: '冇歌',
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
      other: '$countString 專輯',
      one: '1 專輯',
      zero: '冇專輯',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => '類型';

  @override
  String get genreSongsScreenTitle => '類型歌曲';

  @override
  String get deviceColorSettingTitle => '裝置顏色';

  @override
  String get touchScreenSettingTitle => '觸控螢幕啟用';

  @override
  String get repeatModeSettingTitle => '重複';

  @override
  String get repeatModeOne => '一';

  @override
  String get repeatModeAll => '全部';

  @override
  String get vibrateSettingTitle => '震動';

  @override
  String get clickWheelSettingTitle => '按一下輪聲';

  @override
  String get splitScreenSettingTitle => '分裂螢幕模式';

  @override
  String get touchSoundsDialogTitle => '觸摸聲';

  @override
  String get touchSoundsDialogContent => '請啟用「系統設定」觸控聲音，聽點點擊輪聲';

  @override
  String get immersiveModeSettingTitle => '沉浸式模式';

  @override
  String get showAppTutorialSettingTitle => '顯示教學';

  @override
  String get changeDirectorySettingTitle => '變更目錄';

  @override
  String get donateSettingTitle => '捐';

  @override
  String get donateSettingDescription => '如果你鍾意呢個應用程式，請考慮捐款。';

  @override
  String get versionAboutScreenTitle => '版本';

  @override
  String get madeWithLoveTitle => '用 ❤ ️ 由';

  @override
  String get noMusicFilesFound => '冇音樂';

  @override
  String get noArtistsFound => '冇藝術家';

  @override
  String get noAlbumsFound => '冇專輯';

  @override
  String get unknownSong => '未知歌';

  @override
  String get unknownArtist => '未知藝術家';

  @override
  String get unknownAlbum => '未知專輯';

  @override
  String get unknownGenre => '未知嘅類型';

  @override
  String get buttonConfirmText => '得';

  @override
  String get tileValueOn => '喺上面';

  @override
  String get tileValueOff => '收線';

  @override
  String get commonOfText => '嘅';

  @override
  String get pageNotFoundText => '未搵到個特定頁面';

  @override
  String get commonErrorText => '錯誤';

  @override
  String get retryButtonText => '重試';

  @override
  String get filePickerDialogTitle => '揀 [ 掃描音樂目錄 ]';

  @override
  String get searchScreenTitle => '搜尋';

  @override
  String get searchEmptyText => '冇搜尋結果';

  @override
  String get searchResultsText => '搜尋結果 :';

  @override
  String get resultsForText => '結果：';

  @override
  String get disableBatteryOptimizationTitle => '停用電池優化';

  @override
  String get disableBatteryOptimizationContent => '請喺裝置設定入面停用呢個應用程式嘅電池優化，以便背景播放音樂。';

  @override
  String get languageScreenTitle => '語言';

  @override
  String get silverDeviceColor => '銀色';

  @override
  String get blackDeviceColor => '黑色';

  @override
  String get resetSettingsTitle => '重設設定';

  @override
  String get browseArtist => '瀏覽藝術家';

  @override
  String get browseAlbum => '瀏覽專輯';

  @override
  String get cancelText => '取消';

  @override
  String get playlistsScreenTitle => '播放清單';

  @override
  String get addToOnTheGoPlaylist => '加入上到去';

  @override
  String get addAlbumToOnTheGoPlaylist => '加入專輯《上到去》';

  @override
  String get removeSongFromThePlaylist => '喺播放清單入面移除';

  @override
  String get allAlbums => '所有專輯';

  @override
  String get scanningMusicFiles => '掃描音樂檔案';

  @override
  String get newPlaylist => '新播放清單';

  @override
  String get savePlaylist => '儲存播放清單';

  @override
  String get clearPlaylist => '清楚播放清單';

  @override
  String get rescanMusicFilesSettingTitle => '樂器音樂檔案';

  @override
  String get deviceControlMenuTutorialText => '輕輕將拇指移動到點擊輪，就可以導航餐牌';

  @override
  String get centerButtonMenuTutorialText => '按中心按鈕，選取突顯選單項目';

  @override
  String get playPauseMenuTutorialText => '撳呢個掣就可以播放或者暫停歌曲';

  @override
  String get nextButtonMenuTutorialText => '撳呢個掣就可以跳到下一首歌';

  @override
  String get previousButtonMenuTutorialText => '撳呢個掣就可以倒轉，或者返去上一首歌';

  @override
  String get menuButtonTutorialText => '撳呢個掣就可以返去上一個選單。你可以喺任何其他畫面上面按住同埋按住佢，直接去主選單。';

  @override
  String get deviceScreenMenuTutorialText => '呢個係顯示屏幕。預設啟用「觸控螢幕」同「分屏模式」 , 亦可以喺設定入面進一步配置。';

  @override
  String get deviceControlNowPlayingTutorialText => '將拇指移動到點擊輪上面，就可以調整音量';

  @override
  String get centerButtonNowPlayingTutorialText => '按中心按鈕循環穿過尋求棒、洗衣機棒和混搭滑桿。按住中心掣，就可以存取額外嘅選項。';

  @override
  String get nextButtonNowPlayingTutorialText => '按住呢個掣，就可以快速向前行呢首歌';

  @override
  String get previousButtonNowPlayingTutorialText => '按住呢個掣，就可以倒轉歌曲';

  @override
  String get deviceControlSearchTutorialText => '輕輕將拇指移動到點擊輪，突顯字母';

  @override
  String get centerButtonSearchTutorialText => '按中心按鈕，選取突顯字母';

  @override
  String get nextButtonSearchTutorialText => '撳呢個掣就可以加入空間';

  @override
  String get previousButtonSearchTutorialText => '撳呢個掣就可以刪除最後一個字元';

  @override
  String get menuButtonSearchTutorialText => '撳呢個掣就可以關閉鍵盤，同埋同搜尋結果互動';
}
