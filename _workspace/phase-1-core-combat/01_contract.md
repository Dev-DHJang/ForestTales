# 계약

- `AttackData` schema v1은 공격 ID, 의미 입력, 상대 방향, 지상/공중 조건, 연계 단계, 단계 tick, 피해·넉백 벡터, hitbox·재타격, 시각 상태 ID를 소유한다.
- fighter scene의 exported `Array[AttackData]`가 유일한 Phase 1 공격 배선이며 런타임 이름 분기나 동적 기술 생성은 허용하지 않는다.
- `CombatRules`는 고정 60 Hz, 3 stock, 이동·연계 창·DI·복귀·무적·링아웃 수치를 소유한다.
- `CombatIntent`는 fighter ID, tick, action, 단일 방향, edge와 ground/air 문맥을 소유한다.
- 표현은 판정·hitbox·승패에 참여하지 않는다.
- 동시 최종 링아웃은 ADR-016의 반복 서든데스를 따른다.
