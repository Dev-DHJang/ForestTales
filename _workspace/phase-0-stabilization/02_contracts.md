# Phase 0 안정화 계약 검토

## 판정

공개 계약 변경 없음. `docs/attack-system-v01.json`의 나비 v05 `appearance_guardrail`이 승인 데이터이며 테스트 소비자의 기대값만 잘못되어 있었다.

## 정정 내용

- 기존의 모순된 `no animal ears` 기대를 제거한다.
- v05 인간형, 승인된 흰 고양이 귀와 긴 흰 꼬리, 모피 팔다리·동물형 발·동물 다리 금지를 독립 검사한다.
- CharacterData, Resource schema version, manifest, 의미 입력과 런타임 소비 경로는 변경하지 않는다.

## 호환성과 롤백

데이터나 직렬화 형식이 바뀌지 않으므로 마이그레이션은 없다. 롤백은 테스트와 활성 제품 문서 정정만 함께 되돌리되, 승인된 v05 데이터는 변경하지 않는다.
