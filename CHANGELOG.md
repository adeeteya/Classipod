## 2.0.0 (Unreleased)

- Make Immersive Mode toggle native fullscreen on macOS, Windows, and Linux,
  restoring the saved preference at startup.

- Add a saved filename-based duplicate filter in Library Settings. Keep
  the first visible copy without deleting files or saved playlist entries.

- Add a saved Hide Local Music setting while Subsonic is enabled, with
  immediate catalog updates and local music restored when Subsonic is off.

- Update music browsing screens when the library changes so Subsonic songs
  appear after connection or enabling without starting playback. Avoid
  awaiting an artwork request from its own cleanup callback.

- Fix first-run splash hanging after local indexing by preventing newly
  discovered folders from invalidating the pending library load.

- Delay the Now Playing buffering spinner by one second to avoid flashing
  during brief track changes and seeks.

- Prepare the initial library queue without native playback calls; avoid
  rebuilding the catalog for scan progress or unchanged directory lists.
  Update menu counts and artwork when the library arrives asynchronously.

- Release stalled native seeks after stream failures so recovery and track
  controls remain responsive; resume at the requested seek position.

- Preserve server playback position across network interruptions, show a
  spinner on the Now Playing progress bar, and retry with backoff to resume.

- Show a connection-lost message and Retry action in Now Playing when a
  server stream fails due to a network interruption.

- Hide errors from excluded folders in Missing Tracks, updating immediately
  when directory exclusions change.

- Ignore delayed menu preview updates after navigation or library refresh
  removes the originating screen, preventing disposed-widget errors.

- Move per-file read failures from splash into a conditional Missing Tracks
  settings page with song names, file locations, and retry guidance. Continue
  indexing other songs when a tag reader throws.

- Show initial server indexing in the connection dialog with retry and
  continue-in-background actions; move background status into its preview.

- Keep Library Settings and its preview stable behind the Subsonic dialog
  when the keyboard opens; keep dialog fields and actions above the keyboard.

- Defer opening local audio until playback so an unavailable first track
  cannot leave startup waiting on the splash screen.

- Allow native HTTP Subsonic connections to user-configured hosts, including
  local IP addresses, for indexing, artwork, and audio playback.

- Handle playback failures without uncaught UI exceptions and identify
  platform-blocked HTTP streams with an actionable HTTPS message.

- Update flutter_secure_storage to 11.2.0.

- Add a Subsonic server connection in Library Settings, with secure native
  credentials, session-only Web sign-in, cached catalog/artwork, and streaming.
  Merge server music with local tracks and preserve server playlist entries
  when disconnected. Web servers must allow CORS; HTTP access follows each
  platform's transport restrictions.

- Add optional iOS and macOS GitHub release jobs: an unsigned sideloadable IPA
  and a universal, ad-hoc-signed DMG without Developer ID or notarization.
  Include SHA-256 checksums and Apple installation/build documentation.

- Select a parent music folder on iOS and macOS on first launch or Settings
  rescan, remember access across launches, and recursively cache metadata and
  artwork using the shared library indexer.

- Show song and artwork counters only for initial indexing or re-indexing,
  keeping normal cached startup free of briefly flashing totals.

- Restart splash initialization on manual rescan, resetting progress and
  rebuilding playback after forced metadata and artwork extraction.

- Split artist and album-artist tags on &, ;, commas, //, ft., x, featuring,
  and feat, while preserving single slashes and genre names.

- Read metadata and cache embedded artwork in one file open per song, with
  live startup counts and repair of missing artwork on cached songs.

- Fix web playback repeating the first loaded song when selecting or skipping
  tracks; reset the web audio backend before replacing its source.

- Enable built-in Kotlin for the Android app and both audio plugins.
- Pin flutter_taglib to the adeeteya fork, with native binaries and source
  archives hosted in that fork’s releases.

- Remove obsolete iOS CocoaPods integration; use Swift Package Manager
  for all iOS plugin dependencies.

- Update on_audio_query to use its iOS Swift Package Manager implementation.

- Remove obsolete macOS CocoaPods integration; use Swift Package Manager
  for macOS plugin dependencies.

- Add the missing macOS dev scheme and CocoaPods configuration mapping so
  the Android Studio development configuration can select the dev flavor.
  Use local ad-hoc signing for Debug-dev without a development certificate.

- Use TagLib for metadata and artwork on every native platform; remove
  audio_metadata_reader while keeping cache version 1.

- Share bounded playback queues across Android, iOS, macOS, Windows, Linux,
  and web; remove the separate full-native-queue playback path.
- Share incremental indexing, artwork caching, progress, and `library_v1`
  storage for native libraries, with MediaStore and file-picker adapters.
- Remember selected folders/files between launches and keep metadata parsing
  off the UI isolate on desktop and iOS.

- Fix Android playback crashes on large libraries by keeping the queue in Dart
  and loading only the current track into the native player and media session.

- Refactor Android library discovery and incremental metadata indexing with TagLib.
- Preserve album artists and ambiguous artist names.
- Delete the legacy Android metadata cache and scan afresh for 2.0; old ratings
  are not migrated. Subsequent scans retain ratings from the new library.
- Show song and artwork cache progress above the startup loader.
- Repair missing artwork caches and reconcile library changes on startup.

[🚀 updated CI/CD to build Windows installer](https://github.com/adeeteya/Classipod/commit/3fc038606228a9c1e70404b7b902806a97c89324)

[✨ added ability to run debug app without keystore](https://github.com/adeeteya/Classipod/commit/549c6cfec0bb33ae0b565b42a8077dc458a9ac1e)

[🐛 fixed playlist deletion bugs](https://github.com/adeeteya/Classipod/commit/ca6409c3a59346090b417392ddef53bdc3bd4a22)

[✨ added CI/CD with build boolean inputs](https://github.com/adeeteya/Classipod/commit/6f7846d7dd17f824e7da79bad5c867b9ddc511fd)
