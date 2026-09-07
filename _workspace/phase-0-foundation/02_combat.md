# Phase 0 전투 경계

- `scenes/main.tscn`에 World, 분리된 충돌체, 두 임시 파이터와 Camera2D를 둔다.
- 권위 전투 로직은 구현하지 않았고 `scripts/fighter_stub.gd`는 도형 표현만 그린다.
- ProjectSettings의 물리 레이어를 이후 StageData·Hurtbox·Hitbox 경계와 호환되게 이름 붙였다.
- 소비자: Phase 1 combat, ui, mobile과 smoke test.
