# Harness Bootstrap 오케스트레이션

## 입력과 범위

- 사용자 요청과 신규 프로젝트 초기 구축 프롬프트를 입력으로 사용했다.
- 프로젝트명 ForestTales와 경로명에 적합한 forest-tales 슬러그를 적용했다.
- 선택적 AnimalFight 참고 저장소에서는 구조와 경계 원칙만 참고하고 콘텐츠 이름·수치·현재 진척은 복제하지 않았다.

## 아키텍처

- Expert Pool로 요청에 필요한 역할만 선택한다.
- Producer-Reviewer로 생산 뒤 forest-tales-qa가 원 요청과 소비 경계를 검토한다.
- 다영역·계약·Phase 작업만 forest-tales-orchestrator가 통합한다.

## 생산 경계

- 루트 문서, 제품 문서, 팀 명세, 역할 스킬과 검사 스크립트만 생성한다.
- 런타임 계약이나 게임 코드를 구현하지 않아 01_contract.md는 만들지 않는다.
- 문서 전용 bootstrap이므로 version-control 원격 병합을 요구하거나 수행하지 않는다.

## 검증 계획

- ./scripts/verify-harness.sh로 경로, frontmatter, 역할, 증적, 상태와 Phase 게이트를 검사한다.
- 생성 문서·스킬에서 금지된 구형 렌더링 용어를 별도로 검색한다.
- qa가 네 가지 라우팅 시나리오와 생산자·소비자 경계를 대조한다.
