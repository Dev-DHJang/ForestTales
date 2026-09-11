# Forest Arena 에이전트 가이드

## What

- Forest Arena는 Godot 4 기반 Android 우선 2D 플랫폼 아레나 격투게임이다.
- 가로 화면과 터치가 제품 기준이며, 데스크톱 입력은 개발·검증용 어댑터다.
- 제품 기준은 README.md의 문서 우선순위와 docs/01~07, 승인된 docs/DECISIONS.md다.

## Why

- 전투 데이터·판정과 프레임 스프라이트 표현을 분리해야 콘텐츠를 교체해도 결과가 변하지 않는다.
- Phase 종료 기준과 미정 결정을 기록해야 초기 프로토타입이 성장·온라인 범위에 잠식되지 않는다.

## How

- 모든 작업은 _workspace/<topic>/에 요청·생산·QA·종료 증적을 남긴다.
- 새 기능은 자동 테스트 또는 이름 있는 수동 회귀 절차를 포함한다.
- Android 실제 기기에서 확인하지 않은 결과를 기기 검증 통과로 기록하지 않는다.
- 여러 영역 작업은 .agents/skills/forest-arena-orchestrator/와 docs/harness/forest-arena/team-spec.md를 따른다.
- 기본 로컬 검증은 `./scripts/verify.sh`이며, Phase 0 smoke·캐릭터 자산 계약·승인 모션 계약·하네스 검증을 순서대로 실행한다. 하네스 전용 변경은 `./scripts/verify-harness.sh`를 함께 실행한다.
- 역할, 요청 라우팅, 작업 증적 상태와 Android 검증 명령은 docs/harness/forest-arena/operating-index.md를 기준으로 확인한다.
- 비전투 UI 설계는 docs/ui/non-combat-ui-v01.json과 assets/ui/asset-requirements.csv를 계약 원본으로 사용하며, Penpot 절차는 docs/ui/penpot-setup.md를 따른다.

<!-- FOREST_ARENA_GODOT:START -->
## Forest Arena / Godot resource map
- Resource skill: `.agents/skills/forest-arena-godot-resources/SKILL.md`
- UI skill: `.agents/skills/forest-arena-godot-ui/SKILL.md`
- Setup: `docs/forest_arena/GODOT_SETUP.md`
- Registry: `forest_arena/data/resource_registry.json`
- Verify: `python tools/forest_arena/verify_godot_resources.py --project-root .`
<!-- FOREST_ARENA_GODOT:END -->
