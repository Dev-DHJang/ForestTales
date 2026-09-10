# 공격 체계 콘셉트 종료 증적

- 상태: 완료 — 전체 공격 콘셉트, 세 캐릭터 기술 정체성, 단계별 도입 경계와 자동 문서 계약을 기록했다. 2026-09-09 누락 감사 r02까지 반영했다.
- 생성: `docs/attack-system-v01.json`, `tests/combat_concept_contract.gd`, 이 작업공간의 요청·계약·QA 증적.
- 변경: 게임 디자인, UX, 기술 아키텍처, 로드맵, ADR 대기열.
- 미변경: Phase 0 런타임 전투, InputMap/현재 터치 UI, CharacterData, AttackData, hitbox, 공격 애니메이션 등록, Android 기기 상태.
- 검증: 2026-09-09 `./scripts/verify.sh` PASS — `PHASE0_SMOKE`, `CHARACTER_DATA_CONTRACT`, `CHARACTER_MOTION_CONTRACT`, `COMBAT_CONCEPT_CONTRACT`, `verify-harness`. 공격 계약은 12개 공통 기술군, 잡기 보조 경로, 가드·궁극기·무한 방지 경계, 시각 순차 승인 게이트와 세 캐릭터의 기본 연계·특수기·궁극기를 검사한다.
- 다음 단계: Phase 1 승인이 있으면 ADR-012를 accepted 여부 재확인한 뒤 최소 전투 구현으로 진행한다. 자현 공격 모션은 별도 사용자 시안 승인을 먼저 받는다.
