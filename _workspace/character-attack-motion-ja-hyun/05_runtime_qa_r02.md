# 자현 기본 3연계 r02 런타임 QA

승인일: 2026-09-09

| 기준 | 판정 | 증거 |
| --- | --- | --- |
| 런타임 RGBA·크기 | PASS | 세 PNG 모두 2048×128, `srgba` 4채널·실제 alpha |
| 셀·프레임 순서 | PASS | 16개 128×128 셀, 좌→우 순서; SpriteFrames AtlasTexture 영역 0~1920을 128 단위로 등록 |
| 재생 계약 | PASS | `attack_light_combo_01~03`, 12 FPS, one-shot(`loop=false`) |
| 기준 방향·pivot | PASS | 우향 원본, 모든 셀을 발바닥 기준 하단 정렬; 좌향은 향후 래퍼 수평 반전 |
| 포즈·실루엣 | PASS | 01 저자세 잽, 02 몸통 회전·리본 측면타, 03 최대 외곽 리본 스윕·긴 회복으로 구분 |
| alpha·잘림 | PASS | 정규화 때 alpha 잔상을 제거했고, 128×128 셀에서 전신 및 큰 리본 원호가 잘리지 않음 |
| 원본성·권리 | PASS | 승인된 자현 콘셉트와 사용자 승인 r02 검토 시안에서만 파생; 외부 참조 자산 사용 없음 |
| 자동 계약 | PASS | 2026-09-09 Godot headless에서 `character_motion_contract.gd`, `character_attack_motion_contract.gd` 통과; 전체 verify 결과는 아래 종료 증적에 기록 |
| Android 실제 기기 | 미실행 | 이번 작업 범위에 포함하지 않음 |

런타임 SHA-256:

- `attack_light_combo_01_16f.png` — `eeb8d63d825eead9e5e59d5f023c0cbf5c7d2be87079b9260312da5dd6564333`
- `attack_light_combo_02_16f.png` — `936bed9589480219fbb773da73a6b636910eec848322eb327b6e15bfeeca9810`
- `attack_light_combo_03_16f.png` — `c93785b53fec5a3d088e46dc9b39aeb384f31d06dbad1e13029fd3e9ae31ae58`

종료 증적: 2026-09-09 `./scripts/verify.sh` 통과. Phase 0 smoke, CharacterData, character motion, character attack motion, combat concept, UI design, harness가 모두 PASS했다. 출력의 `tcp:5037 connection refused`는 연결된 Android 기기가 없다는 진단이며, 실제 Android 기기 검증은 수행하지 않았다.
