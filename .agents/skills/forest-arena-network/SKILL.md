---
name: forest-arena-network
description: Phase 7 승인 뒤 Forest Arena 전송·직렬화·연결·재시도·시간 제한·진단을 구현한다.
---

# Forest Arena 네트워크

## 사용 시점

- Phase 7 이후 승인된 모델의 연결, 전송, 직렬화, timeout, retry와 진단에 사용한다.
- 로컬 전투, 승패 의미 또는 승인 전 공급자 선택에는 사용하지 않는다.

## 필수 입력

- accepted 네트워크 ADR, versioned 메시지 계약, endpoint 환경과 장애 예산.
- 멀티플레이 상태도, 재현 로그와 지원 장치·네트워크 조건.

## 작업 흐름

1. 연결 상태, timeout, backoff, 취소와 종료 조건을 정의한다.
2. 버전과 ID를 검증하고 중복·손실·순서 역전을 안전하게 처리한다.
3. 비밀·개인정보를 제외한 실패 원인과 상관관계 ID를 기록한다.
4. 네트워크 전환, 앱 백그라운드와 재접속 실패를 검사한다.

## 산출물과 검증

- _workspace/<topic>/02_network.md와 장애 테스트.
- Phase 7, ADR 또는 계약이 없으면 구현하지 않고 blocked와 재개 조건을 남긴다.
