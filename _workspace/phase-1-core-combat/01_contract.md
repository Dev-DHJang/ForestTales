# 계약

- `AttackData` schema v1은 공격 ID, 입력, 단계 tick, 피해·넉백, hitbox·재타격, 시각 상태 ID를 소유한다.
- `CombatRules`는 60 Hz, 3 stock, 이동·복귀·무적·링아웃 수치를 소유한다.
- `CombatIntent`는 fighter ID, tick, action, 단일 방향, edge와 ground/air 문맥을 소유한다.
- 표현은 판정·hitbox·승패에 참여하지 않는다.
- 동시 최종 링아웃은 ADR-016의 반복 서든데스를 따른다.
