// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Permissão de acesso de áudio necessária';

  @override
  String get audioAccessPermissionContent =>
      'Por favor, conceda aos arquivos de áudio acesso para nos permitir tocar seus arquivos de música.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Permissão de acesso de áudio negado';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Por favor, conceda aos arquivos de áudio acesso a este aplicativo nas configurações do dispositivo para nos permitir tocar seus arquivos de música.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Música';

  @override
  String get nowPlayingScreenTitle => 'Agora jogando';

  @override
  String get shuffleSongsMenuTitle => 'Músicas de embaralhamento';

  @override
  String get shuffleSettingTitle => 'Embaralhar';

  @override
  String get settingsScreenTitle => 'Configurações';

  @override
  String get aboutScreenTitle => 'Sobre';

  @override
  String get coverFlowScreenTitle => 'Fluxo de tampa';

  @override
  String get artistsScreenTitle => 'Artistas';

  @override
  String get albumsScreenTitle => 'Álbuns';

  @override
  String get songsScreenTitle => 'Músicas';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString canções',
      one: '1 música',
      zero: 'Sem músicas',
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
      other: '$countString álbuns',
      one: '1 álbum',
      zero: 'no álbum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gêneros';

  @override
  String get genreSongsScreenTitle => 'Músicas de gênero';

  @override
  String get deviceColorSettingTitle => 'Cor do dispositivo';

  @override
  String get touchScreenSettingTitle => 'Tela de toque ativada';

  @override
  String get repeatModeSettingTitle => 'Repita';

  @override
  String get repeatModeOne => 'Um';

  @override
  String get repeatModeAll => 'Todos';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Clique em sons da roda';

  @override
  String get splitScreenSettingTitle => 'Modo de tela dividido';

  @override
  String get touchSoundsDialogTitle => 'Sons de toque';

  @override
  String get touchSoundsDialogContent =>
      'Ativar sons de toque das configurações do sistema para ouvir os sons de roda de cliques';

  @override
  String get immersiveModeSettingTitle => 'Modo imersivo';

  @override
  String get showAppTutorialSettingTitle => 'Mostrar tutorial';

  @override
  String get changeDirectorySettingTitle => 'Diretório de alterações';

  @override
  String get donateSettingTitle => 'Doar';

  @override
  String get donateSettingDescription =>
      'Se você gosta deste aplicativo, considere doar.';

  @override
  String get versionAboutScreenTitle => 'Versão';

  @override
  String get madeWithLoveTitle => 'Feito com ❤️ por';

  @override
  String get noMusicFilesFound => 'Sem música';

  @override
  String get noArtistsFound => 'Sem artistas';

  @override
  String get noAlbumsFound => 'Sem álbuns';

  @override
  String get unknownSong => 'Música desconhecida';

  @override
  String get unknownArtist => 'Artista desconhecido';

  @override
  String get unknownAlbum => 'Álbum desconhecido';

  @override
  String get unknownGenre => 'Gênero desconhecido';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Sobre';

  @override
  String get tileValueOff => 'Desligado';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'A página fornecida não foi encontrada';

  @override
  String get commonErrorText => 'Erro';

  @override
  String get retryButtonText => 'Tente novamente';

  @override
  String get filePickerDialogTitle =>
      'Selecione um diretório para digitalizar música';

  @override
  String get searchScreenTitle => 'Procurar';

  @override
  String get searchEmptyText => 'Sem resultados de pesquisa';

  @override
  String get searchResultsText => 'Resultados da pesquisa:';

  @override
  String get resultsForText => 'Resultados para:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Desative a otimização da bateria';

  @override
  String get disableBatteryOptimizationContent =>
      'Desative a otimização da bateria para este aplicativo nas configurações do dispositivo para permitir reprodução de música em segundo plano.';

  @override
  String get languageScreenTitle => 'Linguagem';

  @override
  String get silverDeviceColor => 'Prata';

  @override
  String get blackDeviceColor => 'Preto';

  @override
  String get resetSettingsTitle => 'Redefinir configurações';

  @override
  String get browseArtist => 'Procure artista';

  @override
  String get browseAlbum => 'Álbum de navegação';

  @override
  String get cancelText => 'Cancelar';

  @override
  String get playlistsScreenTitle => 'Listas de reprodução';

  @override
  String get addToOnTheGoPlaylist => 'Adicione ao uso em movimento';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Adicionar álbum ao On-the-Go';

  @override
  String get removeSongFromThePlaylist => 'Remova da lista de reprodução';

  @override
  String get allAlbums => 'Todos os álbuns';

  @override
  String get scanningMusicFiles => 'Examinando arquivos de música';

  @override
  String get newPlaylist => 'Nova lista de reprodução';

  @override
  String get savePlaylist => 'Salve a lista de reprodução';

  @override
  String get clearPlaylist => 'Lista de reprodução clara';

  @override
  String get rescanMusicFilesSettingTitle => 'Arquivos de música de resgan';

  @override
  String get deviceControlMenuTutorialText =>
      'Mova o polegar levemente ao redor da roda de clique para navegar no menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pressione o botão central para selecionar o item de menu destacado';

  @override
  String get playPauseMenuTutorialText =>
      'Pressione este botão para tocar ou pausar uma música';

  @override
  String get nextButtonMenuTutorialText =>
      'Pressione este botão para pular para a próxima música';

  @override
  String get previousButtonMenuTutorialText =>
      'Pressione este botão para rebobinar ou voltar para a música anterior';

  @override
  String get menuButtonTutorialText =>
      'Pressione este botão para voltar ao menu anterior. Você pode pressionar e segurá -lo de qualquer outra tela para ir diretamente ao menu principal.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Esta é a tela de exibição. A tela de toque e o modo de tela dividida são ativados por padrão e podem ser configurados mais adiante nas configurações.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mova o polegar ao redor da roda de clique para ajustar o volume';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pressione o botão central para percorrer a barra de busca, a barra de lavagem e o controle deslizante de embaralhamento. Pressione e segure o botão central para acessar opções adicionais.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pressione e segure este botão para avançar rapidamente a música';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pressione e segure este botão para retroceder a música';

  @override
  String get deviceControlSearchTutorialText =>
      'Mova o polegar levemente ao redor da roda de clique para destacar um alfabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Pressione o botão central para selecionar o alfabeto destacado';

  @override
  String get nextButtonSearchTutorialText =>
      'Pressione este botão para adicionar um espaço';

  @override
  String get previousButtonSearchTutorialText =>
      'Pressione este botão para excluir o último personagem';

  @override
  String get menuButtonSearchTutorialText =>
      'Pressione este botão para fechar o teclado e interagir com os resultados da pesquisa';
}
