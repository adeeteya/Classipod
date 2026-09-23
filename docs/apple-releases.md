# Apple release downloads

ClassiPod publishes Apple downloads through GitHub Releases without an Apple
Developer Program account:

| Artifact | Purpose | Signing |
| --- | --- | --- |
| `Classipod-iOS.ipa` | iPhone/iPad sideloading, iOS 15+ | No distribution signature; the user's sideloading tool signs it |
| `Classipod-macOS.dmg` | Apple Silicon and Intel Macs, macOS 12+ | App has a local ad-hoc signature; no Developer ID or notarization |

The iOS build is for physical devices, not the simulator. Neither artifact is
an App Store or TestFlight upload. “Unsigned” macOS distribution here means no
certificate-backed developer identity: Apple Silicon still needs ad-hoc code
signatures. The app's sandbox and folder-access entitlements are retained.

## Run the release workflow

1. Set `version:` in `pubspec.yaml` to the intended app version and build number
   (for example, `1.12.0+25`) and commit the release changes.
2. Open **Actions → Build and Deploy Releases → Run workflow**.
3. Choose the branch/ref and release tag (`version_number`, for example
   `v1.12.0`). The tag input names the GitHub release; Apple app versions come
   from `pubspec.yaml`, not the tag input.
4. Enable **iOS**, **macOS**, or both. Disable Android, Linux, Windows, and web
   if only Apple downloads are wanted. Existing Android store deployment still
   runs when Android is enabled.
5. Wait for the selected jobs to finish. Each uploads its installer and
   `.sha256` file to the release, and retains a copy as an Actions artifact.

The Apple jobs run on `macos-26`, use the Flutter version from `pubspec.yaml`,
and call the shared Fastlane lane through the existing `ios/Gemfile` bundle.
They wait for the release-creation job, so uploads cannot race release creation.
New releases target the workflow's commit. When reusing an existing tag, select
its matching ref to avoid publishing a different commit's binaries under it.
Rerunning a job replaces that platform's same-named release assets.

Apple jobs and release creation use `GITHUB_TOKEN` with `contents: write`, or the
existing `GH_TOKEN` secret when configured. No Apple signing secrets are needed.
The other platform jobs retain their existing credential requirements.

## Build locally

Use a Mac with Xcode selected by `xcode-select`, its platform SDKs installed,
and the Flutter version required by `pubspec.yaml`. Install the Ruby version
used by the workflow (currently 3.2.2) and Bundler, then run:

```sh
cd ios
bundle install
bundle exec fastlane build_apple_release platform:ios
bundle exec fastlane build_apple_release platform:macos
```

Both commands fetch dependencies, regenerate Hive adapters and localizations,
then call `scripts/package_apple_release.sh`. Outputs are in `build/releases/`.
Review generated-file changes before committing. The lane does not publish.

For packaging development, after preparing dependencies/generated files, the
underlying commands can also be run from the repository root:

```sh
bash scripts/package_apple_release.sh ios
bash scripts/package_apple_release.sh macos
```

The iOS command builds the `production` scheme in release mode with
`--no-codesign`, then packages `Payload/Runner.app` into the IPA. It excludes any
leftover embedded provisioning profile. The recipient must sign it with a
compatible sideloading tool; downloading it in Safari is not enough.

The macOS command builds the `Runner` scheme in release mode. A temporary Xcode
configuration overrides local team/certificate settings with ad-hoc signing and
requests both `arm64` and `x86_64`. It verifies the executable architectures and
app signatures, then uses the built-in `hdiutil` to make a compressed DMG with
an Applications shortcut. It does not contact Apple's notarization service.
Temporary packaging files are removed after success or failure.

## Verify downloaded artifacts

Download the installer and its matching `.sha256` file into the same directory:

```sh
shasum -a 256 -c Classipod-iOS.ipa.sha256
shasum -a 256 -c Classipod-macOS.dmg.sha256
```

Checksums detect download corruption; they do not replace a trusted developer
signature. The packaging script also checks IPA archive integrity and DMG
integrity before emitting a checksum.

Before publishing a release:

- Sideload the IPA onto a physical iPhone/iPad and verify folder selection,
  indexing, artwork, playback, and reopening the saved folder after relaunch.
- Install the DMG on Apple Silicon and Intel Macs. Verify folder access after
  relaunch, artwork, playback, and Settings → Rescan Music Files.
- Test a browser-downloaded DMG to exercise Gatekeeper; a local build does not
  reproduce the downloaded-file quarantine behavior.

## User installation

See the [README](../README.md#installing-on-iphone-or-ipad) for installation steps.
AltStore Classic users with free accounts must refresh apps every seven days
and are subject to the three-active-app limit, including AltStore itself.
This is separate from AltStore PAL and regional marketplace distribution.

For an unnotarized Mac app, Apple's per-app **Open Anyway** flow may be required.
Do not disable Gatekeeper globally. If macOS reports actual damage or malware,
stop and investigate the download rather than treating it as an ordinary
unidentified-developer warning.

- [AltStore Classic installation and limits](https://faq.altstore.io/altstore-classic)
- [Apple: safely open apps on your Mac](https://support.apple.com/en-us/102445)
- [Apple: Developer ID distribution](https://developer.apple.com/developer-id/)

A future Developer ID/notarization pipeline can replace the macOS ad-hoc signing
step. A public unsigned IPA will continue to require user-side signing unless a
separate Apple-supported distribution channel is adopted.
