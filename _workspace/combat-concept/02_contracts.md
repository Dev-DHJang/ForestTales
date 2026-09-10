# 미래 데이터 소유권

| 데이터 | 미래 소유 책임 | 이 작업의 상태 |
| --- | --- | --- |
| CombatIntent | action ID, 방향, press/hold/release, 문맥 | 문서 계약만 정의 |
| MoveSetData | 기술 목록, 입력 조건, 분기, 시각 상태 ID | Phase 2 전까지 미생성 |
| AttackData | startup/active/recovery, 피해, 넉백, hitbox, 재타격 | Phase 1 전까지 미생성 |
| VisualAdapter | visual_state_id를 프레임·VFX로 표현 | 판정 비권위 유지 |

기존 `attack_light`, `attack_heavy`, `attack_special` 의미 ID는 보존한다. CharacterData의 현재 세 슬롯은 전체 기술표가 아니며, 이 콘셉트 파일도 런타임 캐릭터 Resource를 교체하지 않는다.
