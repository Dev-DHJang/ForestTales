# 묘령 모션 종료 증적

- 상태: 완료 — r02 디자인의 idle·run을 보존하고 stationary jump 런타임 패키지를 등록했다.
- 변경: `assets/character/myo-ryung/animation/runtime/`의 idle·run PNG와 SpriteFrames, manifest, 자동 모션 계약 검사.
- 미변경: CharacterData, 런타임 장면, 전투 코드.
- 검증: Godot import, 2048×128 RGBA, 16개 AtlasTexture, FPS·loop, manifest 해시를 자동 검사했다. 실제 Android 기기는 미검증이다.
