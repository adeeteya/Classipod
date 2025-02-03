import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/page_not_found_screen.dart';
import 'package:classipod/features/about/screen/about_screen.dart';
import 'package:classipod/features/app_startup/screens/splash_screen.dart';
import 'package:classipod/features/custom_screen_widgets/custom_scroll_behavior.dart';
import 'package:classipod/features/custom_screen_widgets/options_modal_page.dart';
import 'package:classipod/features/device/presentation/device_frame.dart';
import 'package:classipod/features/language/language_selection_screen.dart';
import 'package:classipod/features/menu/screens/main_menu_screen.dart';
import 'package:classipod/features/menu/screens/music_menu_screen.dart';
import 'package:classipod/features/menu/screens/split_screen_placeholder.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/album/album_selection_screen.dart';
import 'package:classipod/features/music/album/album_songs_screen.dart';
import 'package:classipod/features/music/artists/artist_albums_screen.dart';
import 'package:classipod/features/music/artists/artists_selection_screen.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_album_selection_screen.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_screen.dart';
import 'package:classipod/features/music/genres/genre_songs_screen.dart';
import 'package:classipod/features/music/genres/genres_screen.dart';
import 'package:classipod/features/music/search/search_screen.dart';
import 'package:classipod/features/music/songs/songs_screen.dart';
import 'package:classipod/features/now_playing/screen/now_playing_more_options_modal.dart';
import 'package:classipod/features/now_playing/screen/now_playing_screen.dart';
import 'package:classipod/features/settings/screens/settings_preferences_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  splash,
  menu,
  settings,
  about,
  language,
  nowPlaying,
  nowPlayingMoreOptions,
  musicMenu,
  coverFlow,
  coverFlowSelection,
  artists,
  artistAlbums,
  albums,
  albumSongs,
  songs,
  genres,
  genreSongs,
  search;

  @override
  String toString() {
    return "/$name";
  }

  String title(BuildContext context) {
    switch (this) {
      case splash:
        return "";
      case menu:
        return context.localization.menuScreenTitle;
      case settings:
        return context.localization.settingsScreenTitle;
      case about:
        return context.localization.aboutScreenTitle;
      case language:
        return context.localization.languageScreenTitle;
      case nowPlaying:
        return context.localization.nowPlayingScreenTitle;
      case nowPlayingMoreOptions:
        return context.localization.nowPlayingScreenTitle;
      case musicMenu:
        return context.localization.musicMenuScreenTitle;
      case coverFlow:
        return context.localization.coverFlowScreenTitle;
      case coverFlowSelection:
        return context.localization.coverFlowScreenTitle;
      case artists:
        return context.localization.artistsScreenTitle;
      case artistAlbums:
        return context.localization.artistsScreenTitle;
      case albums:
        return context.localization.albumsScreenTitle;
      case albumSongs:
        return context.localization.albumsScreenTitle;
      case songs:
        return context.localization.songsScreenTitle;
      case genres:
        return context.localization.genresScreenTitle;
      case genreSongs:
        return context.localization.genreSongsScreenTitle;
      case search:
        return context.localization.searchScreenTitle;
    }
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _menuNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.splash.toString(),
    errorBuilder: (context, state) => const PageNotFoundScreen(),
    routes: [
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, child) {
          return CupertinoPage(
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: CupertinoPageScaffold(
                resizeToAvoidBottomInset: false,
                child: DeviceFrame(child: child),
              ),
            ),
          );
        },
        routes: [
          GoRoute(
            path: Routes.splash.toString(),
            name: Routes.splash.name,
            pageBuilder: (context, state) => CupertinoPage(
              key: state.pageKey,
              child: const SplashScreen(),
            ),
          ),
          ShellRoute(
            parentNavigatorKey: _rootNavigatorKey,
            navigatorKey: _menuNavigatorKey,
            pageBuilder: (context, state, child) => CustomTransitionPage(
              key: state.pageKey,
              child: SplitScreenPlaceholder(child: child),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
            routes: [
              GoRoute(
                path: Routes.menu.toString(),
                name: Routes.menu.name,
                parentNavigatorKey: _menuNavigatorKey,
                pageBuilder: (context, state) => CupertinoPage(
                  key: state.pageKey,
                  child: const MainMenuScreen(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.settings.name,
                    name: Routes.settings.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const SettingsScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.about.name,
                        name: Routes.about.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const AboutScreen(),
                        ),
                      ),
                      GoRoute(
                        path: Routes.language.name,
                        name: Routes.language.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const LanguageSelectionScreen(),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.nowPlaying.toString(),
                    name: Routes.nowPlaying.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const NowPlayingScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.nowPlayingMoreOptions.name,
                        name: Routes.nowPlayingMoreOptions.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => OptionsModalPage(
                          context: context,
                          title: Routes.nowPlayingMoreOptions.title(context),
                          builder: (context) =>
                              const NowPlayingMoreOptionsModal(),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.musicMenu.toString(),
                    name: Routes.musicMenu.name,
                    parentNavigatorKey: _menuNavigatorKey,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const MusicMenuScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.coverFlow.name,
                        name: Routes.coverFlow.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const CoverFlowScreen(),
                        ),
                        routes: [
                          GoRoute(
                            path: Routes.coverFlowSelection.name,
                            name: Routes.coverFlowSelection.name,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) =>
                                CustomTransitionPage(
                              opaque: false,
                              barrierColor: kCupertinoModalBarrierColor,
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (context, _, __, child) =>
                                  child,
                              child: CoverFlowAlbumSelectionScreen(
                                albumDetail: state.extra as AlbumDetail,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: Routes.artists.name,
                        name: Routes.artists.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const ArtistsSelectionScreen(),
                        ),
                        routes: [
                          GoRoute(
                            path: ":artistName",
                            name: Routes.artistAlbums.name,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) => CupertinoPage(
                              key: state.pageKey,
                              child: ArtistAlbumsScreen(
                                artistName:
                                    state.pathParameters["artistName"] ?? "",
                              ),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: Routes.albums.name,
                        name: Routes.albums.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const AlbumsSelectionScreen(),
                        ),
                        routes: [
                          GoRoute(
                            path: Routes.albumSongs.name,
                            name: Routes.albumSongs.name,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) => CupertinoPage(
                              key: state.pageKey,
                              child: AlbumSongsScreen(
                                albumDetail: state.extra as AlbumDetail,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: Routes.songs.name,
                        name: Routes.songs.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const SongsScreen(),
                        ),
                      ),
                      GoRoute(
                        path: Routes.genres.toString(),
                        name: Routes.genres.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const GenresScreen(),
                        ),
                        routes: [
                          GoRoute(
                            path: ":genreName",
                            name: Routes.genreSongs.name,
                            parentNavigatorKey: _rootNavigatorKey,
                            pageBuilder: (context, state) => CupertinoPage(
                              key: state.pageKey,
                              child: GenreSongsScreen(
                                genreName:
                                    state.pathParameters["genreName"] ?? '',
                              ),
                            ),
                          ),
                        ],
                      ),
                      GoRoute(
                        path: Routes.search.name,
                        name: Routes.search.name,
                        parentNavigatorKey: _rootNavigatorKey,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: const SearchScreen(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
