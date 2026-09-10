# 나비 기본 모션 요청

- 상태: v04 chibi 채택 이력 반영, idle·run r01 재점검 완료, stationary jump r02 시각 승인 대기
- Phase: 0 유지
- 입력: v04 chibi로 채택된 manifest의 안정 ID `nabi-concept-v01` PNG와 `concept/design.md`의 사람형 고양이 콘셉트 경계
- 기준 방향: 우향 원본; 좌향은 이후 시각 래퍼에서 수평 반전한다.
- 대상: `idle`, `jump`, `run`, 각각 16프레임. idle 8 FPS loop, run 12 FPS loop, jump 12 FPS one-shot. jump는 수평 이동 없는 제자리 점프로 재생성한다.
- 연기: 절제된 경계 자세, 비공격 발톱 가드, 포니테일의 관성으로 차별화한다. 인간 얼굴·손·발·체형을 유지하고 동물 귀·꼬리·모피·발은 추가하지 않는다.
- 제외: CharacterData 생성, 전투 판정·공격 타이밍, Phase 0 장면 연결, runtime/과 manifest 변경.

승인 전 검토 산출물은 이 workspace 안에만 둔다.
