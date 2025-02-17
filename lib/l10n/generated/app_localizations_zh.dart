// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'classipod';

  @override
  String get menuButtonText => '菜单';

  @override
  String get audioAccessPermissionTitle => '需要音频访问权限';

  @override
  String get audioAccessPermissionContent => '请授予音频文件访问权限，以允许我们播放您的音乐文件。';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => '拒绝音频访问权限';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      '请在设备设置中授予此应用程序的音频文件访问，以允许我们播放您的音乐文件。';

  @override
  String get menuScreenTitle => '菜单';

  @override
  String get musicMenuScreenTitle => '音乐';

  @override
  String get nowPlayingScreenTitle => '现在玩';

  @override
  String get shuffleSongsMenuTitle => '洗牌歌曲';

  @override
  String get shuffleSettingTitle => '洗牌';

  @override
  String get settingsScreenTitle => '设置';

  @override
  String get aboutScreenTitle => '关于';

  @override
  String get coverFlowScreenTitle => '覆盖流';

  @override
  String get artistsScreenTitle => '艺术家';

  @override
  String get albumsScreenTitle => '专辑';

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
      zero: '没有歌曲',
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
      other: '$countString 专辑',
      one: '1 专辑',
      zero: '没有专辑',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => '流派';

  @override
  String get genreSongsScreenTitle => '流派歌曲';

  @override
  String get deviceColorSettingTitle => '设备颜色';

  @override
  String get touchScreenSettingTitle => '触摸屏启用';

  @override
  String get repeatModeSettingTitle => '重复';

  @override
  String get repeatModeOne => '一';

  @override
  String get repeatModeAll => '全部';

  @override
  String get vibrateSettingTitle => '颤动';

  @override
  String get clickWheelSettingTitle => '点击车轮声音';

  @override
  String get splitScreenSettingTitle => '拆分屏幕模式';

  @override
  String get touchSoundsDialogTitle => '触摸声音';

  @override
  String get touchSoundsDialogContent => '请从系统设置中启用触摸声，以听到点击轮的声音';

  @override
  String get immersiveModeSettingTitle => '沉浸式模式';

  @override
  String get showAppTutorialSettingTitle => '展示教程';

  @override
  String get changeDirectorySettingTitle => '更改目录';

  @override
  String get donateSettingTitle => '捐';

  @override
  String get donateSettingDescription => '如果您喜欢此应用，请考虑捐赠。';

  @override
  String get versionAboutScreenTitle => '版本';

  @override
  String get madeWithLoveTitle => '由❤️制成';

  @override
  String get noMusicFilesFound => '没有音乐';

  @override
  String get noArtistsFound => '没有艺术家';

  @override
  String get noAlbumsFound => '没有专辑';

  @override
  String get unknownSong => '未知的歌';

  @override
  String get unknownArtist => '未知艺术家';

  @override
  String get unknownAlbum => '未知专辑';

  @override
  String get unknownGenre => '未知类型';

  @override
  String get buttonConfirmText => '好的';

  @override
  String get tileValueOn => '在';

  @override
  String get tileValueOff => '离开';

  @override
  String get commonOfText => '的';

  @override
  String get pageNotFoundText => '没有找到给定的页面';

  @override
  String get commonErrorText => '错误';

  @override
  String get retryButtonText => '重试';

  @override
  String get filePickerDialogTitle => '选择一个目录以扫描音乐';

  @override
  String get searchScreenTitle => '搜索';

  @override
  String get searchEmptyText => '没有搜索结果';

  @override
  String get searchResultsText => '搜索结果：';

  @override
  String get resultsForText => '结果：';

  @override
  String get disableBatteryOptimizationTitle => '禁用电池优化';

  @override
  String get disableBatteryOptimizationContent =>
      '请在设备设置中禁用此应用程序的电池优化，以允许对音乐进行背景播放。';

  @override
  String get languageScreenTitle => '语言';

  @override
  String get silverDeviceColor => '银';

  @override
  String get blackDeviceColor => '黑色的';

  @override
  String get resetSettingsTitle => '重置设置';

  @override
  String get browseArtist => '浏览艺术家';

  @override
  String get browseAlbum => '浏览专辑';

  @override
  String get cancelText => '取消';

  @override
  String get playlistsScreenTitle => '播放列表';

  @override
  String get addToOnTheGoPlaylist => '添加到旅途中';

  @override
  String get addAlbumToOnTheGoPlaylist => '将专辑添加到旅途中';

  @override
  String get removeSongFromThePlaylist => '从播放列表中删除';

  @override
  String get allAlbums => '所有专辑';

  @override
  String get scanningMusicFiles => '扫描音乐文件';

  @override
  String get newPlaylist => '新播放列表';

  @override
  String get savePlaylist => '保存播放列表';

  @override
  String get clearPlaylist => '清晰的播放列表';

  @override
  String get rescanMusicFilesSettingTitle => '恢复音乐档案';

  @override
  String get deviceControlMenuTutorialText => '在单击方向上轻轻移动拇指以导航菜单';

  @override
  String get centerButtonMenuTutorialText => '按中间按钮选择突出显示的菜单项';

  @override
  String get playPauseMenuTutorialText => '按下此按钮播放或暂停歌曲';

  @override
  String get nextButtonMenuTutorialText => '按下此按钮跳到下一首歌';

  @override
  String get previousButtonMenuTutorialText => '按下此按钮倒带或返回上一首歌';

  @override
  String get menuButtonTutorialText => '按下此按钮返回到上一个菜单。您可以按任何其他屏幕按下直接转到主菜单。';

  @override
  String get deviceScreenMenuTutorialText =>
      '这是显示屏幕。默认情况下启用了触摸屏和拆分屏幕模式，并且可以在设置中进一步配置。';

  @override
  String get deviceControlNowPlayingTutorialText => '将拇指移动到单击方向盘以调整音量';

  @override
  String get centerButtonNowPlayingTutorialText =>
      '按下中心按钮以循环循环，通过Seek Bar，Scrubber Bar和Shuffle Slider循环。按住中心按钮以访问其他选项。';

  @override
  String get nextButtonNowPlayingTutorialText => '按并按住此按钮快速前进这首歌';

  @override
  String get previousButtonNowPlayingTutorialText => '按并按住此按钮倒带歌曲';

  @override
  String get deviceControlSearchTutorialText => '轻轻地将拇指移动到单击车轮上以突出显示字母';

  @override
  String get centerButtonSearchTutorialText => '按中间按钮选择突出显示的字母';

  @override
  String get nextButtonSearchTutorialText => '按下此按钮添加一个空间';

  @override
  String get previousButtonSearchTutorialText => '按下此按钮删除最后一个字符';

  @override
  String get menuButtonSearchTutorialText => '按下此按钮关闭键盘并与搜索结果进行交互';
}
