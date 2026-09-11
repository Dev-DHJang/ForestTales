# 요청

- 날짜: 2026-09-11
- 현재 Phase: 0 유지
- 목표: Forest Arena Godot/Codex Attachment Package v2를 현재 Godot 프로젝트에 공식 설치기로 적용하고, Autoload·리소스 스킬·하네스와 자동 검증을 통합한다.
- 담당: orchestrator, godot-resources, godot-ui, contracts, qa.

## 범위와 불변 조건

- ZIP 설치기의 백업·복사·Autoload 등록·리소스 검증을 사용한다.
- 15개 기존 역할에 Godot UI와 Godot 리소스를 더해 17개 역할 하네스로 전환한다.
- `res://forest_arena/` 카탈로그는 기존 `assets/ui/generated/`, `assets/character/`, 캐릭터 승인 상태, 1280×720 런타임과 현재 Phase 0 동작을 변경하지 않는다.
- 실제 Android 기기 검증, 실제 비전투 Godot 화면, 이미지 승인·생성은 이 요청의 범위 밖이다.
