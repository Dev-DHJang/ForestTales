# 구현 기록

- `FighterController`는 `CharacterData`와 `Array[AttackData]`만 소비한다.
- `MatchController`는 fixed tick, intent, 동시 hit 후보 정렬, 링아웃과 reset을 소유한다.
- 기본 장면은 자현 플레이어와 명령 소스 없는 묘령 훈련 더미다.
- 캐릭터 PNG·SpriteFrames·manifest와 Phase 2 로드아웃은 변경하지 않는다.
