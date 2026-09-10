# 나비 v05 기본 모션 교체 검토

- 대상: `nabi`의 등록된 v04 chibi idle/run/stationary jump를 v05 콘셉트 후보와 일치하도록 교체 검토한다.
- 원본 방향: 우향, 인간형 고양이 테마, 백은발·고양이 귀·긴 꼬리·보라/검정/흰 의상·발톱 가드.
- 규격: idle 16프레임 8 FPS 루프, run 16프레임 12 FPS 루프, jump 16프레임 12 FPS one-shot 제자리 수직 점프. 런타임은 승인 뒤에만 2048×128 RGBA/16 AtlasTexture로 정규화한다.
- 승인 상태: v05 콘셉트와 각 모션 모두 검토 전. 기존 런타임 파일과 manifest는 유지한다.
