## Unreleased

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
