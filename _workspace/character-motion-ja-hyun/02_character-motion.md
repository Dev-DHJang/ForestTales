# 자현 모션 시안 생산 기록

- 생산자: `forest-tales-character-motion`; 프레임 표현 지원: `forest-tales-2d-animation`.
- 시안: 기존 `idle-contact-sheet.png`, `run-contact-sheet.png`은 우향 전신 4×4·16포즈 검토용 contact sheet다. `jump-contact-sheet-r02-stationary.png`은 가로 중심을 유지하도록 재생성한 16포즈 제자리 점프 검토본이다.
- 소비자: 이후 `AnimatedSprite2D` 시각 래퍼. 현재 장면은 소비하지 않는다.
- 권리: 등록 콘셉트의 user-provided 상태를 상속하며 외부 권리 검증을 새로 주장하지 않는다.
- 런타임 전환 계약: alpha·잘림 QA와 사용자 승인을 통과한 동작만 2048×128 RGBA, 128×128 셀 16개, `<motion>_16f.png`와 `<motion>.tres`로 변환한다.
- 불변: 프레임은 피해·상태·넉백·승패의 권위가 아니다.
