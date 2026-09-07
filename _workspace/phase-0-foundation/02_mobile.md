# Phase 0 모바일 기록

- Android export template 4.7.1.stable, JDK 17과 Android SDK/ADB 설치를 확인했다.
- export preset은 가로, immersive, edge-to-edge, arm64-v8a와 에뮬레이터용 x86_64를 사용한다.
- 최소 SDK는 Android 10(API 29), target SDK는 API 36으로 명시하고 생성 APK의 manifest를 `aapt`로 검사한다.
- API 재정의를 위해 프로젝트 로컬 Gradle template을 사용하되 `android/build/`은 재생성 가능한 산출물로 취급한다.
- `_workspace`, `docs`, `tests`, `.agents`는 APK에서 제외하고 package 검사로 누출 회귀를 막는다.
- package ID는 사용자 승인에 따라 `com.foresttales.welllbeing`으로 확정했다.
- 향후 실제 기기 기준대상은 Galaxy S23 Ultra이며 당분간 에뮬레이터만 사용한다.
- ADB에서 arm64 Android 에뮬레이터가 연결된 것을 확인했다. 에뮬레이터 검증은 실제 물리 기기 pass가 아니다.
