---
name: forest-tales-orchestrator
description: Coordinate ForestTales work spanning multiple specialist domains, shared contracts, or Phase boundaries.
---

# ForestTales 오케스트레이터

## 사용 시점

- 둘 이상의 생산 역할, 공용 계약, Phase 변경 또는 릴리스 통합이 필요한 요청에 사용한다.
- 한 역할이 안전하게 완료할 수 있는 좁은 작업에는 사용하지 않는다.

## 필수 입력

- 원 요청, README.md의 문서 우선순위, 현재 Phase와 관련 ADR.
- docs/harness/forest-tales/team-spec.md와 기존 _workspace/<topic>/ 증적.

## 작업 흐름

1. 제품 문서와 DECISIONS.md를 대조해 미정 규칙을 찾는다.
2. 최소 역할만 선택하고 경로·소비자·검증 환경을 분리한다.
3. 00_request.md를 만들고 공용 계약 변경이면 contracts의 01_contract.md를 선행한다.
4. 독립 작업만 병렬화하고 한 소유자가 최종 통합한다.
5. qa 결과의 fix 또는 redo를 최대 두 회차 처리한다.
6. 04_closeout.md에 결과, 검증, 미확인, 롤백과 다음 작업을 기록한다.

## 산출물과 검증

- _workspace/<topic>/02_orchestrator.md와 통합된 역할별 산출물.
- 모든 소비자가 같은 ID·상태·이벤트·Phase 의미를 쓰고 필수 기준이 pass인지 확인한다.
