# 캐릭터 외형 계약 버전 관리

- 기준: `origin/develop`의 `2b289546dd58cdeb0a094ebf08c05ce1bb154ec8`.
- 작업 브랜치: `feature/character-appearance-contract`.
- 기능 커밋: `248b24c feat: define approved character appearance contract`.
- PR: [#4](https://github.com/Dev-DHJang/ForestTales/pull/4), `develop` 대상, 상태 `MERGED`.
- 병합 commit: `108e4570ccb9a2e2a3dd8a8798d4ff7262c0a2ea` (일반 merge commit).
- 대상: 일반 PR로 `develop`에 병합했다. `main`과 릴리스 태그는 변경하지 않았다.
- 보호: 사용자 변경, 승인 PNG·runtime 모션·manifest를 덮어쓰거나 강제 푸시하지 않는다.
- 롤백: 필요 시 merge commit `108e4570`을 revert해 외형 계약과 모든 소비자 변경을 함께 되돌린다. 승인 PNG·모션은 해당 commit에 포함되지 않는다.
