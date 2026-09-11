# 리소스·Autoload 계약

| 표면 | 계약 |
| --- | --- |
| Autoload | `ForestArenaResources` → `res://forest_arena/scripts/forest_arena_resource_manager.gd` |
| 레지스트리 | `res://forest_arena/data/resource_registry.json`의 337개 logical ID |
| 품질 | 품질 의존 22개 자산의 `high`, `medium`, `low` 변형 |
| 소비 | Godot UI는 경로를 하드코딩하지 않고 `ForestArenaResources`를 사용 |
| 검증 | `python tools/forest_arena/verify_godot_resources.py --project-root .` |

패키지 카탈로그는 별도 리소스 계층이다. 기존 `assets/ui/generated/`의 `IMG/*` 계약과 `assets/character/`의 사용자 승인 게이트를 대체하거나 승인하지 않는다.
