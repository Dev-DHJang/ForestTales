# 자현 콤보 공격 프레임 계획

## r02 시각 계약

- r02 시안: `02_r02_drafts/attack_light_combo_0N-r02-clean.png`. 우향 원본, 좌→우·상→하의 4×4·16포즈, 1230×1278 RGBA 검토 시트다.
- 시각 상태 ID는 공격 콘셉트 계약과 일치하는 `attack_light_combo_01`, `attack_light_combo_02`, `attack_light_combo_03`으로 쓴다. 기존 r01의 `attack_combo_0N`은 이력 명칭이며 새 소비 ID가 아니다.
- 01은 낮은 잽·짧은 리본 후행, 02는 몸통 회전·중간 리본 원호, 03은 양팔 개방·최대 리본 회전·긴 회복으로 연계 단계와 피니시를 구별한다.
- 승인 뒤에만 16개 셀을 128×128로 정규화하여 `attack_light_combo_0N_16f.png` 및 동명 SpriteFrames로 저장한다. 12 FPS, loop false, 지상 pivot은 발바닥 중앙이다.

- 검토 원본: `01_drafts/attack-combo-01-contact-sheet-r01.png`부터 `03`까지. 각 파일은 우향 전신 4×4·16포즈 검토용 시트다.
- 런타임 계약: 승인된 r02 시트만 `assets/character/ja-hyun/animation/runtime/attack_light_combo_0N_16f.png`와 동명 SpriteFrames로 저장한다. pivot은 지상 프레임 발바닥 중앙, 12 FPS, loop false다.
- 소비자: 이후 VisualAdapter/AnimatedSprite2D. 프레임은 AttackData의 판정·active 구간·피해·넉백을 결정하지 않는다.
