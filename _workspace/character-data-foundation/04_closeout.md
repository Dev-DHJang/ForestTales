# Closeout

- 상태: 완료 — Phase 2 선행 준비만 수행했고 프로젝트의 현재 Phase는 0으로 유지한다.
- 결과: 자현과 묘령의 단일 CharacterData Resource, 콘셉트 이미지 참조, manifest 및 SHA-256 기록, 계약 테스트를 추가했다. 제공 PNG는 픽셀 변경 없이 캐릭터별 콘셉트 경로로 이동했다.
- 검증: `./scripts/verify.sh` 통과. 실제 Android 기기 검증·전투 연동·애니메이션은 범위 밖이며 pass로 기록하지 않는다.
- 롤백: CharacterData/CharacterStats 스크립트, 두 Resource, manifest, 이미지 경로, 계약 테스트와 문서 변경을 함께 되돌린다.
- 다음 작업: Phase 1 전투 종료 뒤 CharacterData를 RuntimeCombatProfile 조합 계약에 연결하고, 승인된 모션이 생기면 character.tres의 시각 참조를 확장한다.
