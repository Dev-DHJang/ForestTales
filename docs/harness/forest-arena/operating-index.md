# Forest Arena 하네스 운영 색인

## 현재 운영 상태

- 제품 현재 단계: Phase 0. Phase 1 전투는 아직 구현·종료 검증되지 않았다.
- 승인된 선행 콘텐츠: 자현·묘령·나비 콘셉트와 세 캐릭터의 idle/run/jump 모션. 이들은 manifest 기반 계약 자산이며 현재 전투 장면의 권위 또는 Phase 승격 근거가 아니다.
- 승인된 미래 제품 규칙: Story/Solo/Team/AI/Practice, 최대 8명, Team 팀당 1~4명, 장신구 등급·희귀도 없음. 현재 Phase 0 구현 범위를 확장하지 않는다.
- 비전투 UI 기반: `docs/ui/non-combat-ui-v01.json`의 24개 화면과 `assets/ui/asset-requirements.csv`의 61개 요구 에셋. 실제 Godot 화면·이미지·Penpot 파일은 미생산이다.
- 기본 검증: `./scripts/verify.sh`.
- 하네스 전용 검증: `./scripts/verify-harness.sh`.
- Android export·에뮬레이터 검증: `./scripts/export-debug-android.sh`, `./scripts/verify-android-emulator.sh`. 실제 기기 결과는 별도 기록이 없으면 미검증이다.

## 역할과 인수인계

| 역할 | 호출 조건 | 생산물 | 후속 소비자·QA |
| --- | --- | --- | --- |
| orchestrator | 다영역·공용 계약·Phase 경계 | 통합 계획과 closeout | 필요한 역할, qa |
| product | 제품 규칙·수용 기준·ADR | 제품 결정 | orchestrator, qa |
| combat | 이동·공격·판정·링아웃 | 결정론적 전투 | ui, 2d-animation, qa |
| ui | 터치·카메라·HUD | 표현과 의미 입력 어댑터 | combat, mobile, qa |
| 2d-animation | 일반 프레임·아틀라스·시각 래퍼 | SpriteFrames와 매핑 | character-motion, combat, qa |
| character-design | 신규 전투 캐릭터 콘셉트 | 승인된 concept·CharacterData 등록 | character-motion, contracts, combat, qa |
| character-motion | 승인 콘셉트의 idle·jump·run | 모션별 승인 runtime 패키지 | 2d-animation, qa |
| image-design | 초상화·아이콘·배경 등 정적 이미지 | 정적 이미지와 권리 기록 | ui, 2d-animation, qa |
| audio | BGM·SFX | 의미 이벤트 기반 오디오 | combat, mobile, qa |
| mobile | Android export·생명주기·성능 | 기기 검증 증적 | ui, combat, qa |
| contracts | Resource·공용 ID·저장 | versioned 계약 | combat, product, qa |
| multiplayer | Phase 7 온라인 매치 의미 | 온라인 의미 계약 | network, mobile, qa |
| network | Phase 7 전송·복구 | 전송·진단 | multiplayer, mobile, qa |
| qa | 독립 검토 | pass/fix/redo/blocked 증적 | 모든 생산자 |
| version-control | 브랜치·원격 통합 | Git·롤백 증적 | qa, orchestrator |

온라인 역할은 Phase 7과 accepted 네트워크 ADR 전에는 구현하지 않는다. character-design과 character-motion은 각각의 사용자 명시 승인 전 최종 자산·manifest를 변경하지 않는다.

## 작업 증적 상태

| 작업 | 상태 | 재개 또는 참고 |
| --- | --- | --- |
| harness-bootstrap | 완료 | 최초 하네스 구조와 검증 기준 |
| phase-0-foundation | 완료 | Phase 0 실행·에뮬레이터 증적; 실제 기기는 미검증 |
| character-design-skill | 완료 | 캐릭터 디자인 승인 게이트 |
| character-design-prompt-intake | 완료 | 입력 양식과 프롬프트 흐름 |
| character-motion-skill | 완료 | 모션 역할·승인 게이트 |
| character-data-foundation | 완료 | 자현·묘령 CharacterData·manifest 계약 |
| nabi-character-data | 완료 | 나비 CharacterData 등록 |
| character-design-nabi | 완료 | v05 white-tail chibi 콘셉트 채택·등록, 기존 안정 경로 유지 |
| character-motion-ja-hyun | 완료 | idle·run·stationary jump 및 r02 기본 3연계 공격 런타임 등록 완료 |
| character-attack-motion-ja-hyun | 완료 | r02 기본 3연계(one-shot)·visual-state/manifest 자동 계약 등록 완료 |
| character-motion-nabi | 완료 | v05 white-tail chibi 기반 idle·run·stationary jump 런타임 교체 완료 |
| character-motion-myo-ryung | 완료 | r02 idle/run 보존 및 stationary jump 등록 완료 |
| combat-concept | 완료 | 전체 공격 체계 v01, 기술표·ADR·자동 계약 검사 |
| project-harness-cleanup | 완료 | 하네스·문서·계약 검사 정리 및 QA pass |
| forest-arena-ui-foundation | 완료 | 브랜드 전환, UI·에셋 계약, Penpot 하네스와 자동 검사; 외부 Penpot·이미지·Godot 화면 미실행 |

원본 `_workspace/<topic>/` 증적은 감사와 재개를 위해 이동·삭제하지 않는다. 과거 시안 경로나 버전명은 당시 의사결정 증거이므로 현재 자산 경로와 달라도 이 색인의 상태 정보로만 구분한다.
