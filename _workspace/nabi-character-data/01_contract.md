# 나비 CharacterData 계약 적용

- 형식: 기존 `CharacterData` schema v1 및 `CharacterStats`를 그대로 사용한다.
- 식별자: `nabi`는 소문자 kebab-case StringName이며 manifest의 `nabi-concept-v01`과 일치해야 한다.
- 단일 저작 출처: `assets/character/nabi/character.tres`.
- 소비자: 현재는 `tests/character_data_contract.gd`뿐이며, manifest의 소비 예정 경로와 일치한다.
- 기술 슬롯: `nabi-claw-jab`, `nabi-pounce-slash`, `nabi-guard-rake`는 미래 AttackData의 의미 ID일 뿐이며 단계·피해·넉백·hitbox는 포함하지 않는다.
- 호환·롤백: schema v1을 유지한다. 실패 시 나비 Resource, manifest 소비 경로와 테스트 목록을 함께 되돌린다.
