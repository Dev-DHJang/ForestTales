# 캐릭터 브리프·검토 형식

생성 전에 [콘셉트 프롬프트·입력 양식](concept-prompt-template.md)을 먼저 완성한다. 사용자 답변은 이 문서의 대응 필드에 원문대로 기록한다.

## 입력 브리프

| 항목 | 내용 |
| --- | --- |
| draft_slug | 승인 전 작업 증적용 충돌 없는 임시 slug |
| 프로젝트 메타데이터 | 현재 Phase, Android 가로 화면·최대 줌아웃 조건 |
| 사용자 입력 | 완성된 전체 입력 양식의 각 필드 |
| 작화 참조 | 기본 참조 파일, 각 시각 역할, manifest 권리 상태 |
| 추가 참고 | 사용자가 제공한 자료의 출처·허가·적용 범위 |
| 생성 프롬프트 | 고정 규칙과 사용자 입력을 필드별로 반영한 최종 시안 프롬프트 |
| 외형 기준 상태 | `new-draft` 또는 승인 외형 계약의 `contract_id`·`character_id`·`concept_asset_id` |
| 변경 영향 (승인 캐릭터만) | 기존값·제안값, 영향 PNG·초상화·아이콘·모션·아틀라스, 계약 변경 권한과 사용자 승인 상태 |

## 디자인 시트

- 캐릭터 한 줄 정의와 독창성 방향
- 성인 여부·성별 표현, 인간형/수인화 수준과 금지 신체 구조
- 주·보조·포인트 색상, 필수·각도 한정 종 특징, 고정·가변 의상 레이어와 장신구
- 공격 포즈, 작은 화면에서 남겨야 할 식별 요소와 피해야 할 유사성 위험
- 참고 자료의 역할과 권리 상태. 참고는 공통 시각 언어와 가독성 원칙으로 한정한다.
- 승인 캐릭터는 외형 계약의 ID·필수·각도 한정·금지 규칙을 그대로 적고, 변경 시에는 변경 대상과 영향 자산을 별도 표로 남긴다. 계약 밖의 차이는 임의 보정하지 않는다.

## QA 검토표

| 기준 | 판정 | 증거 또는 수정 요청 |
| --- | --- | --- |
| 전체 입력 양식 충족·원문 반영 | pass/fix/redo | |
| 성인·성별 표현과 인간형/수인화 경계 | pass/fix/redo | |
| 필수·각도 한정 종 특징과 금지 신체 구조 | pass/fix/redo | |
| 고정·가변 의상 요소와 팔레트 | pass/fix/redo | |
| 기본·추가 참고의 권리 기록과 원본성 | pass/fix/redo | |
| 최대 줌아웃 종·역할 식별 | pass/fix/redo | |
| 공격 준비·발동 실루엣 | pass/fix/redo | |
| 배경 대비·색상 식별·전신 잘림 여부 | pass/fix/redo | |
| 외형 기준 우선순위·변경 영향·ID 연결 | pass/fix/redo | |

`pass`여도 사용자 명시 승인 전에는 최종 자산을 등록하지 않는다. `fix`는 시안 생산자에게, `redo`는 브리프를 다시 정하는 요청자에게 반환한다.

## 승인·등록 기록

시안 승인 뒤에 표시 이름과 `character_id`를 받고, 신규 캐릭터라면 외형 계약에 기록할 필드를 확정한다. 승인 캐릭터 변경이면 계약 변경과 영향 범위의 명시 승인을 별도로 받는다. QA가 pass하고 등록 대상의 명시 승인을 다시 확인한 뒤에만 콘셉트 PNG와 `design.md`를 `assets/character/<character-id>/concept/`에 저장한다. `assets/character/manifest.json`의 각 기록은 최소한 다음 필드를 가진다.

```json
{
  "asset_id": "<character-id>-concept-v01",
  "character_id": "<character-id>",
  "type": "concept",
  "path": "assets/character/<character-id>/concept/<character-id>-concept-v01.png",
  "creation": { "method": "", "provider": "", "version": "" },
  "rights": { "status": "", "references": [] },
  "verified_on": "YYYY-MM-DD",
  "sha256": "",
  "modifications": [],
  "consumer_path": ""
}
```
