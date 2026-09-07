# ForestTales 에이전트 가이드

## What

- ForestTales는 Godot 4 기반 Android 우선 2D 플랫폼 아레나 격투게임이다.
- 가로 화면과 터치가 제품 기준이며, 데스크톱 입력은 개발·검증용 어댑터다.
- 제품 기준은 README.md의 문서 우선순위와 docs/01~07, 승인된 docs/DECISIONS.md다.

## Why

- 전투 데이터·판정과 프레임 스프라이트 표현을 분리해야 콘텐츠를 교체해도 결과가 변하지 않는다.
- Phase 종료 기준과 미정 결정을 기록해야 초기 프로토타입이 성장·온라인 범위에 잠식되지 않는다.

## How

- 모든 작업은 _workspace/<topic>/에 요청·생산·QA·종료 증적을 남긴다.
- 새 기능은 자동 테스트 또는 이름 있는 수동 회귀 절차를 포함한다.
- Android 실제 기기에서 확인하지 않은 결과를 기기 검증 통과로 기록하지 않는다.
- 여러 영역 작업은 .agents/skills/forest-tales-orchestrator/와 docs/harness/forest-tales/team-spec.md를 따른다.
- 현재 검증 명령은 ./scripts/verify-harness.sh뿐이다. Phase 0에서 실제 게임 검증 명령이 생기면 이 파일과 팀 명세를 함께 갱신한다.
