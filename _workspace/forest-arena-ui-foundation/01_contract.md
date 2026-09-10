# 공용 계약

## 브랜드와 Android

| 표면 | 값 |
| --- | --- |
| 표시명 | `Forest Arena` |
| 로고 | `FOREST ARENA` |
| 기술 슬러그 | `forest-arena` |
| Android package | `com.forestarena.welllbeing` |
| debug APK | `build/android/ForestArena-debug.apk` |
| 하네스 스킬 | `.agents/skills/forest-arena-*` |
| 하네스 문서 | `docs/harness/forest-arena/` |

package 변경은 기존 `com.foresttales.welllbeing` 앱의 인플레이스 업데이트가 아니라 별도 앱 설치다. 기존 설치본 삭제나 데이터 자동 마이그레이션은 이 작업에 포함하지 않는다.

## 화면·에셋

- 화면 단일 원본: `docs/ui/non-combat-ui-v01.json`.
- 에셋 단일 원본: `assets/ui/asset-requirements.csv`.
- Launch: `SCR_01_Splash`, `SCR_02_Login`.
- Lobby/meta: `SCR_03_Lobby`–`SCR_08_Preset`, `SCR_19_Shop`–`SCR_24_Profile`.
- Match flow: `SCR_09_ModeSelect`–`SCR_15_Loading`.
- Result: `SCR_16_Victory`–`SCR_18_MVP`.
- 모든 이미지 슬롯은 `IMG/`로 시작하며 고유한 `assets/ui/generated/...` 출력 경로를 가진다.

## 제품 불변식

- 모드: Story, Solo, Team, AI, Practice.
- 최대 8명. Team은 팀당 1~4명이고 전체 최대 8명.
- 장신구 등급·희귀도 없음.
- Splash 캐릭터 없음.
- Penpot 1920×1080은 설계 참조이며 Godot 1280×720은 런타임 논리 해상도다.

## 캐릭터 승인 매핑

- 자현 → mouse 슬롯 → 승인 콘셉트 `assets/character/ja-hyun/concept/ja-hyun-concept-v01.png`.
- 묘령 → rabbit 슬롯 → 승인 콘셉트 `assets/character/myo-ryung/concept/myo-ryung-concept-v01.png`.
- 나비 → cat-theme 슬롯 → 승인 콘셉트 `assets/character/nabi/concept/nabi-concept-v01.png`.
- fox, wolf, deer, raccoon, extra-01 → `character-approval-required`와 `blocked`.

## 실패와 호환

- 누락 이미지는 정확한 `IMG/*` 플레이스홀더와 보이는 `MISSING ASSETS` 목록으로 실패를 드러낸다.
- 미승인 로스터는 최종 이미지를 만들지 않는다.
- 계정·경제·온라인 소비자가 없으면 화면 계약만 유지하고 구현하지 않는다.
- 캐릭터 ID, 기존 캐릭터 경로, 전투 입력 ID와 Resource 스키마는 변경하지 않는다.
