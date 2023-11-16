#!/usr/bin/env bash

set -euo pipefail

run() {
    TOOLCHAIN=com.apple.dt.toolchain.XcodeDefault
    SCHEME=FooPackageTests
    BUNDLE_PATH="$(PWD)/$SCHEME.xcresult"
    rm -rf "$BUNDLE_PATH"
    xcrun --toolchain "$TOOLCHAIN" \
            xcodebuild test \
            -project "App/ABigFoo.xcodeproj" \
            -toolchain "$TOOLCHAIN" \
            -configuration Debug \
            -destination 'platform=iOS Simulator,name=iPhone 14 Pro,OS=17.0.1'  \
            -sdk iphonesimulator17.0 \
            -scheme "$SCHEME" \
            -enableCodeCoverage YES \
            -skipPackagePluginValidation \
            -disableAutomaticPackageResolution \
            -quiet \
            -resultBundlePath "$BUNDLE_PATH"
}

run