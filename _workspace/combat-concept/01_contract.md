# 공격 콘셉트 계약 v01

정규 원본은 `docs/attack-system-v01.json`이다. 이 계약은 `schema_version: 1`, `status: concept`, `phase: pre-phase-1`을 가져야 한다.

- 각 기술군은 의미 ID, 입력·방향·상태, 역할, 연계/연결 조건, 자원, 날리는 방향, 피니시 여부, 시각 상태 ID를 기록한다.
- 공통 기술군과 캐릭터별 예외를 분리한다. 자현·묘령·나비의 기본 연계 수는 각각 3·4·2다.
- 콘셉트에는 `damage`, `knockback`, `hitbox`, `startup`, `active`, `recovery` 권위 수치를 넣지 않는다. Phase 2의 AttackData와 MoveSetData가 그 책임을 가진다.
- `tests/combat_concept_contract.gd`가 스키마, 세 버튼·잡기 보조 버튼, 4방향·입력 edge, 3 stock, 입력 예약 1개, 공중 5방향·2회 한도, 피니시 취소 금지, 피격 중 공격 취소 금지, 가드 내구·궁극기 포착 조건, 시각 순차 승인 게이트, 세 캐릭터의 연계 수와 특수기·궁극기를 검사한다.
