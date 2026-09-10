# Character appearance contract v01

## 권위와 소비자

- 단일 원본: `docs/character-appearance-v01.json`.
- 생산자: 승인된 캐릭터 디자인과 사용자 확정 외형 결정.
- 소비자: 후속 character-design, character-motion, image-design, 2d-animation과 계약 테스트.
- 연결: 각 항목의 `character_id`와 `concept_asset_id`를 `CharacterData` 및 manifest 콘셉트 항목과 교차 검증한다. 두 기존 스키마에는 필드를 추가하지 않는다.

## 스키마와 불변 조건

- 루트는 `schema_version: 1`, `contract_id: character-appearance-v01`, `phase: 0`, 권위 경계, 공통 규칙과 정확히 세 캐릭터 항목을 가진다.
- 캐릭터 항목은 승인 버전, 성인 성별 표현, 3등신 인간형, 동물 모티브, 팔레트·의상·실루엣, `must_keep`, `angle_conditional`, `may_vary`, `must_not_add`, 작은 화면 우선순위를 가진다.
- `must_keep`와 `must_not_add`의 같은 문자열 중복은 거부한다. 누락·중복·미등록 캐릭터 또는 콘셉트 ID 불일치는 거부한다.
- 세 캐릭터 모두 인간 얼굴·손·발·체형을 우선한다. 계약에 허용되지 않은 귀·꼬리·모피·주둥이·동물형 팔다리를 추론하지 않는다.
- 정확한 동물 문양 도형은 정체성 앵커가 아니다. 후속 자산은 독창적이고 비상표인 추상 종 모티브만 사용한다.
- 외형은 표현 전용이며 피해·능력치·판정·hitbox·공격 타이밍·충돌·승패 필드를 소유하지 않는다.

## 마이그레이션·호환성·롤백

- 나비의 `appearance_guardrail`은 전투 JSON에서 삭제하고 같은 변경에서 전용 계약으로 이전한다. 공격 스키마 버전과 전투 의미는 바꾸지 않으며 저장·런타임 소비자는 없다.
- CharacterData는 schema v1, manifest는 schema v1을 유지한다. 콘셉트 asset ID·경로·SHA도 유지한다.
- 롤백은 외형 JSON, 전용 테스트, CharacterData 요약, 디자인 문서와 템플릿 변경을 함께 제거하고 나비 가드레일·기존 전투 테스트를 복원한다. 이미지·모션은 롤백 대상이 아니다.
