# ForestTales

ForestTales는 독창적인 3등신 동물 캐릭터가 싸우는 Godot 4 기반 Android 우선 2D 플랫폼 아레나 격투게임이다. 현재 저장소는 Phase 0 실행 기반을 포함한다.

## 문서 우선순위

충돌이 있을 때 아래 순서로 판단한다.

1. 사용자가 승인한 [결정 기록](docs/DECISIONS.md)의 accepted ADR
2. 번호순 제품 문서
3. [하네스 팀 명세](docs/harness/forest-tales/team-spec.md)
4. 작업별 _workspace/<topic>/ 인수인계

미정 항목은 영구 규칙으로 확정하지 않고 proposed ADR로 남긴다. 같은 규칙을 여러 문서에 복제하지 않고 담당 문서로 연결한다.

## 문서 지도

- [제품 비전](docs/01_product_vision.md)
- [게임 디자인](docs/02_game_design.md)
- [기능과 UX](docs/03_features_and_ux.md)
- [기술 아키텍처](docs/04_technical_architecture.md)
- [콘텐츠·아트·오디오](docs/05_content_art_audio.md)
- [로드맵과 수용 기준](docs/06_roadmap_and_acceptance.md)
- [AI 개발 가이드](docs/07_ai_development_guide.md)
- [결정 기록](docs/DECISIONS.md)

## 실행과 검증

    godot --path . --editor
    ./scripts/verify.sh
    ./scripts/export-debug-android.sh
    ./scripts/verify-android-emulator.sh

## 현재 상태

- 완료: 제품 문서, 역할 스킬, 팀 명세, Godot 프로젝트, 의미 InputMap, 임시 2D 경기장과 Phase 0 smoke test.
- 로컬 검증 완료: Android debug APK export, arm64 에뮬레이터 설치·가로 실행·중단/복귀와 20:9 시각 검사.
- 미확인: 실제 물리 Android 기기의 터치·중단/복귀·성능과 원격 develop 통합.
- 미구현: Phase 1 전투, 최종 아트·애니메이션·오디오, 데이터 로드아웃과 온라인 기능.
