# Android 검증

- APK: `build/android/ForestArena-debug.apk`
- SHA-256: `53a4bf2c1624d1e2f8c87f2baca0651046e0699934f8c41adede39ef8e18451b`
- package contract: `./scripts/verify-android-package.sh build/android/ForestArena-debug.apk` — pass.
- emulator: `AnimalFight_API_35`, `emulator-5554`, `sdk_gphone64_arm64`, API 35, `arm64-v8a`.
- lifecycle: `./scripts/verify-android-emulator.sh build/android/ForestArena-debug.apk` — install, cold start, active landscape, D-pad/jump touch diagnostic, Home pause, hot resume, input reset pass.
- 실제 Galaxy S23 Ultra: `SM-S918N`, Android API 36, `arm64-v8a`. APK 설치·cold start·3088×1440 landscape·D-pad/점프 touch diagnostic·Home pause·hot resume·입력 해제 pass.
- 기기 관측: 총 PSS 366,360KB, `gfxinfo` GPU frame sample 99th percentile 2ms, thermal status 0(normal). 이는 장시간 성능 목표의 합격 판정이 아닌 해당 검증 세션의 관측값이다.
