# Phase 0 안정화 버전 관리

## 기준과 대상

- 시작 브랜치: `feature/phase-0-foundation`의 로컬 후속 commit `6fd6f4a`와 보존된 dirty 작업 트리.
- 작업 브랜치: `feature/phase-0-stabilization`.
- 재기반 대상과 PR 대상: `origin/develop`.
- `main`, 릴리스 태그와 저장소·원격 이름은 변경하지 않는다.

## 통합 절차

- 기존 변경을 제품·하네스, 승인 자산·계약, 안정화 수정·증적 단위로 커밋한다.
- 최신 원격을 확인하고 기존 Phase 0 PR과 같은 트리인 기준 뒤의 후속 커밋을 `origin/develop` 위로 재기반화한다.
- QA pass 뒤 feature 브랜치를 push하고 일반 merge commit PR로 `develop`에 병합한다.
- 병합 뒤 로컬 `develop`을 `origin/develop` 추적으로 교정하고 fast-forward한다.

## 증적과 롤백

commit SHA, PR, merge SHA와 최종 검증 결과는 검증 후 이 문서와 closeout에 추가한다. 롤백은 `develop`의 안정화 merge commit을 revert하며 `main`에는 영향을 주지 않는다.
