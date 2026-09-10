# 캐릭터 모션 역할 생산 기록

## 입력과 변경

- 제품 기준: 3등신 캐릭터 파이프라인, Android 작은 화면 가독성, 애니메이션 판정 비권위.
- 변경: 승인 콘셉트 전용 standard idle·jump·run 모션 스킬과 런타임 패키지 계약.

## 생산자와 소비자

- 생산자: forest-tales-character-motion. 독립 검토자: forest-tales-qa.
- 선행 생산자: forest-tales-character-design의 승인 콘셉트·manifest.
- 소비자: 이후 AnimatedSprite2D 시각 래퍼. Phase 0의 도형 기반 파이터는 소비하지 않는다.

## 위험과 완화

- 브리프 또는 승인 콘셉트가 없으면 사용자 피드백을 요청하고 런타임 생성을 중단한다.
- 모션별 승인 전에는 workspace 외부에 이미지·리소스·manifest 변경을 남기지 않는다.
- 실제 생성 시 PNG 크기·alpha·16개 영역과 `.tres` 참조를 함께 QA한다.
