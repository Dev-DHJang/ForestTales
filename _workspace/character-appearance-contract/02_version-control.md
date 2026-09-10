# 캐릭터 외형 계약 버전 관리

- 기준: `origin/develop`의 `2b289546dd58cdeb0a094ebf08c05ce1bb154ec8`.
- 작업 브랜치: `feature/character-appearance-contract`.
- 커밋 계획: 외형 계약·소비자 및 테스트를 하나의 원자적 기능 커밋으로 묶고, QA·원격 병합 증적은 후속 문서 커밋으로 기록한다.
- 대상: 일반 PR로 `develop`에 병합한다. `main`과 릴리스 태그는 변경하지 않는다.
- 보호: 사용자 변경, 승인 PNG·runtime 모션·manifest를 덮어쓰거나 강제 푸시하지 않는다.
- 롤백: 기능 PR merge commit을 revert해 외형 계약과 모든 소비자 변경을 함께 되돌린다. 실제 commit·PR·merge SHA는 통합 후 기록한다.
