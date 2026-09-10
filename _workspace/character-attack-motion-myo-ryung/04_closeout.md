# 묘령 공격 모션 종료 증적

- 상태: 완료 — 2026-09-10 사용자 승인에 따라 기본 4연계 r01을 런타임에 등록했다.
- 생성: `attack_light_combo_01~04` 우향 16포즈 RGBA 검토 시트와 2048×128 runtime 시트·SpriteFrames.
- 등록: manifest의 SHA-256·권리 이력·프레임 수·FPS·loop·소비 경로·`visual_state_id`·`combo_index`·`is_finisher`, 묘령 4연계 자동 계약을 추가했다.
- 미변경: CharacterData, AttackData, 전투 코드, 판정, Phase 0 장면.
- 검증: `./scripts/verify.sh` 통과. 실제 Android 기기는 미실행이다.
- 다음 범위: 나비 기본 2연계는 별도 요청 시에만 시안을 제작한다.
