# 캐릭터 디자인 스킬 종료

## 최종 상태

pass — 캐릭터 디자인·승인 역할을 ForestTales 하네스에 통합했다.

## 결과

- `forest-tales-character-design` 스킬과 브리프·QA·등록 형식을 추가했다.
- 신규 전투 캐릭터 요청을 character-design + qa로 라우팅하고 기존 image-design의 후속 정적 이미지 경계를 명확히 했다.
- 사용자 명시 승인 전 최종 캐릭터 자산과 manifest를 변경하지 않는 게이트를 문서와 검사에 추가했다.

## 검증

- `./scripts/verify-harness.sh` — pass; 14개 역할, 필수 문서, 라우팅과 승인 게이트를 확인했다.
- `/bin/sh -n scripts/verify-harness.sh`와 `git diff --check` — pass.
- 실제 캐릭터 승인/등록은 사용자 요청이 들어올 때 QA 결과와 함께 수행한다.

## 롤백

새 skill 폴더와 `_workspace/character-design-skill/`, team-spec·image-design·qa·verify-harness 변경을 되돌리면 이전 13개 역할 하네스로 복구된다.
