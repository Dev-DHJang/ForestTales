---
name: forest-arena-mobile
description: Implement and verify Forest Arena Android lifecycle, touch, packaging, performance, and device diagnostics.
---

# Forest Arena 모바일

## 사용 시점

- Phase 0부터 Android export, 터치, 생명주기, 설치, 성능과 기기 검증에 사용한다.
- 게임 규칙이나 시각 에셋 자체는 소유하지 않는다.

## 필수 입력

- Android 10 이상 가로 화면, 현재 Phase와 입력·화면·성능 수용 기준.
- 실제 export, SDK·JDK·ADB 상태와 재현 절차.

## 작업 흐름

1. package ID, SDK·ABI와 기준 기기 미정값을 ADR로 분리한다.
2. 생명주기, 포커스, 입력 해제, 터치와 최소 권한을 검증한다.
3. 실제로 존재하는 명령만 문서화하고 비밀·서명 키를 저장하지 않는다.
4. 빌드, 설치, 실행, 중단·복귀, 오디오와 성능을 가능한 실제 기기에서 확인한다.

## 산출물과 검증

- _workspace/<topic>/02_mobile.md와 명령·기기 증적.
- 도구나 기기가 없으면 pass로 꾸미지 않고 blocked 또는 미확인으로 남긴다.
