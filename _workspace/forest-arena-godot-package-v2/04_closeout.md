# 종료 증적

- 상태: complete
- 적용: 공식 패키지 설치기, `ForestArenaResources` Autoload, `res://forest_arena/` 리소스 카탈로그, AGENTS 리소스 맵, Godot UI·리소스 스킬·문서·검증기·package harness contract.
- 하네스: 기존 15개 역할을 보존한 채 Godot UI·리소스 역할을 정식 추가해 17개 역할로 검증한다.
- 보존: 기존 사용자 미커밋 character-design 거버넌스 변경, `assets/character/`, `assets/ui/generated/`, `IMG/*` 승인 상태, Phase 0 동작 및 과거 작업 증적.
- 설치 예외: 1차 설치는 샌드박스의 `.agents` 쓰기 제한으로 부분 중단됐고, 2차 공식 설치가 성공했다. 1차에 이미 복사된 `forest_arena/`는 성공 보고서의 변경 목록에서는 생략됐으나 독립 리소스 검증에서 확인됐다.
- 검증: 리소스 검증, headless Godot 로드, shell/diff 검사, 하네스와 전체 `./scripts/verify.sh`가 pass.
- 미검증: 실제 Android 기기와 에뮬레이터 설치·가로 실행·생명주기. pass로 간주하지 않는다.
