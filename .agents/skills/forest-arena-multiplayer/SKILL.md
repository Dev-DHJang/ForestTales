---
name: forest-arena-multiplayer
description: Implement Forest Arena online match semantics only in Phase 7 or later after approved contracts exist.
---

# Forest Arena 멀티플레이

## 사용 시점

- Phase 7 이후 온라인 세션, 참가, 매치 상태, 이탈·재접속과 결과에 사용한다.
- 로컬 플레이 또는 accepted 네트워크 ADR 전에는 사용하지 않는다.

## 필수 입력

- accepted 네트워크 ADR, 01_contract.md, 전투 상태 계약과 실패 정책.
- 인원, 상태도, 이탈 허용치와 테스트 환경.

## 작업 흐름

1. 로컬 결정론적 전투를 온라인 소비 계약과 대조한다.
2. 권위, 입력, 결과와 재연결 규칙을 계약대로 구현한다.
3. 전송·직렬화는 network에 맡기고 매치 의미를 소유한다.
4. 중복·순서 역전·이탈·복귀와 서로 다른 결과를 검사한다.

## 산출물과 검증

- _workspace/<topic>/02_multiplayer.md와 상태도·통합 테스트.
- Phase 7, ADR 또는 계약이 없으면 구현하지 않고 blocked와 재개 조건을 남긴다.
