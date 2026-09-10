# 모션 최종화 통합 기록

- 역할: character-design은 나비 v04 chibi 채택 이력을 정리했고, character-motion·2d-animation은 시트를 제작·정규화 계약을 소유하며, qa는 alpha·16프레임·pivot·방향·실루엣을 검토한다.
- 최종 매트릭스: 자현·묘령·나비 모두 idle·run·jump 런타임 패키지를 등록했다. 묘령 idle·run은 기존 r02 패키지를 보존했고, 나비는 안정 ID `nabi-concept-v01` 아래 v04 chibi 채택 이력을 유지한다.
- 공통 계약: 우향 원본, 좌향은 수평 반전, 16프레임, idle 8 FPS loop, run 12 FPS loop, jump 12 FPS one-shot, 발바닥 중앙 pivot, jump의 수평 전진 없음.
- 완료: 승인된 연기 방향을 실제 alpha 소스 기반의 2048×128 RGBA 시트로 정규화했다. 자동 계약은 세 캐릭터의 9개 필수 모션, alpha, AtlasTexture, FPS·loop, manifest 해시·경로를 검사한다.
