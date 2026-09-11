# 종료 기록

상태: partial — 재현 가능한 APK·에뮬레이터 검증 부채는 해소했고, 실제 Galaxy S23 Ultra 검증은 남아 있다.

- 완료: APK package contract, `AnimalFight_API_35` 설치·cold start·landscape·touch·Home pause/hot resume·입력 해제, Godot resource verifier, 전체 회귀.
- 미확인: Galaxy S23 Ultra를 포함한 실제 Android 기기의 설치·터치·중단/복귀·성능.
- 재개 조건: USB 또는 무선 ADB로 실제 Galaxy S23 Ultra를 연결한 뒤 동일 APK에 대해 설치·가로·터치·Home pause/hot resume·입력 해제와 성능을 실행한다.
- 원격: 검증 증적 커밋 `1fd4598`은 `origin/feature/verification-debt-cleanup`으로 푸시했다. `gh pr create`는 GitHub CLI 로그인 또는 `GH_TOKEN` 부재로 blocked이며, PR·develop 병합은 아직 없다.
- 원격 통합 재개 조건: PR/병합 권한이 있는 `gh auth login` 또는 `GH_TOKEN`을 제공한다.
- 원본 작업 트리의 `project.godot` 미커밋 변경은 이 작업이 수정하지 않았다.
