# Forest Arena

Forest Arena는 독창적인 3등신 동물 캐릭터가 싸우는 Godot 4 기반 Android 우선 2D 플랫폼 아레나 격투게임이다. 현재 저장소는 Phase 0 실행 기반을 포함한다.

## 문서 우선순위

충돌이 있을 때 아래 순서로 판단한다.

1. 사용자가 승인한 [결정 기록](docs/DECISIONS.md)의 accepted ADR
2. 번호순 제품 문서
3. [하네스 팀 명세](docs/harness/forest-arena/team-spec.md)
4. 작업별 _workspace/<topic>/ 인수인계

미정 항목은 영구 규칙으로 확정하지 않고 proposed ADR로 남긴다. 같은 규칙을 여러 문서에 복제하지 않고 담당 문서로 연결한다.

## 문서 지도

- [제품 비전](docs/01_product_vision.md)
- [게임 디자인](docs/02_game_design.md)
- [기능과 UX](docs/03_features_and_ux.md)
- [기술 아키텍처](docs/04_technical_architecture.md)
- [콘텐츠·아트·오디오](docs/05_content_art_audio.md)
- [캐릭터 외형 계약 v01](docs/character-appearance-v01.json)
- [로드맵과 수용 기준](docs/06_roadmap_and_acceptance.md)
- [AI 개발 가이드](docs/07_ai_development_guide.md)
- [결정 기록](docs/DECISIONS.md)
- [비전투 UI·Penpot 설계 기준](docs/ui/penpot-setup.md)
- [하네스 운영 색인](docs/harness/forest-arena/operating-index.md)

## 실행과 검증

    godot --path . --editor
    ./scripts/verify.sh
    ./scripts/export-debug-android.sh
    ./scripts/verify-android-emulator.sh

`./scripts/verify.sh`는 headless 편집기 로드, Phase 0 smoke, manifest 기반 CharacterData·캐릭터 외형·승인 모션 계약, 공격·비전투 UI 설계 계약, 하네스 구조 검사를 묶는 기본 로컬 검증이다. `./scripts/verify-harness.sh`는 스킬·문서·라우팅만 빠르게 확인한다.

## 현재 상태

- 완료: 제품 문서, 17개 역할 스킬(기존 역할과 Godot UI·리소스 역할), 팀 명세, Godot 프로젝트, 의미 InputMap, 임시 2D 경기장과 Phase 0 smoke test.
- 승인된 선행 콘텐츠: 자현·묘령·나비의 CharacterData와 콘셉트 등록, 세 캐릭터의 idle/run/stationary jump 모션 패키지. 이는 Phase 1 전투 완료나 현재 런타임 장면 연결을 뜻하지 않는다.
- 공격 체계: 전체 공격 콘셉트 v01과 자동 문서 계약을 완료했다. Phase 1의 실제 공격·판정·입력 UI는 아직 구현하지 않았다.
- UI 설계 기반: 24개 `SCR_*` 화면, 61개 `IMG/*` 요구 에셋과 로컬 Penpot MCP 작업 계약을 확정했다. 실제 Godot 화면·이미지·Penpot 파일은 아직 만들지 않았다.
- 로컬 검증 완료: Android debug APK export, arm64 에뮬레이터 설치·가로 실행·중단/복귀와 20:9 시각 검사.
- 미확인: 실제 물리 Android 기기의 터치·중단/복귀·성능.
- 미구현: Phase 1 전투, 승인 콘텐츠의 런타임 장면 연결, 승인 대기 공격 모션, 오디오, 데이터 로드아웃과 온라인 기능.
