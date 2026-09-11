# Penpot 비전투 UI 작업 절차

## 경계

- 권위 계약은 `docs/ui/non-combat-ui-v01.json`과 `assets/ui/asset-requirements.csv`다.
- Penpot의 1920×1080은 설계 기준이며 Godot의 1280×720 논리 해상도를 바꾸지 않는다.
- 실시간 전투 HUD는 범위 밖이다.
- Phase 2 종료 시점에는 설계 계약만 유지한다. 실제 Penpot 편집은 사용자가 그 작업을 요청하고 올바른 파일이 열린 경우에만 수행한다.

## 연결 전 검사

1. `docs/ui/penpot-setup.md`를 읽는다.
2. 로컬 MCP 프로세스와 Penpot 플러그인의 연결 여부를 확인한다.
3. 현재 열린 파일·페이지를 읽기 전용으로 확인한다.
4. 팀/프로젝트가 `Forest_Arena`이고 파일이 `Forest_Arena_UI`인지 확인한다.
5. 대상이 다르면 수정하지 말고 올바른 파일을 열도록 요청한다.
6. 기존 페이지, 최상위 섹션, 토큰, 컴포넌트와 `SCR_*` 프레임을 목록화한다.

## 생산 순서

1. Foundations: 의미 색상, 한국어 서체, 8px 간격, radius와 effect.
2. Components: 버튼, 탭, 내비게이션, 카드, 파티 슬롯, 매치 상태와 결과 모듈을 실제 컴포넌트로 만든다.
3. Screens: 계약의 24개 ID를 정확히 사용한다.
4. Assets Mapping: 모든 `IMG/*` 슬롯과 CSV 출력 경로를 연결한다.
5. Dev Handoff: safe area, 토큰, 상태, 컴포넌트 이름과 export 형식을 기록한다.

재실행 시 기존 구조와 컴포넌트를 업데이트한다. 무관한 사용자 작업을 삭제하거나 같은 프레임을 중복 생성하지 않는다.

## 자산과 승인

- 자현은 mouse, 묘령은 rabbit, 나비는 cat-theme 슬롯에만 연결한다.
- 승인 캐릭터의 콘셉트가 일반적인 프롬프트 설명보다 우선한다.
- fox, wolf, deer, raccoon, extra-01은 `character-approval-required`가 해제되기 전 최종 캐릭터로 만들지 않는다.
- 누락 파일은 정확한 `IMG/...` 이름과 비율을 가진 플레이스홀더로 표현하고 보이는 `MISSING ASSETS` 목록에 추가한다.
- Splash에는 캐릭터를 넣지 않는다. 장신구에는 희귀도·등급 단서를 넣지 않는다.

## QA 보고

- 페이지/섹션과 실제 컴포넌트 수
- 정확한 24개 화면 ID와 1920×1080 여부
- 누락 에셋·플레이스홀더 수와 목록
- 모드 5개, 최대 8명, 팀당 1~4명 표현
- Splash 캐릭터 없음과 장신구 무등급 표현
- clipping, overlap, 한국어 가독성, CTA 위계
- 미해결 결정과 MCP 한계
