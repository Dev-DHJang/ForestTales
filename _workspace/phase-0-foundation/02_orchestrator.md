# Phase 0 오케스트레이션

## 역할과 순서

product가 Phase 0 미정값을 proposed ADR로 분리한 뒤 combat·ui·mobile 경계를 한 프로젝트 설정과 테스트 장면에 순차 통합한다. qa는 문서, 생산 코드와 실제 명령을 대조한다.

## 공유 경계

- 의미 입력 ID: `move_left`, `move_right`, `jump`, `dash`, `attack_light`, `attack_heavy`, `attack_special`.
- 물리 레이어: World, FighterBody, Hurtbox, Hitbox, RingOut.
- TouchCommandSource는 의미 입력만 생산하며 피해·상태·승패를 계산하지 않는다.
- 도형 실루엣과 ArenaVisual은 표현이며 충돌 노드와 분리한다.

## 통합 검증

- `godot --headless --path . --editor --quit`
- `godot --headless --path . --script res://tests/phase0_smoke.gd`
- `./scripts/export-debug-android.sh`
- `./scripts/verify-android-emulator.sh`
- `./scripts/verify.sh`
