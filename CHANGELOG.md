# Changelog

## 2.1.0
### New features

- Stream from Subsonic-compatible servers, including Navidrome. Configure and
  validate a connection in Library Settings; combine server and local tracks
  on native apps or replace the demo library on web.
- Cache server catalogs and artwork, refresh or reindex them, and keep saved
  ClassiPod playlist entries when disconnecting. Store native credentials in
  OS secure storage; keep web passwords only for the current session.
- Add Hide Local Music while Subsonic is enabled and a saved duplicate-filename
  filter that hides tracks without deleting files or playlist entries.
- Add Library Settings with refresh/reindex controls and a conditional Missing
  Tracks page listing unreadable files, their locations, and retry guidance.
- Add a sleep timer: 15, 30, 45, or 60 minutes, or the end of the current song.
- Add Off, Songs, and Albums shuffle modes in Settings and Now Playing. Album
  shuffle keeps disc and track order within each album.
- Restore the last queue and selected song after restarting, paused at the
  beginning. Skip unavailable tracks; start fresh if the selected track is
  missing or its first playback attempt fails.
- Add light/dark screen themes and an OLED Black device color.
- Add Original and Big Cover Flow layouts, spring-based wheel movement,
  custom artwork flight previews, and improved reflection/transition effects.
- Remember screen selection and scroll positions; scroll selected artist and
  album entries into view. Show an initial-letter indicator during fast scroll.
- Return to Now Playing after inactivity during playback. Return temporary
  rating/shuffle controls to progress after inactivity, while leaving lyrics
  open until the user advances manually.
- Preview scrubber positions and commit the seek after interaction, display
  queue position, and open More Options as a full screen.
- Add Windows system media controls and Linux MPRIS for track information,
  play/pause, and previous/next actions.
- Add native fullscreen Immersive Mode on macOS, Windows, and Linux, with the
  preference restored at startup.
- Bundle an iPod-inspired click sound on every platform, enabled by default
  for new preferences and settings resets.
- Add functional iOS support and remembered parent-folder access on iOS/macOS,
  including recursive scans of nested folders.
- Provide optional unsigned iOS IPA and universal Apple Silicon/Intel macOS
  DMG release downloads, with checksums and installation instructions.

### Library and browsing improvements

- Use TagLib for metadata and embedded artwork on all native platforms, reading
  both in one file pass. Share incremental indexing, caching, and progress
  across Android MediaStore and native folder/file discovery.
- Keep metadata parsing off the UI isolate on desktop/iOS, remember selected
  folders/files, repair missing artwork, and reconcile library changes at startup.
- Show song/artwork counters during initial indexing or reindexing, without
  briefly displaying them during a normal cached startup.
- Expand documented format support to MP4, Opus, AIFF, APE, and MOV, subject
  to the playback capabilities of each platform.
- Sort album songs by disc and track number; improve album-artist handling,
  artist-name parsing, and consistent name/song ordering. Split multi-artist
  tags while preserving single slashes and unsplit genre names.
- Show artist/album counts for genres, artist names in album views, and direct
  song navigation for artists with a single album.
- Refresh browsing screens, artwork, and menu counts as local/server catalogs
  change, without requiring playback to start.
- Improve typography, selected-title marquees, split-screen preview timing,
  status-bar entrances, progress/volume controls, and artwork animations.
- Improve French, Brazilian Portuguese, and Spanish translations and add
  localized strings for the new controls and server features.

### Bug fixes

- Fix Android crashes with large libraries by keeping a bounded queue in Dart
  and loading only the current track into the native player/media session.
  Use the shared queue behavior across native platforms and web.
- Fix first-run splash hangs after indexing and when the first local file is
  unavailable. Prepare the initial queue without opening audio until playback.
- Restart splash initialization and playback setup after a manual reindex;
  avoid rebuilding catalogs for progress-only or unchanged-folder updates.
- Continue indexing after per-file tag-reader failures. Keep errors out of the
  splash screen and hide Missing Tracks entries from excluded directories.
- Fix web playback repeating the first loaded song when selecting/skipping.
- Retry remote audio after temporary network failures while retaining playback
  position; release stalled native seeks and recover at the requested position.
  Show a connection-lost message with Retry when recovery needs user input.
- Handle playback errors without uncaught UI exceptions; explain blocked HTTP
  streams. Allow configured native HTTP servers, including LAN addresses.
- Delay the buffering spinner to avoid flashes during short transitions/seeks.
- Keep the prior server catalog after failed scans; show first-scan progress,
  retry, and continue-in-background actions in the connection dialog.
- Keep Library Settings and its preview stable when the server dialog keyboard
  opens, with fields and actions remaining accessible.
- Fix artwork cleanup awaiting itself, image-loading failures, incorrect online
  thumbnail paths, and unexpected album-art scrolling.
- Prevent duplicate-route/navigation races and late preview updates targeting
  disposed screens. Preserve Cover Flow headers during route transitions.
- Guard actions on empty playlists/song lists; improve search-field text/cursor
  contrast and allow a long press on the back-seek button to clear text.
- Correct elapsed/remaining-time display and Now Playing shuffle/seek actions.
- Avoid duplicate click/vibration feedback per scroll step; fix click sounds
  on Windows/Linux without interrupting music audio focus.

### Platforms and release tooling

- Move iOS/macOS plugins to Swift Package Manager, use forked TagLib and
  on_audio_query integrations, and enable Android built-in Kotlin.
- Update Flutter and dependencies, Android SDK/NDK settings, and Apple minimum
  deployment targets. Add Linux secure-storage dependencies and Windows build
  compatibility fixes.
- Add macOS development/production schemes and local ad-hoc development signing.
- Derive release versions from pubspec, select Google Play build numbers from
  existing uploads, and align platform metadata with 2.1.0.
- Package Windows with a pinned, checksum-verified Inno Setup compiler and
  improve uninstaller cleanup of app data/caches.
- Add Apple packaging/checksum jobs and web WebAssembly builds; improve native
  CI setup and avoid unrelated Linux runner package upgrades.
- Add large-library stress tooling and coverage for indexing, playback recovery,
  server integration, navigation, shuffle, and timers.
- Update README, store descriptions, Linux desktop/package metadata, web
  descriptions, and citation text for local music and Subsonic/Navidrome.
  Upload store descriptions and release notes with Google Play releases;
  keep image and screenshot uploads disabled.

### Upgrading from 1.12.0

- The legacy Android metadata cache is rebuilt. Ratings stored in that old
  cache are not migrated; later scans retain ratings in the new library.
- Local files remain playable offline. Server audio is streamed and needs a
  connection; only metadata/artwork are cached. Server playlist syncing and
  offline audio downloads are not included. Ratings/edits remain in ClassiPod.
- Web server access requires CORS and a browser-compatible HTTPS configuration;
  web passwords must be entered again after reload. Native HTTP is supported,
  but HTTPS is preferred. Linux credentials require a Secret Service provider.
- Restoring a session restores the song and queue, not its previous timestamp
  or automatic playback.
- iOS downloads require sideloading/signing. macOS downloads use ad-hoc signing
  and are not notarized. See [Apple releases](docs/apple-releases.md).
