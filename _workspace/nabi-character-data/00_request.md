# 나비 CharacterData 요청

- 날짜: 2026-09-07
- 현재 Phase: 0 유지. Phase 2 완료나 전투 콘텐츠 구현을 선언하지 않는다.
- 목표: 승인된 나비 콘셉트 자산을 참조하는 `CharacterData` Resource를 추가한다.
- 포함: `nabi` ID, 콘셉트·설정·역할·태그·미래 기술 슬롯·기본 능력치, manifest 소비 경로 갱신, 계약 테스트 확장.
- 제외: AttackData, hitbox, 피해·넉백, 상태 전이, 캐릭터 선택 화면, 애니메이션, JobData·AccessoryData 조합, 저장·온라인.
- 불변 조건: 콘셉트 이미지와 기술 슬롯은 전투 판정·타이밍·승패를 결정하지 않으며 기존 Phase 0 임시 파이터를 변경하지 않는다.
- 담당: orchestrator, contracts, combat, qa.
