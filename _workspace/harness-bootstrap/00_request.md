# Harness Bootstrap 요청

## 목표

ForestTales에 Godot 4 기반 Android 우선 2D 동물 플랫폼 격투게임의 제품 문서와 repo-local AI 개발 하네스를 구축한다.

## 현재 Phase

제품 문서·하네스 구축 단계이며 Phase 0 게임 구현 전이다.

## 범위

- AGENTS.md, README.md와 docs/01~07 및 DECISIONS.md.
- Expert Pool + Producer-Reviewer 팀 명세.
- 13개 역할 스킬과 결정적 verify-harness.sh.
- 이번 작업의 요청, 오케스트레이션, QA와 closeout 증적.

## 제외

- Godot 프로젝트, 게임 코드, Android export, 게임 테스트와 에셋 제작.
- 온라인 구현, 외부 에셋 다운로드와 Git 원격 변경.

## 불변 조건

- 프로젝트명은 ForestTales, 슬러그는 forest-tales다.
- 전투 판정은 애니메이션 프레임·시각·UI·오디오와 분리한다.
- Phase 7 이전 온라인 구현을 금지한다.
- 기존 사용자 파일과 변경을 보존한다.

## 수용 기준

- 필수: 요청된 문서, 팀 명세, 13개 스킬과 검사 스크립트가 실제 경로에 있다.
- 필수: 모든 스킬의 frontmatter, 이름, 필수 섹션과 팀 역할이 일치한다.
- 필수: 구형 렌더링 용어가 생성 문서와 스킬에 남지 않는다.
- 필수: 정상 라우팅, 계약 선행, QA 회차와 온라인 게이트 시나리오가 문서화된다.
- 명시적 이연: Godot·Android 게임 실행과 실제 기기 검증은 Phase 0에서 시작한다.

## 담당

- 생산·통합: forest-tales-orchestrator
- 독립 검토: forest-tales-qa
- 경로: 저장소 루트, docs/, .agents/skills/, scripts/, _workspace/harness-bootstrap/
