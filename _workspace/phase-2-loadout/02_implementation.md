# 구현 기록

- 기존 세 fighter의 embedded AttackData를 `assets/combat/movesets/*.tres`의 external MoveSetData/AttackData로 이관했다.
- `MatchController`가 두 LoadoutSelection을 build하고 `FighterController.configure_profile()`에 주입한다.
- main 기본 경기는 자현·묘령 character-only selection을 유지한다.
- 자현 prototype JobData와 단일 AccessoryData는 fixture selection·통합 테스트 전용이다.
