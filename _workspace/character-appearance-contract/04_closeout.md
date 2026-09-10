# 캐릭터 외형 계약 종료 증적

- 현재 상태: 완료 — PR #4 병합과 로컬 `develop` 동기화 완료.
- 완료 범위: 세 승인 캐릭터의 외형 JSON v01, CharacterData 요약, 디자인 문서, 생성 입력·QA 템플릿, 독립 자동 계약과 전투 경계 분리.
- 보존: 승인 PNG·runtime 모션·manifest, CharacterData·공격 스키마, 모든 전투 의미와 Phase 0.
- 검증: `./scripts/verify.sh` 전체 통과. Android 검증은 런타임·픽셀 비변경 범위라 실행하지 않았다.
- 원격 증적: PR [#4](https://github.com/Dev-DHJang/ForestTales/pull/4), 일반 merge commit `108e4570ccb9a2e2a3dd8a8798d4ff7262c0a2ea`.
- 로컬 증적: `develop`은 `origin/develop`을 추적하며 동일 merge SHA로 fast-forward됐다. `main`과 릴리스 태그는 변경하지 않았다.
- 롤백: `108e4570` revert. 승인 PNG·모션·manifest는 merge commit에 포함되지 않아 보존된다.
