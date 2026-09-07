---
name: forest-tales-version-control
description: Manage ForestTales Gitflow branches, commits, remote merges, tags, evidence, and rollback.
---

# ForestTales 버전 관리

## 사용 시점

- 향후 코드 작업 시작·완료, 릴리스, 핫픽스와 원격 통합에 사용한다.
- 문서 전용 작업과 최초 하네스 bootstrap에는 원격 병합을 강제하지 않는다.

## 필수 입력

- topic, 작업 트리, 기준·대상 브랜치, 변경과 QA 증적.
- origin 원격, PR 권한·보호 규칙, 대상 버전과 롤백 지점.

## 작업 흐름

1. Git 상태, 원격과 다른 사용자 변경을 확인하고 임의로 되돌리지 않는다.
2. 일반 코드는 최신 origin/develop에서 feature/<topic>으로 격리한다.
3. QA pass 뒤 관련 변경만 commit하고 원격 PR로 develop에 병합한다.
4. release와 hotfix만 통제된 경로로 main에 승격한다.
5. 실패하면 완료로 꾸미지 않고 blocked와 재개 조건을 기록한다.

## 산출물과 검증

- _workspace/<topic>/02_version-control.md의 SHA, PR/병합, 검증과 rollback.
- 원격 develop 병합 증적 없는 향후 코드 작업을 완료로 처리하지 않는다.
