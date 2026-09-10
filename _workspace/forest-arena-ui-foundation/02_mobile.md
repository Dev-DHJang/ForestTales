# 모바일 산출물

- Godot 표시명과 Android label을 `Forest Arena`로 변경했다.
- package ID를 `com.forestarena.welllbeing`, debug APK를 `build/android/ForestArena-debug.apk`로 변경했다.
- export·APK·에뮬레이터 검증 스크립트의 기본값을 같은 계약으로 갱신했다.
- 기존 앱 ID와 달라 별도 앱으로 설치되며 기존 ForestTales 설치본을 자동 삭제하지 않는다.
- ABI arm64-v8a/x86_64, 최소 API 29, target API 36과 가로 화면 계약은 유지했다.
- Penpot 1920×1080은 설계 참조이고 런타임 1280×720은 변경하지 않았다.
- 실제 물리 Android 기기는 이번 작업에서도 미검증이다.
