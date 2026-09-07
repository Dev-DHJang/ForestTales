# Phase 0 실행 기반 요청

## 목표

문서 우선순위와 승인 상태를 지키며 ForestTales의 Godot 4 Android 우선 실행 기반을 만든다.

## 현재 Phase

Phase 0 — 실행 기반.

## 범위

- Godot 프로젝트와 Android debug export preset.
- 의미 InputMap, 2D 테스트 경기장, 도형 기반 임시 파이터와 입력 표시.
- 터치 멀티포인터 어댑터와 포커스·중단 시 입력 해제.
- 데스크톱 부트, headless smoke, Android export의 재현 명령.
- Phase 0에 필요한 proposed ADR 보완.

## 제외

- 이동·공격·판정·피해·넉백·링아웃 승패 등 Phase 1 전투 구현.
- 최종 UI, 아트, 애니메이션, 오디오, 데이터 로드아웃, 저장, 경제와 온라인.
- 실제 물리 Android 기기 검증을 에뮬레이터 검증으로 대체하는 것.

## 불변 조건

- Android 10 이상 가로 화면과 터치가 제품 기준이다.
- 의미 입력은 장치 어댑터와 분리하고 전투 판정은 시각·UI에서 분리한다.
- 임시 package ID와 터치·성능 값은 승인 전 영구 규칙이 아니다.
- 기존 사용자 파일과 변경을 보존한다.

## 수용 기준

- 필수: Godot 4.7.1에서 프로젝트가 오류 없이 headless 부트한다.
- 필수: 일곱 의미 입력과 권위/표현 충돌 레이어가 프로젝트 설정에 있다.
- 필수: 테스트 경기장, 두 임시 파이터, Camera2D와 터치 입력 어댑터가 로드된다.
- 필수: 포커스 손실·앱 중단 때 합성 터치 입력을 해제한다.
- 필수: Android debug APK export를 실제 명령으로 재현한다.
- 명시적 이연: 실제 물리 Android 기기의 설치·실행·터치·중단·복귀·성능 검증.
- 명시적 이연: 터치 크기와 성능 예산의 accepted ADR 전환.

## 담당

- 통합: forest-tales-orchestrator
- 제품: forest-tales-product
- 실행 장면 경계: forest-tales-combat
- 터치 표현: forest-tales-ui
- Android: forest-tales-mobile
- 독립 검토: forest-tales-qa
- 버전 관리: forest-tales-version-control
