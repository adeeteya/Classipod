import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/core/custom_scroll_behavior.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/providers/music_provider.dart';
import 'package:retropod/screens/device/device_controls.dart';
import 'package:retropod/screens/device/device_frame.dart';
import 'package:retropod/screens/menu_screen.dart';
import 'package:retropod/screens/music_screens/album_selection_screen.dart';
import 'package:retropod/screens/music_screens/artist_songs_screen.dart';
import 'package:retropod/screens/music_screens/artists_selection_screen.dart';
import 'package:retropod/screens/music_screens/cover_flow_screen.dart';
import 'package:retropod/screens/music_screens/music_menu_screen.dart';
import 'package:retropod/screens/music_screens/songs_screen.dart';
import 'package:retropod/screens/now_playing_screen.dart';
import 'package:retropod/screens/settings_screen.dart';
import 'package:retropod/screens/status_bar/status_bar.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: "/menu",
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) {
        final size = MediaQuery.of(context).size;
        return CupertinoPage(
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: CupertinoPageScaffold(
              child: DeviceFrame(
                child: Column(
                  children: [
                    IgnorePointer(
                      child: Container(
                        height: size.height * 0.3865,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: context.isDarkMode
                                ? darkDeviceScreenColor
                                : lightDeviceScreenBorderColor,
                            width: 5,
                          ),
                        ),
                        child: Consumer(
                          builder: (context, ref, _) {
                            bool isLoading = ref.watch(musicProvider
                                .select((value) => value.isLoading));
                            if (isLoading) {
                              return Center(
                                child: SvgPicture.asset(
                                    "assets/icons/apple_logo.svg"),
                              );
                            } else {
                              return Column(
                                children: [
                                  const StatusBar(),
                                  Expanded(child: child),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                    const DeviceControls(),
                    const Spacer(),
                  ],
                ),
              ),
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
            ),
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
