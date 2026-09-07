# ForestTales 하네스 팀 명세

## 구조

하네스는 Expert Pool + Producer-Reviewer다. 단일 영역은 해당 전문가가 직접 처리한다. 둘 이상의 생산 영역, 공용 계약 또는 Phase 경계를 건드리는 작업만 orchestrator가 조율하며 qa가 원 요청과 생산·소비 경계를 독립 검토한다.

## 역할

| 역할 | 스킬 | 소유 범위 |
| --- | --- | --- |
| 오케스트레이터 | forest-tales-orchestrator | 영향 분석, 역할 선택, 계약 순서, 통합과 종료 |
| 제품 | forest-tales-product | 제품 규칙, Phase, 범위, 수용 기준과 ADR |
| 전투 | forest-tales-combat | 이동, 상태, 공격, 판정, 넉백, 링아웃과 로드아웃 |
| UI | forest-tales-ui | Android 터치 UX, Camera2D, HUD와 메뉴 |
| 애니메이션 | forest-tales-2d-animation | 프레임, 아틀라스, SpriteFrames와 시각 래퍼 |
| 이미지 | forest-tales-image-design | 콘셉트, 초상화, 아이콘, UI 이미지와 배경 |
| 오디오 | forest-tales-audio | 의미 이벤트 기반 BGM·SFX와 모바일 오디오 |
| 모바일 | forest-tales-mobile | Android export, 생명주기, 터치, 성능과 기기 검증 |
| 계약 | forest-tales-contracts | Resource, 저장, 공용 ID와 미래 versioned 계약 |
| 멀티플레이 | forest-tales-multiplayer | Phase 7 이후 온라인 매치 의미 |
| 네트워크 | forest-tales-network | Phase 7 이후 전송, 연결과 복구 |
| QA | forest-tales-qa | 독립 검증과 pass/fix/redo/blocked 판정 |
| 버전 관리 | forest-tales-version-control | Gitflow, 원격 병합 증적과 롤백 |

## 요청 라우팅

| 요청 | 필수 역할 | 조건부 역할 | 제한 |
| --- | --- | --- | --- |
| 제품 규칙·로드맵 | product | orchestrator, qa | 미정 규칙은 proposed ADR |
| 이동·공격·판정 | combat, qa | ui, mobile | 시각 프레임은 판정 비권위 |
| 터치·카메라·HUD | ui, mobile, qa | combat | 전투 결과 계산 금지 |
| Resource·ID·저장 | contracts, qa | combat, product | 01_contract.md 선행 |
| 콘셉트·정적 이미지 | image-design, qa | ui, 2d-animation | 원본성과 권리 기록 |
| 프레임 애니메이션 | 2d-animation, qa | combat, image-design | AttackData 타이밍 소비 |
| BGM·SFX | audio, qa | combat, mobile | 의미 이벤트 소비 |
| Android export·기기 | mobile, qa | ui, combat | 실제 기기 결과 구분 |
| 온라인·재접속 | contracts, multiplayer, network, mobile, qa | combat, ui | Phase 7 + accepted ADR 필수 |
| 릴리스·원격 통합 | version-control, qa | orchestrator | 실제 Git·권한 필요 |

모호한 요청은 README와 현재 Phase를 읽는 영향 분석부터 수행한다. 기본값은 현재 Phase 유지와 새 시스템 미추가다.

## 작업 흐름과 증적

모든 작업은 _workspace/<topic>/에 둔다. topic은 소문자 영문·숫자·하이픈을 사용한다.

1. 00_request.md: 목표, Phase, 범위, 제외, 불변 조건, 필수/명시적 이연 수용 기준과 담당.
2. 01_contract.md: Resource, 저장, 공용 ID 또는 프로토콜 변경 시 생산 전에 작성.
3. 02_<role>.md: 역할별 입력, 변경, 생산자·소비자, 검증과 위험.
4. 03_qa_rNN.md: 회차별 pass, fix, redo 또는 blocked.
5. 02_version-control.md: 향후 코드 작업의 브랜치, commit, 원격 PR/병합과 롤백.
6. 04_closeout.md: 최종 상태, 실행·미실행 검증, 필요한 원격 증적과 다음 작업.

