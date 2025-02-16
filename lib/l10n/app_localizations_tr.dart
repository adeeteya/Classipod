// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENÜ';

  @override
  String get audioAccessPermissionTitle => 'Ses erişim izni gerekli';

  @override
  String get audioAccessPermissionContent => 'Müzik dosyalarınızı oynatmamıza izin vermek için lütfen ses dosyaları erişimi verin.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Ses erişim izni reddedildi';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Müzik dosyalarınızı oynatmamıza izin vermek için lütfen cihaz ayarlarında bu uygulama için ses dosyaları erişimi verin.';

  @override
  String get menuScreenTitle => 'Menü';

  @override
  String get musicMenuScreenTitle => 'Müzik';

  @override
  String get nowPlayingScreenTitle => 'Şimdi oynuyor';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Şarkıları';

  @override
  String get shuffleSettingTitle => 'Karıştırmak';

  @override
  String get settingsScreenTitle => 'Ayarlar';

  @override
  String get aboutScreenTitle => 'Hakkında';

  @override
  String get coverFlowScreenTitle => 'Kapak akışı';

  @override
  String get artistsScreenTitle => 'Sanatçılar';

  @override
  String get albumsScreenTitle => 'Albümler';

  @override
  String get songsScreenTitle => 'Şarkılar';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString şarkılar',
      one: '1 şarkı',
      zero: 'şarkı yok',
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
      other: '$countString albümler',
      one: '1 albüm',
      zero: 'albüm yok',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Türler';

  @override
  String get genreSongsScreenTitle => 'Tür Şarkıları';

  @override
  String get deviceColorSettingTitle => 'Cihaz rengi';

  @override
  String get touchScreenSettingTitle => 'Dokunmatik ekran etkin';

  @override
  String get repeatModeSettingTitle => 'Tekrarlamak';

  @override
  String get repeatModeOne => 'Bir';

  @override
  String get repeatModeAll => 'Tüm';

  @override
  String get vibrateSettingTitle => 'Titremek';

  @override
  String get clickWheelSettingTitle => 'Tekerlek Seslerini Tıklayın';

  @override
  String get splitScreenSettingTitle => 'Bölünmüş ekran modu';

  @override
  String get touchSoundsDialogTitle => 'Dokunma Sesleri';

  @override
  String get touchSoundsDialogContent => 'Tıklama tekerleği seslerini duymak için lütfen sistem ayarlarından dokunma seslerini etkinleştirin';

  @override
  String get immersiveModeSettingTitle => 'Sürükleyici mod';

  @override
  String get showAppTutorialSettingTitle => 'Gösteri Eğitimi';

  @override
  String get changeDirectorySettingTitle => 'Dizini Değiştir';

  @override
  String get donateSettingTitle => 'Bağış yapmak';

  @override
  String get donateSettingDescription => 'Bu uygulamayı beğendiyseniz, lütfen bağış yapmayı düşünün.';

  @override
  String get versionAboutScreenTitle => 'Versiyon';

  @override
  String get madeWithLoveTitle => '❤️ ile yapılmış';

  @override
  String get noMusicFilesFound => 'Müzik Yok';

  @override
  String get noArtistsFound => 'Sanatçı yok';

  @override
  String get noAlbumsFound => 'Albüm yok';

  @override
  String get unknownSong => 'Bilinmeyen Şarkı';

  @override
  String get unknownArtist => 'Bilinmeyen sanatçı';

  @override
  String get unknownAlbum => 'Bilinmeyen Albüm';

  @override
  String get unknownGenre => 'Bilinmeyen tür';

  @override
  String get buttonConfirmText => 'TAMAM';

  @override
  String get tileValueOn => 'Açık';

  @override
  String get tileValueOff => 'Kapalı';

  @override
  String get commonOfText => 'ile ilgili';

  @override
  String get pageNotFoundText => 'Verilen sayfa bulunamadı';

  @override
  String get commonErrorText => 'Hata';

  @override
  String get retryButtonText => 'Yeniden yapmak';

  @override
  String get filePickerDialogTitle => 'Müzik taramak için bir dizin seçin';

  @override
  String get searchScreenTitle => 'Aramak';

  @override
  String get searchEmptyText => 'Arama Sonucu Yok';

  @override
  String get searchResultsText => 'Arama Sonuçları:';

  @override
  String get resultsForText => 'Sonuçlar:';

  @override
  String get disableBatteryOptimizationTitle => 'Pil optimizasyonunu devre dışı bırakın';

  @override
  String get disableBatteryOptimizationContent => 'Müziğin arka plan çalmasına izin vermek için lütfen cihaz ayarlarında bu uygulama için pil optimizasyonunu devre dışı bırakın.';

  @override
  String get languageScreenTitle => 'Dil';

  @override
  String get silverDeviceColor => 'Gümüş';

  @override
  String get blackDeviceColor => 'Siyah';

  @override
  String get resetSettingsTitle => 'Ayarları Sıfırla';

  @override
  String get browseArtist => 'Sanatçıya göz atın';

  @override
  String get browseAlbum => 'Gözat Albümü';

  @override
  String get cancelText => 'İptal etmek';

  @override
  String get playlistsScreenTitle => 'Çalma listeleri';

  @override
  String get addToOnTheGoPlaylist => 'Harekete geçin';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Hareket halindeyken albüm ekle';

  @override
  String get removeSongFromThePlaylist => 'Oynat listesinden kaldır';

  @override
  String get allAlbums => 'Tüm Albümler';

  @override
  String get scanningMusicFiles => 'Müzik dosyalarını tarama';

  @override
  String get newPlaylist => 'Yeni Çalma Listesi';

  @override
  String get savePlaylist => 'Oynat listesini kaydet';

  @override
  String get clearPlaylist => 'Oynatma Listesi';

  @override
  String get rescanMusicFilesSettingTitle => 'Yeniden düzenli müzik dosyaları';

  @override
  String get deviceControlMenuTutorialText => 'Menüde gezinmek için başparmağınızı tıklama tekerleğinin etrafında hafifçe hareket ettirin';

  @override
  String get centerButtonMenuTutorialText => 'Vurgulanan menü öğesini seçmek için Merkez düğmesine basın';

  @override
  String get playPauseMenuTutorialText => 'Bir şarkıyı çalmak veya duraklatmak için bu düğmeye basın';

  @override
  String get nextButtonMenuTutorialText => 'Bir sonraki şarkıya atlamak için bu düğmeye basın';

  @override
  String get previousButtonMenuTutorialText => 'Yeniden sarmak veya önceki şarkıya geri dönmek için bu düğmeye basın';

  @override
  String get menuButtonTutorialText => 'Önceki menüye geri dönmek için bu düğmeye basın. Doğrudan ana menüye gitmek için diğer ekranlardan basılı tutabilirsiniz.';

  @override
  String get deviceScreenMenuTutorialText => 'Bu ekran ekranı. Dokunmatik ekran ve bölünmüş ekran modu varsayılan olarak etkinleştirilir ve ayarlarda daha fazla yapılandırılabilir.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Sesi ayarlamak için başparmağınızı tıklama tekerleğinin etrafında hareket ettirin';

  @override
  String get centerButtonNowPlayingTutorialText => 'Arama çubuğu, yıkama çubuğu ve shuffle kaydırıcısından geçerek merkez düğmesine basın. Ek seçeneklere erişmek için Orta düğmesini basılı tutun.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Şarkıyı hızlı bir şekilde ileriye götürmek için bu düğmeye basın ve basılı tutun';

  @override
  String get previousButtonNowPlayingTutorialText => 'Şarkıyı geri sarmak için bu düğmeyi basılı tutun';

  @override
  String get deviceControlSearchTutorialText => 'Bir alfabeyi vurgulamak için başparmağınızı tıklama tekerleğinin etrafında hafifçe hareket ettirin';

  @override
  String get centerButtonSearchTutorialText => 'Vurgulanan alfabeyi seçmek için Merkez düğmesine basın';

  @override
  String get nextButtonSearchTutorialText => 'Bir alan eklemek için bu düğmeye basın';

  @override
  String get previousButtonSearchTutorialText => 'Son karakteri silmek için bu düğmeye basın';

  @override
  String get menuButtonSearchTutorialText => 'Klavyeyi kapatmak için bu düğmeye basın ve arama sonuçlarıyla etkileşime geçin';
}
