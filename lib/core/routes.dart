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

// GoRouter configuration
final router = GoRouter(
  initialLocation: "/menu",
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
          path: "/menu",
          name: "Menu",
          pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            maintainState: false,
            child: const MenuScreen(),
          ),
          routes: [
            GoRoute(
                path: "settings",
                name: "Settings",
                pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      maintainState: false,
                      child: const SettingsScreen(),
                    ),
                routes: [
                  GoRoute(
                    path: "about",
                    name: "About",
                    pageBuilder: (context, state) => CupertinoPage(
                      key: state.pageKey,
                      maintainState: false,
                      child: const AboutScreen(),
                    ),
                  ),
                ]),
            GoRoute(
              path: "now-playing",
              name: "Now Playing",
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                maintainState: false,
                child: const NowPlayingScreen(),
              ),
            ),
            GoRoute(
              path: "music",
              name: "Music",
              pageBuilder: (context, state) => CupertinoPage(
                key: state.pageKey,
                maintainState: false,
                child: const MusicMenuScreen(),
              ),
              routes: [
                GoRoute(
                  path: "cover-flow",
                  name: "Cover Flow",
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const CoverFlowScreen(),
                  ),
                ),
                GoRoute(
                  path: "artists",
                  name: "Artists",
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const ArtistsSelectionScreen(),
                  ),
                  routes: [
                    GoRoute(
                      path: ":artistName",
                      name: "Artist Songs Screen",
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
                  path: "albums",
                  name: "Albums",
                  pageBuilder: (context, state) => CupertinoPage(
                    key: state.pageKey,
                    maintainState: false,
                    child: const AlbumsSelectionScreen(),
                  ),
                ),
                GoRoute(
                  path: "songs",
                  name: "Songs",
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
