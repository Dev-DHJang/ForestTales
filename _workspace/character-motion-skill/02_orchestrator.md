# 캐릭터 모션 스킬 통합

## 아키텍처

character-motion은 승인 콘셉트에서 표준 이동 모션을 만드는 좁은 역할이다. character-design이 콘셉트·최초 등록을 소유하고, character-motion은 모션별 승인과 런타임 패키지를 소유한다. 2d-animation은 그 밖의 프레임·아틀라스·시각 래퍼를 계속 담당하며 QA가 독립 검토한다.

## 등록 계약

- 입력: manifest에 등록된 승인 콘셉트 PNG와 다섯 항목의 모션 브리프.
- 승인 전: `_workspace/character-motion-<character-id>/`에서 시안·검토만 수행한다.
- 승인 후 모션별 경로: `assets/character/<character-id>/animation/runtime/<motion>_16f.png`, `<motion>.tres`.
- PNG는 2048×128 RGBA, 가로 16 프레임·128×128 셀이다. idle 8 FPS와 run 12 FPS는 루프, jump는 1회 재생이다.
- manifest에는 권리·해시·규격·소비 경로·승인 이력을 기록한다. 시각 모션은 전투 판정 비권위다.

## 검증 계획

`./scripts/verify-harness.sh`에서 15개 역할, 새 스킬의 frontmatter·필수 섹션, character-motion 라우팅과 모션별 승인 게이트를 확인한다. 실제 PNG·SpriteFrames 생성은 승인된 캐릭터 요청 시점에 수행한다.
