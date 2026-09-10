# 나비 v05 기본 모션 종료 증적

- 상태: 완료 — 사용자 채택 후 idle·run·stationary jump의 기존 런타임 PNG 픽셀을 v05 white-tail chibi 모션으로 교체했다.
- 변경: `assets/character/nabi/animation/runtime/{idle,run,jump}_16f.png`, manifest 해시·생성·권리 이력. 기존 `.tres` SpriteFrames 경로·16개 AtlasTexture·FPS·루프 값은 유지했다.
- 정규화: 각 4×4 검토 시트를 좌→우·상→하로 잘라 16개 128×128 셀로 맞추고 2048×128 RGBA 시트로 연결했다. 반투명 배경 제거 잔상은 alpha threshold로 제거했다.
- 미변경: CharacterData 능력치·기술 슬롯, AttackData, 전투 타이밍·판정, Phase 0 장면, 좌향 별도 파일.
- 검증: 2026-09-09 `CHARACTER_MOTION_CONTRACT: PASS` 및 `./scripts/verify.sh` PASS. 실제 Android 기기 미실행.
