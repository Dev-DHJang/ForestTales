---
name: forest-arena-2d-animation
description: Produce Forest Arena frame animation, sprite sheets, atlases, SpriteFrames, and replaceable visual wrappers.
---

# Forest Arena 2D 애니메이션

## 사용 시점

- 캐릭터·직업·장신구의 프레임, 아틀라스, SpriteFrames와 시각 래퍼에 사용한다.
- 승인 콘셉트의 표준 idle·jump·run 16프레임 패키지와 모션별 사용자 승인 게이트는 forest-arena-character-motion이 소유한다.
- Hitbox/Hurtbox, 공격 단계 시간, 플랫폼 충돌과 승패는 소유하지 않는다.

## 필수 입력

- 현재 Phase, docs/05_content_art_audio.md, 턴어라운드·키 포즈와 전투 의미 상태.
- 파일·메모리 예산 후보, 에셋 권리 상태와 소비 경로.

## 작업 흐름

1. 원본 프레임, 런타임 아틀라스와 Godot 래퍼를 분리한다.
2. 프레임 순서, pivot, 방향 전환, 루프와 투명 영역을 검증한다.
3. 애니메이션은 AttackData 타이밍을 표현하며 판정을 결정하지 않는다.
4. 공급자별 경로를 공용 전투 코드에 노출하지 않는다.
5. 최대 줌아웃 실루엣과 Android 메모리·draw call 영향을 측정한다.

## 산출물과 검증

- _workspace/<topic>/02_2d_animation.md, 원본·런타임 경로, 매핑과 권리 기록.
- import, 프레임 누락, 잘림, 방향, 교체 가능성과 판정 분리를 검사한다.
