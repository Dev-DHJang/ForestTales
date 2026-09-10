# 캐릭터 외형 계약 명확화 요청

- 날짜: 2026-09-10
- 현재 Phase: 0 유지.
- 목표: 자현·묘령·나비의 승인 콘셉트에서 후속 이미지·모션 제작이 임의 해석할 수 있는 인간형 경계, 종 특징, 의상, 색과 실루엣을 versioned 외형 계약으로 명확히 한다.
- 사용자 확정: 자현은 성인 남성, 묘령·나비는 성인 여성이다. 세 캐릭터 모두 3등신 인간형을 우선한다. 묘령의 작은 흰 꼬리는 측면·후면에서만 허용한다.
- 포함: 외형 JSON v01, CharacterData 요약, 캐릭터별 디자인 문서, 생성 입력 템플릿, 계약·하네스 테스트, 기존 나비 외형 문구의 전투 JSON 분리.
- 제외: 콘셉트 PNG와 모션 픽셀 재생성, manifest·CharacterData 스키마, 능력치·입력·판정·hitbox·전투 타이밍, Phase 승격.
- 불변 조건: 승인 asset ID·경로·SHA와 모든 runtime PNG·SpriteFrames를 보존한다. 외형 정보는 표현 전용이다.
- 필수 검증: JSON·셸 문법, 전용 Godot 계약 테스트, 전체 `./scripts/verify.sh`, 이미지·모션·manifest 비변경 확인.
- 명시적 이연: 런타임 및 픽셀 비변경 작업이므로 Android export·에뮬레이터·물리 기기 검증은 실행하지 않는다.
- 담당: orchestrator, contracts, character-design, qa, version-control.