fix는 구현 생산자에게, redo는 product 또는 contracts 소유자에게 돌린다. 수정은 최대 두 회차이며 같은 원인이 반복되면 접근과 역할을 다시 분류한다. 필수 검증 불가는 blocked다. 사용자 승인으로 명시적 이연한 검사만 범위·이유·재개 조건을 남긴다.

## 병렬성과 소유권

- 서로 다른 문서의 읽기 분석, 독립된 이미지·애니메이션·오디오 후보와 격리된 테스트만 병렬화할 수 있다.
- 같은 파일, 공용 계약, InputMap, 프로젝트 설정, 에셋 manifest와 상태를 공유하는 테스트는 한 소유자가 순차 처리한다.
- 병렬 작업은 겹치지 않는 경로와 소비자를 먼저 기록하며 orchestrator가 최종 통합한다.
- 일부 실패 시 성공 산출물은 보존하고 실패 범위, 소비자 영향과 재시도 조건을 closeout에 남긴다.

## 불변 경계

- combat는 전투 판정을, ui·2d-animation·image-design·audio는 표현을 소유한다.
- 애니메이션 프레임, 프레임 이벤트, 보이는 몸·무기, UI와 소리는 피해, 상태, 넉백 또는 승패를 결정하지 않는다.
- CharacterData + JobData + AccessoryData의 조합은 contracts와 combat가 함께 관리한다.
- 경기장 충돌, 스폰과 KillVolume은 StageData 및 전투 레이어가 소유하며 장식과 분리한다.
- 온라인, 영속 진행과 경제는 해당 Phase와 사용자 승인 전 구현하지 않는다.

## Phase 게이트

- Phase 0: Godot·Android 실행 기반과 임시 2D 장면.
- Phase 1: 이동, 공격, 판정, 링아웃과 최소 터치 전투.
- Phase 2: Resource와 런타임 로드아웃 조합.
- Phase 3: 전투 원형 비교.
- Phase 4: 장신구와 태그 시너지.
- Phase 5: 분기형 직업 구조.
- Phase 6: Android 오프라인 수직 슬라이스.
- Phase 7: accepted 네트워크 ADR과 versioned 계약 이후 온라인.

Phase 7 이전 온라인 구현 요청은 multiplayer와 network가 실행하지 않는다. 필요한 ADR, 계약, 선행 종료 기준과 재개 조건을 기록해 blocked로 인수인계한다.

## QA와 완료

- 생산자는 자동 검사 또는 이름 있는 수동 회귀를 수행한다.
- qa는 원 요청, 담당 제품 문서, 계약, 생산자와 소비자 산출물을 함께 읽는다.
- 실제 기기·서비스가 없어 수행하지 못한 검증은 pass가 아니다.
- 알려진 차단 결함이 없고 모든 필수 기준이 pass일 때만 완료한다.
- 하네스는 ./scripts/verify-harness.sh로 검사한다. 게임 명령은 Phase 0에서 실제로 만든 뒤 문서화한다.

## 버전 관리

- main은 배포 가능한 릴리스 이력, develop은 다음 릴리스의 원격 통합 브랜치다.
- 일반 코드 작업은 최신 origin/develop에서 feature/<topic>으로 분기한다.
- QA pass 뒤 원격 PR로 develop에 병합하고 SHA, PR/병합 commit, 검증과 롤백을 02_version-control.md에 기록한다.
- release/<version>과 hotfix/<version>만 통제된 경로로 main에 들어간다.
- 권한, 보호 규칙, 네트워크 또는 충돌로 원격 병합에 실패하면 blocked다.
- 문서 전용 작업과 최초 하네스 bootstrap은 원격 병합을 완료 조건으로 강제하지 않는다.
