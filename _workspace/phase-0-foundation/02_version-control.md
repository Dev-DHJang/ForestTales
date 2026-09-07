# Phase 0 버전 관리 기록

## 초기 상태

- 작업 시작 시 현재 폴더는 Git 저장소가 아니었다.
- 원격 `https://github.com/Dev-DHJang/ForestTales.git`에는 `main`의 `765dec1 Initial commit`과 README만 있었다.

## 사용자 승인 후 구성

- 로컬 Git 저장소를 초기화하고 `origin`을 사용자 지정 URL로 등록했다.
- `main`과 로컬 `develop`은 `origin/main`의 `765dec1`을 기준으로 한다.
- 현재 변경은 `feature/phase-0-foundation`에 격리한다.
- `android/`, `.godot/`, APK와 빌드 산출물은 Git에서 제외한다.

## 완료 조건

- Phase 0 QA pass 뒤 관련 파일만 commit한다.
- 원격 `develop`과 feature branch를 push하고 PR 병합 SHA를 기록한다.
- 롤백은 최종 병합 commit의 revert로 수행한다.
