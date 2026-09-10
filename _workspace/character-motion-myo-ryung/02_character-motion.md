# 묘령 모션 시안 생산 기록

- 생산자: `forest-tales-character-motion`; 프레임 표현 지원: `forest-tales-2d-animation`.
- 시안: 사용자가 `jump-contact-sheet-r02.png`의 캐릭터 디자인을 채택했다. 비채택 드래프트는 작업 공간에서 삭제했다.
- 런타임: 채택된 디자인을 기준으로 `idle_16f.png`와 `run_16f.png`를 투명 16프레임 시트로 정규화했다. 소비자는 이후 `AnimatedSprite2D` 시각 래퍼이며 현재 장면은 소비하지 않는다.
- stationary jump 시안: `jump-contact-sheet-r03-stationary.png`은 우향 4×4·16포즈이며 수평 전진을 제거한 수직 점프 검토본이다. 사용자 승인과 RGBA QA 전에는 런타임 파일을 만들지 않는다.
- 권리: 등록 콘셉트의 user-provided 상태를 상속하며, 시안은 해당 승인 콘셉트를 입력으로 한 생성 시안이다. 외부 권리 검증을 새로 주장하지 않는다.
- 런타임 전환 계약: 승인된 idle·run은 2048×128 RGBA, 128×128 셀 16개, `<motion>_16f.png`와 `<motion>.tres`로 변환했다. idle은 8 FPS loop, run은 12 FPS loop다.
- 불변: 프레임은 피해·상태·넉백·승패의 권위가 아니다.
