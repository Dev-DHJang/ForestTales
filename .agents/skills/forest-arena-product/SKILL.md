---
name: forest-arena-product
description: Forest Arena 제품 규칙·Phase 범위·로드아웃 의도·수용 기준·ADR 제안을 관리한다.
---

# Forest Arena 제품

## 사용 시점

- 비전, 게임 규칙, 성장 의도, 로드맵, 범위와 수용 기준 변경에 사용한다.
- 확정된 전투 규칙의 코드 구현만 필요한 경우에는 combat를 사용한다.

## 필수 입력

- 원 요청, README.md, 관련 제품 문서, DECISIONS.md와 현재 Phase.
- 플레이테스트 근거와 영향받는 생산자·소비자.

## 작업 흐름

1. 규칙을 담당 문서 한 곳에 두고 다른 문서는 연결한다.
2. 확정 규칙, 조정 가능한 기본값과 미정 결정을 구분한다.
3. 미정 규칙은 proposed ADR로 만들고 사용자 승인 없이 accepted로 바꾸지 않는다.
4. 의도를 관찰 가능한 수용 기준과 Phase 종료 기준으로 변환한다.

## 산출물과 검증

- _workspace/<topic>/02_product.md, 담당 제품 문서와 필요한 ADR.
- 문서 간 용어·Phase·범위가 일치하고 구현되지 않은 기능을 현재 상태로 쓰지 않았는지 확인한다.
