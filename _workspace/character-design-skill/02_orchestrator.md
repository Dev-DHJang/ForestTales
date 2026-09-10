# 캐릭터 디자인 스킬 통합

## 아키텍처

기존 Expert Pool + Producer-Reviewer에 character-design 역할을 추가한다. 최초 전투 캐릭터 콘셉트는 character-design과 qa가 순차 처리하고, 승인 후 정적 파생 이미지는 image-design, 애니메이션은 2d-animation, 전투 데이터는 contracts/combat에 넘긴다.

## 소유 경계

- character-design: 입력 브리프, 콘셉트 시안, 사용자 승인 확인, 승인 자산과 manifest 등록.
- qa: 입력·권리·모바일 가독성의 독립 판정.
- image-design: 승인된 캐릭터의 초상화·아이콘 및 일반 정적 이미지.

## 안전한 등록 흐름

승인 전에는 대화와 `_workspace/character-design-<character-id>/`만 사용한다. 명시 승인 후에만 캐릭터별 콘셉트 폴더와 manifest를 변경한다. 현재 승인된 신규 캐릭터가 없으므로 `assets/character/`에는 변경하지 않는다.

## 검증 계획

`./scripts/verify-harness.sh`로 새 역할의 경로, frontmatter, 필수 섹션, 팀 라우팅과 승인 게이트를 확인한다. 셸 구문 검사와 변경 경계 검색을 함께 수행한다.
