// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'classipod';

  @override
  String get menuButtonText => 'メニュー';

  @override
  String get audioAccessPermissionTitle => 'オーディオアクセス許可が必要です';

  @override
  String get audioAccessPermissionContent =>
      '音楽ファイルを再生できるように、オーディオファイルアクセスを許可してください。';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'オーディオアクセス許可は拒否されました';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'デバイス設定のこのアプリのオーディオファイルアクセスを許可して、音楽ファイルを再生できるようにしてください。';

  @override
  String get menuScreenTitle => 'メニュー';

  @override
  String get musicMenuScreenTitle => '音楽';

  @override
  String get nowPlayingScreenTitle => '今遊んでいます';

  @override
  String get shuffleSongsMenuTitle => 'シャッフルソング';

  @override
  String get shuffleSettingTitle => 'シャッフル';

  @override
  String get settingsScreenTitle => '設定';

  @override
  String get aboutScreenTitle => 'について';

  @override
  String get coverFlowScreenTitle => 'カバーフロー';

  @override
  String get artistsScreenTitle => 'アーティスト';

  @override
  String get albumsScreenTitle => 'アルバム';

  @override
  String get songsScreenTitle => '歌';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 歌',
      one: '1 歌',
      zero: '歌がありません',
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
      other: '$countString アルバム',
      one: '1 アルバム',
      zero: 'アルバムがありません',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ジャンル';

  @override
  String get genreSongsScreenTitle => 'ジャンルソング';

  @override
  String get deviceColorSettingTitle => 'デバイスの色';

  @override
  String get touchScreenSettingTitle => 'タッチ画面が有効になっています';

  @override
  String get repeatModeSettingTitle => '繰り返す';

  @override
  String get repeatModeOne => '1つ';

  @override
  String get repeatModeAll => '全て';

  @override
  String get vibrateSettingTitle => '振動します';

  @override
  String get clickWheelSettingTitle => 'ホイールサウンドをクリックします';

  @override
  String get splitScreenSettingTitle => 'スクリーンモードを分割します';

  @override
  String get touchSoundsDialogTitle => '音をタッチします';

  @override
  String get touchSoundsDialogContent => 'システム設定からタッチサウンドを有効にして、クリックホイールの音を聞く';

  @override
  String get immersiveModeSettingTitle => '没入モード';

  @override
  String get showAppTutorialSettingTitle => 'チュートリアルを表示します';

  @override
  String get changeDirectorySettingTitle => 'ディレクトリを変更します';

  @override
  String get donateSettingTitle => '寄付する';

  @override
  String get donateSettingDescription => 'このアプリが気に入ったら、寄付を検討してください。';

  @override
  String get versionAboutScreenTitle => 'バージョン';

  @override
  String get madeWithLoveTitle => 'byで作られています';

  @override
  String get noMusicFilesFound => '音楽はありません';

  @override
  String get noArtistsFound => 'アーティストはいません';

  @override
  String get noAlbumsFound => 'アルバムはありません';

  @override
  String get unknownSong => '不明な歌';

  @override
  String get unknownArtist => '未知のアーティスト';

  @override
  String get unknownAlbum => '不明なアルバム';

  @override
  String get unknownGenre => '不明なジャンル';

  @override
  String get buttonConfirmText => 'わかりました';

  @override
  String get tileValueOn => 'の上';

  @override
  String get tileValueOff => 'オフ';

  @override
  String get commonOfText => 'の';

  @override
  String get pageNotFoundText => '指定されたページは見つかりませんでした';

  @override
  String get commonErrorText => 'エラー';

  @override
  String get retryButtonText => 'リトライ';

  @override
  String get filePickerDialogTitle => '音楽をスキャンするディレクトリを選択します';

  @override
  String get searchScreenTitle => '検索';

  @override
  String get searchEmptyText => '検索結果はありません';

  @override
  String get searchResultsText => '検索結果：';

  @override
  String get resultsForText => '結果：';

  @override
  String get disableBatteryOptimizationTitle => 'バッテリーの最適化を無効にします';

  @override
  String get disableBatteryOptimizationContent =>
      'デバイス設定のこのアプリのバッテリーの最適化を無効にして、音楽の背景再生を可能にしてください。';

  @override
  String get languageScreenTitle => '言語';

  @override
  String get silverDeviceColor => '銀';

  @override
  String get blackDeviceColor => '黒';

  @override
  String get resetSettingsTitle => '設定をリセットします';

  @override
  String get browseArtist => 'アーティストを閲覧します';

  @override
  String get browseAlbum => 'アルバムを閲覧します';

  @override
  String get cancelText => 'キャンセル';

  @override
  String get playlistsScreenTitle => 'プレイリスト';

  @override
  String get addToOnTheGoPlaylist => '外出先に追加します';

  @override
  String get addAlbumToOnTheGoPlaylist => '外出先にアルバムを追加します';

  @override
  String get removeSongFromThePlaylist => 'プレイリストから取り外します';

  @override
  String get allAlbums => 'すべてのアルバム';

  @override
  String get scanningMusicFiles => '音楽ファイルのスキャン';

  @override
  String get newPlaylist => '新しいプレイリスト';

  @override
  String get savePlaylist => 'プレイリストを保存します';

  @override
  String get clearPlaylist => 'クリアプレイリスト';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Musicファイル';

  @override
  String get deviceControlMenuTutorialText =>
      'クリックホイールの周りに親指を軽く動かしてメニューをナビゲートします';

  @override
  String get centerButtonMenuTutorialText => '中央ボタンを押して、強調表示されたメニュー項目を選択します';

  @override
  String get playPauseMenuTutorialText => 'このボタンを押して、曲を再生または一時停止します';

  @override
  String get nextButtonMenuTutorialText => 'このボタンを押して、次の曲にスキップします';

  @override
  String get previousButtonMenuTutorialText => 'このボタンを押して巻き戻すか、前の曲に戻ります';

  @override
  String get menuButtonTutorialText =>
      'このボタンを押して、前のメニューに戻ります。他の画面からそれを押し続けて、メインメニューに直接移動できます。';

  @override
  String get deviceScreenMenuTutorialText =>
      'これが表示画面です。タッチスクリーンモードとスプリット画面モードはデフォルトで有効になり、設定でさらに構成できます。';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'クリックホイールの周りに親指を動かしてボリュームを調整します';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'センターボタンを押して、シークバー、スクラバーバー、シャッフルスライダーをサイクリングします。センターボタンを押し続けて、追加のオプションにアクセスします。';

  @override
  String get nextButtonNowPlayingTutorialText => 'このボタンを押して、曲を早送りする';

  @override
  String get previousButtonNowPlayingTutorialText => 'このボタンを押し続けて、曲を巻き戻します';

  @override
  String get deviceControlSearchTutorialText =>
      'クリックホイールの周りに親指を軽く動かして、アルファベットを強調表示します';

  @override
  String get centerButtonSearchTutorialText => '中央ボタンを押して、強調表示されたアルファベットを選択します';

  @override
  String get nextButtonSearchTutorialText => 'このボタンを押してスペースを追加します';

  @override
  String get previousButtonSearchTutorialText => 'このボタンを押して、最後の文字を削除します';

  @override
  String get menuButtonSearchTutorialText => 'このボタンを押してキーボードを閉じて、検索結果と対話します';
}
