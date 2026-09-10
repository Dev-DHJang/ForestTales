# Combat boundary review

- CharacterData의 기술 슬롯은 이름 기반 공용 코드 분기가 아닌 미래 AttackData 참조를 위한 의미 ID다.
- `concept_image`와 모든 콘셉트 서술은 표현 전용이다. 공격 단계, hitbox, 피해, 넉백, 상태 또는 승패를 소유하지 않는다.
- 현재 `FighterStub`과 Phase 0 장면은 CharacterData를 읽거나 변경하지 않는다.
