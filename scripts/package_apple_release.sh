#!/bin/bash
# Build downloadable Apple artifacts without an Apple developer account.
set -euo pipefail

platform="${1:-}"
if [[ "$platform" != ios && "$platform" != macos ]]; then
  echo "Usage: bash scripts/package_apple_release.sh ios|macos" >&2
  exit 2
fi
if [[ "$(uname -s)" != Darwin ]]; then
  echo "Apple releases require macOS with Xcode and Flutter installed." >&2
  exit 1
fi

cd "$(dirname "$0")/.."
repository="$PWD"
output="$repository/build/releases"
mkdir -p "$output"
staging="$(mktemp -d "$output/.apple-release.XXXXXX")"
trap 'rm -rf "$staging"' EXIT

if [[ "$platform" == ios ]]; then
  flutter build ios --release --no-pub --suppress-analytics \
    --flavor production --target lib/main.dart --no-codesign

  app="$repository/build/ios/iphoneos/Runner.app"
  test -d "$app"
  mkdir -p "$staging/Payload"
  ditto "$app" "$staging/Payload/Runner.app"
  # Do not ship any provisioning profile left over from a developer build.
  rm -f "$staging/Payload/Runner.app/embedded.mobileprovision"
  artifact=Classipod-iOS.ipa
  # The archive must contain Payload/ at its root (not the staging directory).
  ditto -c -k --norsrc --keepParent "$staging/Payload" "$staging/$artifact"
  unzip -tq "$staging/$artifact"
else
  # Override project-local development signing without changing the project.
  # Apple Silicon requires ad-hoc code signatures, even without Developer ID.
  cat > "$staging/Unsigned.xcconfig" <<'XCCONFIG'
CODE_SIGN_IDENTITY = -
CODE_SIGN_STYLE = Manual
DEVELOPMENT_TEAM =
PROVISIONING_PROFILE_SPECIFIER =
CODE_SIGNING_ALLOWED = YES
CODE_SIGNING_REQUIRED = YES
CODE_SIGN_INJECT_BASE_ENTITLEMENTS = NO
ARCHS = arm64 x86_64
ONLY_ACTIVE_ARCH = NO
XCCONFIG
  XCODE_XCCONFIG_FILE="$staging/Unsigned.xcconfig" \
    flutter build macos --release --no-pub --suppress-analytics \
      --target lib/main.dart

  app="$repository/build/macos/Build/Products/Release/classipod.app"
  test -d "$app"
  # Fail rather than label a single-architecture app as universal.
  lipo "$app/Contents/MacOS/classipod" -verify_arch arm64 x86_64
  codesign --verify --deep --strict "$app"
  codesign -dv "$app" 2>&1 | grep -q '^Signature=adhoc$'
  mkdir -p "$staging/dmg"
  ditto "$app" "$staging/dmg/classipod.app"
  ln -s /Applications "$staging/dmg/Applications"
  artifact=Classipod-macOS.dmg
  hdiutil create -volname ClassiPod -srcfolder "$staging/dmg" \
    -format UDZO "$staging/$artifact"
  hdiutil verify "$staging/$artifact"
fi

mv -f "$staging/$artifact" "$output/$artifact"
cd "$output"
shasum -a 256 "$artifact" > "$artifact.sha256"
echo "Created $output/$artifact"
