import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/about/screen/about_screen.dart';
import 'package:classipod/features/app_startup/screens/splash_screen.dart';
import 'package:classipod/features/custom_screen_widgets/cupertino_modal_page.dart';
import 'package:classipod/features/custom_screen_widgets/custom_scroll_behavior.dart';
import 'package:classipod/features/device/presentation/device_frame.dart';
import 'package:classipod/features/menu/menu_screen.dart';
import 'package:classipod/features/music/album/album_selection_screen.dart';
import 'package:classipod/features/music/artists/artist_songs_screen.dart';
import 'package:classipod/features/music/artists/artists_selection_screen.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_album_selection_screen.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_screen.dart';
import 'package:classipod/features/music/music_menu_screen.dart';
import 'package:classipod/features/music/songs/songs_screen.dart';
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
  nowPlaying,
  music,
  coverFlow,
  coverFlowSelection,
  artists,
  artistSongs,
  albums,
  songs;

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
      case nowPlaying:
        return context.localization.nowPlayingScreenTitle;
      case music:
        return context.localization.musicMenuScreenTitle;
      case coverFlow:
        return context.localization.coverFlowScreenTitle;
      case coverFlowSelection:
        return context.localization.coverFlowSelectionScreenTitle;
      case artists:
        return context.localization.artistsScreenTitle;
      case artistSongs:
        return context.localization.artistSongsScreenTitle;
      case albums:
        return context.localization.albumsScreenTitle;
      case songs:
        return context.localization.songsScreenTitle;
    }
  }
}

// GoRouter configuration
final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: Routes.splash.toString(),
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) {
          return CupertinoPage(
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: CupertinoPageScaffold(
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
          GoRoute(
            path: Routes.menu.toString(),
            name: Routes.menu.name,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const MenuScreen(),
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
                path: Routes.settings.name,
                name: Routes.settings.name,
                pageBuilder: (context, state) => CupertinoPage(
                  key: state.pageKey,
                  child: const SettingsScreen(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.about.name,
                    name: Routes.about.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const AboutScreen(),
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: Routes.nowPlaying.name,
                name: Routes.nowPlaying.name,
                pageBuilder: (context, state) => CupertinoPage(
                  key: state.pageKey,
                  child: const NowPlayingScreen(),
                ),
              ),
              GoRoute(
                path: Routes.music.name,
                name: Routes.music.name,
                pageBuilder: (context, state) => CupertinoPage(
                  key: state.pageKey,
                  child: const MusicMenuScreen(),
                ),
                routes: [
                  GoRoute(
                    path: Routes.coverFlow.name,
                    name: Routes.coverFlow.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const CoverFlowScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.coverFlowSelection.name,
                        name: Routes.coverFlowSelection.name,
                        pageBuilder: (context, state) => CupertinoModalPage(
                          context: context,
                          useRootNavigator: false,
                          builder: (context) => CoverFlowAlbumSelectionScreen(
                            albumName:
                                state.uri.queryParameters['albumName'] ?? '',
                            artistName:
                                state.uri.queryParameters['artistName'] ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.artists.name,
                    name: Routes.artists.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const ArtistsSelectionScreen(),
                    ),
                    routes: [
                      GoRoute(
                        path: Routes.artistSongs.name,
                        name: Routes.artistSongs.name,
                        pageBuilder: (context, state) => CupertinoPage(
                          key: state.pageKey,
                          child: ArtistSongsScreen(
                            artistName:
                                state.uri.queryParameters["artistName"] ??
                                    context.localization.unknownArtist,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Routes.albums.name,
                    name: Routes.albums.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const AlbumsSelectionScreen(),
                    ),
                  ),
                  GoRoute(
                    path: Routes.songs.name,
                    name: Routes.songs.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      child: const SongsScreen(),
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
);
