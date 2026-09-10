# 캐릭터 외형 계약 오케스트레이션

- contracts가 전용 JSON의 스키마·권위·ID 연결과 전투 계약 이전을 소유한다.
- character-design이 승인 PNG를 바꾸지 않고 캐릭터별 외형 경계, 디자인 문서와 향후 입력 템플릿을 정렬한다.
- qa가 생산 문서와 PNG를 독립 대조하고 자동 계약·하네스·전체 회귀를 판정한다.
- version-control은 `origin/develop` 기준 `feature/character-appearance-contract`와 PR 병합·롤백 증적을 관리한다.
- CharacterData 요약 외 Resource 필드, manifest, PNG, runtime SpriteFrames, 전투 의미와 Phase는 변경하지 않는다.
- 공용 파일과 검증 로그 충돌을 피하기 위해 계약 → 디자인·템플릿 → QA → 원격 통합 순으로 처리한다.
