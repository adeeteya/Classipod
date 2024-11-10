import 'package:classipod/core/custom_scroll_behavior.dart';
import 'package:classipod/screens/about_screen.dart';
import 'package:classipod/screens/device/device_frame.dart';
import 'package:classipod/screens/menu_screen.dart';
import 'package:classipod/screens/music_screens/album_selection_screen.dart';
import 'package:classipod/screens/music_screens/artist_songs_screen.dart';
import 'package:classipod/screens/music_screens/artists_selection_screen.dart';
import 'package:classipod/screens/music_screens/cover_flow_screen.dart';
import 'package:classipod/screens/music_screens/music_menu_screen.dart';
import 'package:classipod/screens/music_screens/songs_screen.dart';
import 'package:classipod/screens/now_playing_screen.dart';
import 'package:classipod/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  menu,
  settings,
  about,
  nowPlaying,
  music,
  coverFlow,
  artists,
  artistSongs,
  albums,
  songs;

  @override
  String toString() {
    return "/$name";
  }
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.menu.toString(),
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
          path: Routes.menu.toString(),
          name: Routes.menu.name,
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            maintainState: false,
            child: const MenuScreen(),
          ),
          routes: [
            GoRoute(
                path: Routes.settings.name,
                name: Routes.settings.name,
                pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      maintainState: false,
                      child: const SettingsScreen(),
                    ),
                routes: [
                  GoRoute(
                    path: Routes.about.name,
                    name: Routes.about.name,
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      maintainState: false,
                      child: const AboutScreen(),
                    ),
                  ),
                ]),
            GoRoute(
              path: Routes.nowPlaying.name,
              name: Routes.nowPlaying.name,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                maintainState: false,
                child: const NowPlayingScreen(),
              ),
            ),
            GoRoute(
              path: Routes.music.name,
              name: Routes.music.name,
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                maintainState: false,
                child: const MusicMenuScreen(),
              ),
              routes: [
                GoRoute(
                  path: Routes.coverFlow.name,
                  name: Routes.coverFlow.name,
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const CoverFlowScreen(),
                  ),
                ),
                GoRoute(
                  path: Routes.artists.name,
                  name: Routes.artists.name,
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const ArtistsSelectionScreen(),
                  ),
                  routes: [
                    GoRoute(
                      path: ":artistName",
                      name: Routes.artistSongs.name,
                      pageBuilder: (context, state) => CupertinoPage(
                        key: state.pageKey,
                        maintainState: false,
                        child: ArtistSongsScreen(
                            artistName: state.pathParameters["artistName"] ??
                                "Unknown Artist"),
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: Routes.albums.name,
                  name: Routes.albums.name,
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const AlbumsSelectionScreen(),
                  ),
                ),
                GoRoute(
                  path: Routes.songs.name,
                  name: Routes.songs.name,
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
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
);
