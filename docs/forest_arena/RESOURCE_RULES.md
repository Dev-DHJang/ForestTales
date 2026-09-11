# Forest Arena 리소스 규칙

- 밝은 판타지 숲, 조각 나무와 잎 UI, 비픽셀 아트 방향을 사용한다.
- `character/main` 아래의 주인공 토끼 파일은 정체성을 보존하는 기준 리소스다.
- 장신구에는 등급·희귀도·별 티어를 두지 않는다.
- 버튼·프레임의 일반 UI 문구는 네이티브 Godot 텍스트로 유지한다.
- 품질 디렉터리를 하드코딩하지 말고 `ForestArenaResources` 논리 ID를 사용한다.
- 전투 HUD는 이 패키지 범위 밖이다.
- 카탈로그 변경 뒤 `python tools/forest_arena/verify_godot_resources.py --project-root .`로 registry·품질·Autoload를 검증한다.
