# 프로젝트 하네스 통합·정리 요청

## 목표

15개 ForestTales repo-local 스킬, 문서, 작업 증적과 manifest 기반 캐릭터 계약 검사를 하나의 운영 구조로 정리한다.

## 범위

- 하네스 운영 색인, README·AGENTS·제품/아트 문서 정합화.
- manifest 탐색 기반 CharacterData·승인 모션 계약 검사.
- 무시된 Godot 캐시와 DS_Store 정리, 검증과 QA 증적.

## 제외

- Phase 1 전투 구현·Phase 승격, 사용자 미승인 시안 등록, Android export 디렉터리 삭제, 기존 workspace 원본 이동·삭제.

## 불변 조건

- 현재 Phase는 0으로 유지한다.
- character-motion은 독립 역할로 유지한다.
- 승인 콘텐츠는 전투 판정 또는 현재 런타임 연결의 권위가 아니다.
- manifest가 승인 concept·animation-runtime 계약의 등록 목록이다.
