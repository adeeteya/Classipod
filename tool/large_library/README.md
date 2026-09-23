# Large-library tests

Run from the repository root after installing Python 3.10+, FFmpeg (with
libmp3lame), and the project's Flutter SDK:

```sh
flutter pub get --suppress-analytics
flutter gen-l10n
python3 scripts/large_library.py --tracks 1000
python3 scripts/large_library.py --tracks 10000
python3 scripts/large_library.py --tracks 50000
python3 -m unittest discover -s scripts -p 'test_large_library.py'
```

On Windows, use `python` instead of `python3`. Flutter and FFmpeg must be on
PATH. No extra Python packages are required. Tests live outside `test/`, so the
normal `flutter test --no-pub --coverage --suppress-analytics` command remains
independent of FFmpeg and the stress suite.

## Inputs and isolation

The generator encodes 300 one-second templates: MP3, FLAC, and PCM WAV for each
of 100 albums by 20 artists. It generates its own PNG artwork and copies these
templates to distinct nested paths, including Unicode and uppercase extensions.
Some albums omit track/year/genre tags; even-numbered albums have PNG artwork
in MP3/FLAC. WAV uses ASCII INFO tags and no artwork; Unicode metadata is tested
in MP3/FLAC and Unicode paths in all formats. This is a scale suite, not an
exhaustive format or tagging conformance suite.

FFmpeg writes WAV track numbers as `IPRT`, while the current metadata reader
recognizes `ITRK`. The generator explicitly changes that chunk identifier to
`ITRK` for this corpus. Support for FFmpeg's `IPRT` spelling remains a separate
format-compatibility gap; this suite does not silently accept a dropped tag.
Missing MP3 years are expected to be `0`, matching the dependency's explicit
`DateTime(0)` fallback; missing FLAC/WAV years are expected to be null.

Each tier creates both a clean library and a mixed library. The mixed library
adds empty/truncated files, unsupported text, and a missing MP3 path (explicit
file imports only). Each contains exactly the requested number of valid tracks.
The manifest follows `manifest.schema.json`; expected metadata comes from the
generation recipe, not the parser's output. MP3 duration allows 100 ms for codec
padding; FLAC/WAV allow 1 ms. Bitrate must be positive, but is not compared across
formats because the dependency exposes format-dependent units. Reopening checks
every persisted field exactly, including bitrate and original index.

Expect approximately 80 MB for both 1,000-track libraries, 0.8 GB at 10,000, and
4 GB at 50,000, plus templates, manifests, snapshots and databases. Files are real
copies, not symlinks or hardlinks. Existing `test/test_files/` music and artwork
are never used as writable outputs, modified, or deleted.

Each invocation owns a newly created OS temporary directory. Each import gets
fresh thumbnail and Hive directories. Successful and failed runs clean up only
that invocation's temporary directory. Use `--keep` to retain it for debugging.
Logs and reports survive cleanup in a unique `build/large-library/run-*` folder;
`--report-dir` changes its parent without deleting or reusing existing folders.

## Assertions and measurements

For each profile, both repository entry points run via `compute`, twice, in
separate Flutter processes. The worker verifies exact valid path sets/counts,
all recipe metadata, duration, and artwork bytes. It writes Hive using production
adapters, flushes/closes it, and saves a full-field snapshot. A fresh process
reopens the database and checks both the manifest and snapshot. No filesystem
enumeration ordering or deduplication behavior is assumed.
Normalized full-field snapshots must also match across repeated imports and
entry points, excluding traversal indices and temporary thumbnail directories.

A separate synthetic worker creates the same number of metadata records with
ten tracks per album, two discs per album, and 100 artists. It overrides the
library provider and tests production song sorting, album grouping/order, and
empty, absent, exact, case-insensitive, broad, artist and album searches.

`report.json` includes generation time, per-case parse/Hive write/Hive reopen
times, sort/group/search times, input/thumbnail/database bytes, OS, Python,
Flutter/Dart, FFmpeg, and Git revision. Each case has a separate log and result.
Peak RSS is the entire Flutter **test worker** (all its isolates, runtime and
Hive), excluding the launcher/compiler; it is not parser-only memory. Assertions
and snapshots contribute to this peak. Runtime measurements exclude generation,
compilation and assertions. Runs are fresh application processes, not controlled
cold OS filesystem-cache benchmarks.

Each external command has a 30-minute watchdog by default; change it with
`--timeout-seconds`. On timeout the runner kills the process tree and exits
nonzero. Crashes, incorrect imports, artwork mismatches and persistence failures
also exit nonzero. Timing and memory are reported without universal thresholds;
compare baselines on the same machine/toolchain before introducing gates.

## CI and boundaries

PR checks run the 1,000-track suite on Linux. The stress workflow runs only by
manual dispatch, which selects a tier and can include Windows/macOS for release
validation. Metrics and failure logs are
uploaded even when tests fail.

This tests repository import and Hive operations, not OS media discovery,
picker orchestration, UI frame timing, or playback. Android/iOS device testing
and browser playback/import need their own integration suite. Short clips prove
record-count scaling, not behavior with huge individual audio files or artwork.
