# 종료 기록

## 상태

완료 — 나비의 승인된 콘셉트를 참조하는 CharacterData를 추가했다. 프로젝트 Phase는 0으로 유지한다.

## 결과

- 단일 저작 출처: `assets/character/nabi/character.tres`
- 기본 능력치, 역할, 태그와 미래 AttackData용 의미 슬롯을 등록했다.
- manifest 소비 경로와 CharacterData 계약 테스트를 나비에 맞게 갱신했다.

## 검증

- `./scripts/verify.sh` — pass: Phase 0 smoke, CharacterData 계약, harness.
- `./scripts/verify-harness.sh` — pass.
- 실제 Android 기기 검증은 수행하지 않았다.

## 제외·다음 작업

AttackData·전투 판정, CharacterData의 런타임 조합, 애니메이션과 Android 기기 검증은 포함하지 않았다. 이후 Phase 게이트와 승인된 계약에 따라 진행한다.
