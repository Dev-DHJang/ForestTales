# 묘령 기본 4연계 r01 런타임 QA

승인일: 2026-09-10

| 기준 | 판정 | 증거 |
| --- | --- | --- |
| RGBA·크기 | PASS | 4개 PNG 모두 2048×128, sRGBA·실제 alpha |
| 셀·순서·pivot | PASS | 16개 128×128 셀, 좌→우 순서, 발바닥 기준 하단 정렬 |
| 재생 계약 | PASS | `attack_light_combo_01~04`, 12 FPS, loop false |
| 연계별 연기 | PASS | 손타격 → 상승 무릎 → 회전 킥 → 도약 회전 킥 피니시의 축·회전·체공감이 구분됨 |
| 피니시 | PASS | 04는 가장 큰 귀·리본 외곽 실루엣과 긴 회복을 가짐 |
| alpha 잔상·잘림 | PASS | alpha threshold와 128×128 정규화 뒤 전신·귀·리본이 셀 안에 유지됨 |
| 계약·회귀 | PASS | character motion, character attack motion 및 `./scripts/verify.sh` 전체 통과 |
| Android 실제 기기 | 미실행 | `tcp:5037` 연결 거부로 실제 기기 검증은 수행하지 않음 |

런타임 SHA-256은 `assets/character/manifest.json`의 묘령 r01 공격 4개 항목과 일치한다.
