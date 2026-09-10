#!/bin/sh
set -eu

apk_path=${1:-build/android/ForestArena-debug.apk}
package_id=com.forestarena.welllbeing
android_sdk_path=${ANDROID_SDK_ROOT:-${ANDROID_HOME:-}}

if [ -z "$android_sdk_path" ]; then
	android_sdk_path="$HOME/Library/Android/sdk"
fi

adb_path="$android_sdk_path/platform-tools/adb"
if [ ! -x "$adb_path" ]; then
	echo "Android adb not found: $adb_path" >&2
	exit 1
fi
if [ ! -f "$apk_path" ]; then
	echo "APK not found: $apk_path" >&2
	exit 1
fi

emulator_serial=$($adb_path devices | awk '$1 ~ /^emulator-/ && $2 == "device" { print $1; exit }')
if [ -z "$emulator_serial" ]; then
	echo "No Android emulator is connected" >&2
	exit 1
fi

$adb_path -s "$emulator_serial" wait-for-device
$adb_path -s "$emulator_serial" install -r "$apk_path"
$adb_path -s "$emulator_serial" shell am force-stop "$package_id"

cold_start=$($adb_path -s "$emulator_serial" shell am start -W -n "$package_id/com.godot.game.GodotAppLauncher")
printf '%s\n' "$cold_start"
if ! printf '%s\n' "$cold_start" | grep -F "Status: ok" >/dev/null; then
	echo "Android emulator cold start failed" >&2
	exit 1
fi

$adb_path -s "$emulator_serial" shell input keyevent KEYCODE_HOME
hot_resume=$($adb_path -s "$emulator_serial" shell am start -W -n "$package_id/com.godot.game.GodotAppLauncher")
printf '%s\n' "$hot_resume"
if ! printf '%s\n' "$hot_resume" | grep -F "Status: ok" >/dev/null; then
	echo "Android emulator hot resume failed" >&2
	exit 1
fi

activities=$($adb_path -s "$emulator_serial" shell dumpsys activity activities)
if ! printf '%s\n' "$activities" | grep -F "topResumedActivity=" | grep -F "$package_id/com.godot.game.GodotAppLauncher" >/dev/null; then
	echo "Forest Arena is not the top resumed activity" >&2
	exit 1
fi

input_state=$($adb_path -s "$emulator_serial" shell dumpsys input)
if ! printf '%s\n' "$input_state" | grep -E 'Viewport INTERNAL: displayId=0.*orientation=(1|3).*logicalFrame=.*isActive=\[1\]' >/dev/null; then
	echo "Forest Arena is not running in an active landscape viewport" >&2
	exit 1
fi

echo "Android emulator install, landscape, cold start, background, and hot resume passed: $emulator_serial"
