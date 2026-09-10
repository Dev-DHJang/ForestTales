# 전투 구현

- 세 fighter scene에 고유 ID의 exported `Array[AttackData]`를 직렬화했다. 공용 컨트롤러에는 캐릭터 이름 분기가 없다.
- 60 Hz 이동·점프·대시, 3/4/2 약연계, 방향·대시·5방향 공중 공격, 중립/위 특수와 명시적 no-op을 구현했다.
- hit 후보는 사전 snapshot과 안정 ID로 정렬한 뒤 피해·넉백·DI를 동시에 적용한다.
- 단발 재적중·자가 타격을 막고 묘령 다단, 자현 pull, 나비 forward, 위 특수 self impulse를 데이터로 유지한다.
- Hitbox/Hurtbox와 KillVolume 노드는 디버그·장면 계약을 표현하며 authoritative 계산은 AttackData와 CombatRules를 사용한다.
