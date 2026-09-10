# 자현 기본 모션 요청

- 상태: idle·run r01 재점검 완료, stationary jump r02 시각 승인 대기
- Phase: 0 유지
- 입력: manifest의 `ja-hyun-concept-v01` 승인 PNG와 `character.tres`의 균형형 근접 격투가 정체성
- 기준 방향: 우향 원본; 좌향은 이후 시각 래퍼에서 수평 반전한다.
- 대상: `idle`, `jump`, `run`, 각각 16프레임. idle 8 FPS loop, run 12 FPS loop, jump 12 FPS one-shot. jump는 수평 이동 없는 제자리 점프로 재생성한다.
- 연기: 낮은 가드, 측정된 체중 이동, 꼬리·후드 리본의 민첩한 후행을 우선한다.
- 제외: 전투 판정, 공격 타이밍, CharacterData 변경, Phase 0 도형 파이터 연결, runtime/과 manifest 변경.

승인 전 검토 산출물은 이 workspace 안에만 둔다.
