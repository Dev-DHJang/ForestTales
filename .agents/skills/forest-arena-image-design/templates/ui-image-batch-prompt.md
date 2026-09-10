# Forest Arena UI 이미지 배치 제작 프롬프트

`assets/ui/asset-requirements.csv`에서 요청받은 행만 처리하고 각 행의 `asset_slot`, `output_path`, `format`, `aspect`, `status`, `approval_dependency`, `source_reference`를 그대로 따른다.

## 전역 방향

Forest Arena용 독창적인 제작 자산을 만든다. 밝은 회화적 판타지 숲, 비픽셀, 고해상도, 부드러운 하늘색, 민트와 신선한 초록, 따뜻한 햇빛, 거대한 나무, 숲 마을, 가벼운 나무·수정·석재, 코발트와 따뜻한 금색을 사용한다. 청소년과 청년에게 친근하고 모험적이되 유아적이지 않게 한다. 제3자 캐릭터, 로고, 지도, UI, 아이콘이나 특정 작가 스타일을 복제하지 않는다.

## 캐릭터 규칙

- 자현 mouse 슬롯은 `assets/character/ja-hyun/concept/ja-hyun-concept-v01.png`를 정체성 기준으로 사용한다.
- 묘령 rabbit 슬롯은 `assets/character/myo-ryung/concept/myo-ryung-concept-v01.png`를 기준으로 사용한다.
- 나비 cat-theme 슬롯은 승인된 `assets/character/nabi/concept/nabi-concept-v01.png`를 기준으로 사용하며 동물 귀·꼬리·모피·발바닥·동물 다리를 새로 붙이지 않는다.
- 승인된 3등신 시각 방향을 유지한다.
- `approval_dependency=character-approval-required`인 행은 생성하지 않고 blocked로 보고한다.

## 출력 규칙

- Splash 배경에는 캐릭터가 없어야 한다.
- 배경에는 UI 텍스트나 로고를 넣지 않는다.
- 캐릭터와 FX는 요구된 경우 투명 배경을 사용한다.
- 장신구는 분리된 물체로 만들고 희귀도 별·티어·색상 테두리·legendary/epic 등급 단서를 넣지 않는다.
- 로고 외에는 내장 라벨이나 텍스트를 피한다.
- 정확한 `output_path`로만 납품하고 생성 방식·참조·후편집·검증을 `_workspace/<topic>/02_image.md`에 기록한다.
- 생성하지 못한 행은 정확한 `IMG/*` 슬롯과 이유를 `MISSING ASSETS` 인수인계에 남긴다.
