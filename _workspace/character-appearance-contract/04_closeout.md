# 캐릭터 외형 계약 종료 증적

- 현재 상태: 로컬 구현·QA 완료, 원격 `develop` 통합 대기.
- 완료 범위: 세 승인 캐릭터의 외형 JSON v01, CharacterData 요약, 디자인 문서, 생성 입력·QA 템플릿, 독립 자동 계약과 전투 경계 분리.
- 보존: 승인 PNG·runtime 모션·manifest, CharacterData·공격 스키마, 모든 전투 의미와 Phase 0.
- 검증: `./scripts/verify.sh` 전체 통과. Android 검증은 런타임·픽셀 비변경 범위라 실행하지 않았다.
- 원격 완료 조건: 기능 PR을 일반 merge commit으로 `develop`에 병합하고 로컬 `develop`을 fast-forward한 뒤 PR·commit SHA와 rollback을 기록한다.
