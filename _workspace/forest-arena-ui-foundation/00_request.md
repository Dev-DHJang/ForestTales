# 요청

- 날짜: 2026-09-09
- 현재 Phase: 0 유지
- 목표: 활성 브랜드를 Forest Arena로 전환하고 24개 비전투 화면의 Penpot 설계 기반, 61개 이미지 요구 계약과 하네스 작업 경로를 저장소에 통합한다.
- 담당: orchestrator, product, contracts, ui, image-design, mobile, qa, version-control.

## 범위

- ADR-014 브랜드·Android 식별자 마이그레이션과 ADR-015 미래 모드·인원·장신구 규칙.
- Godot 표시명, Android package/label, APK 이름, 활성 문서·스크립트·공격 콘셉트 제목.
- 15개 스킬의 `forest-arena-*` 경로·ID와 `docs/harness/forest-arena/`.
- `SCR_*` 24개, `IMG/*` 61개, Penpot 설정·절차·프롬프트와 자동 계약 검사.

## 제외

- 24개 화면의 실제 Godot 구현.
- 이미지 생성 또는 승인되지 않은 신규 캐릭터 제작.
- Penpot 서버 실행과 외부 Penpot 파일 수정.
- 온라인, 계정, 상점, 경제, 랭크와 소셜 기능 구현.
- 저장소 로컬 폴더·GitHub 원격 이름 변경, commit, push와 merge.

## 불변 조건

- 캐릭터 ID·기존 자산 경로, `attack_light` 등 전투 입력 ID와 Resource 스키마 유지.
- Godot 런타임 논리 해상도 1280×720과 현재 Phase 0 동작 유지.
- 기존 dirty worktree와 과거 `_workspace/` 증적 보존.
- Android 기존 package 설치본을 삭제하지 않는다.

## 수용 기준

- 24개 화면 ID와 61개 고유 출력 경로가 기계 검사된다.
- Story/Solo/Team/AI/Practice, 최대 8명, Team 팀당 1~4명 계약이 검사된다.
- Splash 캐릭터 금지, 장신구 희귀도 금지와 `MISSING ASSETS` 규칙이 검사된다.
- 새 15개 스킬명·라우팅·Penpot 참조·템플릿과 활성 이전 이름 잔존 여부가 검사된다.
- `sh -n`, `git diff --check`, `./scripts/verify-harness.sh`, `./scripts/verify.sh`, Android debug export와 APK 계약을 검증한다.
- 에뮬레이터가 연결된 경우에만 설치·가로 실행을 재검증한다. 실제 물리 기기는 미검증으로 기록한다.
