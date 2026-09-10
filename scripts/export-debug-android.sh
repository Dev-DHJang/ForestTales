#!/bin/sh
set -eu

apk_path=build/android/ForestArena-debug.apk

if [ -f android/build/build.gradle ]; then
	godot --headless --path . --export-debug "Android Debug" "$apk_path"
else
	godot --headless --path . --install-android-build-template --export-debug "Android Debug" "$apk_path"
fi
./scripts/verify-android-package.sh "$apk_path"

echo "Android debug export passed: $apk_path"
