# Character data foundation request

- 날짜: 2026-09-07
- 현재 Phase: 0 유지. Phase 2 완료 선언은 하지 않는다.
- 목표: 캐릭터별 `character.tres`를 이미지, 콘셉트, 설정, 능력치와 향후 캐릭터 확장 정보의 단일 저작 출처로 만든다.
- 포함: CharacterData/CharacterStats 계약, 자현·묘령 데이터, 제공 콘셉트 이미지 등록, manifest, 자동 계약 검사.
- 제외: 전투 판정·장면 연동, 애니메이션, 중앙 레지스트리, 직업·장신구 런타임 조합, 온라인·저장.
- 불변 조건: 시각 자산은 전투 타이밍·판정·승패를 결정하지 않으며 기존 Phase 0 임시 파이터는 유지한다.
- 담당: orchestrator, contracts, character-design, product, combat, qa.
