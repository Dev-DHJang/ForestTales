# Android 검증

- APK: `build/android/ForestArena-debug.apk`
- SHA-256: `53a4bf2c1624d1e2f8c87f2baca0651046e0699934f8c41adede39ef8e18451b`
- package contract: `./scripts/verify-android-package.sh build/android/ForestArena-debug.apk` — pass.
- emulator: `AnimalFight_API_35`, `emulator-5554`, `sdk_gphone64_arm64`, API 35, `arm64-v8a`.
- lifecycle: `./scripts/verify-android-emulator.sh build/android/ForestArena-debug.apk` — install, cold start, active landscape, D-pad/jump touch diagnostic, Home pause, hot resume, input reset pass.
- 실제 Galaxy S23 Ultra: 연결된 기기가 없어 미검증. 이 결과는 물리 기기 pass가 아니다.
