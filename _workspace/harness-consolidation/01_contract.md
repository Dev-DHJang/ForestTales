# 하네스 운영 계약

- 역할 표의 스킬 ID는 `docs/harness/forest-arena/team-spec.md`가 유일한 원본이다.
- `verify-harness.sh`는 그 표와 `.agents/skills/*/SKILL.md`를 양방향 비교하며 역할 수 상수를 두지 않는다.
- 기본 증적은 `00_request.md`, `04_closeout.md`다. 공용 계약, 실질적 인수인계, 독립 QA가 필요할 때만 각각 `01_contract.md`, `02_<role>.md`, `03_qa_rNN.md`를 추가한다.
- 일반 구현 요청의 브랜치·commit·push·PR·`develop` 병합과 롤백 정보는 `04_closeout.md`에 남긴다. 예외와 플랫폼 보안 확인은 팀 명세를 따른다.
