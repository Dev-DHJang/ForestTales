---
name: forest-arena-character-motion
description: Create reviewable, approval-gated Forest Arena idle, jump, and run character motion packages from registered concepts.
---

# Forest Arena 캐릭터 모션

## 사용 시점

- 승인·등록된 캐릭터 콘셉트를 idle, jump, run의 게임 런타임 스프라이트시트와 SpriteFrames로 만들 때 사용한다.
- 최초 캐릭터 콘셉트 등록은 forest-arena-character-design, 일반 프레임·아틀라스·시각 래퍼는 forest-arena-2d-animation이 소유한다.
- 전투 판정, 충돌, 공격 타이밍 또는 현재 Phase 0 도형 파이터 장면 연결에는 사용하지 않는다.

## 필수 입력

- 소문자 kebab-case 캐릭터 ID와 `assets/character/manifest.json`에 기록된 승인 콘셉트 PNG.
- 승인 캐릭터의 `docs/character-appearance-v01.json` 항목과 필수·각도 한정·금지 외형 규칙.
- 기준 방향, 각 모션의 연기·느낌, idle·run 루프 의도와 jump의 체공 의도.
- 현재 Phase, docs/05_content_art_audio.md, 원본성·권리 조건과 소비자.
- 위 다섯 항목 중 하나라도 없으면 생성 전에 필요한 항목만 사용자에게 물어본다. 등록되지 않았거나 콘셉트 PNG가 없는 캐릭터는 런타임 모션을 만들지 않는다.

## 작업 흐름

1. manifest, 승인 콘셉트 PNG와 외형 계약을 확인하고, `_workspace/character-motion-<character-id>/00_request.md`에 브리프·Phase·기준 방향과 외형 불변 조건을 기록한다.
2. 독창적인 투명 배경 시안을 만들고 모션마다 정확히 16프레임을 설계한다. idle은 8 FPS 루프, run은 12 FPS 루프, jump는 1회 재생을 기본값으로 하며, 변경은 브리프와 사용자 승인에 기록한다.
3. 승인 전 시안, 프레임 순서와 검토 산출물은 `_workspace/character-motion-<character-id>/`에만 둔다. 최종 캐릭터 에셋 경로나 manifest에는 쓰지 않는다.
4. forest-arena-qa와 함께 16프레임 수, 프레임 누락·잘림, alpha, 기준 방향, 작은 Android 화면 실루엣, FPS·루프, 원본성·권리를 검토하고 `03_qa_rNN.md`에 기록한다.
5. QA 결과와 모션별 시안을 제시하고, idle·jump·run 각각에 대해 사용자의 명시 승인을 받는다. 승인되지 않은 모션은 런타임 파일을 생성하지 않는다.
6. 승인된 모션만 `assets/character/<character-id>/animation/runtime/<motion>_16f.png`에 2048×128 RGBA PNG(가로 16칸, 셀당 128×128)로 저장하고, 같은 디렉터리의 `<motion>.tres`에 해당 시트의 16프레임과 `idle`·`jump`·`run` 애니메이션 이름을 가진 SpriteFrames를 작성한다.
7. 승인된 각 모션의 생성 방식, 원본성·권리 상태, 해시, 16프레임·FPS·루프 규칙, 런타임 소비 경로와 승인 이력을 `assets/character/manifest.json`에 갱신한다. 이 파일은 이후 AnimatedSprite2D 시각 래퍼에 바로 연결할 수 있는 패키지이며, 현재 Phase 0 장면은 수정하지 않는다.

## 산출물과 검증

- 승인 전: `_workspace/character-motion-<character-id>/`의 요청, 모션 시안, `02_character-motion.md`, QA 기록과 종료 증적.
- 승인 후: 승인된 모션별 2048×128 PNG, `.tres`, manifest 기록.
- Godot import에서 PNG 투명도·크기·16개 AtlasTexture 영역과 SpriteFrames의 프레임 순서, FPS·루프를 확인한다.
- 시각 프레임은 표현 전용이며 피해, 상태, 넉백 또는 승패의 권위가 아니다.
