// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle =>
      'Yêu cầu quyền truy cập âm thanh cần thiết';

  @override
  String get audioAccessPermissionContent =>
      'Vui lòng cấp các tệp âm thanh truy cập để cho phép chúng tôi phát các tệp nhạc của bạn.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Quyền truy cập âm thanh bị từ chối';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Vui lòng cấp quyền truy cập tệp âm thanh cho ứng dụng này trong cài đặt thiết bị để cho phép chúng tôi phát các tệp nhạc của bạn.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Âm nhạc';

  @override
  String get nowPlayingScreenTitle => 'Hiện đang chơi';

  @override
  String get shuffleSongsMenuTitle => 'Những bài hát xáo trộn';

  @override
  String get shuffleSettingTitle => 'Xáo trộn';

  @override
  String get settingsScreenTitle => 'Cài đặt';

  @override
  String get aboutScreenTitle => 'Về';

  @override
  String get coverFlowScreenTitle => 'Dòng chảy bao gồm';

  @override
  String get artistsScreenTitle => 'Nghệ sĩ';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Bài hát';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Bài hát',
      one: '1 bài hát',
      zero: 'không có bài hát',
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
      other: '$countString Album',
      one: '1 album',
      zero: 'không có album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Thể loại';

  @override
  String get genreSongsScreenTitle => 'Bài hát thể loại';

  @override
  String get deviceColorSettingTitle => 'Màu thiết bị';

  @override
  String get touchScreenSettingTitle => 'Chạm vào màn hình được bật';

  @override
  String get repeatModeSettingTitle => 'Lặp lại';

  @override
  String get repeatModeOne => 'Một';

  @override
  String get repeatModeAll => 'Tất cả';

  @override
  String get vibrateSettingTitle => 'Rung';

  @override
  String get clickWheelSettingTitle => 'Nhấp vào âm thanh bánh xe';

  @override
  String get splitScreenSettingTitle => 'Chế độ chia màn hình';

  @override
  String get touchSoundsDialogTitle => 'Chạm vào âm thanh';

  @override
  String get touchSoundsDialogContent =>
      'Vui lòng bật âm thanh cảm ứng từ cài đặt hệ thống để nghe âm thanh của bánh xe nhấp chuột';

  @override
  String get immersiveModeSettingTitle => 'Chế độ nhập vai';

  @override
  String get showAppTutorialSettingTitle => 'Hiển thị hướng dẫn';

  @override
  String get changeDirectorySettingTitle => 'Thay đổi thư mục';

  @override
  String get donateSettingTitle => 'Quyên tặng';

  @override
  String get donateSettingDescription =>
      'Nếu bạn thích ứng dụng này, xin vui lòng xem xét quyên góp.';

  @override
  String get versionAboutScreenTitle => 'Phiên bản';

  @override
  String get madeWithLoveTitle => 'Được thực hiện bằng ❤ bởi';

  @override
  String get noMusicFilesFound => 'Không có âm nhạc';

  @override
  String get noArtistsFound => 'Không có nghệ sĩ';

  @override
  String get noAlbumsFound => 'Không có album';

  @override
  String get unknownSong => 'Bài hát không xác định';

  @override
  String get unknownArtist => 'Nghệ sĩ chưa biết';

  @override
  String get unknownAlbum => 'Album không xác định';

  @override
  String get unknownGenre => 'Thể loại chưa biết';

  @override
  String get buttonConfirmText => 'ĐƯỢC RỒI';

  @override
  String get tileValueOn => 'TRÊN';

  @override
  String get tileValueOff => 'Tắt';

  @override
  String get commonOfText => 'của';

  @override
  String get pageNotFoundText => 'Trang đã cho không được tìm thấy';

  @override
  String get commonErrorText => 'Lỗi';

  @override
  String get retryButtonText => 'Thử lại';

  @override
  String get filePickerDialogTitle => 'Chọn một thư mục để quét âm nhạc';

  @override
  String get searchScreenTitle => 'Tìm kiếm';

  @override
  String get searchEmptyText => 'Không có kết quả tìm kiếm';

  @override
  String get searchResultsText => 'Kết quả tìm kiếm:';

  @override
  String get resultsForText => 'Kết quả cho:';

  @override
  String get disableBatteryOptimizationTitle => 'Tắt tối ưu hóa pin';

  @override
  String get disableBatteryOptimizationContent =>
      'Vui lòng vô hiệu hóa tối ưu hóa pin cho ứng dụng này trong cài đặt thiết bị để cho phép phát lại nền của nhạc.';

  @override
  String get languageScreenTitle => 'Ngôn ngữ';

  @override
  String get silverDeviceColor => 'Bạc';

  @override
  String get blackDeviceColor => 'Đen';

  @override
  String get resetSettingsTitle => 'Đặt lại cài đặt';

  @override
  String get browseArtist => 'Duyệt nghệ sĩ';

  @override
  String get browseAlbum => 'Duyệt album';

  @override
  String get cancelText => 'Hủy bỏ';

  @override
  String get playlistsScreenTitle => 'Danh sách phát';

  @override
  String get addToOnTheGoPlaylist => 'Thêm vào khi đang di chuyển';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Thêm album vào khi đang di chuyển';

  @override
  String get removeSongFromThePlaylist => 'Loại bỏ khỏi danh sách phát';

  @override
  String get allAlbums => 'Tất cả các album';

  @override
  String get scanningMusicFiles => 'Quét các tập tin nhạc';

  @override
  String get newPlaylist => 'Danh sách phát mới';

  @override
  String get savePlaylist => 'Lưu danh sách phát';

  @override
  String get clearPlaylist => 'Danh sách phát rõ ràng';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan tập tin nhạc';

  @override
  String get deviceControlMenuTutorialText =>
      'Di chuyển nhẹ ngón tay cái của bạn xung quanh bánh xe nhấp để điều hướng menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Nhấn nút trung tâm để chọn mục menu được tô sáng';

  @override
  String get playPauseMenuTutorialText =>
      'Nhấn nút này để phát hoặc tạm dừng bài hát';

  @override
  String get nextButtonMenuTutorialText =>
      'Nhấn nút này để bỏ qua bài hát tiếp theo';

  @override
  String get previousButtonMenuTutorialText =>
      'Nhấn nút này để tua lại hoặc quay lại bài hát trước';

  @override
  String get menuButtonTutorialText =>
      'Nhấn nút này để quay lại menu trước. Bạn có thể nhấn và giữ nó từ bất kỳ màn hình nào khác để trực tiếp đi đến menu chính.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Đây là màn hình hiển thị. Màn hình cảm ứng và chế độ màn hình chia được bật theo mặc định và có thể được cấu hình thêm trong các cài đặt.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Di chuyển ngón tay cái của bạn xung quanh bánh xe nhấp để điều chỉnh âm lượng';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Nhấn nút trung tâm để đạp qua thanh tìm kiếm, thanh chà sàn và thanh trượt xáo trộn. Nhấn và giữ nút trung tâm để truy cập các tùy chọn bổ sung.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Nhấn và giữ nút này để nhanh chóng chuyển tiếp bài hát';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Nhấn và giữ nút này để tua lại bài hát';

  @override
  String get deviceControlSearchTutorialText =>
      'Di chuyển nhẹ ngón tay cái của bạn xung quanh bánh xe nhấp chuột để tô sáng bảng chữ cái';

  @override
  String get centerButtonSearchTutorialText =>
      'Nhấn nút trung tâm để chọn bảng chữ cái được tô sáng';

  @override
  String get nextButtonSearchTutorialText =>
      'Nhấn nút này để thêm một khoảng trống';

  @override
  String get previousButtonSearchTutorialText =>
      'Nhấn nút này để xóa ký tự cuối cùng';

  @override
  String get menuButtonSearchTutorialText =>
      'Nhấn nút này để đóng bàn phím và tương tác với kết quả tìm kiếm';
}
