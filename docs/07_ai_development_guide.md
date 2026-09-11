# 07. AI 개발 가이드

## 작업 순서

1. README.md의 문서 우선순위와 현재 Phase를 확인한다.
2. 목표, Phase, 범위, 제외, 불변 조건, 수용 기준과 검증을 _workspace/<topic>/00_request.md에 적는다.
3. 공용 Resource, 저장, ID 또는 프로토콜이 바뀌면 contracts 역할이 01_contract.md를 먼저 작성한다.
4. 한 영역은 해당 전문가가 직접 처리하고, 여러 영역·계약·Phase 작업은 orchestrator가 최소 역할을 고른다.
5. 생산자는 자동 테스트 또는 이름 있는 수동 회귀를 수행한다.
6. qa는 원 요청과 생산자·소비자 경계를 함께 검토한다.
7. 미정 영구 규칙은 proposed ADR로 남기고 사용자 승인 전 accepted로 만들지 않는다.
8. 실제 Android 기기에서 수행하지 않은 검증은 에디터 결과와 구분한다.
9. 비전투 UI 작업은 `docs/ui/non-combat-ui-v01.json`과 `assets/ui/asset-requirements.csv`를 먼저 읽고 product/contracts → ui/image-design → mobile/qa 순서로 인수인계한다.

## 표준 요청 형식

    목표:
    현재 Phase:
    범위:
    제외:
    불변 조건:
    수용 기준: 필수 또는 명시적 이연
    검증:

## 작업 증적

- 00_request.md: 목표, 범위, 제외, 불변 조건, 수용 기준과 담당.
- 01_contract.md: 공용 계약 변경 시 구현 전에 작성.
- 02_<role>.md: 역할별 변경, 생산자·소비자, 검증과 위험.
- 03_qa_rNN.md: 회차별 pass, fix, redo 또는 blocked.
- 04_closeout.md: 최종 상태, 실행·미실행 검증, 브랜치·commit·PR·병합·롤백과 다음 작업.

## 초기 구현 금지

Phase 2 종료 시점에는 정식 선택 UI, 24개 비전투 화면의 실제 Godot 구현, 성장·경제 UI, 계정, 상점, 결제, 광고, 온라인 매칭, 프로덕션 백엔드와 전체 에셋 다운로드를 하지 않는다. Phase 1 전투 런타임과 Phase 2 로드아웃 주입은 구현 완료지만, 사용자 승인 콘셉트와 모션 패키지는 전투 판정 권위를 뜻하지 않는다. 온라인 역할은 Phase 7과 승인된 ADR·계약 전 요청을 blocked로 인수인계한다.

## 인수인계 확인

- 바뀐 문서·코드·데이터·에셋 경로.
- 생산자와 소비자가 공유하는 ID, 상태, 이벤트와 실패 의미.
- 실행한 테스트와 실행하지 못한 기기·서비스 검증.
- 임시 결정, ADR 상태와 재개 조건.
- 사용자 변경 보존 여부, 롤백 지점과 다음 담당.
