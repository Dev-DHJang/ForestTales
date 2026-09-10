# 캐릭터 모션 생성 스킬 요청

## 목표

승인·등록된 ForestTales 캐릭터 콘셉트에서 idle, jump, run 모션을 생성하고, 모션별 사용자 명시 승인 뒤에만 Godot 런타임 패키지를 등록하는 repo-local 역할을 추가한다.

## 범위

- `forest-tales-character-motion` 스킬, 2d-animation·QA 역할 경계, 팀 라우팅과 하네스 검사.
- 모션별 16프레임 128×128 셀·2048×128 RGBA PNG, SpriteFrames와 manifest 기록 계약.
- 이 변경의 요청·통합·QA·종료 증적.

## 제외

- 실제 캐릭터 모션 이미지 생성, 사용자 승인 자산 등록, 현재 Phase 0 도형 파이터의 AnimatedSprite2D 연결.
- 전투 판정, 충돌, 공격 타이밍 또는 CharacterData 구현.

## 수용 기준

- 승인 콘셉트·필수 브리프 확인, QA, 모션별 명시 승인, 등록 순서가 스킬에 있다.
- 승인 전에는 `assets/character/`과 manifest를 변경하지 않는다.
- 승인 후의 PNG·SpriteFrames·manifest 규격과 기본 재생 규칙이 결정적으로 안내된다.
- team-spec과 verify-harness가 15개 역할과 새 라우팅·승인 게이트를 확인한다.
