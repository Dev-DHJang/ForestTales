# CharacterData contract v1

## Source and consumers

- 소스: `assets/character/<character-id>/character.tres` 하나가 해당 캐릭터의 모든 저작 정보를 소유한다.
- 소비자: 현재는 계약 테스트만 소비한다. 미래 선택 화면·매치 설정은 CharacterData Resource를 명시 참조한다.
- 중앙 레지스트리, 저장 형식, 네트워크 메시지는 이번 계약에 포함하지 않는다.

## Fields and invariants

- `CharacterData`: schema version 1, kebab-case StringName ID, 표시 이름, 콘셉트 asset ID·Texture2D 참조, 콘셉트·설정, 역할, 태그, 고유 기술 슬롯 ID, 패시브 설명, 직업 트리 슬롯, `CharacterStats`.
- `CharacterStats`: 생존, 무게, 지상/공중 이동, 점프, 중력, 대시 속도·지속 시간, 공중 점프 횟수. 모든 실수 값은 양수이고 공중 점프 횟수는 0 이상이다.
- 콘셉트 이미지의 Resource 경로와 manifest 경로·SHA-256은 일치해야 한다.
- CharacterData 및 모든 소스 Resource는 현재 전투에서 수정하거나 소비하지 않는다. 향후 LoadoutBuilder만 복제·조합한다.
- 기술 슬롯은 미래 AttackData의 의미 ID이며 공격 프레임·hitbox·피해값을 포함하지 않는다.

## Compatibility and rollback

- `schema_version`이 1이 아닌 데이터는 유효하지 않다. 호환성 변경은 새 버전과 마이그레이션 또는 명시적 거부 정책을 먼저 추가한다.
- 롤백은 CharacterData/manifest/이미지를 함께 이전 버전으로 되돌린다.
