# Phase 0 안정화 모바일 검증

## 기준

- Forest Arena, `com.forestarena.welllbeing`, Android 10/API 29 이상.
- arm64-v8a 실제 기기 ABI와 x86_64 에뮬레이터 ABI, 가로 immersive 화면.
- cold start, Home 중단, hot resume와 포커스 손실 시 의미 입력 해제.

## 실행 절차

1. `./scripts/export-debug-android.sh`
2. `./scripts/verify-android-package.sh build/android/ForestArena-debug.apk`
3. `./scripts/verify-android-emulator.sh build/android/ForestArena-debug.apk`

## 실행 결과

- `./scripts/export-debug-android.sh` — pass. 현재 소스에서 `build/android/ForestArena-debug.apk`를 재생성했다.
- APK 계약 — pass. Forest Arena 표시명, `com.forestarena.welllbeing`, API 29/36, arm64-v8a·x86_64, 가로 화면과 개발 파일 제외를 확인했다.
- `./scripts/verify-android-emulator.sh build/android/ForestArena-debug.apk` — pass on `emulator-5554` / `AnimalFight_API_35`.
- 설치, COLD 시작, 활성 가로 viewport, Home 중단과 HOT 복귀를 확인했다.
- 의미 입력 해제는 `PHASE0_SMOKE`의 다중 포인터와 `release_all_touches` 회귀로 확인했다.
- 실제 Galaxy S23 Ultra — 미검증. 기기 pass로 기록하지 않는다.
