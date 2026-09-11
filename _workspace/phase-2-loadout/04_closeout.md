# 종료 기록

상태: complete.

- `./scripts/verify.sh`, `git diff --check` 통과.
- 2026-09-12에 `build/android/ForestArena-debug.apk` (SHA-256 `53a4bf2c1624d1e2f8c87f2baca0651046e0699934f8c41adede39ef8e18451b`)의 `verify-android-package.sh`를 재실행해 package ID, API 29/36, ABI, landscape, 개발 파일 제외 계약을 통과했다.
- 같은 APK를 `AnimalFight_API_35` (`sdk_gphone64_arm64`, API 35, arm64-v8a)에 설치해 cold start, landscape, touch, Home pause, hot resume 및 입력 해제를 통과했다.
- Galaxy S23 Ultra 등 실제 Android 기기는 연결·실행 권한이 없어 계속 미검증이며, pass로 간주하지 않는다.
- PR #8이 `develop`에 병합됐다. merge SHA: `c256070fca6e36f0fb97c98b05f956488ffe0e48`.
