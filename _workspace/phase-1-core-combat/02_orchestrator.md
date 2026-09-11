# 오케스트레이션

- 계약/전투가 AttackData·CombatRules·CombatIntent와 fixed-tick 권위를 소유한다.
- UI는 snapshot과 의미 입력만 소비하고, 모바일은 export·터치·생명주기를 검증한다.
- QA는 전투 생산자와 분리된 SceneTree 회귀와 Android 명령으로 수용 기준을 확인한다.
- `character-design-rule-governance` 미커밋 변경은 이 작업의 생산물·커밋·통합에서 제외한다.
