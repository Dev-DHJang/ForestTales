# 프로젝트 하네스 통합 결정

## 통합 방식

- Expert Pool + Producer-Reviewer 구조와 15개 역할을 유지한다.
- 운영 색인이 역할, 검증 명령과 workspace 상태를 연결하고 team-spec은 규범·라우팅의 원본으로 유지한다.
- `verify.sh`는 전체 검증 진입점, `verify-harness.sh`는 하네스 구조 검사로 분리한다.

## 계약 검사

- concept 검사는 manifest의 모든 `type: concept` 기록을 탐색해 CharacterData, ID, 경로, 해시와 consumer 경로를 확인한다.
- motion 검사는 모든 `type: animation-runtime` 기록을 탐색해 시트, SpriteFrames, 16 프레임 atlas, FPS·loop, 해시와 consumer 경로를 확인한다.
- manifest에 없는 workspace 시안은 자동 검사 대상이 아니다.

## 정리 경계

- `.uid`와 추적된 `.import`는 보존한다.
- 무시된 `.godot`와 `.DS_Store`만 제거하고 Android export와 승인 자산은 보존한다.
