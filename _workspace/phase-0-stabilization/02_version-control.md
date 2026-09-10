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

## 통합 증적

- 기존 Phase 0 병합 기록 후속: `bffc466`.
- Forest Arena Phase 0 기준선 통합: `714da64`.
- 안정화 검증 증적: `167a5e5`.
- 구현 PR: [#2](https://github.com/Dev-DHJang/ForestTales/pull/2), base `develop`, head `feature/phase-0-stabilization`, CLEAN/MERGEABLE 확인 뒤 일반 merge commit으로 병합.
- 구현 merge commit: `c066fdf0d0999202342e74f03553a7b2002c440e`.
- 로컬 `develop` 추적을 `origin/main`에서 `origin/develop`로 교정하고 구현 merge commit까지 fast-forward했다.

## 롤백

구현 롤백은 `develop`의 `c066fdf0d0999202342e74f03553a7b2002c440e`를 revert한다. `main`과 릴리스 태그에는 영향을 주지 않는다.
