#!/usr/bin/env bash

set -euo pipefail

run() {
    TOOLCHAIN=com.apple.dt.toolchain.XcodeDefault
    IOS_VERSION=${IOS_VERSION:-17.0.1}
    SDK=${SDK:-iphonesimulator17.2}
    BUILD_DIR="$(PWD)/.xcbuild"

    SCHEME=FooPackageTests
    PROJECT=App/ABigFoo.xcodeproj
    BUNDLE_PATH="$(PWD)/$SCHEME.xcresult"
    DESTINATION="platform=iOS Simulator,OS=$IOS_VERSION,name=iPhone 12 Pro"
    rm -rf "$BUILD_DIR"
    rm -rf "$BUNDLE_PATH"
    xcrun --toolchain "$TOOLCHAIN" \
            xcodebuild test \
            -project "$PROJECT" \
            -toolchain "$TOOLCHAIN" \
            -configuration Debug \
            -destination "$DESTINATION"  \
            -scheme "$SCHEME" \
            -enableCodeCoverage YES \
            -derivedDataPath "$BUILD_DIR" \
            -skipPackagePluginValidation \
            -disableAutomaticPackageResolution \
            -quiet \
            -resultBundlePath "$BUNDLE_PATH"
}

run