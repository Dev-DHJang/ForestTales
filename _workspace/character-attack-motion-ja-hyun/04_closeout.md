# 자현 콤보 공격 모션 종료 증적

## r02 상태

- 상태: 완료 — 2026-09-09 사용자 승인에 따라 r02 기본 3연계를 런타임에 등록했다.
- 생성: `attack_light_combo_01~03` 우향 16포즈 RGBA 검토 시트와 각 2048×128 런타임 시트·SpriteFrames. 기존 r01 RGB 체크무늬 시안은 이력으로 보존했다.
- 등록: manifest의 해시·권리·프레임 수·FPS·loop·소비 경로·`visual_state_id`·`combo_index`·`is_finisher`와 자동 계약을 추가했다.
- 미변경: CharacterData, AttackData, 전투 코드, 판정, Phase 0 장면.
- 다음 범위: 묘령 4연계는 별도 요청 시에만 시안을 제작한다.
