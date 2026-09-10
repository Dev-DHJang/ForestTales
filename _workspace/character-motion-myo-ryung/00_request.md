# 묘령 기본 모션 요청

- 상태: idle·run r02 등록 완료 유지, stationary jump r03 시각 승인 대기
- Phase: 0 유지
- 입력: manifest의 `myo-ryung-concept-v01` 승인 PNG와 `character.tres`의 공중 압박형 정체성
- 기준 방향: 우향 원본; 좌향은 이후 시각 래퍼에서 수평 반전한다.
- 대상: 등록된 `idle`, `run`은 유지한다. `jump`는 r02 디자인 기준으로 16프레임, 12 FPS one-shot의 제자리 점프로 재생성한다.
- 연기: 탄성 있는 체중 이동과 귀·리본의 공중감을 우선한다.
- 제외: 전투 판정, 공격 타이밍, CharacterData 변경, Phase 0 도형 파이터 연결, jump 런타임 패키지.

승인 전 검토 산출물은 이 workspace 안에만 둔다.
