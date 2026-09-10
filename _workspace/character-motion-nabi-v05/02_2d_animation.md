# 나비 v05 시각 자산 경계

- 후보 경로: `review/nabi-{idle,run,jump}-r02-alpha.png`.
- 각 후보는 RGBA 4×4 연락 시트이며, 현재 런타임 시트·SpriteFrames·manifest를 소비하지 않는다.
- 승인 후에만 2048×128 RGBA(16×128×128) 시트, 해당 `.tres`, SHA-256, 권리·승인 기록을 만든다.
- 좌향 별도 파일은 만들지 않으며 미래 VisualAdapter의 수평 반전을 사용한다.
- 시각 프레임은 AttackData, hitbox, 피해, 넉백, 콤보 타이밍의 권위가 아니다.
