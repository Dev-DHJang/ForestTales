# Phase 0 안정화 오케스트레이션

## 역할과 순서

1. contracts가 승인된 나비 v05 데이터와 소비 테스트를 대조해 잘못된 기대값만 정정한다.
2. orchestrator가 제품 문서의 v05 표기와 운영 색인의 완료 상태를 맞춘다.
3. mobile이 debug APK와 에뮬레이터 설치·가로 실행·중단·복귀를 재검증한다.
4. qa가 계약, 활성 브랜드, 하네스, Android와 Phase 경계를 독립 확인한다.
5. version-control이 검증된 변경만 feature 브랜치 PR로 `origin/develop`에 통합한다.

## 통합 경계

- `docs/attack-system-v01.json`의 schema version과 `appearance_guardrail`은 바꾸지 않는다.
- 테스트는 `human-form`, 흰 고양이 귀, 긴 흰 꼬리와 모피 팔다리·동물형 발·동물 다리 금지를 각각 검사한다.
- 기존 workspace 원본과 승인 manifest 자산은 이동하거나 삭제하지 않는다.
- Godot 검사는 사용자 로그 파일 충돌을 피하도록 순차 실행한다.
